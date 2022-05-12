package com.ma.disaster.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.Product;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ma.disaster.vo.ProductStockVO;
import com.ma.disaster.vo.ProductVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-04
 */
public interface IProductService extends IService<Product> {

    /**
     * 物资列表
     * @param page
     * @param productVO
     * @return
     */
    Page<ProductVO> findProductList(Page page, ProductVO productVO);


    /**
     * 库存列表
     * @param page
     * @param productVO
     * @return
     */
    Page<ProductStockVO> findProductStocks(Page<ProductStockVO> page, ProductVO productVO);

    /**
     * 所有库存(饼图使用)
     * @param objectPage
     * @param productVO
     * @return
     */
    Page<ProductStockVO> findAllStocks(Page<Object> objectPage, ProductVO productVO);
}
