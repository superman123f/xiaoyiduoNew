<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<link rel="stylesheet" href="${ctx}/styles/shop/shop_header.css">

<div class="site-nav-bg">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="/shop/commodity">首页</a>
        </p>
        <div class="sn-quick-menu">
            <div class="sp-cart" style="margin-right: 22px;"><a href="/documents/shiro-jstl.html">帮助文档</a></div>
            <div class="login" style="margin-right: 22px;"><a href="javascript;">公告</a></div>
            <shiro:hasAnyRoles name="admin,seller">
                <div class="sp-cart" style="margin-right: 22px;"><a href="/admin/portal">后台管理</a></div>
            </shiro:hasAnyRoles>

            <shiro:hasAnyRoles name="seller,buyer">
                <div class="sp-cart" style="margin-right: 22px;"><a href="/cart/seeCartList">购物车</a><span id="cartSpan">${sessionScope.cartGoodCount}</span></div>
                <div  style="margin-right: 22px;"><a href="/favorite/toFavoritePage"><span class="favoriteFolder"><i class="layui-icon layui-icon-rate-solid" style="font-size: 14px; color: #9c9c9c; margin-right: 1px;"></i>收藏夹</span></a></div>
            </shiro:hasAnyRoles>

            <div class="sp-cart" style="margin-right: 22px;"><a href="javascript:;">
                <shiro:principal property="nickname"></shiro:principal></a>
            </div>

            <shiro:notAuthenticated>
                <div class="login"><a href="/shop/login">登录</a></div>
            </shiro:notAuthenticated>
            <shiro:authenticated>
                <div class="login" style="margin-right: 22px;"><a href="/user/logout">退出</a></div>
            </shiro:authenticated>
        </div>
    </div>
</div>



<div class="header">
    <div class="headerLayout w1200">
        <div class="headerCon">
            <h1 class="mallLogo">
                <a href="#" title="校益多商城">
                    <img width="97" height="32" src="../../../images/shop/logo.png">
                </a>
            </h1>
            <div class="mallSearch">
                <form class="layui-form" novalidate>
                    <input id="goodName" type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
                    <button type="button" id="searchBtn" class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" name="" value="">
                </form>
            </div>
        </div>
    </div>
</div>
