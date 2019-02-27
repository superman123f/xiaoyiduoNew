package com.xh.xiaoyiduo.admin.ddgl.controller;

import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER;
import com.xh.xiaoyiduo.admin.ddgl.service.IOrderManageService;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import com.xh.xiaoyiduo.shop.service.IS_USERService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String toFrontOrderAdminPage(Model model){
        List<B_GOOD_ORDER> orderList = orderManageService.showGoodOrderList();
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
}
