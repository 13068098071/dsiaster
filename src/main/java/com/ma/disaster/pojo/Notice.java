package com.ma.disaster.pojo;

import com.baomidou.mybatisplus.annotation.*;

import java.time.LocalDate;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author 马志超
 * @since 2022-04-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("p_notice")
@ApiModel(value="Notice对象", description="")
public class Notice implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "公告标题")
    private String title;

    @ApiModelProperty(value = "公告摘要")
    @TableField("summary")
    private String summary;

    @ApiModelProperty(value = "公告内容")
    private String content;

    @ApiModelProperty(value = "公告权重")
    private Integer sorted;

    @ApiModelProperty(value = "公告状态：1存在，0删除")
    @TableLogic
    private Integer status;

    @ApiModelProperty(value = "开始时间")
    @TableField("start_time")
    private LocalDate startTime;

    @ApiModelProperty(value = "截止时间")
    @TableField("end_time")
    private LocalDate endTime;

    @ApiModelProperty(value = "发布时间")
    @TableField("create_time")
    private LocalDate createTime;

    @ApiModelProperty(value = "修改时间")
    @TableField("update_time")
    private LocalDate updateTime;

}
