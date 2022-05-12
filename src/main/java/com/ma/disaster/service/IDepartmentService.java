package com.ma.disaster.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.Department;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 马志超
 * @since 2022-03-27
 */
public interface IDepartmentService extends IService<Department> {

    Page<Department> getDepartmentByPage(Page<Department> departmentPage, String name);
}
