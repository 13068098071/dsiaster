package com.ma.disaster.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 马志超
 * @date 2022/4/6
 * @Description
 */
@Data
@AllArgsConstructor
public class CrmLogMessage {
    private Integer logid;//日志id
    private String UserName;//管理员姓名
    private String UserRole;//管理员角色
    private String Content;//日志描述
    private String Remarks;//参数集合
    private String TableName;//表格名称
    private String DateTime;//操作时间
    private String resultValue;//返回值
    private String ip;//ip地址
    private String  requestUrl;//请求地址
    private String result;//操作结果
    private  String ExString;//错误信息


    @Override
    public String toString() {
        return "CrmLogMessage{" +
                "logid=" + logid +
                ", UserName='" + UserName + '\'' +
                ", UserRole='" + UserRole + '\'' +
                ", Content='" + Content + '\'' +
                ", Remarks='" + Remarks + '\'' +
                ", TableName='" + TableName + '\'' +
                ", DateTime='" + DateTime + '\'' +
                ", resultValue='" + resultValue + '\'' +
                ", ip='" + ip + '\'' +
                ", requestUrl='" + requestUrl + '\'' +
                ", result='" + result + '\'' +
                ", ExString='" + ExString + '\'' +
                '}';
    }
}
