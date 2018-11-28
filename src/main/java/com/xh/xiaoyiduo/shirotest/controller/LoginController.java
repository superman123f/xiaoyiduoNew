package com.xh.xiaoyiduo.shirotest.controller;

import com.xh.xiaoyiduo.shirotest.pojo.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/s")
public class LoginController {
    @RequestMapping("/login")
    public String login() {
        System.out.println("loin跳转");
//        return "login";
        return "login";
    }

    @RequestMapping("/a")
    public String a() {
        return "a";
    }

    @RequestMapping("/loginUser")
    public String loginUser(String username, String password, HttpSession session) {
        //授权认证
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        try {
            //完成登录
            subject.login(usernamePasswordToken);
            //获得用户对象
            User user = (User) subject.getPrincipal();
            //存入session
            session.setAttribute("user", user);
            return "index";
        } catch (Exception e) {
            return "login";//返回登录页面
        }

    }

//    退出
    @RequestMapping("/logOut")
    public String logOut(HttpSession session) {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
//        session.removeAttribute("user");
        return "login";
    }

    //    admin角色
    @RequestMapping("/admin")
//    @ResponseBody
    public String admin(){
        System.out.println("admin");
        return "admin";
    }

    //    customer角色
    @RequestMapping("/customer")
//    @ResponseBody
    public String customer(){
        System.out.println("customer");
        return "customer";
    }

//    只有添加权限的用户可以访问
    @RequestMapping("/add")
//    @ResponseBody
    public String add(){
        System.out.println("add");
        return "add";
    }

//    删除
    @RequestMapping("/delete")
//    @ResponseBody
    public String delete(){
        System.out.println("delete");
        return "delete";
    }

//    查询
    @RequestMapping("/query")
//    @ResponseBody
    public String query(){
        System.out.println("query");
        return "query";
    }

//    update
    @RequestMapping("/update")
//    @ResponseBody
    public String insert(){
        System.out.println("update");
        return "update";
    }


}