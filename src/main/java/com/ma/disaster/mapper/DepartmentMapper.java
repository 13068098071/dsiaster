package com.ma.disaster.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.Department;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 马志超
 * @since 2022-03-27
 */
public interface DepartmentMapper extends BaseMapper<Department> {


    Page<Department> getDepartmentByPage(Page<Department> departmentPage, @Param("name") String name);
}
