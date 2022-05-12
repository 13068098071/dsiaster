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
@TableName("p_out_stock_info")
@ApiModel(value="OutStockInfo对象", description="")
public class OutStockInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField("out_num")
    private String outNum;

    @TableField("p_num")
    private String pNum;

    @TableField("product_number")
    private Integer productNumber;

    @TableField("create_time")
    private LocalDateTime createTime;

    @TableField("modified_time")
    private LocalDateTime modifiedTime;


}
