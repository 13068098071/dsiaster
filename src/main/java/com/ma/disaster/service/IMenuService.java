package com.ma.disaster.service;

import com.ma.disaster.pojo.Menu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-10
 */
public interface IMenuService extends IService<Menu> {


    List<Menu> findMenus(String name);

}
