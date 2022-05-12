package com.ma.disaster.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.pojo.OutStock;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ma.disaster.vo.OutStockVO;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 马志超
 * @since 2022-04-09
 */
public interface OutStockMapper extends BaseMapper<OutStock> {

    /**
     * 出库单列表
     * @param page
     * @param outStockVO
     * @return
     */
    Page<OutStockVO> findOutStockList(Page<OutStockVO> page,@Param("outStockVO") OutStockVO outStockVO);
}
