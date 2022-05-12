package com.ma.disaster.vo;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author 马志超
 * @Date 2022/03/01
 * @Version 1.0
 **/
@Data
public class InStockDetailVO {

    private String inNum;

    private Integer status;

    private Integer type;

    private String operator;

    private SupplierVO supplierVO;

    private long total;/** 总数**/

    private List<InStockItemVO> itemVOS=new ArrayList<>();

}


