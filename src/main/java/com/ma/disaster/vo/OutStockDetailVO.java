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
public class OutStockDetailVO {

    private String outNum;

    private Integer status;

    private Integer type;

    private String operator;

    private ConsumerVO consumerVO;

    private long total;/** 总数**/

    private List<OutStockItemVO> itemVOS=new ArrayList<>();

}
