package com.ma.disaster.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.Notice;
import com.ma.disaster.service.INoticeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 马志超
 * @since 2022-04-09
 */
@RestController
@RequestMapping("/notice")
public class NoticeController {

    @Resource
    private INoticeService noticeService;

    @GetMapping
    public Result getNotice(@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum,
                            @RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize,
                            String title){
        QueryWrapper<Notice> noticeQueryWrapper = new QueryWrapper<>();
        if (StrUtil.isNotBlank(title)) {
            noticeQueryWrapper.like("title",title);
        }
        noticeQueryWrapper.le("start_time",LocalDate.now());
        noticeQueryWrapper.ge("end_time",LocalDate.now());
        noticeQueryWrapper.orderByAsc("sorted");
        return Result.success(noticeService.page(new Page<>(pageNum,pageSize),noticeQueryWrapper));
    }

    @PostMapping
    public Result addNotice(@RequestBody Notice notice){
        if(notice.getId() == null) {
            notice.setStatus(1);
            notice.setCreateTime(LocalDate.now());
        }
        notice.setUpdateTime(LocalDate.now());
        noticeService.saveOrUpdate(notice);
        return Result.success();
    }

    @DeleteMapping("{id}")
    private Result deleteNotice(@PathVariable Integer id){
        noticeService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        noticeService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping("/getNotice/{id}")
    public Result getNotice(@PathVariable Integer id){
        return Result.success(noticeService.getById(id));
    }

}
