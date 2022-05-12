package com.ma.disaster.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.Supplier;
import com.ma.disaster.service.ISupplierService;
import com.ma.disaster.vo.SupplierVO;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 马志超
 * @since 2022-04-07
 */
@RestController
@RequestMapping("/supplier")
public class SupplierController {

    @Resource
    private ISupplierService supplierService;

    @ApiOperation(value = "来源列表", notes = "来源列表,根据来源名模糊查询")
    @GetMapping("/findSupplierList")
    public Result findSupplierList(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                   @RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize,
                                   SupplierVO supplierVO) {
        QueryWrapper<Supplier> supplierVOQueryWrapper = new QueryWrapper<>();
        if(StrUtil.isNotBlank(supplierVO.getName())) {
            supplierVOQueryWrapper.like("name",supplierVO.getName());
        }
        if(StrUtil.isNotBlank(supplierVO.getContact())) {
            supplierVOQueryWrapper.like("contact",supplierVO.getContact());
        }
        if(StrUtil.isNotBlank(supplierVO.getAddress())) {
            supplierVOQueryWrapper.like("address",supplierVO.getAddress());
        }
        supplierVOQueryWrapper.orderByAsc("id");

        return Result.success(supplierService.page(new Page<>(pageNum,pageSize),supplierVOQueryWrapper));
    }

    /**
     * 添加来源
     *
     * @return
     */
    @ApiOperation(value = "添加来源")
    @PostMapping
    public Result add(@RequestBody @Validated Supplier supplier) {
        supplier.setCreateTime(LocalDateTime.now());
        supplier.setModifiedTime(LocalDateTime.now());
        supplierService.save(supplier);
        return Result.success();
    }


    /**
     * 编辑来源
     *
     * @param id
     * @return
     */
    @ApiOperation(value = "编辑来源", notes = "编辑来源信息")
    @GetMapping("/edit/{id}")
    public Result edit(@PathVariable Long id) {
        Supplier supplier = supplierService.getById(id);
        return Result.success(supplier);
    }

    /**
     * 更新来源
     *
     * @return
     */
    @ApiOperation(value = "更新来源", notes = "更新来源信息")
    @PutMapping("/update/{id}")
    public Result update(@PathVariable Long id, @RequestBody @Validated Supplier supplier) {
        supplier.setId(id);
        supplierService.updateById(supplier);
        return Result.success();
    }

    /**
     * 删除来源
     *
     * @param id
     * @return
     */
    @ApiOperation(value = "删除来源", notes = "删除来源信息")
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Long id) {
        supplierService.removeById(id);
        return Result.success();
    }

    /**
     * 所有来源
     *
     * @return
     */
    @ApiOperation(value = "所有来源", notes = "所有来源列表")
    @GetMapping("/findAll")
    public Result findAll() {
        List<Supplier> suppliers = supplierService.list();
        return Result.success(suppliers);
    }
}
