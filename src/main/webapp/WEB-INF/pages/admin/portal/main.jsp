<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/5
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon.ico"/>
    <title>校益多后台管理系统</title>
    <link rel="stylesheet" href="${ctx}/styles/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/styles/admin/global.css">
    <link rel="stylesheet" href="${ctx}/styles/admin/icheck/minimal/red.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <%--导航栏--%>
    <div class="layui-header">
        <div class="layui-logo">校益多后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="javascript:;" onclick="choose('/admin/admin');">用户列表</a></li>
            <li class="layui-nav-item"><a href="javascript:;" onclick="choose('/admin/member');">会员列表</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a href="/shop/commodity">首页</a></li>
            <li class="layui-nav-item">
                <%--<input type="text" value="${user.userId}">--%>
                <a href="javascript:;">
                    <c:set value="${user.resources}" var="userResources"/>
                        <c:forEach items="${userResources}" var="resource" end="0">
                            <img src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}" class="layui-nav-img">
                        </c:forEach>
                    <%--<img src="http://t.cn/RCzsdCq" class="layui-nav-img">--%>
                    <shiro:principal property="nickname"></shiro:principal>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/user/logout">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <shiro:hasRole name="admin">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">用户管理</a>
                        <dl class="layui-nav-child">
                            <dd><a class="layui-this"  href="javascript:;" onclick="choose('/admin/userAdmin');">用户列表</a></dd>
                        </dl>
                    </li>
                </shiro:hasRole>

                <li class="layui-nav-item">
                    <a href="javascript:;">权限管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="choose('/admin/admin');">规则列表</a></dd>
                        <dd><a href="javascript:;" onclick="choose('/admin/role');">角色列表</a></dd>
                        <dd><a href="javascript:;" onclick="choose('/admin/adminRole');">用户角色</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">禁品管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="choose('/ban/toBanManagePage');">禁品列表</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">公告管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="return false;">公告列表</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a class="" href="javascript:;">商品管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="choose('/admin/goodAdmin');">商品列表</a></dd>
                    </dl>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="choose('/admin/goodInfo');">商品信息</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">订单管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="return false;">订单列表</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">开发者工具</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="choose('/admin/index');">控制台</a></dd>
                    </dl>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="choose('/admin/member');">会员列表</a></dd>
                    </dl>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="choose('/admin/sysConfig');">系统变量</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="">
            <iframe id="iframeBody" frameborder="0" width="100%" height="800px" src="/admin/userAdmin"></iframe>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/icheck.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/dw.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/portal/main.js"></script>
</body>
</html>