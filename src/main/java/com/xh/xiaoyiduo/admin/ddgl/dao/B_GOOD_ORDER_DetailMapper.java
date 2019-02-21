package com.xh.xiaoyiduo.admin.ddgl.dao;

import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER_DETAIL;
import org.springframework.stereotype.Repository;

@Repository("orderDetailMapper")
public interface B_GOOD_ORDER_DetailMapper {
    int deleteByPrimaryKey(String detailId);

    int insert(B_GOOD_ORDER_DETAIL record);

    int insertSelective(B_GOOD_ORDER_DETAIL record);

    B_GOOD_ORDER_DETAIL selectByPrimaryKey(String detailId);

    int updateByPrimaryKeySelective(B_GOOD_ORDER_DETAIL record);

    int updateByPrimaryKey(B_GOOD_ORDER_DETAIL record);
}