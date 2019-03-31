<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2019/1/18
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>
<html>
<head>
    <title>公告页面</title>
    <link rel="stylesheet" href="${ctx}/styles/admin/gggl/noticePage.css">
</head>

<body>
<div class="notice_meta">
    <c:forEach items="${noticeList}" var="notice">
        <div class="notice_parent">
            <div class="notice_title"><span>${notice.title}</span></div>
            <div class="notice_content"><span>${notice.content}</span></div>
            <div class="notice_release_time"><span>管理员&nbsp;&nbsp;发布于&nbsp;&nbsp;<fmt:formatDate value="${notice.releaseTime}" pattern="yyyy/MM/dd HH:mm:ss"/></span></div>
        </div>
    </c:forEach>
</div>
</body>
</html>
