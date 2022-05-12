package com.ma.disaster.service.impl;


import cn.hutool.core.bean.BeanUtil;
import cn.hutool.log.Log;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ma.disaster.common.Constants;
import com.ma.disaster.controller.dto.UserDTO;
import com.ma.disaster.controller.dto.UserPasswordDTO;
import com.ma.disaster.exception.ServiceException;
import com.ma.disaster.mapper.RoleMapper;
import com.ma.disaster.mapper.RoleMenuMapper;
import com.ma.disaster.mapper.UserMapper;
import com.ma.disaster.pojo.Menu;
import com.ma.disaster.pojo.Role;
import com.ma.disaster.pojo.User;
import com.ma.disaster.service.IMenuService;
import com.ma.disaster.service.IUserService;
import com.ma.disaster.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


/**
 * @author 马志超
 * @date 2022/3/27
 * @Description
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    private static final Log LOG = Log.get();

    @Resource
    private UserMapper userMapper;

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private RoleMenuMapper roleMenuMapper;

    @Resource
    private IMenuService menuService;

    @Resource
    private RedisTemplate redisTemplate;


    /**
     * 查询部门人数
     * @param id
     * @return
     */
    @Override
    public Integer getDepartmentPersonCount(Long id) {
        return userMapper.getDepartmentPersonCount(id);
    }

    @Override
    public UserDTO login(UserDTO userDTO) {
        User user = getUserInfo(userDTO);
        if (user != null) {
            BeanUtil.copyProperties(user, userDTO, true);
            // 设置token
            String token = TokenUtils.genToken(user.getId().toString(), user.getPassword());
            userDTO.setToken(token);
            String role = user.getRole();
            List<Menu> roleMenus = getRoleMenus(role);
            userDTO.setMenus(roleMenus);
            redisTemplate.opsForValue().set("username",userDTO.getUsername());
            return userDTO;
        } else {
            throw new ServiceException(Constants.CODE_600, "用户名或密码错误");
        }
    }

    @Override
    public User register(UserDTO userDTO) {
        User user = getUserInfo(userDTO);
        if (user == null) {
            user = new User();
            user.setAvatar("https://hexo-ma.oss-cn-beijing.aliyuncs.com/img/壁纸/7b641a0f33b9fa57ae97c4dfea070e25--2888376614.jpg");
            BeanUtil.copyProperties(userDTO, user, true);
            // 默认一个普通用户的角色
            save(user);  // 把 copy完之后的用户对象存储到数据库
        } else {
            throw new ServiceException(Constants.CODE_600, "用户已存在");
        }
        return user;
    }

    @Override
    public void updatePassword(UserPasswordDTO userPasswordDTO) {
        int update = userMapper.updatePassword(userPasswordDTO);
        if (update < 1) {
            throw new ServiceException(Constants.CODE_600, "密码错误");
        }
    }

    @Override
    public List<User> getUser(Integer id) {
        return userMapper.getUser(id);
    }

    @Override
    public Page<User> findUserByPage(Page<User> page, String username, String email, Integer sex, Long departmentId) {
        return userMapper.findUserByPage(page,username,email,sex,departmentId);
    }


    private User getUserInfo(UserDTO userDTO) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", userDTO.getUsername());
        queryWrapper.eq("password", userDTO.getPassword());
        User user;
        try {
            user = getOne(queryWrapper); // 从数据库查询用户信息
        } catch (Exception e) {
            LOG.error(e);
            throw new ServiceException(Constants.CODE_500, "系统错误");
        }
        return user;
    }

    /**
     * 获取当前角色的菜单列表
     * @param roleFlag
     * @return
     */
    private List<Menu> getRoleMenus(String roleFlag) {
        Integer roleId = roleMapper.selectByFlag(roleFlag);
        // 当前角色的所有菜单id集合
        List<Integer> menuIds = roleMenuMapper.selectByRoleId(roleId);

        // 查出系统所有的菜单(树形)
        List<Menu> menus = menuService.findMenus("");
        // new一个最后筛选完成之后的list
        List<Menu> roleMenus = new ArrayList<>();
        // 筛选当前用户角色的菜单
        for (Menu menu : menus) {
            if (menuIds.contains(menu.getId())) {
                roleMenus.add(menu);
            }
            List<Menu> children = menu.getChildren();
            // removeIf()  移除 children 里面不在 menuIds集合中的 元素
            children.removeIf(child -> !menuIds.contains(child.getId()));
        }
        return roleMenus;
    }
}
