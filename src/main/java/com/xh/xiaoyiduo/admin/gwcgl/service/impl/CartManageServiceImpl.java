package com.xh.xiaoyiduo.admin.gwcgl.service.impl;

import com.xh.xiaoyiduo.admin.gwcgl.dao.B_GOOD_CartMapper;
import com.xh.xiaoyiduo.admin.gwcgl.pojo.B_GOOD_CART;
import com.xh.xiaoyiduo.admin.gwcgl.service.ICartManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 */
@Service("cartManageService")
public class CartManageServiceImpl implements ICartManageService {

    @Autowired
    B_GOOD_CartMapper cartMapper;

    @Override
    public int deleteCartItemByCartId(String cartId) {
        return cartMapper.deleteByPrimaryKey(cartId);
    }

    @Override
    public int insert(B_GOOD_CART cart) {
        return cartMapper.insert(cart);
    }

    @Override
    public Integer queryCartGoodCountsByUserId(String userId) {
        return cartMapper.queryCartGoodCountsByUserId(userId);
    }

    @Override
    public List<B_GOOD_CART> getCurrentUserCartInfos(String currentUserId) {
        return cartMapper.selectByPrimaryKey(currentUserId);
    }
}
