package com.ma.disaster.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.annotation.LogAnnotation;
import com.ma.disaster.common.Constants;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.Product;
import com.ma.disaster.service.IProductService;
import com.ma.disaster.vo.ProductStockVO;
import com.ma.disaster.vo.ProductVO;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.springframework.beans.BeanUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 马志超
 * @since 2022-04-04
 */
@RestController
@RequestMapping("/product")
public class ProductController {

    @Resource
    private IProductService productService;

    /**
     * 全部物资列表
     * @return
     */
    @ApiOperation(value = "物资列表", notes = "物资列表,根据物资名模糊查询")
    @GetMapping("/findProductList")
    @LogAnnotation(module = "product",operator = "分页查询物资信息")
    public Result findProductList(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                  @RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize,
                                  @RequestParam(value = "categorys", required = false) String categorys,
                                  ProductVO productVO) {
        buildCategorySearch(categorys, productVO);
        Page<ProductVO> productVOPageVO = productService.findProductList(new Page<>(pageNum, pageSize), productVO);
        return Result.success(productVOPageVO);
    }


    /**
     * 可入库物资(入库页面使用)
     * @return
     */
    @ApiOperation(value = "可入库物资列表", notes = "物资列表,根据物资名模糊查询")
    @GetMapping("/findProducts")
    public Result findProducts(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                     @RequestParam(value = "pageSize") Integer pageSize,
                                     @RequestParam(value = "categorys", required = false) String categorys,
                                     ProductVO productVO){
        productVO.setStatus(0);
        buildCategorySearch(categorys, productVO);
        if (productVO.getStatus() != null) {
        }
        //PageVO<ProductVO> productVOPageVO = productService.findProductList(pageNum, pageSize, productVO);
        return Result.success();
    }
    /**
     * 添加物资
     * @return
     */
    @ApiOperation(value = "添加物资")
    @PostMapping("/add")
    public Result add(@RequestBody @Validated ProductVO productVO) {
        if (productVO.getCategoryKeys().length != 3) {
            return Result.error(Constants.CODE_400,"物资需要3级分类");
        }
        Product product = new Product();
        BeanUtils.copyProperties(productVO,product);
        @NotNull(message = "分类不能为空") Long[] categoryKeys = productVO.getCategoryKeys();
        if(categoryKeys.length==3){
            product.setOneCategoryId(categoryKeys[0]);
            product.setTwoCategoryId(categoryKeys[1]);
            product.setThreeCategoryId(categoryKeys[2]);
        }
        product.setStatus(2);//未审核
        product.setPNum(UUID.randomUUID().toString().substring(0,32));
        product.setCreateTime(LocalDateTime.now());
        product.setModifiedTime(LocalDateTime.now());
        boolean save = productService.save(product);
        return Result.success(save);
    }

    /**
     * 删除物资
     * @param id
     * @return
     */
    @ApiOperation(value = "删除物资", notes = "删除物资信息")
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        Product product = productService.getById(id);
        if(product.getStatus() != 1 && product.getStatus() != 2){
            return Result.error(Constants.PRODUCT_STATUS_ERROR,"物资状态错误");
        }
        productService.removeById(id);
        return Result.success();
    }

    /**
     * 移入回收站
     * @param id
     * @return
     */
    @ApiOperation(value = "移入回收站", notes = "移入回收站")
    @PutMapping("/remove/{id}")
    public Result remove(@PathVariable Integer id){
        Product product = productService.getById(id);
        if(product.getStatus() != 0) {
            return Result.error(Constants.PRODUCT_STATUS_ERROR,"物资状态错误");
        }
        product.setStatus(1);
        productService.updateById(product);
        return Result.success();
    }

    /**
     * 恢复数据从回收站
     * @param id
     * @return
     */
    @ApiOperation(value = "恢复物资", notes = "从回收站中恢复物资")
    @PutMapping("/back/{id}")
    public Result back(@PathVariable Integer id) {
        Product product = productService.getById(id);
        if(product.getStatus()!=1){
            return Result.error(Constants.PRODUCT_STATUS_ERROR,"物资状态错误");
        }
        product.setStatus(0);
        productService.updateById(product);
        return Result.success();
    }

    /**
     * 物资添加审核
     * @param id
     * @return
     */
    @ApiOperation(value = "物资添加审核", notes = "物资添加审核")
    @PutMapping("/publish/{id}")
    public Result publish(@PathVariable Integer  id) {
        Product product = productService.getById(id);
        if(product.getStatus()!=2){
            return Result.error(Constants.PRODUCT_STATUS_ERROR,"物资状态错误");
        }else {
            product.setStatus(0);
            productService.updateById(product);
        }
        return Result.success();
    }

    /**
     * 编辑物资
     * @param id
     * @return
     */
    @ApiOperation(value = "编辑物资", notes = "编辑物资信息")
    @GetMapping("/edit/{id}")
    public Result edit(@PathVariable Integer id) {
        Product product = productService.getById(id);
        ProductVO productVO = converterToProductVO(product);
        return Result.success(productVO);
    }

    /**
     * 转VO
     * @param product
     * @return
     */
    public static ProductVO converterToProductVO(Product product) {
        ProductVO productVO = new ProductVO();
        BeanUtils.copyProperties(product,productVO);
        return productVO;
    }

    /**
     * 更新物资
     *
     * @return
     */
    @ApiOperation(value = "更新物资", notes = "更新物资信息")
    @PutMapping("/update/{id}")
    public Result update(@PathVariable Integer  id, @RequestBody ProductVO productVO){
        if (productVO.getCategoryKeys().length != 3) {
            return Result.error(Constants.CODE_400,"物资需要3级分类");
        }
        Product product = new Product();
        BeanUtils.copyProperties(productVO,product);
        product.setModifiedTime(LocalDateTime.now());
        @NotNull(message = "分类不能为空") Long[] categoryKeys = productVO.getCategoryKeys();
        if(categoryKeys.length==3){
            product.setOneCategoryId(categoryKeys[0]);
            product.setTwoCategoryId(categoryKeys[1]);
            product.setThreeCategoryId(categoryKeys[2]);
        }
        UpdateWrapper<Product> productUpdateWrapper = new UpdateWrapper<>();
        productUpdateWrapper.eq("p_num",id);
        productService.updateById(product);
        return Result.success();
    }

    /**
     * 库存列表
     * @return
     */
    @ApiOperation(value = "库存列表", notes = "物资列表,根据物资名模糊查询")
    @GetMapping("/findProductStocks")
    //@LogAnnotation(module = "stock",operator = "分页查询物资库存信息")
    public Result findProductStocks(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                          @RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize,
                                          @RequestParam(value = "categorys", required = false) String categorys,
                                          ProductVO productVO) {

        buildCategorySearch(categorys, productVO);
        Page<ProductStockVO> productVOPageVO = productService.findProductStocks(new Page<ProductStockVO>(pageNum,pageSize), productVO);
        return Result.success(productVOPageVO);
    }

    /**
     * 所有库存(饼图使用)
     * @return
     */
    @ApiOperation(value = "全部库存", notes = "物资所有库存信息,饼图使用")
    @GetMapping("/findAllStocks")
    public Result findAllStocks(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                @RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize,
                                @RequestParam(value = "categorys", required = false) String categorys,
                                ProductVO productVO) {
        buildCategorySearch(categorys, productVO);
        Page<ProductStockVO> stocks = productService.findAllStocks(new Page<>(pageNum, pageSize), productVO);
        //List<ProductStockVO> list = productService.findAllStocks(pageNum, pageSize,productVO);
        return Result.success(stocks);
    }
    /**
     * 封装物资查询条件
     * @param categorys
     * @param productVO
     */
    private void buildCategorySearch(@RequestParam(value = "categorys", required = false) String categorys, ProductVO productVO) {
        if (categorys != null && !"".equals(categorys)) {
            String[] split = categorys.split(",");
            switch (split.length) {
                case 1:
                    productVO.setOneCategoryId(Long.parseLong(split[0]));
                    break;
                case 2:
                    productVO.setOneCategoryId(Long.parseLong(split[0]));
                    productVO.setTwoCategoryId(Long.parseLong(split[1]));
                    break;
                case 3:
                    productVO.setOneCategoryId(Long.parseLong(split[0]));
                    productVO.setTwoCategoryId(Long.parseLong(split[1]));
                    productVO.setThreeCategoryId(Long.parseLong(split[2]));
                    break;
            }
        }
    }
}
