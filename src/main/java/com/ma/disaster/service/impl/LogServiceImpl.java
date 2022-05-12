package com.ma.disaster.service.impl;

import com.ma.disaster.pojo.Log;
import com.ma.disaster.mapper.LogMapper;
import com.ma.disaster.service.ILogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 操作日志表 服务实现类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-06
 */
@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log> implements ILogService {

}
