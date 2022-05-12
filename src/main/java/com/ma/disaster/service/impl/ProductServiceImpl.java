package com.ma.disaster.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.Result;
import com.ma.disaster.mapper.StockMapper;
import com.ma.disaster.pojo.Product;
import com.ma.disaster.mapper.ProductMapper;
import com.ma.disaster.service.IProductService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ma.disaster.vo.ProductStockVO;
import com.ma.disaster.vo.ProductVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-04
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements IProductService {

    @Resource
    private ProductMapper productMapper;

    @Resource
    private StockMapper stockMapper;
    /**
     * 物资列表
     * @param page
     * @param productVO
     * @return
     */
    @Override
    public Page<ProductVO> findProductList(Page page, ProductVO productVO) {
        QueryWrapper<Product> productQueryWrapper = new QueryWrapper<>();
        if(productVO.getStatus() != null) {
            productQueryWrapper.eq("status",productVO.getStatus());
        }
        if (StrUtil.isNotBlank(productVO.getName())) {
            productQueryWrapper.like("name",productVO.getName());
        }
        if(productVO.getThreeCategoryId()!=null){
            productQueryWrapper.eq("one_category_id",productVO.getOneCategoryId())
                               .eq("two_category_id",productVO.getTwoCategoryId())
                               .eq("three_category_id",productVO.getThreeCategoryId());
            return productMapper.selectPage(page,productQueryWrapper);
        }
        if(productVO.getTwoCategoryId()!=null){
            productQueryWrapper.eq("one_category_id",productVO.getOneCategoryId())
                    .eq("two_category_id",productVO.getTwoCategoryId());
            return productMapper.selectPage(page,productQueryWrapper);
        }
        if(productVO.getOneCategoryId()!=null){
            productQueryWrapper.eq("one_category_id",productVO.getOneCategoryId());
            return productMapper.selectPage(page,productQueryWrapper);
        }
        return productMapper.selectPage(page,productQueryWrapper);
    }

    /**
     * 库存列表
     * @param page
     * @param productVO
     * @return
     */
    @Override
    public Page<ProductStockVO> findProductStocks(Page<ProductStockVO> page, ProductVO productVO) {
        return stockMapper.findProductStocks(page,productVO);

    }

    /**
     * 所有库存(饼图使用)
     * @param page
     * @param productVO
     * @return
     */
    @Override
    public Page<ProductStockVO> findAllStocks(Page page, ProductVO productVO) {
        return stockMapper.findAllStocks(page,productVO);
    }


}
