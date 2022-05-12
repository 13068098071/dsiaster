package com.ma.disaster.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.annotation.LogAnnotation;
import com.ma.disaster.common.PageVO;
import com.ma.disaster.common.Result;
import com.ma.disaster.pojo.Category;
import com.ma.disaster.service.ICategoryService;
import com.ma.disaster.vo.ProductCategoryTreeNodeVO;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  物资类别
 * </p>
 *
 * @author 马志超
 * @since 2022-04-03
 */
@RestController
@RequestMapping("/category")
public class CategoryController {

    @Resource
    private ICategoryService categoryService;

    /**
     * 获取父级分类树：2级树
     *
     * @return
     */
    @ApiOperation(value = "父级分类树")
    @GetMapping("/getParentCategoryTree")
    //@LogAnnotation(module = "category",operator = "查询物资分类信息")
    public Result getParentCategoryTree() {
        List<Category> categories = categoryService.getAllCategory();
        return Result.success(categories);
    }

    /**
     * 分类树形结构(分页)
     *
     * @return
     */
    @ApiOperation(value = "分类树形结构")
    @GetMapping("/categoryTree")
    public Result categoryTree(@RequestParam(value = "pageNum", required = false) Integer pageNum,
                                     @RequestParam(value = "pageSize", required = false) Integer pageSize) {

        List<Category> oneCategory = categoryService.getCategoryByPid(0L);
        List<Category> twoCategory = getTwoCategory(oneCategory);
        List<Category> threeCategory = getThreeCategory(twoCategory);
        return Result.success(threeCategory);
    }

    /**
     * 获取二级菜单
     * @param categories
     * @return
     */
    public List<Category> getTwoCategory(List<Category> categories){
        for (Category category : categories) {
            List<Category> children = categoryService.getCategoryByPid(category.getId());
            category.setChildren(children);
        }
        return categories;
    }

    /**
     * 获取三级菜单
     * @param categories
     * @return
     */
    public List<Category> getThreeCategory(List<Category> categories){
        for (Category category : categories) {
            for (int i = category.getChildren().size() - 1; i >= 0; i--) {
                List<Category> children = categoryService.getCategoryByPid(category.getChildren().get(i).getId());
                category.getChildren().get(i).setChildren(children);
            }
        }
        return categories;
    }
}
