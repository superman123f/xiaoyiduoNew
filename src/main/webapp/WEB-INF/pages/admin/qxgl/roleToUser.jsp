<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/5
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<html>
<head>
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon1.ico"/>
    <title>权限管理</title>
    <link rel="stylesheet" type="text/css" href="../../../styles/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/admin/yygl/userAdmin.css">
</head>
<style>
    .layui-table-view .layui-form-radio {
        margin-top: 15px;
    }
</style>
<body bgcolor="white" style="margin:15px;">

<fieldset class="layui-elem-field">
    <legend>权限管理 - 用户角色</legend>
    <div class="layui-field-box">
        <form class="layui-form" action="">
            <div class="layui-form-item" style="text-align:center;">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input id="searchUser" autocomplete="off" class="layui-input" placeholder="学号" type="text" name="name" value="">
                    </div>
                    <div class="layui-input-inline">
                        <input id="nickname" autocomplete="off" class="layui-input" placeholder="昵称" type="text" name="nickname" value="">
                    </div>
                    <div class="layui-input-inline">
                        <input id="realName" autocomplete="off" class="layui-input" placeholder="真实姓名" type="text" name="realName" value="">
                    </div>
                </div>
                <div class="layui-inline" style="text-align:left;">
                    <div class="layui-input-inline">
                        <button id="reload" type="button" class="layui-btn" data-type="reload"><i class="layui-icon"></i>查询</button>
                    </div>
                </div>
            </div>
        </form>
        <hr>
        <div class="layui-btn-group">
            <%--<button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="/user/userInfo" dw-title="新增用户信息" dw-width="880px" dw-height="500px">--%>
                <%--<i class="layui-icon">&#xe654;</i>新增--%>
            <%--</button>--%>
            <button id="giveUserRole" class="layui-btn layui-btn-xs layui-btn-normal" data-type="giveUserRole">
                <i class="layui-icon">&#xe654;</i>关联角色
            </button>
            <%--<button class="layui-btn layui-btn-xs dw-refresh">--%>
            <%--<i class="layui-icon">&#x1002;</i>刷新--%>
            <%--</button>--%>
            <%--<button id="exportExl" class="layui-btn layui-btn-xs" data-type="exportExl">导出Excel</button>--%>
        </div>
        <hr>

        <table id="demo" lay-filter="test"></table>

    </div>
</fieldset>


<%--@*工具栏  在Table中使用 toolbar声明一个 Id  放置在任意位置皆可*@--%>
<script type="text/html" id="barDemo">
    <%--<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="detail">查看</a>--%>
    <%--<button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="create1" dw-title="新增用户" dw-width="100%" dw-height="100%">--%>
    <%--<i class="layui-icon">&#xe654;</i>新增--%>
    <%--</button>--%>

    <%--<button class="layui-btn layui-btn-xs layui-btn-normal">--%>
    <%--<i class="layui-icon">&#xe642;</i>编辑--%>
    <%--</button>--%>
    <div class="layui-btn-group">
        <button class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit">
            <%--<i class="layui-icon">&#xe642;</i>--%>
            查看角色
        </button>
        <%--<button class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">--%>
            <%--<i class="layui-icon">&#xe640;</i>删除--%>
        <%--</button>--%>
    </div>
</script>

</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/qxgl/userRoleAdmin.js"></script>
</html>
