package com.ma.disaster.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.controller.dto.UserPasswordDTO;
import com.ma.disaster.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @author 马志超
 * @date 2022/3/27
 * @Description
 */
public interface UserMapper extends BaseMapper<User> {
    /**
     * 查询部门人数
     * @param id
     * @return
     */
    Integer getDepartmentPersonCount(@Param("id") Long id);

    @Update("update m_user set password = #{newPassword} where username = #{username} and password = #{password}")
    int updatePassword(UserPasswordDTO userPasswordDTO);

    /**
     * 导出表用户
     * @param id
     * @return
     */
    List<User> getUser(Integer id);

    /**
     * 分页查询
     * @param page
     * @param username
     * @param email
     * @param sex
     * @param departmentId
     * @return
     */
    Page<User> findUserByPage(Page<User> page, @Param("username") String username, @Param("email") String email,@Param("sex") Integer sex,@Param("departmentId") Long departmentId);

}
