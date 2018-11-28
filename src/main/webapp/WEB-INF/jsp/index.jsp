<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>登录</title>
</head>

<h1>欢迎${user.username }光临!请选择你的操作:</h1><br>
shrio标签，显示用户相关信息：
<shiro:principal property="uid"/>
<shiro:principal property="username"/>
<shiro:principal property="password"/>
<ul>
    <shiro:hasPermission name="add"><li>增加</li></shiro:hasPermission>
    <shiro:hasPermission name="delete"><li>删除</li></shiro:hasPermission>
    <shiro:hasPermission name="update"><li>修改</li></shiro:hasPermission>
    <shiro:hasPermission name="query"><li>查询</li></shiro:hasPermission>
    <shiro:hasRole name="admin"><li><a href="http://localhost:8090/s/admin">admin</a></li></shiro:hasRole>
    <shiro:hasRole name="customer"><li><a href="http://localhost:8090/s/customer">customer</a></li></shiro:hasRole>
    <shiro:hasPermission name="add"><li><a href="http://localhost:8090/s/add">add</a></li></shiro:hasPermission>
    <shiro:hasPermission name="delete"><li><a href="http://localhost:8090/s/delete">delete</a></li></shiro:hasPermission>
    <shiro:hasPermission name="query"><li><a href="http://localhost:8090/s/query">query</a></li></shiro:hasPermission>
    <shiro:hasPermission name="update"><li><a href="http://localhost:8090/s/update">update</a></li></shiro:hasPermission>

</ul>
<a href="${pageContext.request.contextPath }/s/logOut">点我注销</a><br>
<a href="/documents/shiro-jstl.html">Shiro的jstl标签使用说明</a>

</body>
</html>