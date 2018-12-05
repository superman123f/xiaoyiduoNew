package com.xh.xiaoyiduo.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 */
@Controller
public class AdminController {
    @RequestMapping("/admin")
    public String admin(){
        System.out.println("测试后端框架");
        return "admin";
    }

    @RequestMapping("/adminRole")
    public String adminRole(){
        System.out.println("测试后端框架");
        return "adminRole";
    }
    @RequestMapping("/control")
    public String control(){
        System.out.println("测试后端框架");
        return "control";
    }
    @RequestMapping("/create")
    public String create(){
        System.out.println("测试后端框架");
        return "create";
    }
    @RequestMapping("/index")
    public String index(){
        System.out.println("测试后端框架");
        return "index";
    }
    @RequestMapping("/member")
    public String member(){
        System.out.println("测试后端框架");
        return "member";
    }
    @RequestMapping("/role")
    public String role(){
        System.out.println("测试后端框架");
        return "role";
    }
    @RequestMapping("/rule")
    public String rule(){
        System.out.println("测试后端框架");
        return "rule";
    }

    @RequestMapping("/sysConfig")
    public String sysConfig(){
        System.out.println("测试后端框架");
        return "sysConfig";
    }
    @RequestMapping("/upload")
    public String upload(){
        System.out.println("测试后端框架");
        return "upload";
    }
}
