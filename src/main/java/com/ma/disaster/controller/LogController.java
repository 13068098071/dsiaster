package com.ma.disaster.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.Log;
import com.ma.disaster.service.ILogService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 操作日志表 前端控制器
 * </p>
 *
 * @author 马志超
 * @since 2022-04-06
 */
@RestController
@RequestMapping("/log")
public class LogController {

    @Resource
    private ILogService logService;

    @GetMapping
    public Result getLogByPage(@RequestParam(value = "pageNum") Integer pageNum,
                               @RequestParam(value = "pageSize") Integer pageSize,
                               Log log){
        QueryWrapper<Log> logQueryWrapper = new QueryWrapper<>();
        if(StrUtil.isNotBlank(log.getUsername())) {
            logQueryWrapper.like("username",log.getUsername());
        }
        if(StrUtil.isNotBlank(log.getIp())) {
            logQueryWrapper.like("ip",log.getIp());
        }
        if(StrUtil.isNotBlank(log.getLocation())) {
            logQueryWrapper.like("location",log.getLocation());
        }
        return Result.success(logService.page(new Page<>(pageNum,pageSize),logQueryWrapper));
    }

    @DeleteMapping("{id}")
    public Result deleteLog(@PathVariable Long id){
        return Result.success(logService.removeById(id));
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        logService.removeByIds(ids);
        return Result.success();
    }


}
