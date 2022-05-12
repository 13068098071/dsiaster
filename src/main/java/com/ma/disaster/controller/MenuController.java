package com.ma.disaster.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.Constants;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.Dict;
import com.ma.disaster.pojo.Menu;
import com.ma.disaster.pojo.Role;
import com.ma.disaster.service.IDictService;
import com.ma.disaster.service.IMenuService;
import com.ma.disaster.service.IRoleService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 马志超
 * @since 2022-04-10
 */
@RestController
@RequestMapping("/menu")
public class MenuController {
    @Resource
    private IMenuService menuService;
    @Resource
    private IDictService dictService;

    @GetMapping
    public Result getUserByPage(String name){
        return Result.success(menuService.findMenus(name));
    }

    @PostMapping
    public Result updateOrAddRole(@RequestBody Menu menu) {
        return Result.success(menuService.saveOrUpdate(menu));
    }

    @DeleteMapping("{id}")
    public Result deleteRole(@PathVariable Integer id) {
        return Result.success(menuService.removeById(id));
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        menuService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping("/icons")
    public Result getIcons() {
        QueryWrapper<Dict> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type", Constants.DICT_TYPE_ICON);
        return Result.success(dictService.list(queryWrapper));
    }
}
