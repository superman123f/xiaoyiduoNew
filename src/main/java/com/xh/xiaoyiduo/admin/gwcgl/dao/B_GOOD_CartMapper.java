package com.xh.xiaoyiduo.admin.gwcgl.dao;

import com.xh.xiaoyiduo.admin.gwcgl.pojo.B_GOOD_CART;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("cartMapper")
public interface B_GOOD_CartMapper {
    int deleteByPrimaryKey(String cartId); //删除购物项

    int insert(B_GOOD_CART cart); //添加商品到购物车

    int insertSelective(B_GOOD_CART record);

    List<B_GOOD_CART> selectByPrimaryKey(@Param("userId") String currentUserId); //获取登录用户的购物车信息列表

    int updateByPrimaryKeySelective(B_GOOD_CART record);

    int updateByPrimaryKey(B_GOOD_CART record);
}