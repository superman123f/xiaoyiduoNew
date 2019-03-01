package com.xh.xiaoyiduo.admin.ddgl.service;

import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER;
import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER_DETAIL;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

/**
 */
public interface IOrderManageService {
    Map<String, Object> createGoodOrder(String goodId, Integer goodNum, Model model); //生成订单
    B_GOOD_ORDER showGoodOrdel(String orderId, Model model); //展示订单
    List<B_GOOD_ORDER> showGoodOrderList(); //显示所有订单
    int saveGoodOrder(B_GOOD_ORDER order); //保存订单
    int deleteOrderItemByOrderId(String orderId); //删除订单
}
