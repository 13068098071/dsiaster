package com.ma.disaster.vo;

import lombok.Data;

/**
 * @Author 马志超
 * @Date 2022/03/01
 * @Version 1.0
 **/
@Data
public class InStockItemVO {
    private Long id;

    private String pNum;

    private String name;

    private String model;

    private String unit;

    private String imageUrl;

    private int count;
}
