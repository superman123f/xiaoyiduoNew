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
<style>
    .main_content {
        float: left;
        width: 100%;
        height: 100%;
    }

    .user {
        width: 32%;
        float: left;
        text-align: center;
    }
    .user_name {
        background-color: #00adff;
        font-size: 15px;
    }

    .role {
        width: 32%;
        height: 100%;
        float: left;
        text-align: center;
        border-left: 1px solid #9c9691;
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
        width: calc(36% - 2px);
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
    <c:if test="${ not empty user}">
        <div class="user">
            <div class="user_name">
                <span>用户</span>
            </div>
            <ul class="permission_ul">
                <li>
                    ${user.nickname}
                </li>
            </ul>
        </div>
        <div class="role">
            <div class="role_name">
                <span>角色</span>
            </div>
            <c:set value="${user.roles}" var="roles"/>
            <ul class="permission_ul">
                <c:forEach items="${roles}" var="role">
                <li>
                    ${role.roleName}<br>
                </li>
                </c:forEach>
            </ul>
        </div>
        <div class="permission">
            <div class="role_name">
                <span>权限</span>
            </div>
            <%--<c:set value="${role.permissions}" var="permissions"/>--%>
            <ul class="permission_ul">
                <c:forEach items="${permissionList}" var="permission">
                    <li>${permission}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
    <c:if test="${ empty user}">
        <div class="user">
            <div class="user_name">
                <span>用户</span>
            </div>
            <ul class="permission_ul">
                <li>
                        无
                </li>
            </ul>
        </div>
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
