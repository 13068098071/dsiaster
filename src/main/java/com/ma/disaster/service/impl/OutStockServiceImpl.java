package com.ma.disaster.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.pojo.OutStock;
import com.ma.disaster.mapper.OutStockMapper;
import com.ma.disaster.service.IOutStockService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ma.disaster.vo.OutStockVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-09
 */
@Service
public class OutStockServiceImpl extends ServiceImpl<OutStockMapper, OutStock> implements IOutStockService {

    @Resource
    private OutStockMapper outStockMapper;
    /**
     * 出库单列表
     * @param page
     * @param outStockVO
     * @return
     */
    @Override
    public Page<OutStockVO> findOutStockList(Page<OutStockVO> page, OutStockVO outStockVO) {
        return outStockMapper.findOutStockList(page,outStockVO);
    }
}
