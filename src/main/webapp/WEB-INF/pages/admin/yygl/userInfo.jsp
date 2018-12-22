<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/21
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>
<html>
<head>
    <title>编辑用户信息</title>
</head>
<body>
<%--隐藏域--%>
<input type="hidden" value="${user.userId}"></input>

<form class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">学号</label>
        <input class="layui-form-input" value="${user.studentNo}">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">昵称</label>
        <input class="layui-form-input" value="${user.nickname}">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">真实姓名</label>
        <input class="layui-form-input" value="${user.realName}">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <input class="layui-form-input" value="${user.sex}">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电子邮箱</label>
        <input class="layui-form-input" value="${user.email}">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <input class="layui-form-input" value="${user.phone}">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">宿舍地址</label>
        <input class="layui-form-input" value="${user.dormitoryAddress}">
    </div>
    <%--<div class="layui-form-item">--%>
        <%--<label class="layui-form-label">创建时间</label>--%>
        <%--<input class="layui-form-input" value="${user.createTime}">--%>
    <%--</div>--%>
</form>

</body>
<script type="text/javascript" src="../../../../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../../../../styles/layui/layui.js"></script>
</html>

<script>
    layui.use(['form', 'layer'], function(){
       var form = layui.form();
       var layer = layui.layer();
    });
</script>
