package com.xh.xiaoyiduo.admin.ddgl.dao;

import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("orderMapper")
public interface B_GOOD_ORDERMapper {
    int deleteByPrimaryKey(String orderId);

    int insert(B_GOOD_ORDER record);

    int insertSelective(B_GOOD_ORDER record);

    B_GOOD_ORDER selectByPrimaryKey(String orderId);

    List<B_GOOD_ORDER> selectAllOrder();

    int updateByPrimaryKeySelective(B_GOOD_ORDER record);

    int updateByPrimaryKey(B_GOOD_ORDER record);
}