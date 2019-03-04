package com.xh.xiaoyiduo.admin.ddgl.dao;

import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("orderMapper")
public interface B_GOOD_ORDERMapper {
    int deleteByPrimaryKey(String orderId);

    int insert(B_GOOD_ORDER record);

    int insertSelective(B_GOOD_ORDER record);

    B_GOOD_ORDER selectByPrimaryKey(String orderId);

    List<B_GOOD_ORDER> selectAllOrder(@Param("buyerId")String buyerId);

    int updateByPrimaryKeySelective(B_GOOD_ORDER record);

    int updateByPrimaryKey(B_GOOD_ORDER record);

//    --------------后端----------

    int getOrderCount(@Param("sellerId")String sellerId,@Param("orderId")String orderId, @Param("buyerName")String buyerName, @Param("orderStatus")String orderStatus); //订单个数
    //获取所有订单
    List<B_GOOD_ORDER> getAllOrdersBackend(@Param("sellerId")String sellerId,@Param("orderId")String orderId, @Param("buyerName")String buyerName, @Param("orderStatus")String orderStatus,@Param("currentPage")String currentPage, @Param("pageSize")String pageSize);

    B_GOOD_ORDER showBackGoodOrdel(String orderId);
}