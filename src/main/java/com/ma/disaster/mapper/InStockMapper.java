package com.ma.disaster.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.pojo.InStock;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ma.disaster.vo.InStockVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 马志超
 * @since 2022-04-07
 */
public interface InStockMapper extends BaseMapper<InStock> {

    /**
     * 入库单列表
     * @param page
     * @param inStockVO
     * @return
     */
    Page<InStockVO> findInStockList(Page<InStockVO> page, @Param("inStockVo") InStockVO inStockVO);

    /**
     * 入库表单
     * @return
     */
    List<InStockVO> findInStockExport();
}
