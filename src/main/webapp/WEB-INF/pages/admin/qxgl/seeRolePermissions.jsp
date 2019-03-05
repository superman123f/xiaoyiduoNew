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
    <title>角色权限</title>
    <link rel="stylesheet" href="${ctx}/styles/layui/css/layui.css">
</head>
<body>
    角色：${role.roleId}
    权限：
    <c:set value="${role.permissions}" var="permissions"/>
    <c:forEach items="${permissions}" var="permission">
        ${permission.permissionName}<br>
    </c:forEach>

</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
</html>
