package com.ma.disaster.service.impl;

import com.ma.disaster.pojo.Stock;
import com.ma.disaster.mapper.StockMapper;
import com.ma.disaster.service.IStockService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-05
 */
@Service
public class StockServiceImpl extends ServiceImpl<StockMapper, Stock> implements IStockService {

}
