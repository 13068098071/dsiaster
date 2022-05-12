package com.ma.disaster.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.Department;
import com.ma.disaster.mapper.DepartmentMapper;
import com.ma.disaster.service.IDepartmentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 马志超
 * @since 2022-03-27
 */
@Service
public class DepartmentServiceImpl extends ServiceImpl<DepartmentMapper, Department> implements IDepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    /**
     * 分页按照条件查询
     * @param departmentPage
     * @param name
     * @return
     */
    @Override
    public Page<Department> getDepartmentByPage(Page<Department> departmentPage, String name) {
        return departmentMapper.getDepartmentByPage(departmentPage,name);
    }
}
