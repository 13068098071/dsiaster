package com.ma.disaster.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.pojo.Stock;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ma.disaster.vo.ProductStockVO;
import com.ma.disaster.vo.ProductVO;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 马志超
 * @since 2022-04-05
 */
public interface StockMapper extends BaseMapper<Stock> {

    /**
     * 库存列表
     * @param page
     * @param productVO
     * @return
     */
    Page<ProductStockVO> findProductStocks(Page<ProductStockVO> page,@Param("productVO") ProductVO productVO);

    /**
     * 所有库存(饼图使用)
     * @param page
     * @param productVO
     * @return
     */
    Page<ProductStockVO> findAllStocks(Page page, ProductVO productVO);
}
