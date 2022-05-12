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
 * @since 2022-04-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("p_in_stock")
@ApiModel(value="InStock对象", description="")
public class InStock implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "入库单编号")
    @TableField("in_num")
    private String inNum;

    @ApiModelProperty(value = "类型：1：捐赠，2：下拨，3：采购,4:退货入库")
    private Integer type;

    @ApiModelProperty(value = "操作人员")
    private String operator;

    @ApiModelProperty(value = "入库单创建时间")
    @TableField("create_time")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "入库单修改时间")
    private LocalDateTime modified;

    @ApiModelProperty(value = "物资总数")
    @TableField("product_number")
    private Integer productNumber;

    @ApiModelProperty(value = "来源")
    @TableField("supplier_id")
    private Long supplierId;

    @ApiModelProperty(value = "描述信息")
    private String remark;

    @ApiModelProperty(value = "0:正常入库单,1:已进入回收,2:等待审核")
    private Integer status;


}
