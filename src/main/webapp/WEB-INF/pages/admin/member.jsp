<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/5
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon1.ico"/>
    <title>校益多</title>
    <link rel="stylesheet" href="${ctx}/styles/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/styles/admin/global.css">
    <link rel="stylesheet" href="${ctx}/styles/admin/icheck/minimal/red.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%--<%@ include file="../admin_header.jsp"%> <!--引入admin头部jsp样式-->--%>

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
                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;">用户管理</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="admin">用户列表</a></dd>--%>
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
                <%--<li class="layui-nav-item layui-nav-itemed">--%>
                    <%--<a href="javascript:;">会员管理</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a class="layui-this" href="member">会员列表</a></dd>--%>
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
            <fieldset class="layui-elem-field">
                <legend>用户管理 - 用户列表</legend>
                <div class="layui-field-box">
                    <form class="layui-form" action="">
                        <div class="layui-form-item" style="text-align:center;">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input autocomplete="off" class="layui-input" placeholder="请输入名称" type="text" name="name" value="">
                                </div>
                            </div>
                            <div class="layui-inline" style="text-align:left;">
                                <div class="layui-input-inline">
                                    <button class="layui-btn"><i class="layui-icon">&#xe615;</i>查询</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <hr>
                    <div class="layui-btn-group">
                        <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="create" dw-title="新增用户" dw-width="100%" dw-height="100%">
                            <i class="layui-icon">&#xe654;</i>新增
                        </button>
                        <button class="layui-btn layui-btn-xs layui-btn-danger dw-batch-delete" dw-url="./delete.json">
                            <i class="layui-icon">&#xe640;</i>批删
                        </button>
                        <button class="layui-btn layui-btn-xs dw-refresh">
                            <i class="layui-icon">&#x1002;</i>刷新
                        </button>
                    </div>
                    <hr>
                    <table class="layui-table">
                        <colgroup>
                            <col width="150">
                            <col width="150">
                            <col width="200">
                            <col>
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="selectAll"><input type="checkbox"></th>
                            <th>昵称</th>
                            <th>加入时间</th>
                            <th>签名</th>
                            <th style="text-align:center;">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="checkbox" name="id" value="1"></td>
                            <td>贤心</td>
                            <td>2016-11-29</td>
                            <td>人生就像是一场修行</td>
                            <td class="text-center">
                                <div class="layui-btn-group">
                                    <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="create?id=1" dw-title="编辑用户">
                                        <i class="layui-icon">&#xe642;</i>编辑
                                    </button>
                                    <button class="layui-btn layui-btn-xs layui-btn-danger dw-delete" dw-url="delete?id=1" dw-title="小明">
                                        <i class="layui-icon">&#xe640;</i>删除
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="id" value="2"></td>
                            <td>许闲心</td>
                            <td>2016-11-28</td>
                            <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
                            <td class="text-center">
                                <div class="layui-btn-group">
                                    <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="create?id=1" dw-title="编辑用户">
                                        <i class="layui-icon">&#xe642;</i>编辑
                                    </button>
                                    <button class="layui-btn layui-btn-xs layui-btn-danger dw-delete" dw-url="delete?id=1" dw-title="小明">
                                        <i class="layui-icon">&#xe640;</i>删除
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="id" value="3 "></td>
                            <td>sentsin</td>
                            <td>2016-11-27</td>
                            <td> Life is either a daring adventure or nothing.</td>
                            <td class="text-center">
                                <div class="layui-btn-group">
                                    <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="create?id=1" dw-title="编辑用户">
                                        <i class="layui-icon">&#xe642;</i>编辑
                                    </button>
                                    <button class="layui-btn layui-btn-xs layui-btn-danger dw-delete" dw-url="delete?id=1" dw-title="小明">
                                        <i class="layui-icon">&#xe640;</i>删除
                                    </button>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </fieldset>
        <%--</div>--%>
    <%--</div>--%>

    <%--<div class="layui-footer">--%>
        <%--<!-- 底部固定区域 -->--%>
        <%--© layui.com - 底部固定区域--%>
    <%--</div>--%>
</div>
</body>
<script type="text/javascript" src="../../../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../../../styles/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/icheck.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/dw.js"></script>
</html>