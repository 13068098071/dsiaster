package com.ma.disaster.mapper;

import com.ma.disaster.pojo.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 马志超
 * @since 2022-04-10
 */
public interface RoleMapper extends BaseMapper<Role> {

    @Select("select id from m_role where flag = #{flag}")
    Integer selectByFlag(@Param("flag") String flag);
}
