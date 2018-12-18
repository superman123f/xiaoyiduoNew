<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="site-nav-bg">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="#">首页</a>
        </p>
        <div class="sn-quick-menu">
            <div class="sp-cart" style="margin-right: 22px;"><a href="/documents/shiro-jstl.html">帮助文档</a></div>
            <shiro:hasRole name="admin">
                <div class="sp-cart" style="margin-right: 22px;"><a href="/admin/admin">后台管理</a></div>
            </shiro:hasRole>
            <shiro:notAuthenticated>
                <div class="login"><a href="/shop/login">登录</a></div>
            </shiro:notAuthenticated>
            <shiro:authenticated>
                <div class="login" style="margin-right: 22px;"><a href="/user/logout">退出</a></div>
            </shiro:authenticated>
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
