package com.ma.disaster.service.impl;

import com.ma.disaster.pojo.Files;
import com.ma.disaster.mapper.FileMapper;
import com.ma.disaster.service.IFileService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-03
 */
@Service
public class FileServiceImpl extends ServiceImpl<FileMapper, Files> implements IFileService {

}
