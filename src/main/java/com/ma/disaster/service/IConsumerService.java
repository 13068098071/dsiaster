package com.ma.disaster.service;

import com.ma.disaster.pojo.Consumer;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ma.disaster.vo.ConsumerVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-09
 */
public interface IConsumerService extends IService<Consumer> {

    Consumer add(ConsumerVO consumerVO);
}
