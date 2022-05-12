package com.ma.disaster.common;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author 马志超
 * @Date 2022/03/01
 * @Version 1.0
 **/
@Data
public class PageVO<T> {
    private long total;

    private List<T> rows=new ArrayList<>();

    public PageVO(long total, List<T> data) {
        this.total = total;
        this.rows = data;
    }
}
