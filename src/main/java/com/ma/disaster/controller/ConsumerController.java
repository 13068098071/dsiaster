package com.ma.disaster.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.Consumer;
import com.ma.disaster.pojo.Supplier;
import com.ma.disaster.service.IConsumerService;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *  物资去向相关接口
 * </p>
 *
 * @author 马志超
 * @since 2022-04-09
 */
@RestController
@RequestMapping("/consumer")
public class ConsumerController {
    @Resource
    private IConsumerService consumerService;

    /**
     * 去向列表
     *
     * @return
     */
    @ApiOperation(value = "去向列表", notes = "去向列表,根据去向名模糊查询")
    @GetMapping("/findConsumerList")
    public Result findConsumerList(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                   @RequestParam(value = "pageSize") Integer pageSize,
                                   Consumer consumer) {
        QueryWrapper<Consumer> consumerVOQueryWrapper = new QueryWrapper<>();
        if (StrUtil.isNotBlank(consumer.getName())) {
            consumerVOQueryWrapper.like("name",consumer.getName());
        }

        if (StrUtil.isNotBlank(consumer.getAddress())) {
            consumerVOQueryWrapper.like("address",consumer.getAddress());
        }

        if (StrUtil.isNotBlank(consumer.getContact())) {
            consumerVOQueryWrapper.like("contact",consumer.getContact());
        }
        Page<Consumer> consumers = consumerService.page(new Page<Consumer>(pageNum, pageSize), consumerVOQueryWrapper);
        return Result.success(consumers);
    }

    /**
     * 所有来源
     *
     * @return
     */
    @ApiOperation(value = "所有来源", notes = "所有来源列表")
    @GetMapping("/findAll")
    public Result findAll() {
        List<Consumer> consumers = consumerService.list();
        return Result.success(consumers);
    }


    /**
     * 添加去向
     *
     * @return
     */
    @ApiOperation(value = "添加去向")
    @PostMapping("/add")
    public Result add(@RequestBody @Validated Consumer consumer) {
        consumer.setCreateTime(LocalDateTime.now());
        consumer.setModifiedTime(LocalDateTime.now());
        consumerService.save(consumer);
        return Result.success();
    }

    /**
     * 编辑去向
     *
     * @param id
     * @return
     */
    @ApiOperation(value = "编辑去向", notes = "编辑去向信息")
    @GetMapping("/edit/{id}")
    public Result edit(@PathVariable Long id) {
        Consumer consumer = consumerService.getById(id);
        return Result.success(consumer);
    }

    /**
     * 更新去向
     *
     * @return
     */
    @ApiOperation(value = "更新去向", notes = "更新去向信息")
    @PutMapping("/update/{id}")
    public Result update(@PathVariable Long id, @RequestBody @Validated Consumer consumer) {
        consumer.setModifiedTime(LocalDateTime.now());
        consumerService.updateById(consumer);
        return Result.success();
    }

    /**
     * 删除去向
     *
     * @param id
     * @return
     */
    @ApiOperation(value = "删除去向", notes = "删除去向信息")
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Long id) {
        consumerService.removeById(id);
        return Result.success();
    }
}
