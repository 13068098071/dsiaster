package com.ma.disaster.service.impl;

import com.ma.disaster.pojo.Consumer;
import com.ma.disaster.mapper.ConsumerMapper;
import com.ma.disaster.service.IConsumerService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ma.disaster.vo.ConsumerVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-09
 */
@Service
public class ConsumerServiceImpl extends ServiceImpl<ConsumerMapper, Consumer> implements IConsumerService {

    @Resource
    private ConsumerMapper consumerMapper;

    @Override
    public Consumer add(ConsumerVO consumerVO) {
        Consumer consumer = new Consumer();
        BeanUtils.copyProperties(consumerVO,consumer);
        consumer.setCreateTime(LocalDateTime.now());
        consumer.setModifiedTime(LocalDateTime.now());
        consumerMapper.insert(consumer);
        return consumer;
    }
}
