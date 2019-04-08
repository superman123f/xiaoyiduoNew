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
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon1.ico"/>
    <title>校益多</title>
    <link rel="stylesheet" type="text/css" href="../../../styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="../../../styles/shop/findPwd.css">
    <link rel="stylesheet" type="text/css" href="../../../styles/layui/css/layui.css">
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
    .step_content {
        float: left;
        margin-top: 15px;
        margin-bottom: 38px;
    }
    .phone_verify {
        float: left;
        padding: 5px 10px;
        background-color: #009688;
    }
    .reset_password {
        float: left;
        margin-left: 4px;
        padding: 5px 10px;
        background-color: #949494;
    }
    .reset_title {
        font-size: 17px;
        color: white;
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

    <div style="margin: 20px 0px 120px 63px;">
        <div class="step_content">
            <div class="phone_verify">
                <span class="reset_title">1.手机验证</span>
                <%--设置成功--%>
            </div>
            <div class="reset_password">
                <span class="reset_title">2.重置密码</span>
            </div>
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
                            <input type="button" class="layui-btn layui-btn-normal" id="find"  value="获取验证码" />
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
<%@ include file="/WEB-INF/pages/shop_rooter.jsp" %> <!--引入尾部样式-->
</body>
<script type="text/javascript" src="../../../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../../../styles/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/scripts/shop/findPwd.js"></script>
</html>
<script>
    layui.use('layer', 'form', function(){
        var layer = layui.layer;
        var form = layui.form;
    });
</script>