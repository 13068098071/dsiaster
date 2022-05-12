package com.ma.disaster.service.impl;

import com.ma.disaster.pojo.Supplier;
import com.ma.disaster.mapper.SupplierMapper;
import com.ma.disaster.service.ISupplierService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ma.disaster.vo.SupplierVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-07
 */
@Service
public class SupplierServiceImpl extends ServiceImpl<SupplierMapper, Supplier> implements ISupplierService {

    @Resource
    private SupplierMapper supplierMapper;

    @Override
    public Supplier add(SupplierVO supplierVO) {
        Supplier supplier = new Supplier();
        BeanUtils.copyProperties(supplierVO,supplier);
        supplier.setCreateTime(LocalDateTime.now());
        supplier.setModifiedTime(LocalDateTime.now());
        supplierMapper.insert(supplier);
        return supplier;
    }
}
