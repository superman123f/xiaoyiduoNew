<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/9
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<%--<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>--%>
<%--<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon1.ico"/>
    <title>校益多</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/layui/css/layui.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>

<style>
    #canvas {
        float: right;
        display: inline-block;
        /*border: 1px solid #ccc;*/
        /*border-radius: 5px;*/
        cursor: pointer;
    }
</style>
<body>

<%@ include file="../shop_header.jsp"%> <!--引入头部jsp样式-->

<div class="content content-nav-base  login-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="/shop/commodity" class="active">所有商品</a>
                    <a href="/shop/about">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="login-bg">
        <div class="login-cont w1200">
            <div class="form-box">
                <form id="myForm" class="layui-form" action="#" onsubmit="return false;" method="post">
                    <legend style="padding:40px 0;">用户登录</legend>
                    <div class="my_span">
                        <span id="mySpan"></span>
                    </div>
                    <div class="layui-form-item">
                        <%--<div class="layui-input-inline">--%>
                            <%--<i class="layui-icon layui-icon-cellphone iphone-icon"></i>--%>
                            <%--<input type="tel" name="userAccount" id="phone" lay-verify="required" placeholder="手机号 / 学号 / 昵称" autocomplete="off" class="layui-input">--%>
                        <%--</div>--%>
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <i class="layui-icon layui-icon-cellphone iphone-icon"></i>
                                <input type="tel" name="userAccount" id="phone" lay-verify="required" placeholder="手机号 / 学号 / 昵称" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <i class="layui-icon layui-icon-password iphone-icon"></i>
                                <input type="password" name="password" id="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline veri-code">
                            <div class="layui-input-inline">
                                <input style="width:185px;display:inline-block;" id="authCode" lay-verify="required" type="text" name="pnum" placeholder="请输入验证码" autocomplete="off" class="layui-input">
                                <canvas id="canvas" width="100" height="38"></canvas>
                                <%--<input type="button" class="layui-btn" id="find"  value="验证码" />--%>
                            </div>
                        </div>
                    </div>

                    <%--验证码--%>
                    <%--<div class="code">--%>
                        <%--<input type="text" value="" placeholder="请输入验证码（不区分大小写）" class="input-val">--%>
                        <%--<br>--%>
                        <%--<canvas id="canvas" width="100" height="43"></canvas>--%>
                        <%--<button class="btn">提交</button>--%>
                    <%--</div>--%>


                    <div class="layui-form-item login-btn">
                        <div class="layui-input-block" style="padding-top:7px;">
                            <button class="layui-btn" type="button" lay-filter="demo1" onclick="login();">登录</button>
                            <%--lay-submit--%>
                        </div>
                    </div>
                    <p><a href="/user/toRegisterPage" style="float:left;">立即注册</a><a href="/user/findPwd" style="float:right;">忘记密码？</a></p>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/pages/shop_rooter.jsp" %> <!--引入尾部样式-->
</body>
<script type="text/javascript" src="../../../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../../../styles/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/scripts/shop/login.js"></script>
</html>


<script>
    layui.use('layer', 'form', function(){
       var layer = layui.layer;
       var form = layui.form;
    });
</script>