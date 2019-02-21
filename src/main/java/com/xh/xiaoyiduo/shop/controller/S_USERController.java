package com.xh.xiaoyiduo.shop.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xh.xiaoyiduo.admin.spgl.pojo.RESOURCES;
import com.xh.xiaoyiduo.admin.spgl.service.IResourcesManageService;
import com.xh.xiaoyiduo.admin.utils.newImageCut;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import com.xh.xiaoyiduo.shop.service.IS_USERService;
import com.xh.xiaoyiduo.utils.ShiroSHAUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.security.auth.login.AccountNotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 */
@Controller
@RequestMapping("/user")
@SessionAttributes("currentUser")
public class S_USERController {

    @Autowired
    IS_USERService userService;

    @Autowired
    IResourcesManageService resourcesManageService;

    /**
     * 检测用户是否登录
     * @return
     */
    @RequestMapping("/checkUserLogin")
    @ResponseBody
    public Map<String, Object> checkUserLogin(){
        Map<String, Object> result = new HashMap<>();
        S_USER currentUser = (S_USER) SecurityUtils.getSubject().getPrincipal();
        if(currentUser == null){
            result.put("success", false);
            result.put("msg", "该用户未登录");
        }
        return result;
    }

    @RequestMapping("/testUserHead")
    public String UserHeadTest(){
        return "/admin/yygl/testUserHead";
    }

    /**
     * 测试裁剪用户头像
     * @return
     */
    @RequestMapping("/testCutUserHead")
    @ResponseBody
    public Object testCutUserHead(MultipartFile pictureFile, String x, String y, String w, String h, HttpServletResponse response, Model model){

//        String oldName = file.getOriginalFilename(); //获取原名
////        String path = request.getServletContext().getRealPath("/upload/"); //获得项目所在绝对路径
//        String fileName = changeName(oldName); //将图片重命名
//
////        String rappendix = "upload/" + fileName; //返回给前端的路径
////        fileName = imgPath + fileName; //合并具体的路径
//
//
//        Map<String,Object> result = new HashMap<>(); //返回给前端的结果
//        String imgUrl = null; //保存好后的图片路径
//
//        File file1 = new File(".."); //创建文件夹
//        try {
//            String basePath = file1.getCanonicalPath()+"/resources/shop";
//            File baseFile = new File(basePath);
//            System.out.println("ready to make baseFile " + basePath);
//            if(!baseFile.exists()){
//                baseFile.mkdirs();
//                System.out.println("to make file success");
//            }
//
//            //获取项目根目录的上级目录,并把图片保存在该目录下
//            imgUrl = baseFile+"/"+fileName;
//            String newImgUrl = imgUrl.replaceAll("\\\\", "/");
//            File file2 = new File(imgUrl);
//            file.transferTo(file2); //保存图片
////            imgUrl.replaceAll("\\\\",  "/");
//            result.put("status", "0"); //0保存成功，1保存失败
//            result.put("src", newImgUrl); //图片路径
//            result.put("oldName", oldName); //原图片名称
//            System.out.println("save image success");
//            return result;
//        } catch (IllegalStateException e) {
//            result.put("status", "1");
//            System.out.println(imgUrl + "图片保存失败");
//            return result;
//        } catch (IOException e){
//            result.put("status", "1");
//            System.out.println(imgUrl + "图片保存失败");
//            return result;
//        }
        Map<String, Object> data = new HashMap<>();
        try{
            InputStream is = pictureFile.getInputStream();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            newImageCut.imgCut(baos, is, "", (int)Math.ceil(Double.parseDouble(x)), (int)Math.ceil(Double.parseDouble(y)), (int)Math.ceil(Double.parseDouble(w)), (int)Math.ceil(Double.parseDouble(h)));

            String oldName = pictureFile.getOriginalFilename(); //获取原文件名
            String newName = changeName(oldName); // 重命名
//            byte[] byteArray = baos.toByteArray(); //缓冲区

            String targetFile = "E:/guyuanhui/NewGraduateProject/xiaoyiduo/resources/user/"; // 保存用户头像的文件夹
            String targetPicture = targetFile + newName; // 保存的图片路径
            FileOutputStream fos = new FileOutputStream(new File(targetPicture));
            baos.writeTo(fos);
            baos.flush();
            baos.close();
            fos.flush();
            fos.close();

            // 获取当前用户id
            S_USER currentUser = (S_USER)SecurityUtils.getSubject().getPrincipal();
            if(currentUser != null) {
                String userId = currentUser.getUserId();
                // 删除已有的头像图片路径，但实际上图片是没有删除
                resourcesManageService.deleteByPrimaryKey(userId);
                // 保存用户头像地址
                String resourceId = UUID.randomUUID().toString().replaceAll("\\-", "");
                RESOURCES resource = new RESOURCES();
                resource.setResourceId(resourceId);
                resource.setUrl(targetPicture);
                resource.setType("0");
                resource.setSourceId(userId);
                resourcesManageService.insert(resource);
                // 重新获取用户信息
                currentUser = userService.selectByUserId(userId);
                model.addAttribute("currentUser", currentUser);
            }

            data.put("status", true);
            data.put("userImgUrl", targetPicture);
//            data.put("msg", "success");
        }catch(Exception e){
//            data.put("status",  true);
            e.printStackTrace();
            data.put("msg", "上传失败");
        }

        return data;
    }

    //将图片重命名
    public static String changeName(String oldName){
//        Random r = new Random();
//        Date d = new Date();
        //使用uuid命名
        String uuid = UUID.randomUUID().toString().replaceAll("\\-","");
        String newName = oldName.substring(oldName.indexOf('.'));
//        newName = r.nextInt(99999999) + d.getTime() + newName;
        newName = uuid + newName;
        return newName;
    }

    /**
     * 登录校验
     * @param userAccount
     * @param password
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public Map<String, Object> login(String userAccount, String password, Model model){
        System.out.println("登录用户校验身份");
        System.out.println("用户名： " + userAccount);
        System.out.println("密码： " + password);

        Map<String, Object> result = new HashMap<>();

        UsernamePasswordToken token = new UsernamePasswordToken(userAccount, password);
        Subject currentUser = SecurityUtils.getSubject();


        try {
            currentUser.login(token);
            S_USER user = (S_USER) SecurityUtils.getSubject().getPrincipal();
            String userId = user.getUserId();
            user = userService.selectByUserId(userId);
            model.addAttribute("currentUser", user);
            result.put("success", true);
            result.put("msg", "登录成功");
        } catch (UnknownAccountException e) {
            System.out.println("用户名不存在");
//            return "/shop/login";
            result.put("success", false);
            result.put("msg", "用户名不存在");
        } catch (IncorrectCredentialsException e) {
            System.out.println("密码错误");
//            return "/shop/login";
            result.put("success", false);
            result.put("msg", "密码错误");
        }

//        S_USER user = userService.selectByPhone(userAccount);
//        userService.selectByStudentNo(userAccount);
//        userService.selectByNickname(userAccount);

//        return "forward:/good/getSonGoodList";
        return result;
    }

    /**
     * 退出当前用户
     * @return
     */
    @RequestMapping("/logout")
    public String logout(){
        Subject currentUser = SecurityUtils.getSubject();

        try {
            currentUser.logout();
            System.out.println("退出系统成功");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "forward:/good/getSonGoodList";
    }

    @RequestMapping("/toRegisterPage")
    public String toRegisterPage(){
        System.out.println("跳转到注册页面");
//        return "/shop/register";
        return "/shop/register";
    }

    /**
     * 注册
     * @param user
     * @param request
     * @return
     */
    @RequestMapping("/register")
    @ResponseBody
    public Object register(S_USER user, HttpServletRequest request){
        System.out.println("studentNo==>" + user.getStudentNo());
        System.out.println("nickname==>" + user.getNickname());

        Map<String, Object> data = new HashMap<>();

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
                data.put("codeTimeOut", true);
                data.put("codeMsg", "验证码超过有效时间,请重新获取");
            }else{
                System.out.println("正在注册。。。");

                String uuid = UUID.randomUUID().toString().replaceAll("\\-", "");
                String passowrd = ShiroSHAUtil.sha1ToPassword(user.getNickname(), user.getPassword());

                user.setUserId(uuid);  //插入主键
                //user.setCreateTime(date);  //时间用sql生成，sysdate
                user.setPassword(passowrd);

                int i = userService.insert(user);
                if(i > 0){
                    System.out.println("添加用户成功！");
                    data.put("success", true);
                    data.put("userMsg", "添加用户成功");
                }else {
                    System.out.println("添加失败！");
                    data.put("success", false);
                    data.put("userMsg", "添加用户失败");
                }

                //赋予买家权限
                int j = userService.associateRoleByRoleId(uuid, uuid, "3"); //3为买家

                if(j > 0){
                    System.out.println("赋予买家权限成功");
                } else {
                    System.out.println("赋予买家权限失败");
                }
            }
        }else {
            System.out.println("验证码失效，请重新获取");
            data.put("codeTimeOut", true);
            data.put("codeMsg", "验证码失效，请重新获取");
        }

        return data;
    }


    /**
     * 获取手机验证码
     * @param phoneNumber
     * @param request
     * @param response
     */
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

    /**
     * 获取用户列表、模糊搜索用户
     * @param limit
     * @param page
     * @param response
     * @return
     */
    @RequestMapping("/getAllUsers")
    @ResponseBody
    public String getAllUsers(String limit, String page, String studentNo, String nickname, String realName, HttpServletResponse response){
        System.out.println("page: " + page);
        System.out.println("limite: " + limit);
        System.out.println("studentNo: " + studentNo);

        Integer i = userService.getUserCount(studentNo, nickname, realName);
        int count = 0;
        if(i == null){
            System.out.println("not account");
        } else {
            count = i.intValue();
            System.out.println("account exist");
        }

        List<S_USER> userList = userService.getAllUsers(limit, page, studentNo, nickname, realName);
        String userListJson  = JSON.toJSONString(userList); //将对象转换成json

        String json = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + userListJson + "}";
        return json;
    }


    /**
     * 搜索用户
     * @param studentNo
     * @return
     */
    @RequestMapping("/searchUser")
    @ResponseBody
    public String searchUser(String limit, String page, String studentNo, String nickname, String realName, HttpServletResponse response){
        Integer count = userService.getUserCount(studentNo, nickname, realName);

        List<S_USER> userList = userService.fuzzyQueryUsers(limit, page, studentNo, nickname, realName);
        String userListJson = JSON.toJSONString(userList);

        String json = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + userListJson + "}";

        return  json;
    }

    /**
     * 导出用户数据
     * @return
     */
    @RequestMapping("exportExcel")
    @ResponseBody
    public List<S_USER> exportExcel(){
        List<S_USER> userList = userService.exportUserExcel();
        return userList;
    }

    /**
     * 删除用户
     * @param userId
     * @param response
     * @return
     */
    @RequestMapping("/deleteUser")
    @ResponseBody
    public Object deleteUser(String userId, HttpServletResponse response){
        System.out.println("userId: " + userId);

        int count = userService.deleteByPrimaryKey(userId);
        Map<String, Object> data = new HashMap<>();

        if(count > 0){
            data.put("success", true);
            data.put("msg", "删除用户成功");
            System.out.println("删除用户成功");
        } else {
            data.put("success", false);
            data.put("msg", "删除用户失败");
            System.out.println("删除用户失败");
        }

        return data;
    }

    /**
     * 批量删除用户
     * @param userIds
     * @param response
     * @return
     */
    @RequestMapping("/deleteUserInfos")
    @ResponseBody
    public Object deleteUserInfos(String userIds, HttpServletResponse response){
        System.out.println("=============批量删除用户============");
        System.out.println(userIds);
        String[] userId = userIds.split("，");
        int count = userService.deleteByUserIds(userId);
        System.out.println("成功删除" + count + "条记录");
        Map<String,Object> data = new HashMap<>();
        if(count > 0) {
            data.put("success", true);
            data.put("msg", "删除成功");
        } else {
            data.put("success", false);
            data.put("msg", "删除失败");
        }
        return data;
    }


    /**
     * 查看或编辑用户信息
     * @param userId
     * @return
     */
    @RequestMapping("/userInfo")
    public String userInfo(String userId, Model model){
        System.out.println("用户编号为： " + userId);
        System.out.println("查看或编辑用户信息");
        S_USER user = userService.selectByUserId(userId);
        model.addAttribute("user", user);
        return "/admin/yygl/userInfo";
    }

    /**
     * 新增、编辑
     * @return
     */
    @RequestMapping("/updateUserInfo")
    @ResponseBody
    public Object updateUserInfo(S_USER user){

        Map<String, Object> data = new HashMap<>();

        //新增用户，判断id是否存在
        if(user.getUserId().equals("") || user.getUserId() == null){

            String uuid = UUID.randomUUID().toString().replaceAll("\\-", "");
            String passowrd = ShiroSHAUtil.sha1ToPassword(user.getNickname(), "123456"); //初始密码为123456，后期改为用户的手机号

            user.setUserId(uuid);  //插入主键
            //user.setCreateTime(date);  //时间用sql生成，sysdate
            user.setPassword(passowrd);

            int i = userService.insert(user); //添加用户

            String userRoleId = UUID.randomUUID().toString().replaceAll("\\-", "");
            //赋予买家权限
            int j = userService.associateRoleByRoleId(userRoleId, uuid, "3"); //3为买家

            if(j > 0){
                System.out.println("赋予买家权限成功");
            } else {
                System.out.println("赋予买家权限失败");
            }

            if(i > 0) {
                System.out.println("新增用户成功");
                data.put("success", true);
                data.put("msg", "新增成功");
            } else {
                System.out.println("新增用户失败");
                data.put("success", false);
                data.put("msg", "新增失败");
            }

        } else { //编辑用户
            System.out.println("编辑用户信息");
            System.out.println(user);
            int i = userService.updateUserInfoByUserId(user);

            if(i > 0) {
                data.put("success", true);
                data.put("msg", "保存成功");
                System.out.println("编辑用户成功");
            } else {
                data.put("success", false);
                data.put("msg", "保存失败");
                System.out.println("编辑用户失败");
            }
        }
        return data;
    }

    /**
     * 前端-查看个人信息
     * @return
     */
    @RequestMapping("/seeUserInfo")
    public String seeUserInfo(Model model){
        S_USER currentUser = (S_USER) SecurityUtils.getSubject().getPrincipal();
        if(currentUser != null) {
            String userId =currentUser.getUserId();
            S_USER user = userService.selectByUserId(userId);
            model.addAttribute("user", user);
        }
        return "/shop/user/seeUserInfo";
    }
    /**
     * 前端-编辑个人资料
     * @param userId
     * @return
     */
    @RequestMapping("/userInfo1")
    public String userInfo1(String userId, Model model){
        S_USER user = userService.selectByUserId(userId);
        model.addAttribute("user", user);
        return "/shop/user/editUserInfo";
    }
    /**
     * 后端-基本信息
     * @return
     */
    @RequestMapping("/seeUserInfoEnd")
    public String seeUserInfoEnd(Model model){
        S_USER currentUser = (S_USER) SecurityUtils.getSubject().getPrincipal();
        if(currentUser != null) {
            String userId =currentUser.getUserId();
            S_USER user = userService.selectByUserId(userId);
            model.addAttribute("user", user);
        }
        return "/shop/user/editUserInfo";
    }
}
