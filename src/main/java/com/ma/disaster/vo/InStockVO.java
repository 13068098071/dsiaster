package com.ma.disaster.vo;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author 马志超
 * @Date 2022/03/01
 * @Version 1.0
 **/
@Data
public class InStockVO {

    @Excel(name = "入库id")
    private Long id;

    @Excel(name = "入库单编号")
    private String inNum;

    @NotNull(message = "入库单类型不能为空")
    @Excel(name = "入库类型")
    private Integer type;

    @Excel(name = "操作人员")
    private String operator;

    @Excel(name = "来源")
    private Long supplierId;

    @Excel(name = "供应商名称")
    private String supplierName;

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "入库单创建时间",format = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    private Date modified;

    /** 该入库单的总数**/
    private Integer productNumber;


    @NotBlank(message = "入库备注不能为空")
    @Excel(name = "描述信息")
    private String remark;

    private List<Object>products=new ArrayList<>();

    @Excel(name = "入库状态")
    private Integer status;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;


    /** 如果supplierId不存在需要添加供应商信息**/

    private String name;

    @Excel(name = "供应商地址")
    private String address;

    @Excel(name = "供应商邮箱")
    private String email;

    @Excel(name = "供应商电话")
    private String phone;

    private Integer sort;

    @Excel(name = "联系人")
    private String contact;
}
