package com.xh.xiaoyiduo.admin.ddgl.service;

import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER;
import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER_DETAIL;
import org.springframework.ui.Model;

import java.util.Map;

/**
 */
public interface IOrderManageService {
    Map<String, Object> createGoodOrder(String goodId, Integer goodNum, Model model); //生成订单
    B_GOOD_ORDER showGoodOrdel(String orderId, Model model); //展示订单
}
