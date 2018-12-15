package com.xh.xiaoyiduo.shop.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import com.xh.xiaoyiduo.shop.service.IS_USERService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.security.auth.login.AccountNotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 */
@Controller
@RequestMapping("/user")
public class S_USERController {

    @Autowired
    IS_USERService userService;

    @RequestMapping("/login")
    public String login(String userAccount, String password){
        System.out.println("登录用户校验身份");
        System.out.println("用户名： " + userAccount);
        System.out.println("密码： " + password);

        UsernamePasswordToken token = new UsernamePasswordToken(userAccount, password);
        Subject currentUser = SecurityUtils.getSubject();


        try {
            currentUser.login(token);
        } catch (UnknownAccountException e) {
            System.out.println("用户名不存在");
        } catch (IncorrectCredentialsException e) {
            System.out.println("密码错误");
        }

//        S_USER user = userService.selectByPhone(userAccount);
//        userService.selectByStudentNo(userAccount);
//        userService.selectByNickname(userAccount);

        return "/shop/commodity";
    }

    @RequestMapping("/toRegisterPage")
    public String toRegisterPage(){
        System.out.println("跳转到注册页面");
//        return "/shop/register";
        return "/shop/register";
    }

    @RequestMapping("/register")
    public String register(S_USER user, HttpServletRequest request){
        System.out.println("studentNo==>" + user.getStudentNo());
        System.out.println("nickname==>" + user.getNickname());

        //校验验证码的有效时间
        HttpSession session = request.getSession();
        if(session.getAttribute("random") != null){
            Date sendDate = (Date)session.getAttribute("sendDate");
            Date currentDate = new Date();
            long leadTime = currentDate.getTime() - sendDate.getTime();
            long delayTime = 2 * 60 * 1000; //自定义有效时间 2分钟
            System.out.println("时间差距： " + leadTime);
            if(leadTime > delayTime){
                session.removeAttribute("random");  //清除验证码
                System.out.println("验证码超过有效时间");
            }else{
                System.out.println("正在注册");
            }
        }else {
            System.out.println("验证码失效，请重新获取验证码");
        }



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
        return "/shop/login";
    }

//    获取手机验证码
    @RequestMapping("/getPhoneCode")
    public void getPhoneCode(String phoneNumber, HttpServletRequest request, HttpServletResponse response){
        System.out.println("phoneNumber " + phoneNumber);
        //生成随机6位数
        int random = (int)((Math.random()*9+1)*100000);
        Date sendDate = new Date(); //发送验证码日期

        System.out.println("手机验证码为： " + random);
        System.out.println("发送验证码日期: " + sendDate);

        HttpSession session = request.getSession();
        session.setAttribute("random", random);
        session.setAttribute("sendDate", sendDate);

//        秒滴云发送验证码，系统完成时，需要启动下面这两行代码
//        AccountInfo.execute(); // 获取开发者账号信息
//        String messageResult = IndustrySMS.execute(phoneNumber, random); // 返回结果

//        模拟返回结果，系统完成时，需注释这行代码
        String messageResult = "{\"respCode\":\"00000\",\"respDesc\":\"请求成功。\",\"failCount\":\"0\",\"failList\":[],\"smsId\":\"bad667c2f1d94b749a1f3c46672d383d\"}";

        //获取json格式中的值
        JSONObject jsonObject = JSON.parseObject(messageResult);
        String respCode = jsonObject.get("respCode").toString(); //响应码为00000，表示发送成功，但并不代表成功发送到用户手机上。
        System.out.println("短信返回状态码 " + respCode);

//        返回json数据
        Map<String,Object> result = new HashMap<>();
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer;

        if(respCode.equals("00000")) {
            result.put("success", true);
            result.put("msg", "验证码发送成功，验证码为：" + random + ",为了方便测试。");
        }else {
            result.put("success", false);
            result.put("msg", "验证码发送失败");
        }

        String str = JSON.toJSONString(result); //将Map对象转换为json
        System.out.println(str);

        try {
            writer = response.getWriter();
            writer.print(str);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/findPwd")
    public String findPwd(){
        System.out.println("跳转到找回密码页面");
        return "/shop/findPwd";
    }

}
