package com.xh.xiaoyiduo.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 */
@Controller
@RequestMapping("/shop")
public class ShopController {
    public final static String ABOUT_VIEW = "/shop/about";
    public final static String BUYTODAY = "/shop/buytoday";
    public final static String COMMODITY= "/shop/commodity";
    public final static String DETAILS = "/shop/details";
    public final static String INDEX = "/shop/index";
    public final static String INFORMATION = "/shop/information";
    public final static String LOGIN = "/shop/login";
    public final static String SHOPCART = "/shop/shopcart";
    public final static String REGISTER_VIEW = "/shop/register";

    @RequestMapping("/about")
    public String about(){
        System.out.println("view to about pages success");
        return ABOUT_VIEW;
    }

    @RequestMapping("/buytoday")
    public String buytoday(){
        System.out.println("view to buytoday pages success");
        return BUYTODAY;
    }

    @RequestMapping("/commodity")
    public String commodity(){
        System.out.println("view to commodity pages success");
        return COMMODITY;
    }

    @RequestMapping("/details")
    public String details(){
        System.out.println("view to details pages success");
        return DETAILS;
    }

    @RequestMapping("/index")
    public String index(){
        System.out.println("view to index pages success");
        return INDEX;
    }

    @RequestMapping("/information")
    public String information(){
        System.out.println("view to information pages success");
        return INFORMATION;
    }

    @RequestMapping("/login")
    public String login(){
        System.out.println("view to login pages success");
        return LOGIN;
    }

    @RequestMapping("/shopcart")
    public String shopcart(){
        System.out.println("view to shopcart pages success");
        return SHOPCART;
    }

    @RequestMapping("/register")
    public String register(){
        System.out.println("view to register pages success");
        return REGISTER_VIEW;
    }
}
