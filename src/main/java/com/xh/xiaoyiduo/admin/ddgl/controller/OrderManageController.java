package com.xh.xiaoyiduo.admin.ddgl.controller;

import com.alibaba.fastjson.JSON;
import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER;
import com.xh.xiaoyiduo.admin.ddgl.service.IOrderManageService;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import com.xh.xiaoyiduo.shop.service.IS_USERService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 */
@Controller
@RequestMapping("/order")
public class OrderManageController {

    @Autowired
    IOrderManageService orderManageService;
    @Autowired
    IS_USERService userService;

    /**
     * 加载订单
     * @param goodId
     * @param goodNum
     * @param model
     * @return
     */
    @RequestMapping("/createGoodOrderInfo")
    public String createGoodOrderInfo(String goodId, Integer goodNum, Model model){
        orderManageService.createGoodOrder(goodId, goodNum, model);
        return "/admin/ddgl/goodOrderPage";
    }

    @RequestMapping("/showGoodOrderPage")
    public String showGoodOrderPage(String orderId, Model model){
        orderManageService.showGoodOrdel(orderId, model);
        return "/admin/ddgl/goodOrderPage";
    }

    /**
     * 前端展示订单管理
     * @return
     */
    @RequestMapping("/toFrontOrderAdminPage")
    public String toFrontOrderAdminPage(String buyerId, Model model){
        S_USER user = (S_USER)SecurityUtils.getSubject().getPrincipal();
        List<B_GOOD_ORDER> orderList = new ArrayList<>();
        if(user != null) {
            String currentId = user.getUserId();
            orderList = orderManageService.showGoodOrderList(currentId);
        }
        model.addAttribute("orderList", orderList);
        return "/admin/ddgl/frontOrderAdmin";
    }


    @RequestMapping("/updateReceiverAddress")
    @ResponseBody
    public Object updateReceiverAddress(){
        S_USER currentUser = (S_USER)SecurityUtils.getSubject().getPrincipal();
        S_USER user = userService.selectByUserId(currentUser.getUserId());
        return user;
    }

    /**
     * 保存订单
     * @param order
     * @return
     */
    @RequestMapping("/saveGoodOrder")
    public String saveGoodOrder(B_GOOD_ORDER order){
        orderManageService.saveGoodOrder(order);
        return "/admin/ddgl/goodOrderPage";
    }

    /**
     * 删除订单
     * @return
     */
    @RequestMapping("/deleteOrderItemByOrderId")
    @ResponseBody
    public Map<String, Object> deleteOrderItemByOrderId(String orderId, Model model) {
        Map<String, Object> result = new HashMap<>();
        int i = orderManageService.deleteOrderItemByOrderId(orderId);
        if(i > 0) {
            result.put("success", true);
            System.out.println("删除订单成功");
        } else {
            System.out.println("删除订单失败");
        }
        return result;
    }

    /**
     * 批量删除订单
     * @return
     */
    @RequestMapping("/deleteOrderItemByOrderIds")
    @ResponseBody
    public Map<String, Object> deleteOrderItemByOrderIds(String orderIds) {
        Map<String, Object> result = new HashMap<>();
        String[] orders = orderIds.split(",");
        int sum = 0;
        int temp = 0;
        for(int i = 0; i < orders.length; i++) {
            temp = orderManageService.deleteOrderItemByOrderId(orders[i]);
            if(temp > 0) {
                sum++;
            }
        }

        if(sum > 0) {
            result.put("success", true);
            result.put("msg", "成功删除"+sum+"个订单");
            System.out.println("批量删除订单成功");
        } else {
            System.out.println("批量删除订单失败");
        }
        return result;
    }

    /**
     * 查看订单详情，前端
     * @return
     */
    @RequestMapping("/seeOrderDetail")
    public String seeOrderDetail(String orderId, Model model) {
        orderManageService.showGoodOrdel(orderId, model);
        return "/admin/ddgl/orderDetail";
    }

//    后端功能

    @RequestMapping("/backOrderManagePage")
    public String backOrderManagePage(){
        return "/admin/ddgl/backend/backOrderAdmin";
    }

    /**
     * 后端获取订单列表
     * @param limit
     * @param page
     * @param response
     * @return
     */
    @RequestMapping("/getAllOrders")
    @ResponseBody
    public String getAllOrders(String sellerId, String orderId, String buyerName, String orderStatus, String page, String limit, HttpServletResponse response){
        Subject currentUser = SecurityUtils.getSubject();
        int count = 0;
        List<B_GOOD_ORDER> orderList = new ArrayList<>();
        String orderListJson;

        S_USER user = (S_USER)currentUser.getPrincipal();
        if(user != null) {
            String userId = user.getUserId();

            boolean isAdmin = currentUser.hasRole("admin");

            if(isAdmin) {
                count = orderManageService.getOrderCount(null,orderId,buyerName,orderStatus);
                orderList = orderManageService.getAllOrdersBackend(null,orderId,buyerName,orderStatus, page, limit);
            } else {
                count = orderManageService.getOrderCount(userId,orderId,buyerName,orderStatus);
                orderList = orderManageService.getAllOrdersBackend(userId,orderId,buyerName,orderStatus, page, limit);
            }
        }

        if(count > 0){
            System.out.println("not orderId");
        } else {
            System.out.println("orderId exist");
        }

        orderListJson = JSON.toJSONString(orderList); //将对象转换成json
        String json = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + orderListJson + "}";
        return json;
    }

    /**
     * 删除订单
     * @param
     * @param response
     * @return
     */
    @RequestMapping("/deleteOrder")
    @ResponseBody
    public Object deleteUser(String orderId, HttpServletResponse response){

        int count = orderManageService.deleteOrderByOrderId(orderId);
        Map<String, Object> data = new HashMap<>();

        if(count > 0){
            data.put("success", true);
            data.put("msg", "删除订单成功 ");
            System.out.println("删除订单成功");
        } else {
            data.put("success", false);
            data.put("msg", "删除订单失败");
            System.out.println("删除订单失败");
        }

        return data;
    }

    /**
     * 批量删除订单
     * @param
     * @param response
     * @return
     */
    @RequestMapping("/deleteOrderInfos")
    @ResponseBody
    public Object deleteOrderInfos(String orderIds, HttpServletResponse response){
        String[] orderId = orderIds.split("，");
        int count = 0;
        int temp = 0;
        for(int i = 0; i < orderId.length; i++){
            temp = orderManageService.deleteOrderByOrderId(orderId[i]);
            if(temp > 0) {
                count ++;
            }
        }

        System.out.println("成功删除" + count + "个订单");
        Map<String,Object> data = new HashMap<>();
        if(count > 0) {
            data.put("success", true);
            data.put("msg", "删除成功 ");
        } else {
            data.put("success", false);
            data.put("msg", "删除失败 ");
        }
        return data;
    }

    /**
     * 后端查看订单详情
     * @param orderId
     * @param model
     * @return
     */
    @RequestMapping("/toBackOrderDetailPage")
    public String toBackOrderDetailPage(String orderId, String type, Model model) {
        B_GOOD_ORDER order = orderManageService.showBackGoodOrdel(orderId);
        model.addAttribute("order", order);
        model.addAttribute("type", type);
        return "/admin/ddgl/backend/backOrderDetail";
    }

    /**
     * 保存后端订单详情
     * @param order
     * @return
     */
    @RequestMapping("/saveBackOrderDetail")
    @ResponseBody
    public Map<String, Object> saveBackOrderDetail(B_GOOD_ORDER order){
        Map<String, Object> result =  new HashMap<>();
        int i = orderManageService.saveBackOrderDetail(order);
        if(i > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        return result;
    }
}
