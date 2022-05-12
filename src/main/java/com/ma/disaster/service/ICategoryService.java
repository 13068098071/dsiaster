package com.ma.disaster.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.PageVO;
import com.ma.disaster.pojo.Category;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ma.disaster.vo.ProductCategoryTreeNodeVO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-03
 */
public interface ICategoryService extends IService<Category> {

    /**
     * 获取所有的分类
     * @return
     */
    List<Category> getAllCategory();

    /**
     *
     * @param page
     * @return
     */
    Page<ProductCategoryTreeNodeVO> categoryTree(Page page);

    /**
     * 获取二级菜单
     * @param id
     * @return
     */
    List<Category> getCategoryByPid(Long id);
}
