package com.ma.disaster.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.pojo.OutStock;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ma.disaster.vo.OutStockVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-09
 */
public interface IOutStockService extends IService<OutStock> {

    /**
     * 出库单列表
     * @param outStockVOPage
     * @param outStockVO
     * @return
     */
    Page<OutStockVO> findOutStockList(Page<OutStockVO> outStockVOPage, OutStockVO outStockVO);
}
