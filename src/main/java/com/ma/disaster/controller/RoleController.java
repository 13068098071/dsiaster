package com.ma.disaster.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.Role;
import com.ma.disaster.pojo.User;
import com.ma.disaster.service.IRoleService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 马志超
 * @since 2022-04-10
 */
@RestController
@RequestMapping("/role")
public class RoleController {
    @Resource
    private IRoleService roleService;

    @GetMapping("/all")
    public Result findAll() {
        return Result.success(roleService.list());
    }

    @GetMapping
    public Result getUserByPage(@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum,
                                @RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize,
                                String name){
        QueryWrapper<Role> roleQueryWrapper = new QueryWrapper<>();
        if (StrUtil.isNotBlank(name)) {
            roleQueryWrapper.like("name",name);
        }

        return Result.success(roleService.page(new Page<Role>(pageNum,pageSize),roleQueryWrapper));
    }

    @PostMapping
    public Result updateOrAddRole(@RequestBody Role role) {
        return Result.success(roleService.saveOrUpdate(role));
    }

    @DeleteMapping("{id}")
    public Result deleteRole(@PathVariable Integer id) {
        return Result.success(roleService.removeById(id));
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        roleService.removeByIds(ids);
        return Result.success();
    }

    /**
     * 绑定角色和菜单的关系
     * @param roleId 角色id
     * @param menuIds 菜单id数组
     * @return
     */
    @PostMapping("/roleMenu/{roleId}")
    public Result roleMenu(@PathVariable Integer roleId, @RequestBody List<Integer> menuIds) {
        roleService.setRoleMenu(roleId, menuIds);
        return Result.success();
    }

    @GetMapping("/roleMenu/{roleId}")
    public Result getRoleMenu(@PathVariable Integer roleId) {
        return Result.success( roleService.getRoleMenu(roleId));
    }
}
