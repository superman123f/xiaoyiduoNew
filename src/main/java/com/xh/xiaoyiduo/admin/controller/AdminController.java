package com.xh.xiaoyiduo.admin.controller;

import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
import com.xh.xiaoyiduo.admin.spgl.service.IGoodManageService;
import com.xh.xiaoyiduo.admin.yygl.service.IUserManageService;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import com.xh.xiaoyiduo.shop.service.IS_USERService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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
    private final static String USERADMIN_VIEW = "/admin/userAdmin";
    private final static String SYSCONFIG_VIEW = "/admin/sysConfig";
    private final static String UPLOAD_VIEW = "/admin/upload";
    private final static String GOODADMIN_VIEW = "/admin/spgl/goodAdmin";
    private final static String GOODINFO_VIEW = "/admin/spgl/goodInfo";

    @Autowired
    IS_USERService userService;
    @Autowired
    IGoodManageService goodManageService;


    @RequestMapping("/admin")
    public String admin(){
        System.out.println("测试后端框架");
        return ADMIN_VIEW;
    }

    @RequestMapping("/portal")
    public String admin1(Model model){
        // 获取当前用户id
        S_USER currentUser = (S_USER) SecurityUtils.getSubject().getPrincipal();
        if(currentUser != null) {
            String userId = currentUser.getUserId();
            S_USER user = userService.selectByUserId(userId);
            model.addAttribute("user", user);
        }

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
    @RequestMapping("/userAdmin")
    public String rule(){
        System.out.println("测试后端框架");
        return USERADMIN_VIEW;
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

    @RequestMapping("/goodAdmin")
    public String goodAdmin(){
        System.out.println("测试后端框架");
        return GOODADMIN_VIEW;
    }

    @RequestMapping("/goodInfo")
    public String goodInfo(Model model){
        List<B_GOOD_FATHER> fatherList = goodManageService.getGoodFatherList();
        model.addAttribute("fatherList", fatherList);
        return GOODINFO_VIEW;
    }}
