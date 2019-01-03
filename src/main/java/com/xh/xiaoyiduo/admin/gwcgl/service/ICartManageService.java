package com.xh.xiaoyiduo.admin.gwcgl.service;

import com.xh.xiaoyiduo.admin.gwcgl.pojo.B_GOOD_CART;

import java.util.List;

/**
 */
public interface ICartManageService {

    int deleteCartItemByCartId(String cartId); //删除购物项

    int insert(B_GOOD_CART cart); //添加商品到购物车

    Integer queryCartGoodCountsByUserId(String userId); //查询购物车商品个数

    List<B_GOOD_CART> getCurrentUserCartInfos(String currentUserId); //获取登录用户的购物车信息列表

}
