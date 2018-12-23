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
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/layui/css/layui.css">
</head>
<body>

<form class="layui-form" action="/user/updateUserInfo" method="post">
    <%--隐藏用户id--%>
    <input type="hidden" name="userId" value="${user.userId}">

    <div class="layui-form-item">
        <label class="layui-form-label">学号</label>
        <div class="layui-input-block">
            <input type="text" id="studentNo" name="studentNo" autocomplete="off" class="layui-input" value="${user.studentNo}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">昵称</label>
        <div class="layui-input-block">
            <input type="text" id="nickname" name="nickname" autocomplete="off" name="studentNo" class="layui-input" value="${user.nickname}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">真实姓名</label>
        <div class="layui-input-block">
            <input type="text" id="realName" name="realName" autocomplete="off" class="layui-input" value="${user.realName}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="text" id="sex" name="sex" autocomplete="off" class="layui-input" value="${user.sex}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电子邮箱</label>
        <div class="layui-input-block">
            <input type="text" id="email" name="email" autocomplete="off" class="layui-input" value="${user.email}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-block">
            <input type="text" id="phone" name="phone" autocomplete="off" class="layui-input" value="${user.phone}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">宿舍地址</label>
        <div class="layui-input-block">
             <input type="text" id="dormitoryAddress" name="dormitoryAddress" autocomplete="off" class="layui-input" value="${user.dormitoryAddress}">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="submit" class="layui-btn" value="提交">
            <input type="reset" class="layui-btn" value="重置">
        </div>
    </div>
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
