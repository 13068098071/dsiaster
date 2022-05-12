package com.ma.disaster.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ma.disaster.mapper.ProductMapper;
import com.ma.disaster.pojo.InStock;
import com.ma.disaster.mapper.InStockMapper;
import com.ma.disaster.pojo.Product;
import com.ma.disaster.service.IInStockService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ma.disaster.vo.InStockDetailVO;
import com.ma.disaster.vo.InStockVO;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.UUID;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 马志超
 * @since 2022-04-07
 */
@Service
public class InStockServiceImpl extends ServiceImpl<InStockMapper, InStock> implements IInStockService {

    @Resource
    private InStockMapper inStockMapper;

    @Resource
    private ProductMapper productMapper;
    /**
     * 入库单列表
     * @param page
     * @param inStockVO
     * @return
     */
    @Override
    public Page<InStockVO> findInStockList(Page<InStockVO> page, InStockVO inStockVO) {
        return inStockMapper.findInStockList(page,inStockVO);
    }

    @Override
    public InStockDetailVO detail(Page<InStockDetailVO> inStockDetailVOPage, Long id) {
        InStockDetailVO inStockDetailVO = new InStockDetailVO();
        InStock inStock = inStockMapper.selectById(id);

        return null;
    }

    /**
     * 导出入库表单
     * @return
     */
    @Override
    public List<InStockVO> findInStockExport() {
        return inStockMapper.findInStockExport();
    }

    @Override
    public void addIntoStock(InStockVO inStockVO) {
        //随机生成入库单号
        String IN_STOCK_NUMBER = UUID.randomUUID().toString().substring(0, 32).replace("-", "");
        //记录改单总数
        int itemNUmber = 0;
        //商品，明细
        List<Object> products = inStockVO.getProducts();
        if (!CollectionUtils.isEmpty(products)) {
            for (Object product : products) {
                LinkedHashMap item = ((LinkedHashMap) product);
                //入库数量
                int productNumber = (int) item.get("productNumber");
                //物资编号
                Integer productId = (Integer) item.get("productId");
                Product dbProduct = productMapper.selectById(productId);
            }
        }
    }
}
