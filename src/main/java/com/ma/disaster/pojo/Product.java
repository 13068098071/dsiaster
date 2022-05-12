package com.ma.disaster.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.Id;

/**
 * <p>
 * 
 * </p>
 *
 * @author 马志超
 * @since 2022-04-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("m_product")
@ApiModel(value="Product对象", description="")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "商品编号")
    @TableField("p_num")
    private String pNum;

    @ApiModelProperty(value = "商品名称")
    private String name;

    @ApiModelProperty(value = "图片")
    @TableField("image_url")
    private String imageUrl;

    @ApiModelProperty(value = "规格型号")
    private String model;

    @ApiModelProperty(value = "计算单位")
    private String unit;

    @ApiModelProperty(value = "备注")
    private String remark;

    @ApiModelProperty(value = "排序")
    private Integer sort;

    @ApiModelProperty(value = "创建时间")
    @TableField("create_time")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "修改时间")
    @TableField("modified_time")
    private LocalDateTime modifiedTime;

    @ApiModelProperty(value = "1级分类")
    @TableField("one_category_id")
    private Long oneCategoryId;

    @ApiModelProperty(value = "2级分类")
    @TableField("two_category_id")
    private Long twoCategoryId;

    @ApiModelProperty(value = "3级分类")
    @TableField("three_category_id")
    private Long threeCategoryId;

    @ApiModelProperty(value = "是否删除:1物资正常,0:物资回收,2:物资审核中")
    private Integer status;
}
