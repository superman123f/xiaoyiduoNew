package com.xh.xiaoyiduo.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    private final static String ADMIN_VIEW = "/admin/admin";
    private final static String ADMINROLE_VIEW = "/admin/adminRole";
    private final static String CONTROLE_VIEW = "/admin/control";
    private final static String CREATE_VIEW = "/admin/create";
    private final static String INDEX_VIEW = "/admin/index";
    private final static String MEMBER_VIEW = "/admin/member";
    private final static String ROLE_VIEW = "/admin/role";
    private final static String RULE_VIEW = "/admin/rule";
    private final static String SYSCONFIG_VIEW = "/admin/sysConfig";
    private final static String UPLOAD_VIEW = "/admin/upload";



    @RequestMapping("/admin")
    public String admin(){
        System.out.println("测试后端框架");
        return ADMIN_VIEW;
    }

    @RequestMapping("/portal")
    public String admin1(){
        System.out.println("后台框架首页");
        return "/admin/portal/main";
    }

    @RequestMapping("/adminRole")
    public String adminRole(){
        System.out.println("测试后端框架");
        return ADMINROLE_VIEW;
    }
    @RequestMapping("/control")
    public String control(){
        System.out.println("测试后端框架");
        return CONTROLE_VIEW;
    }
    @RequestMapping("/create")
    public String create(){
        System.out.println("测试后端框架");
        return CREATE_VIEW;
    }
    @RequestMapping("/index")
    public String index(){
        System.out.println("测试后端框架");
        return INDEX_VIEW;
    }
    @RequestMapping("/member")
    public String member(){
        System.out.println("测试后端框架");
        return MEMBER_VIEW;
    }
    @RequestMapping("/role")
    public String role(){
        System.out.println("测试后端框架");
        return ROLE_VIEW;
    }
    @RequestMapping("/rule")
    public String rule(){
        System.out.println("测试后端框架");
        return RULE_VIEW;
    }

    @RequestMapping("/sysConfig")
    public String sysConfig(){
        System.out.println("测试后端框架");
        return SYSCONFIG_VIEW;
    }
    @RequestMapping("/upload")
    public String upload(){
        System.out.println("测试后端框架");
        return UPLOAD_VIEW;
    }
}
