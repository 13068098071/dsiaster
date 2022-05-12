package com.ma.disaster.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ma.disaster.controller.dto.UserDTO;
import com.ma.disaster.controller.dto.UserPasswordDTO;
import com.ma.disaster.pojo.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author 马志超
 * @date 2022/3/27
 * @Description
 */
public interface IUserService extends IService<User> {


    /**
     * 查询部门人数
     * @param id
     * @return
     */
    Integer getDepartmentPersonCount(Long id);


    /**
     * 登录
     * @param userDTO
     * @return
     */
    UserDTO login(UserDTO userDTO);

    /**
     * 注册用户
     * @param userDTO
     * @return
     */
    User register(UserDTO userDTO);

    /**
     * 修改密码
     * @param userPasswordDTO
     */
    void updatePassword(UserPasswordDTO userPasswordDTO);


    /**
     * 导出用户
     * @param id
     * @return
     */
    List<User> getUser(Integer id);

    /**
     * 扥也查询用户
     * @param page
     * @param username
     * @param email
     * @param sex
     * @param departmentId
     * @return
     */
    Page<User> findUserByPage(Page<User> page, String username, String email, Integer sex, Long departmentId);
}
