<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>登录</title>
</head>

<h1>欢迎登录!${user.username }</h1>
<shiro:guest>
    您当前是游客，<a href="javascript:void(0);">请登录</a>
</shiro:guest><br>

判断用户是否登录
<shiro:user>
    <shiro:principal property="username"></shiro:principal>
</shiro:user><br>
当前用户认证状态：
<shiro:authenticated>
    已认证
</shiro:authenticated>
<shiro:notAuthenticated>
    未认证
</shiro:notAuthenticated>
<br>
<form action="${pageContext.request.contextPath }/s/loginUser" method="post">
    <input type="text" name="username"><br>
    <input type="password" name="password"><br>
    <input type="submit" value="提交">
</form>
</body>
</html>

