package com.xh.xiaoyiduo.controller;

import com.xh.xiaoyiduo.pojo.User;
import com.xh.xiaoyiduo.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 */
@Controller
public class IndexController {

    @Autowired
    IUserService userService = null;

    @RequestMapping("/index")
    public String index(){
       return "index";
    }

    @RequestMapping("/index1")
    public String index1(){
        return "index";
    }

    @RequestMapping("/getUser")
    public User getUser(String username){
        return userService.getUser(username);
    }

    @RequestMapping("/insertUser")
    @ResponseBody
    public String insertUser(String username){
        int i = userService.insertUser(username);
        if(i > 0){
            return "插入成功";
        }

        return "插入失败";
    }
}
