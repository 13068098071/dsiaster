package com.ma.disaster.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ma.disaster.pojo.Menu;
import com.ma.disaster.mapper.MenuMapper;
import com.ma.disaster.service.IMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-10
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

    @Resource
    private MenuMapper menuMapper;
    @Override
    public List<Menu> findMenus(String name) {
        QueryWrapper<Menu> roleQueryWrapper = new QueryWrapper<>();
        if (StrUtil.isNotBlank(name)) {
            roleQueryWrapper.like("name",name);
        }
        List<Menu> list = list(roleQueryWrapper);
        List<Menu> parentNode = list.stream().filter(menu -> menu.getPid() == null).collect(Collectors.toList());
        for (Menu menu : parentNode) {
            menu.setChildren(list.stream().filter(m -> menu.getId().equals(m.getPid())).collect(Collectors.toList()));
        }
        return parentNode;
    }
}
