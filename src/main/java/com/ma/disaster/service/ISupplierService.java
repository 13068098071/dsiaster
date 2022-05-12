package com.ma.disaster.service;

import com.ma.disaster.pojo.Supplier;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ma.disaster.vo.SupplierVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-07
 */
public interface ISupplierService extends IService<Supplier> {

    Supplier add(SupplierVO supplierVO);
}
