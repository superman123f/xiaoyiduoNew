<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/5
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="${ctx}/styles/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/styles/admin/global.css">
    <link rel="stylesheet" href="${ctx}/styles/admin/icheck/minimal/red.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

   测试角色列表
    <%--<div class="layui-side layui-bg-black">--%>
        <%--<div class="layui-side-scroll">--%>
            <%--<!-- 左侧导航区域（可配合layui已有的垂直导航） -->--%>
            <%--<ul class="layui-nav layui-nav-tree"  lay-filter="test">--%>
                <%--<li class="layui-nav-item"><a href="index">控制台</a></li>--%>
                <%--<li class="layui-nav-item">--%>
                    <%--<a class="" href="javascript:;">系统设置</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="sysConfig">系统变量</a></dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
                <%--<li class="layui-nav-item layui-nav-itemed">--%>
                    <%--<a href="javascript:;">用户管理</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a class="layui-this" href="admin">用户列表</a></dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;">权限管理</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="rule">规则列表</a></dd>--%>
                        <%--<dd><a href="role">角色列表</a></dd>--%>
                        <%--<dd><a href="adminRole">用户角色</a></dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;">会员管理</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="member">会员列表</a></dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;">开发者工具</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="control">一键生成</a></dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;">集成Demo</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="upload">文件上传</a></dd>--%>
                        <%--<dd><a href="upload">Execel导出</a></dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
            <%--</ul>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="layui-body">--%>
        <%--<!-- 内容主体区域 -->--%>
        <%--<div style="padding: 15px;">--%>
            <%--<iframe frameborder="0" width="100%" height="500px" src="/admin/rule"></iframe>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="layui-footer">--%>
        <%--<!-- 底部固定区域 -->--%>
        <%--© layui.com - 底部固定区域--%>
    <%--</div>--%>
</div>
<script type="text/javascript" src="../../../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../../../styles/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/icheck.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/dw.js"></script>
</body>
</html>