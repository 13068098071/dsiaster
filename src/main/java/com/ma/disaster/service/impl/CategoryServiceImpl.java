package com.ma.disaster.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.common.PageVO;
import com.ma.disaster.pojo.Category;
import com.ma.disaster.mapper.CategoryMapper;
import com.ma.disaster.service.ICategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ma.disaster.vo.ProductCategoryTreeNodeVO;
import com.ma.disaster.vo.ProductCategoryVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-03
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements ICategoryService {

    @Resource
    private CategoryMapper categoryMapper;

    @Override
    public List<Category> getAllCategory() {
        return categoryMapper.getAllCategory(0);
    }

    @Override
    public Page<ProductCategoryTreeNodeVO> categoryTree(Page page) {
        return categoryMapper.categoryTree(page);
    }

    /**
     * 获取二级菜单
     * @param id
     * @return
     */
    @Override
    public List<Category> getCategoryByPid(Long id) {
        return categoryMapper.getCategoryByPid(id);
    }


}
