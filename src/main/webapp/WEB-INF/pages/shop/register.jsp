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
    <link rel="stylesheet" type="text/css" href="../../../styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="../../../styles/layui/css/layui.css">
    <script type="text/javascript" src="../../../scripts/jquery.min.js"></script>
    <script type="text/javascript" src="../../../styles/layui/layui.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>

<body>
<div class="site-nav-bg">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="#">首页</a>
        </p>
        <div class="sn-quick-menu">
            <div class="login"><a href="/shop/login">登录</a></div>
            <div class="sp-cart"><a href="/shop/shopcart">购物车</a><span>2</span></div>
        </div>
    </div>
</div>



<div class="header">
    <div class="headerLayout w1200">
        <div class="headerCon">
            <h1 class="mallLogo">
                <a href="#" title="校益多商城">
                    <img src="../../../images/shop/logo.png">
                </a>
            </h1>
            <div class="mallSearch">
                <form action="" class="layui-form" novalidate>
                    <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" name="" value="">
                </form>
            </div>
        </div>
    </div>
</div>


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
        <div class="login-cont w1200">
            <div class="form-box1">
                <form class="layui-form" action="">
                    <%--<legend style="padding:40px 0;">用户登录</legend>--%>
                    <a href="/shop/register">已有账号登录</a>
                    <div class="layui-form-item">
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <i class="layui-icon layui-icon-cellphone iphone-icon"></i>
                                <input type="tel" name="phone" id="phone" lay-verify="required|phone" placeholder="请输入手机号 / 学号" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <i class="layui-icon layui-icon-password iphone-icon"></i>
                                <input type="tel" name="password" id="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline veri-code">
                            <div class="layui-input-inline">
                                <input style="width:185px;display:inline-block;" id="pnum" type="text" name="pnum" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">
                                <canvas id="canvas" width="100" height="38"></canvas>
                                <%--<input type="button" class="layui-btn" id="find"  value="验证码" />--%>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item login-btn">
                        <div class="layui-input-block" style="padding-top:7px;">
                            <button class="layui-btn" lay-submit="" lay-filter="demo1" onclick="return false">登录</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
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
</body>
</html>