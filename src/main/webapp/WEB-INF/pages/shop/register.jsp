<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/9
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/layui/css/layui.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>

<%--<body style="text-align:center">--%>
<body>
<%@ include file="../shop_header.jsp"%> <!--引入头部jsp样式-->

<div class="content content-nav-base  login-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="/shop/commodity" class="active">所有商品</a>
                    <a href="/shop/buytoday">今日团购</a>
                    <a href="/shop/information">商品资讯</a>
                    <a href="/shop/about">关于我们</a>
                </div>
            </div>
        </div>
    </div>

    <div class="login-bg">
        <%--<br>--%>

        <%--studentNo学号，nickName昵称，password密码，realName真实姓名，sex性别，email电子邮箱，dormitoryAddress宿舍地址，phone手机号，</br>--%>
        <%--<div class="login-cont w1200">--%>
            <%--<div class="form-box1">--%>
        <div class="form-box1">
            <div class="form-box2">
                <form class="layui-form" action="/user/register" method="post">

                    <div class="layui-form-item">
                        <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>学号</label>
                        <div class="layui-input-block">
                            <input type="text" id="studentNo" name="studentNo" class="layui-input" placeholder="请输入学号" autocomplete="off">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>昵称</label>
                        <div class="layui-input-block">
                            <input type="text" id="nickname" name="nickname" class="layui-input" placeholder="请输入昵称" autocomplete="off">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>密码</label>
                        <div class="layui-input-block">
                            <input type="password" id="password" name="password" class="layui-input" placeholder="请输入密码" autocomplete="off">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>确认密码</label>
                        <div class="layui-input-block">
                            <input type="password" id="confrimPwd" name="confrimPwd" class="layui-input" placeholder="请确认密码" autocomplete="off">
                        </div>
                    </div>

                    <%--<div class="layui-form-item">--%>
                        <%--<label class="layui-form-label">真实姓名</label>--%>
                        <%--<div class="layui-input-block">--%>
                            <%--<input type="text" name="realName" class="layui-input" placeholder="请输入真实姓名" autocomplete="off">--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <%--<div class="layui-form-item">--%>
                        <%--<label class="layui-form-label">性别</label>--%>
                        <%--<div class="layui-input-block">--%>
                            <%--<input type="radio" name="sex" value="0" checked title="男">--%>
                            <%--<input type="radio" name="sex" value="1" title="女">--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <%--<div class="layui-form-item">--%>
                        <%--<label class="layui-form-label">电子邮箱</label>--%>
                        <%--<div class="layui-input-block">--%>
                            <%--<input type="text" name="email" class="layui-input" placeholder="请输入电子邮箱" autocomplete="off">--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <%--<div class="layui-form-item">--%>
                        <%--<label class="layui-form-label">宿舍地址</label>--%>
                        <%--<div class="layui-input-block">--%>
                            <%--<input type="text" name="dormitoryAddress" class="layui-input" placeholder="请填写宿舍地址" autocomplete="off">--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>手机号码</label>
                        <div class="layui-input-block">
                            <input type="text" id="phone" name="phone" class="layui-input" placeholder="请输入手机号码" autocomplete="off">
                        </div>
                    </div>

                    <%--手机验证码--%>
                    <div class="layui-inline veri-code">
                        <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>验证码</label>
                        <div class="layui-input-inline" style="display: inline-flex;">
                            <input id="pnum" type="text" name="pnum" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input" autocomplete="off">
                            <input type="button" class="layui-btn layui-btn-normal" id="find"  value="获取验证码" />
                        </div>
                    </div>

                    </br>
                    </br>
                    <%--<span id="msg"></span>--%>

                    <%--按钮区--%>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <input type="submit" class="layui-btn" value="注册">
                            <input type="reset" class="layui-btn" value="重置">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <%--</div>--%>

        <%--<div class="login-cont w1200">--%>
            <%--<div class="form-box1">--%>
                <%--<form class="layui-form" action="">--%>
                    <%--&lt;%&ndash;<legend style="padding:40px 0;">用户登录</legend>&ndash;%&gt;--%>
                    <%--<a href="/shop/register">已有账号登录</a>--%>
                    <%--<div class="layui-form-item">--%>
                        <%--<div class="layui-inline iphone">--%>
                            <%--<div class="layui-input-inline">--%>
                                <%--<i class="layui-icon layui-icon-cellphone iphone-icon"></i>--%>
                                <%--<input type="tel" name="phone" id="phone" lay-verify="required|phone" placeholder="请输入手机号 / 学号" autocomplete="off" class="layui-input">--%>
                            <%--</div>--%>
                        <%--</div>--%>

                        <%--<input>--%>
                        <%--<div class="layui-inline iphone">--%>
                            <%--<div class="layui-input-inline">--%>
                                <%--<i class="layui-icon layui-icon-password iphone-icon"></i>--%>
                                <%--<input type="tel" name="password" id="password" placeholder="请输入密码" autocomplete="off" class="layui-input">--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="layui-inline veri-code">--%>
                            <%--<div class="layui-input-inline">--%>
                                <%--<input style="width:185px;display:inline-block;" id="pnum" type="text" name="pnum" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">--%>
                                <%--<canvas id="canvas" width="100" height="38"></canvas>--%>
                                <%--&lt;%&ndash;<input type="button" class="layui-btn" id="find"  value="验证码" />&ndash;%&gt;--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="layui-form-item login-btn">--%>
                        <%--<div class="layui-input-block" style="padding-top:7px;">--%>
                            <%--<button class="layui-btn" lay-submit="" lay-filter="demo1" onclick="return false">登录</button>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</form>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
</div>

<div class="footer">
    <div class="ng-promise-box">
        <div class="ng-promise w1200">
            <p class="text">
                <a class="icon1" href="javascript:;">7天无理由退换货</a>
                <a class="icon2" href="javascript:;">满99元全场免邮</a>
                <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
            </p>
        </div>
    </div>
    <div class="mod_help w1200">
        <p>
            <a href="javascript:;">关于我们</a>
            <span>|</span>
            <a href="javascript:;">帮助中心</a>
            <span>|</span>
            <a href="javascript:;">售后服务</a>
            <span>|</span>
            <a href="javascript:;">商品资讯</a>
            <span>|</span>
            <a href="javascript:;">关于货源</a>
        </p>
        <p class="coty">校益多商城版权所有 &copy; 2018-2050</p>
    </div>
</div>
<%@ include file="/WEB-INF/pages/shop_rooter.jsp" %> <!--引入尾部样式-->
</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/scripts/shop/register.js"></script>
</html>
