package com.ma.disaster.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.Constants;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.*;
import com.ma.disaster.service.*;
import com.ma.disaster.vo.ConsumerVO;
import com.ma.disaster.vo.OutStockDetailVO;
import com.ma.disaster.vo.OutStockItemVO;
import com.ma.disaster.vo.OutStockVO;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.CollectionUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
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
 * @since 2022-04-09
 */
@RestController
@RequestMapping("/out-stock")
public class OutStockController {

    @Resource
    private IOutStockService outStockService;
    @Resource
    private IOutStockInfoService outStockInfoService;
    @Resource
    private IConsumerService consumerService;
    @Resource
    private IProductService productService;
    @Resource
    private IStockService stockService;
    @Resource
    private RedisTemplate redisTemplate;
    /**
     * 发放单列表
     * @param pageNum
     * @param pageSize
     * @param outStockVO
     * @return
     */
    @ApiOperation(value = "出库单列表")
    @GetMapping("/findOutStockList")
    public Result findInStockList(
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize,
            OutStockVO outStockVO) {
        Page<OutStockVO> outStockList = outStockService.findOutStockList(new Page<OutStockVO>(pageNum,pageSize), outStockVO);
        return Result.success(outStockList);
    }

    /**
     * 提交物资发放单
     * @return
     */
    @ApiOperation("提交发放单")
    @PostMapping("/addOutStock")
    public Result addOutStock(@RequestBody @Validated OutStockVO outStockVO) {
        if(outStockVO.getConsumerId()==null){
            //说明现在添加物资来源
            ConsumerVO consumerVO = new ConsumerVO();
            BeanUtils.copyProperties(outStockVO,consumerVO);
            if("".equals(consumerVO.getName())||consumerVO.getName()==null){
                return Result.error(Constants.CODE_400,"物资去向名不能为空");
            }
            if("".equals(consumerVO.getContact())||consumerVO.getContact()==null){
                return Result.error(Constants.CODE_400,"联系人不能为空");
            }
            if("".equals(consumerVO.getAddress())||consumerVO.getAddress()==null){
                return Result.error(Constants.CODE_400,"地址不能为空");
            }
            if("".equals(consumerVO.getPhone())||consumerVO.getPhone()==null){
                return Result.error(Constants.CODE_400,"联系方式不能为空");
            }
            if(consumerVO.getSort()==null){
                return Result.error(Constants.CODE_400,"排序不能为空");
            }
            Consumer consumer = consumerService.add(consumerVO);
            outStockVO.setConsumerId(consumer.getId());
        }
        //提交发放单
        //随机生成发放单号
        String OUT_STOCK_NUM = UUID.randomUUID().toString().substring(0, 32).replace("-","");
        int itemNumber=0;//记录该单的总数
        //获取商品的明细
        List<Object> products = outStockVO.getProducts();
        if(!CollectionUtils.isEmpty(products)) {
            for (Object product : products) {
                LinkedHashMap item = (LinkedHashMap) product;
                //发放数量
                int productNumber = (int) item.get("productNumber");
                //物资编号
                Integer productId = (Integer) item.get("productId");
                Product dbProduct = productService.getById(productId);
                if (dbProduct == null) {
                    return Result.error(Constants.PRODUCT_NOT_FOUND,"物资找不到");
                }else if(productNumber<=0){
                    return Result.error(Constants.PRODUCT_OUT_STOCK_NUMBER_ERROR,dbProduct.getName()+"发放数量不合法,无法入库");
                } else {
                    //校验库存
                    QueryWrapper<Stock> stockQueryWrapper = new QueryWrapper<>();
                    stockQueryWrapper.eq("p_num",dbProduct.getPNum());
                    Stock stocks = stockService.getOne(stockQueryWrapper);
                    if(stocks==null){
                        return Result.error(Constants.CODE_400,"该物资在库存中不存在");
                    }
                    if(productNumber>stocks.getStock()){
                        return Result.error(Constants.PRODUCT_STOCK_ERROR,dbProduct.getName()+"库存不足,库存剩余:"+stocks);
                    }
                    itemNumber += productNumber;
                    //入库单明细
                    OutStockInfo outStockInfo = new OutStockInfo();
                    outStockInfo.setCreateTime(LocalDateTime.now());
                    outStockInfo.setModifiedTime(LocalDateTime.now());
                    outStockInfo.setProductNumber(productNumber);
                    outStockInfo.setPNum(dbProduct.getPNum());
                    outStockInfo.setOutNum(OUT_STOCK_NUM);
                    outStockInfoService.save(outStockInfo);
                }
            }
            OutStock outStock = new OutStock();
            BeanUtils.copyProperties(outStockVO,outStock);
            outStock.setCreateTime(LocalDateTime.now());
            outStock.setProductNumber(itemNumber);
            String username = (String) redisTemplate.opsForValue().get("username");
            outStock.setOperator(username);
            //生成入库单
            outStock.setOutNum(OUT_STOCK_NUM);
            //设置为待审核
            outStock.setStatus(2);
            outStockService.save(outStock);
        }else {
            return Result.error(Constants.PRODUCT_OUT_STOCK_EMPTY,"物资发放不能为空");
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
        OutStock outStock = outStockService.getById(id);
        if (outStock == null) {
            return Result.error(Constants.CODE_400,"发放单不存在");
        }
        Integer status = outStock.getStatus();
        if (status != 0) {
            return Result.error(Constants.CODE_400,"发放单状态不正确");
        }
        outStock.setStatus(1);
        outStockService.updateById(outStock);
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
        OutStock outStock = outStockService.getById(id);
        if (outStock.getStatus() != 1) {
            return Result.error(Constants.CODE_400,"发放单状态不正确");
        }
        outStock.setStatus(0);
        outStockService.updateById(outStock);
        return Result.success();
    }

    /**
     * 删除物资发放单
     * @param id
     * @return
     */
    @ApiOperation(value = "删除物资发放单")
    @GetMapping("/delete/{id}")
    public Result delete(@PathVariable Long id) {
        OutStock outStock = outStockService.getById(id);
        if (outStock == null) {
            return Result.error(Constants.CODE_400,"发放单不存在");
        }
        if (outStock.getStatus()!=1&&outStock.getStatus()!=2) {
            return Result.error(Constants.CODE_400,"发放单状态错误,无法删除");
        }
        outStockService.removeById(id);
        UpdateWrapper<OutStockInfo> outStockInfoUpdateWrapper = new UpdateWrapper<>();
        outStockInfoUpdateWrapper.eq("out_num",outStock.getOutNum());
        outStockInfoService.remove(outStockInfoUpdateWrapper);
        return Result.success();
    }

    /**
     * 物资发放单详细
     *
     * @param id
     * @return
     */
    @ApiOperation(value = "发放单明细")
    @GetMapping("/detail/{id}")
    public Result detail(@PathVariable Long id,
                               @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                               @RequestParam(value = "pageSize",defaultValue = "3") Integer pageSize) {
        OutStockDetailVO outStockDetailVO = new OutStockDetailVO();
        OutStock outStock = outStockService.getById(id);
        if (outStock == null) {
            return Result.error(Constants.CODE_400,"发放单不存在");
        }
        BeanUtils.copyProperties(outStock,outStockDetailVO);
        Consumer consumer = consumerService.getById(outStock.getConsumerId());
        if (consumer == null) {
            return Result.error(Constants.CODE_400,"物资领取方不存在,或已被删除");
        }
        ConsumerVO consumerVO = new ConsumerVO();
        BeanUtils.copyProperties(consumer,consumerVO);
        outStockDetailVO.setConsumerVO(consumerVO);
        String outNum = outStock.getOutNum();
        QueryWrapper<OutStockInfo> outStockInfoQueryWrapper = new QueryWrapper<>();
        outStockInfoQueryWrapper.eq("out_num",outNum);
        List<OutStockInfo> outStockInfos = outStockInfoService.list(outStockInfoQueryWrapper);
        outStockDetailVO.setTotal(outStockInfos.size());
        if (!CollectionUtils.isEmpty(outStockInfos)) {
            for (OutStockInfo outStockInfo : outStockInfos) {
                String pNum = outStockInfo.getPNum();
                QueryWrapper<Product> productQueryWrapper = new QueryWrapper<>();
                productQueryWrapper.eq("p_num",pNum);
                List<Product> products = productService.list(productQueryWrapper);
                if (!CollectionUtils.isEmpty(products)) {
                    Product product = products.get(0);
                    OutStockItemVO outStockItemVO = new OutStockItemVO();
                    BeanUtils.copyProperties(product,outStockItemVO);
                    outStockItemVO.setCount(outStockInfo.getProductNumber());
                    outStockDetailVO.getItemVOS().add(outStockItemVO);
                } else {
                    return Result.error(Constants.CODE_400,"编号为:["+pNum+"]的物资找不到,或已被删除");
                }
            }
        } else {
            return Result.error(Constants.CODE_400,"发放编号为:["+outNum+"]的明细找不到,或已被删除");
        }
        return Result.success(outStockDetailVO);
    }

    /**
     * 发放审核
     * @param id
     * @return
     */
    @ApiOperation(value = "入库审核")
    @PutMapping("/publish/{id}")
    public Result publish(@PathVariable Long id) {
        OutStock outStock = outStockService.getById(id);
        if (outStock == null) {
            return Result.error(Constants.CODE_400,"发放单不存在");
        }
        if (outStock.getStatus()!=2) {
            return Result.error(Constants.CODE_400,"发放单状态错误");
        }
        Consumer consumer = consumerService.getById(outStock.getConsumerId());
        if (consumer == null) {
            return Result.error(Constants.CODE_400,"发放来源信息错误");
        }
        //发放单号
        String outNum = outStock.getOutNum();
        QueryWrapper<OutStockInfo> outStockInfoQueryWrapper = new QueryWrapper<>();
        outStockInfoQueryWrapper.eq("out_num",outNum);
        List<OutStockInfo> outStockInfos = outStockInfoService.list(outStockInfoQueryWrapper);
        if (!CollectionUtils.isEmpty(outStockInfos)) {
            for (OutStockInfo outStockInfo : outStockInfos) {
                //物资编号
                String pNum = outStockInfo.getPNum();
                //入库物资数
                Integer productNumber = outStockInfo.getProductNumber();
                QueryWrapper<Product> productQueryWrapper = new QueryWrapper<>();
                productQueryWrapper.eq("p_num", pNum);
                List<Product> products = productService.list(productQueryWrapper);
                if (products.size() > 0) {
                    Product product = products.get(0);
                    //如果存在，就减少数量
                    QueryWrapper<Stock> stockQueryWrapper = new QueryWrapper<>();
                    stockQueryWrapper.eq("p_num", product.getPNum());
                    List<Stock> stocks = stockService.list(stockQueryWrapper);
                    if (!CollectionUtils.isEmpty(stocks)) {
                        //更新数量
                        Stock stock = stocks.get(0);
                        if (stock.getStock() < productNumber) {
                            return Result.error(Constants.CODE_400, "物资:" + product.getName() + "的库存不足");
                        }
                        stock.setStock(stock.getStock() - productNumber);
                        stockService.updateById(stock);
                    } else {
                        return Result.error(Constants.CODE_400, "该物资在库存中找不到");
                    }
                    outStock.setCreateTime(LocalDateTime.now());
                    outStock.setStatus(0);
                    outStockService.updateById(outStock);
                } else {
                    return Result.error(Constants.CODE_400, "物资编号为:[" + pNum + "]的物资不存在");
                }
            }
        } else {
            return Result.error(Constants.CODE_400, "发放的明细不能为空");
        }
        return Result.success();
    }
}
