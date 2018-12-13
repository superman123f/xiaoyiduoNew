package com.xh.xiaoyiduo.shop.controller;

import com.alibaba.fastjson.JSON;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import com.xh.xiaoyiduo.shop.service.IS_USERService;
import com.xh.xiaoyiduo.utils.miaodiyun.httpApiDemo.AccountInfo;
import com.xh.xiaoyiduo.utils.miaodiyun.httpApiDemo.IndustrySMS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 */
@Controller
@RequestMapping("/user")
public class S_USERController {

    private int random = 000000;

    @Autowired
    IS_USERService userService;

    @RequestMapping("/toRegisterPage")
    public String toRegisterPage(){
        System.out.println("跳转到注册页面");
        return "/shop/register";
    }

    @RequestMapping("/register")
    public String register(S_USER user){
        System.out.println("studentNo==>" + user.getStudentNo());
        System.out.println("nickname==>" + user.getNickname());
//        System.out.println("password==>" + password);

//        S_USER user = new S_USER();
//        user.setDormitoryAddress("f");
//        user.setEmail("f");
//        user.setNickname("f");
//        user.setPassword("f");
//        user.setPhone("f");
//        user.setRealName("f");
//        user.setSex("d");
//        user.setStudentNo("d");
//        user.setUserId("d");
//        int i = userService.insert(user);
//        if(i > 0){
//            System.out.println("添加用户成功！");
//        }else {
//            System.out.println("添加失败！");
//        }
        return "/admin/admin";
    }

//    获取手机验证码
    @RequestMapping("/getPhoneCode")
    public void getPhoneCode(String phoneNumber, HttpServletResponse response){
        System.out.println("getting code....");

        System.out.println("phoneNumber " + phoneNumber);
        //生成随机6位数
        random = (int)((Math.random()*9+1)*100000);

        System.out.println("手机验证码为： " + random);

//        发送验证码
//        AccountInfo.execute(); // 获取开发者账号信息
//        IndustrySMS.execute(phoneNumber, random); // 验证码通知短信接口

//        {"respCode":"00000","respDesc":"请求成功。","failCount":"0","failList":[],"smsId":"bad667c2f1d94b749a1f3c46672d383d"}

        Map<String,Object> result = new HashMap<>();
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer;

        result.put("success", true);
        result.put("msg", "验证码发送成功");

        String str = JSON.toJSONString(result);
        System.out.println(str);

        try {
            writer = response.getWriter();
            writer.print(str);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
