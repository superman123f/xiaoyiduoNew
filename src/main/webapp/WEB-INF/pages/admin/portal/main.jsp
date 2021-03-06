<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/5
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/pages/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon1.ico"/>
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
        <%--<ul class="layui-nav layui-layout-left">--%>
            <%--<li class="layui-nav-item"><a href="javascript:void(0);" onclick="choose('/admin/admin');">用户列表</a></li>--%>
            <%--<li class="layui-nav-item"><a href="javascript:void(0);" onclick="choose('/admin/member');">会员列表</a></li>--%>
        <%--</ul>--%>
        <ul class="layui-nav layui-layout-right" style="margin-right: 20px;">
            <li class="layui-nav-item"><a href="/shop/commodity">首页</a></li>
            <li class="layui-nav-item">
                <%--<input type="text" value="${user.userId}">--%>
                <a href="javascript:void(0);">
                    <c:set value="${user.resources}" var="userResources"/>
                        <c:forEach items="${userResources}" var="resource" end="0">
                            <img src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}" class="layui-nav-img">
                        </c:forEach>
                    <%--<img src="http://t.cn/RCzsdCq" class="layui-nav-img">--%>
                    <shiro:principal property="nickname"></shiro:principal>
                </a>
                <dl class="layui-nav-child">
                    <dd><a id="jbzl" href="javascript:void(0);">基本资料</a></dd>
                    <dd><a href="/user/logout">注销</a></dd>
                </dl>
            </li>
            <%--<li class="layui-nav-item"><a href="/user/logout">退了</a></li>--%>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <dd><a class="layui-this"  href="javascript:void(0);" onclick="choose('/notice/toNoticePage');">公告必读</a></dd>
                </li>
                <shiro:hasPermission name="用户管理">
                    <li class="layui-nav-item">
                        <a href="javascript:void(0);">用户管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:void(0);" onclick="choose('/admin/userAdmin');">用户列表</a></dd>
                        </dl>
                    </li>
                </shiro:hasPermission>

                <shiro:hasPermission name="权限管理">
                    <li class="layui-nav-item">
                        <a href="javascript:void(0);">权限管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:void(0);" onclick="choose('/role/toRoleAdminPage');">权限列表</a></dd>
                            <dd><a href="javascript:void(0);" onclick="choose('/role/permissionToRole');">角色列表</a></dd>
                            <dd><a href="javascript:void(0);" onclick="choose('/role/roleToUser');">用户角色</a></dd>
                        </dl>
                    </li>
                </shiro:hasPermission>

                <shiro:hasPermission name="禁品管理">
                    <li class="layui-nav-item">
                        <a href="javascript:void(0);">禁品管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:void(0);" onclick="choose('/ban/toBanManagePage');">禁品列表</a></dd>
                            <dd><a href="javascript:void(0);" onclick="choose('/ban/toBaiduAIWebsite');">模型训练</a></dd>
                        </dl>
                    </li>
                </shiro:hasPermission>

                <shiro:hasPermission name="公告管理">
                    <li class="layui-nav-item">
                        <a href="javascript:void(0);">公告管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:void(0);" onclick="choose('/notice/noticeAdminPage')">公告列表</a></dd>
                        </dl>
                    </li>
                </shiro:hasPermission>

                <shiro:hasPermission name="类目管理">
                    <li class="layui-nav-item">
                        <a class="" href="javascript:void(0);">类目管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:void(0);" onclick="choose('/type/toGoodTypePage');">类目列表</a></dd>
                        </dl>
                    </li>
                </shiro:hasPermission>

                <shiro:hasPermission name="商品管理">
                    <li class="layui-nav-item">
                        <a class="" href="javascript:void(0);">商品管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:void(0);" onclick="choose('/admin/goodAdmin');">商品列表</a></dd>
                        </dl>
                        <%--<dl class="layui-nav-child">--%>
                            <%--<dd><a href="javascript:void(0);" onclick="choose('/admin/goodInfo');">商品信息</a></dd>--%>
                        <%--</dl>--%>
                    </li>
                </shiro:hasPermission>

                <shiro:hasPermission name="订单管理">
                    <li class="layui-nav-item">
                        <a href="javascript:void(0);">订单管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:void(0);" onclick="choose('/order/backOrderManagePage');">订单列表</a></dd>
                        </dl>
                    </li>
                </shiro:hasPermission>

                <shiro:hasPermission name="统计分析">
                    <li class="layui-nav-item"><a href="javascript:void(0);" onclick="choose('/good/getReport');">统计分析</a></li>
                </shiro:hasPermission>

                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:void(0);">统计分析</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="javascript:void(0);" onclick="return false;">统计分析</a></dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>

                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:void(0);">开发者工具</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="javascript:void(0);" onclick="choose('/admin/index');">控制台</a></dd>--%>
                    <%--</dl>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="javascript:void(0);" onclick="choose('/admin/member');">会员列表</a></dd>--%>
                    <%--</dl>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="javascript:void(0);" onclick="choose('/admin/sysConfig');">系统变量</a></dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
            </ul>
        </div>
    </div>

    <div class="layui-body" style="overflow-y: hidden;">
        <!-- 内容主体区域 -->
        <iframe id="iframeBody" frameborder="0" style="width:100%; height:100%;" src="/notice/toNoticePage"></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <%--© layui.com - 底部固定区域--%>
        校益多，竭诚为您服务！
    </div>
</div>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/icheck.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/dw.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/portal/main.js"></script>
</body>
</html>
<script>
    layui.use(['layer'], function(){
       var layer = layui.layer;
    });

    $(function(){
        //获取窗口大小
        var a = $(window).width();
        var b = $(window).height();

        var width = $(".layui-body").width();
        var height = $(".layui-body").height();
        $("#iframeBody").css("width", width);
        $("#iframeBody").css("height", height);

        $('#jbzl').click(function(){
            layer.open({
                title: '基本资料',
                type: 2,
                // skin: 'layui-layer-rim', //加上边框
                area: ['685px', '504px'], //宽高
                content: '/user/seeUserInfoEnd'
            });
        });
    });
</script>