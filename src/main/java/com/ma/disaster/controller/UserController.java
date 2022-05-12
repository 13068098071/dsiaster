package com.ma.disaster.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.annotation.LogAnnotation;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.User;
import com.ma.disaster.service.IDepartmentService;
import com.ma.disaster.service.IUserService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

/**
 * @author 马志超
 * @date 2022/3/27
 * @Description 用户管理
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Resource
    private IUserService userService;

    @Resource
    private IDepartmentService departmentService;

    @GetMapping("/")
    public Result getAllUser(){
        return Result.success(userService.list());
    }

    @GetMapping("/getOneUser/{id}")
    public Result getOneUser(@PathVariable Integer id){
        return Result.success(userService.getById(id));
    }

    @GetMapping("/page")
    //@LogAnnotation(module = "user",operator = "多条件分页查询用户信息")
    public Result getUserByPage(@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum,
                                      @RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize,
                                      String username,
                                      String email,
                                      Integer sex,
                                      Long departmentId){
        return Result.success(userService.findUserByPage(new Page<User>(pageNum,pageSize),username,email,sex,departmentId));
    }

    @GetMapping("/username/{username}")
    public Result findByUsername(@PathVariable String username) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        return Result.success(userService.getOne(queryWrapper));
    }

    @PostMapping
    public Result addOrUpdateUser(@RequestBody User user){
        if (user.getId() == null && user.getPassword() == null) {  // 新增用户默认密码
            user.setPassword("123");
        }
        return Result.success(userService.saveOrUpdate(user));
    }

    @DeleteMapping("{id}")
    public Result deleteUser(@PathVariable Integer id){
        userService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        userService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping("/export")
    public void exportUser(HttpServletResponse response){
        List<User> users = userService.getUser(null);
        ExportParams params = new ExportParams("用户表","用户表", ExcelType.HSSF);
        Workbook sheets = ExcelExportUtil.exportExcel(params, User.class, users);
        ServletOutputStream outputStream = null;
        try {
            // 用流的形式传输
            response.setHeader("content-type","application/octet-stream");
            // 防止中文乱码
            response.setHeader("content-disposition","attachment;filename="+ URLEncoder.encode("用户表.xls","UTF-8"));
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
}
