package com.ma.disaster.controller;


import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.Constants;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.*;
import com.ma.disaster.service.*;
import com.ma.disaster.vo.InStockDetailVO;
import com.ma.disaster.vo.InStockItemVO;
import com.ma.disaster.vo.InStockVO;
import com.ma.disaster.vo.SupplierVO;
import io.swagger.annotations.ApiOperation;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.BeanUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.CollectionUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.UUID;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 马志超
 * @since 2022-04-07
 */
@RestController
@RequestMapping("/in-stock")
public class InStockController {

    @Resource
    private IInStockService inStockService;
    @Resource
    private IInStockInfoService inStockInfoService;
    @Resource
    private ISupplierService supplierService;
    @Resource
    private IProductService productService;
    @Resource
    private IStockService stockService;
    @Resource
    private RedisTemplate redisTemplate;

    /**
     * 入库单列表
     *
     * @param pageNum
     * @param pageSize
     * @param inStockVO
     * @return
     */
    @ApiOperation(value = "入库单列表")
    @GetMapping("/findInStockList")
    public Result findInStockList(
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize,
            InStockVO inStockVO) {
        Page<InStockVO> inStockList = inStockService.findInStockList(new Page<InStockVO>(pageNum,pageSize), inStockVO);
        return Result.success(inStockList);
    }

    /**
     * 物资入库
     * @param inStockVO
     * @return
     */
    @ApiOperation(value = "物资入库")
    @PostMapping("/addIntoStock")
    public Result addIntoStock(@RequestBody @Validated InStockVO inStockVO)  {
        if(inStockVO.getSupplierId()==null){
            //说明现在添加物资来源
            SupplierVO supplierVO = new SupplierVO();
            BeanUtils.copyProperties(inStockVO,supplierVO);
            if("".equals(supplierVO.getName())||supplierVO.getName()==null){
               return  Result.error(Constants.CODE_400,"物资提供方名不能为空");
            }
            if("".equals(supplierVO.getEmail())||supplierVO.getEmail()==null){
                return  Result.error(Constants.CODE_400,"邮箱不能为空");
            }
            if("".equals(supplierVO.getContact())||supplierVO.getContact()==null){
                return  Result.error(Constants.CODE_400,"联系人不能为空");
            }
            if("".equals(supplierVO.getAddress())||supplierVO.getAddress()==null){
                return  Result.error(Constants.CODE_400,"地址不能为空");
            }
            if("".equals(supplierVO.getPhone())||supplierVO.getPhone()==null){
                return  Result.error(Constants.CODE_400,"联系方式不能为空");
            }
            if(supplierVO.getSort()==null){
                return  Result.error(Constants.CODE_400,"排序不能为空");
            }
            Supplier supplier = supplierService.add(supplierVO);
            inStockVO.setSupplierId(supplier.getId());
        }
        //随机生成入库单号
        String IN_STOCK_NUM = UUID.randomUUID().toString().substring(0, 32).replace("-", "");
        //记录改单总数
        int itemNumber = 0;
        //商品，明细
        List<Object> products = inStockVO.getProducts();
        if (!CollectionUtils.isEmpty(products)) {
            for (Object product : products) {
                LinkedHashMap item = ((LinkedHashMap) product);
                //入库数量
                int productNumber = (int) item.get("productNumber");
                //物资编号
                Integer productId = (Integer) item.get("productId");
                Product dbProduct = productService.getById(productId);
                if (dbProduct == null) {
                    return  Result.error(Constants.PRODUCT_NOT_FOUND,"物资找不到");
                }else if(dbProduct.getStatus()==1) {
                    return  Result.error(Constants.PRODUCT_IS_REMOVE, dbProduct.getName() + "物资已被回收,无法入库");
                } else if(dbProduct.getStatus()==2){
                    return  Result.error(Constants.PRODUCT_WAIT_PASS, dbProduct.getName() + "物资待审核,无法入库");
                }else if(productNumber<=0){
                    return  Result.error(Constants.PRODUCT_IN_STOCK_NUMBER_ERROR,dbProduct.getName()+"入库数量不合法,无法入库");
                } else {
                    itemNumber += productNumber;
                    //插入入库单明细
                    InStockInfo inStockInfo = new InStockInfo();
                    inStockInfo.setCreateTime(LocalDateTime.now());
                    inStockInfo.setModifiedTime(LocalDateTime.now());
                    inStockInfo.setProductNumber(productNumber);
                    inStockInfo.setPNum(dbProduct.getPNum());
                    inStockInfo.setInNum(IN_STOCK_NUM);
                    inStockInfoService.save(inStockInfo);
                }
            }
            InStock inStock = new InStock();
            BeanUtils.copyProperties(inStockVO,inStock);
            inStock.setCreateTime(LocalDateTime.now());
            inStock.setModified(LocalDateTime.now());
            inStock.setProductNumber(itemNumber);
            String username = (String) redisTemplate.opsForValue().get("username");
            inStock.setOperator(username);
            //生成入库单
            inStock.setInNum(IN_STOCK_NUM);
            //设置为待审核
            inStock.setStatus(2);
            inStockService.save(inStock);
        }
        return Result.success();
    }


    @GetMapping("/export")
    public void exportUser(HttpServletResponse response){
        List<InStockVO> inStocks = inStockService.findInStockExport();
        ExportParams params = new ExportParams("入库表","入库表", ExcelType.HSSF);
        Workbook sheets = ExcelExportUtil.exportExcel(params, InStockVO.class, inStocks);
        ServletOutputStream outputStream = null;
        try {
            // 用流的形式传输
            response.setHeader("content-type","application/octet-stream");
            // 防止中文乱码
            response.setHeader("content-disposition","attachment;filename="+ URLEncoder.encode("入库表.xls","UTF-8"));
            outputStream = response.getOutputStream();
            sheets.write(outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if(outputStream != null){
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 物资入库单详细
     *
     * @param id
     * @return
     */
    @ApiOperation(value = "入库单明细")
    @GetMapping("/detail/{id}")
    public Result detail(@PathVariable Long id,
                               @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                               @RequestParam(value = "pageSize",defaultValue = "3") Integer pageSize) {
        InStockDetailVO inStockDetailVO = new InStockDetailVO();
        InStock inStock = inStockService.getById(id);
        if(inStock == null) {
            return Result.error(Constants.CODE_400,"入库单不存在");
        }
        BeanUtils.copyProperties(inStock,inStockDetailVO);
        Supplier supplier = supplierService.getById(inStock.getSupplierId());
        if(supplier==null){
            Result.error(Constants.CODE_400,"提供物资方不存在,或已被删除");
        }
        SupplierVO supplierVO = new SupplierVO();
        BeanUtils.copyProperties(supplier,supplierVO);

        inStockDetailVO.setSupplierVO(supplierVO);
        String inNum = inStock.getInNum();

        //查询该单所有的物资
        QueryWrapper<InStockInfo> inStockInfoQueryWrapper = new QueryWrapper<>();
        inStockInfoQueryWrapper.eq("in_num",inNum);
        List<InStockInfo> inStockInfos = inStockInfoService.list(inStockInfoQueryWrapper);
        inStockDetailVO.setTotal(inStockInfos.size());

        if(!CollectionUtils.isEmpty(inStockInfos)){
            for (InStockInfo inStockInfo : inStockInfos) {
                String pNum = inStockInfo.getPNum();
                QueryWrapper<Product> productQueryWrapper = new QueryWrapper<>();
                productQueryWrapper.eq("p_num",pNum);
                List<Product> products = productService.list(productQueryWrapper);
                if(!CollectionUtils.isEmpty(products)){
                    Product product = products.get(0);
                    InStockItemVO inStockItemVO = new InStockItemVO();
                    BeanUtils.copyProperties(product,inStockItemVO);
                    inStockItemVO.setCount(inStockInfo.getProductNumber());
                    inStockDetailVO.getItemVOS().add(inStockItemVO);
                } else {
                    return Result.error(Constants.CODE_400,"编号为:["+pNum+"]的物资找不到,或已被删除");
                }
            }
        } else {
            return Result.error(Constants.CODE_400,"入库编号为:["+inNum+"]的明细找不到,或已被删除");
        }
        return Result.success(inStockDetailVO);
    }

    /**
     * 入库审核
     * 入库信息表status为2，表示当前入库信息为待审核状态；通过来源id，获取来源人的信息，不能为null；
     * 通过入库单号获取入库物品的物资编号和数量
     * 通过物资编号去物资表获取对应的商品编号
     * 通过商品编号获取对应的库存信息：如果存在将库存增加，不存在添加库存信息
     * 更新入库信息表：更新入库状态为0表示已经入库，更新修改时间
     * @param id
     * @return
     */
    @ApiOperation(value = "入库审核")
    @PutMapping("/publish/{id}")
    public Result publish(@PathVariable Long id)  {
        //获取物资入库信息
        InStock inStock = inStockService.getById(id);
        if (inStock == null) {
            return Result.error(Constants.CODE_400,"入库单不存在");
        }
        if (inStock.getStatus() != 2) {
            return Result.error(Constants.CODE_400,"入库单状态错误");
        }
        //获取入库来源信息
        Supplier supplier = supplierService.getById(inStock.getSupplierId());
        if (supplier == null) {
            return Result.error(Constants.CODE_400,"入库来源信息错误");
        }
        //入库单号
        String inNum = inStock.getInNum();
        //通过入库单号获取入库物资信息
        QueryWrapper<InStockInfo> inStockInfoQueryWrapper = new QueryWrapper<>();
        inStockInfoQueryWrapper.eq("in_num",inNum);
        List<InStockInfo> stockInfos = inStockInfoService.list(inStockInfoQueryWrapper);
        if (!CollectionUtils.isEmpty(stockInfos)) {
            for (InStockInfo stockInfo : stockInfos) {
                //物资编号
                String pNum = stockInfo.getPNum();
                //入库物资数
                Integer productNumber = stockInfo.getProductNumber();
                QueryWrapper<Product> productQueryWrapper = new QueryWrapper<>();
                productQueryWrapper.eq("p_num", pNum);
                List<Product> products = productService.list(productQueryWrapper);
                if (products.size() > 0) {
                    Product product = products.get(0);
                    //入库如果存在，就增加数量，否则插入
                    QueryWrapper<Stock> stockQueryWrapper = new QueryWrapper<>();
                    stockQueryWrapper.eq("p_num", product.getPNum());
                    List<Stock> stocks = stockService.list(stockQueryWrapper);
                    if (!CollectionUtils.isEmpty(stocks)) {
                        //更新数量
                        Stock stock = stocks.get(0);
                        UpdateWrapper<Stock> stockUpdateWrapper = new UpdateWrapper<>();
                        stockUpdateWrapper.eq("p_num",stock.getPNum());
                        stockUpdateWrapper.set("stock",stock.getStock() + productNumber);
                        //stock.setStock(stock.getStock() + productNumber);
                        stockService.update(stockUpdateWrapper);
                        //stockService.updateById(stock);
                    } else {
                        Stock stock = new Stock();
                        stock.setPNum(product.getPNum());
                        stock.setStock((long) productNumber);
                        stockService.save(stock);
                    }
                    inStock.setModified(LocalDateTime.now());
                    inStock.setStatus(0);
                    inStockService.updateById(inStock);
                } else {
                    return Result.error(Constants.CODE_400, "物资编号为:[" + pNum + "]的物资不存在");
                }
            }
        } else {
            return Result.error(Constants.CODE_400, "入库的明细不能为空");
        }
        return Result.success();
    }

    /**
     * 移入回收站
     * @param id
     * @return
     */
    @ApiOperation(value = "移入回收站", notes = "移入回收站")
    @PutMapping("/remove/{id}")
    public Result remove(@PathVariable Long id) {
        InStock inStock = inStockService.getById(id);
        if(inStock == null) {
            return Result.error(Constants.CODE_400,"入库单不存在");
        }
        Integer status = inStock.getStatus();
        if(status != 0) {
            return Result.error(Constants.CODE_400,"入库单状态不正确");
        }
        inStock.setStatus(1);
        inStockService.updateById(inStock);
        return Result.success();
    }

    /**
     * 恢复数据从回收站
     * @param id
     * @return
     */
    @ApiOperation(value = "恢复数据", notes = "从回收站中恢复入库单")
    @PutMapping("/back/{id}")
    public Result back(@PathVariable Long id) {
        InStock inStock = inStockService.getById(id);
        if (inStock.getStatus() != 1) {
            return Result.error(Constants.CODE_400,"入库单状态不正确");
        }
        inStock.setStatus(0);
        inStockService.updateById(inStock);
        return Result.success();
    }

    /**
     * 删除物资入库单
     * @param id
     * @return
     */
    @ApiOperation(value = "删除物资入库单")
    @GetMapping("/delete/{id}")
    public Result delete(@PathVariable Long id) {
        InStock inStock = inStockService.getById(id);
        if(inStock == null) {
            return Result.error(Constants.CODE_400,"入库单不存在");
        }
        Integer status = inStock.getStatus();
        if(status != 0 && status != 1) {
            return Result.error(Constants.CODE_400,"入库单状态错误,无法删除");
        }
        inStockService.removeById(id);
        UpdateWrapper<InStockInfo> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("in_num",inStock.getInNum());
        inStockInfoService.remove(updateWrapper);
        return Result.success();
    }
}
