package com.ma.disaster.pojo;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelEntity;
import com.baomidou.mybatisplus.annotation.*;


import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;


/**
 * <p>
 * 用户表
 * </p>
 *
 * @author 马志超
 * @since 2022-03-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("m_user")
@ApiModel(value="User对象", description="用户表")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "用户ID")
    @TableId(value = "id", type = IdType.AUTO)
    @Excel(name = "用户ID")
    private Integer id;

    @ApiModelProperty(value = "用户名")
    @Excel(name = "用户名")
    private String username;

    private String nickname;

    @ApiModelProperty(value = "邮箱")
    @Excel(name = "邮箱")
    private String email;

    @ApiModelProperty(value = "头像")
    private String avatar;

    @ApiModelProperty(value = "联系电话")
    @TableField("phone_number")
    @Excel(name = "手机号")
    private String phoneNumber;

    @ApiModelProperty(value = "状态 0锁定 1有效")
    @TableLogic
    private Integer status;

    @ApiModelProperty(value = "性别 0男 1女 2保密")
    @Excel(name = "性别")
    private Integer sex;

    @ApiModelProperty(value = "0:超级管理员，1：系统用户")
    private Integer type;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "生日")
    @Excel(name = "生日",width = 20,format = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "Asia/Shanghai")
    private Date birth;

    @ApiModelProperty(value = "部门id")
    @TableField("department_id")
    private Long departmentId;

    @ApiModelProperty(value = "部门名称")
    @TableField(exist = false)
    @ExcelEntity(name = "部门名称")
    private Department department;

    @ApiModelProperty(value = "角色")
    @ExcelEntity(name = "角色名称")
    private String role;
}

