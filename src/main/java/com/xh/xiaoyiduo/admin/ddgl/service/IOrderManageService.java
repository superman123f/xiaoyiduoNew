package com.xh.xiaoyiduo.admin.ddgl.service;

import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER;
import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER_DETAIL;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 */
public interface IOrderManageService {
    //-------------frontend------------//
    Map<String, Object> createGoodOrder(String goodIds, String goodNums, Model model); //生成订单
    B_GOOD_ORDER showGoodOrdel(String orderId, Model model); //展示订单
    List<B_GOOD_ORDER> showGoodOrderList(String buyerId); //前端显示用户所有订单
    int saveGoodOrder(List<B_GOOD_ORDER> orderList, String cartIds, String source, Model model, HttpServletRequest request); //批量保存订单
    int deleteOrderItemByOrderId(String orderId); //删除订单
    int updateUserInfoByUserId(S_USER user); //更新用户信息

    //-------------backend------------//
    int getOrderCount(String sellerId,String orderId, String buyerName, String orderStatus); //订单个数
    List<B_GOOD_ORDER> getAllOrdersBackend(String sellerId,String orderId, String buyerName, String orderStatus,String currentPage, String pageSize);// 后端获取所有订单
    int deleteOrderByOrderId(String orderId); //删除订单
    B_GOOD_ORDER showBackGoodOrdel(String orderId, Model model); //查看订单详情
    int saveBackOrderDetail(B_GOOD_ORDER order); //更新订单详情

}
