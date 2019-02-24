package com.xh.xiaoyiduo.admin.ddgl.controller;

import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER;
import com.xh.xiaoyiduo.admin.ddgl.service.IOrderManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 */
@Controller
@RequestMapping("/order")
public class OrderManageController {

    @Autowired
    IOrderManageService orderManageService;

    @RequestMapping("/createGoodOrderInfo")
    @ResponseBody
    public  Map<String, Object> createGoodOrderInfo(String goodId, Integer goodNum, Model model){
        Map<String, Object> result = orderManageService.createGoodOrder(goodId, goodNum, model);
        return result;
    }

    @RequestMapping("/showGoodOrderPage")
    public String showGoodOrderPage(String orderId, Model model){
        orderManageService.showGoodOrdel(orderId, model);
        return "/admin/ddgl/goodOrderPage";
    }

    @RequestMapping("/toFrontOrderAdminPage")
    public String toFrontOrderAdminPage(){
        return "/admin/ddgl/frontOrderAdmin";
    }
}
