package com.ma.disaster.mapper;

import com.ma.disaster.pojo.RoleMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 角色菜单关系表 Mapper 接口
 * </p>
 *
 * @author 马志超
 * @since 2022-04-10
 */
public interface RoleMenuMapper extends BaseMapper<RoleMenu> {

    @Delete("delete from m_role_menu where role_id = #{roleId}")
    void deleteByRoleId(Integer roleId);

    @Select("select menu_id from m_role_menu where role_id = #{roleId}")
    List<Integer> selectByRoleId(@Param("roleId")Integer roleId);
}
