<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2019/3/5
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>
<html>
<head>
    <title>用户角色</title>
    <link rel="stylesheet" href="${ctx}/styles/layui/css/layui.css">
</head>
<body>
${user.userId}
用户：${user.nickname}
角色：<br>
<c:set value="${user.roles}" var="roles"/>
<c:forEach items="${roles}" var="role">
    ${role.roleName}<br>
</c:forEach>
权限：<br>

</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
</html>
