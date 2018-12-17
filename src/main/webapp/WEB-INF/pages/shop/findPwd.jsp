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
    <link rel="stylesheet" type="text/css" href="../../../styles/shop/findPwd.css">
    <link rel="stylesheet" type="text/css" href="../../../styles/layui/css/layui.css">
    <script type="text/javascript" src="../../../scripts/jquery.min.js"></script>
    <script type="text/javascript" src="../../../styles/layui/layui.js"></script>
    <script type="text/javascript" src="${ctx}/scripts/shop/findPwd.js"></script>
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
                    <a href="/shop/buytoday">今日团购</a>
                    <a href="/shop/information">商品资讯</a>
                    <a href="/shop/about">关于我们</a>
                </div>
            </div>
        </div>
    </div>

    <div style="margin: 20px 0px 120px 63px;">
        <div>
            手机验证
            重置密码
            <%--设置成功--%>
        </div>

        <%--手机验证--%>
        <div class="phone_verification_part">
            <form class="layui-form layui-form-pane">
                <div class="layui-form-item">
                    <label class="layui-form-label">手机</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="phone" id="phone" lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">验证码</label>
                        <div class="layui-input-inline">
                            <input id="pnum" type="text" name="pnum" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input" autocomplete="off">
                        </div>

                        <div class="layui-form-mid" style="padding: 0!important;">
                            <button type="button" class="layui-btn layui-btn-normal">获取验证码</button>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <button id="phone_verification_btn" class="layui-btn" onclick="return false;">提交</button>
                </div>

            </form>
        </div>

        <%--重置密码--%>
        <div class="reset_password_part" style="display:none;">
            <form class="layui-form layui-form-pane">
                <div class="layui-form-item">
                    <label class="layui-form-label">新密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="newPwd" id="newPwd" lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="confrimPwd" id="confrimPwd" lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <input type="button" id="reset_password_btn" class="layui-btn" value="提交">
                </div>
            </form>
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
<%@ include file="/WEB-INF/pages/shop_rooter.jsp" %> <!--引入尾部样式-->

</body>
</html>
<script>
    layui.use('layer', 'form', function(){
        var layer = layui.layer;
        var form = layui.form;
    });
</script>