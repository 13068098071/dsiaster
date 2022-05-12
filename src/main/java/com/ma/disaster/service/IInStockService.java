package com.ma.disaster.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.pojo.InStock;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ma.disaster.vo.InStockDetailVO;
import com.ma.disaster.vo.InStockVO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-07
 */
public interface IInStockService extends IService<InStock> {

    /**
     * 入库单列表
     * @param page
     * @param inStockVO
     * @return
     */
    Page<InStockVO> findInStockList(Page<InStockVO> page, InStockVO inStockVO);

    /**
     * 入库明细
     * @param inStockDetailVOPage
     * @param id
     * @return
     */
    InStockDetailVO detail(Page<InStockDetailVO> inStockDetailVOPage, Long id);

    /**
     * 导出入库单
     * @return
     */
    List<InStockVO> findInStockExport();


    /**
     * 入库
     * @param inStockVO
     */
    void addIntoStock(InStockVO inStockVO);
}
