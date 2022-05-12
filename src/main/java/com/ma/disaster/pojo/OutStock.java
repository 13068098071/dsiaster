package com.ma.disaster.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
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
@TableName("p_out_stock")
@ApiModel(value="OutStock对象", description="")
public class OutStock implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "出库单")
    @TableField("out_num")
    private String outNum;

    @ApiModelProperty(value = "出库类型:0:直接出库,1:审核出库")
    private Integer type;

    @ApiModelProperty(value = "操作人")
    private String operator;

    @ApiModelProperty(value = "出库时间")
    @TableField("create_time")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "出库总数")
    @TableField("product_number")
    private Integer productNumber;

    @ApiModelProperty(value = "消费者id")
    @TableField("consumer_id")
    private Long consumerId;

    @ApiModelProperty(value = "备注")
    private String remark;

    @ApiModelProperty(value = "状态:0:正常入库,1:已进入回收,2:等待审核")
    private Integer status;

    @ApiModelProperty(value = "紧急程度:1:不急,2:常规,3:紧急4:特急")
    private Integer priority;


}
