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
@TableName("p_in_stock_info")
@ApiModel(value="InStockInfo对象", description="")
public class InStockInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "入库单编号")
    @TableField("in_num")
    private String inNum;

    @ApiModelProperty(value = "商品编号")
    @TableField("p_num")
    private String pNum;

    @ApiModelProperty(value = "数量")
    @TableField("product_number")
    private Integer productNumber;

    @TableField("create_time")
    private LocalDateTime createTime;

    @TableField("modified_time")
    private LocalDateTime modifiedTime;


}
