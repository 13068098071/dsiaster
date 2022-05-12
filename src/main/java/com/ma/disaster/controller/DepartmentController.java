package com.ma.disaster.controller;


import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.annotation.LogAnnotation;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.Department;
import com.ma.disaster.service.IDepartmentService;
import com.ma.disaster.service.IUserService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

/**
 * <p>
 *  部门管理
 * </p>
 *
 * @author 马志超
 * @since 2022-03-27
 */
@RestController
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    private IDepartmentService departmentService;
    @Autowired
    private IUserService userService;

    @GetMapping("/")
    public Result getAllDepartment(){
        return Result.success(departmentService.list().stream().map(department -> {
            Integer departmentPersonCount = userService.getDepartmentPersonCount(department.getId());
            department.setTotal(departmentPersonCount);
            return department;
        }));
    }

    @GetMapping("/getOneDepartment/{id}")
    public Result getOneDepartment(@PathVariable Integer id) {
        return Result.success(departmentService.getById(id));
    }

    @GetMapping("/page")
    //@LogAnnotation(module = "department",operator = "分页查询部门信息")
    public Result getDepartmentByPage(@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum,
                                      @RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize,
                                      String name){
        QueryWrapper<Department> departmentQueryWrapper = new QueryWrapper<>();
        if(StrUtil.isNotBlank(name)) {
            departmentQueryWrapper.like("name",name);
        }
        return Result.success(departmentService.page(new Page<Department>(pageNum, pageSize), departmentQueryWrapper).getRecords().stream()
                .map(department -> {
                    Integer departmentPersonCount = userService.getDepartmentPersonCount(department.getId());
                    department.setTotal(departmentPersonCount);
                    return department;
                }));
    }

    @GetMapping("/export")
    public void exportUser(HttpServletResponse response){
        List<Department> departments = departmentService.list();
        ExportParams params = new ExportParams("部门表","部门表", ExcelType.HSSF);
        Workbook sheets = ExcelExportUtil.exportExcel(params, Department.class, departments);
        ServletOutputStream outputStream = null;
        try {
            // 用流的形式传输
            response.setHeader("content-type","application/octet-stream");
            // 防止中文乱码
            response.setHeader("content-disposition","attachment;filename="+ URLEncoder.encode("部门表.xls","UTF-8"));
            outputStream = response.getOutputStream();
            sheets.write(outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if(outputStream != null){
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @PostMapping
    public Result addDepartment(@RequestBody Department department){
        department.setStatus(1);
        departmentService.saveOrUpdate(department);
        return Result.success();
    }

    @DeleteMapping("{id}")
    public Result deleteDepartment(@PathVariable Integer id){
        departmentService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(departmentService.removeByIds(ids));
    }
}
