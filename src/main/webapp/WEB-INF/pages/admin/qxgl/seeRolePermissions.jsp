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
<style>
    .main_content {
        float: left;
        width: 100%;
        height: 100%;
    }
    .role {
        width: 50%;
        float: left;
        text-align: center;
    }
    .role_name {
        background-color: #00adff;
        font-size: 15px;
    }
    .permission {
        text-align: center;
        float: left;
        border-left: 1px solid #9c9691;
        height: 100%;
        width: calc(50% - 1px);
    }
    .permission_ul {
        margin-top: 10px;
    }
    .permission_ul li {
        margin-bottom: 2px;
        font-size: 13px;
    }
</style>
<body>
<div class="main_content">
    <c:if test="${ not empty role}">
        <div class="role">
            <div class="role_name">
                <span>角色</span>
            </div>
            <ul class="permission_ul">
                <li>
                    ${role.roleName}
                </li>
            </ul>
        </div>
        <div class="permission">
            <div class="role_name">
                <span>权限</span>
            </div>
            <c:set value="${role.permissions}" var="permissions"/>
            <ul class="permission_ul">
                <c:forEach items="${permissions}" var="permission">
                    <li>${permission.permissionName}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
    <c:if test="${ empty role}">
        <div class="role">
            <div class="role_name">
                <span>角色</span>
            </div>
            <ul class="permission_ul">
                <li>无</li>
            </ul>
        </div>
        <div class="permission">
            <div class="role_name">
                <span>权限</span>
            </div>
            <ul class="permission_ul">
                <li>无</li>
            </ul>
        </div>
    </c:if>
</div>
</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
</html>
