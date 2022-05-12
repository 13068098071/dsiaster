package com.ma.disaster.service.impl;

import com.ma.disaster.pojo.Notice;
import com.ma.disaster.mapper.NoticeMapper;
import com.ma.disaster.service.INoticeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-09
 */
@Service
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper, Notice> implements INoticeService {

}
