package com.ma.disaster.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.pojo.Category;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ma.disaster.vo.ProductCategoryTreeNodeVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 马志超
 * @since 2022-04-03
 */
public interface CategoryMapper extends BaseMapper<Category> {

    List<Category> getAllCategory(@Param("pid") int pid);

    Page<ProductCategoryTreeNodeVO> categoryTree(Page page);

    /**
     * 获取二级菜单
     * @param id
     * @return
     */
    List<Category> getCategoryByPid(@Param("id") Long id);
}
