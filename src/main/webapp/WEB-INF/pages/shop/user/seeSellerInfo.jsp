<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon1.ico"/>
    <title>查看卖家信息</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/admin/scjgl/favoriteFolder.css">
    <%--Jcrop样式--%>
    <link rel="stylesheet" href="${ctx}/scripts/plugs/Jcrop/jquery.Jcrop.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<style>
    .userInfo_content{
        position: relative;
        padding-top: 20px;
        padding-left: 43px;
        padding-bottom: 0px;
    }
</style>
<body>
<div class="content content-nav-base commodity-content">
    <div class="data-cont-wrap w1200">
        <!--用户头像-->
        <div class="userInfo_content">
            <c:set value="${user.resources}" var="userResources"/>
            <div class="userHead">
                <c:forEach items="${userResources}" var="resource">
                    <img id="userImg" class="userImg" src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}">
                </c:forEach>
                <label>${user.nickname}</label>
            </div>

            <div class="userInfo_message">
                <form class="layui-form" action="" method="post" onsubmit="return false;">
                    <%--隐藏用户id--%>
                    <input id="userId" type="hidden" name="userId" value="${user.userId}">

                    <div class="layui-form-item">
                        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号:&nbsp;&nbsp;&nbsp;&nbsp;${user.studentNo}</label>
                    </div>

                    <div class="layui-form-item">
                        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;昵称:&nbsp;&nbsp;&nbsp;&nbsp;${user.nickname}</label>
                    </div>
                    <%--<div class="layui-form-item">--%>
                        <%--<label>真实姓名:&nbsp;&nbsp;&nbsp;&nbsp;${user.realName}</label>--%>
                    <%--</div>--%>
                    <div class="layui-form-item">
                        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别:&nbsp;&nbsp;&nbsp;&nbsp;${user.sex}</label>
                    </div>
                    <div class="layui-form-item">
                        <label>电子邮箱:&nbsp;&nbsp;&nbsp;&nbsp;${user.email}</label>
                    </div>
                    <div class="layui-form-item">
                        <label>&nbsp;&nbsp;&nbsp;手机号:&nbsp;&nbsp;&nbsp;&nbsp;${user.phone}</label>
                    </div>
                    <div class="layui-form-item">
                        <label>宿舍地址:&nbsp;&nbsp;&nbsp;&nbsp;${user.dormitoryAddress}</label>
                    </div>
                    <div class="chang_info">
                        <%--<a id="changeInfo" class="cutImg1">关闭</a>--%>
                        <button class="layui-btn" onclick="myclose();">关闭</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
</html>
<script>
    layui.use(['layer'], function(){
        var layer = layui.layer;
    });
    function myclose() {
        var myIndex = parent.layer.getFrameIndex(window.name);
        parent.layer.close(myIndex);
    }
</script>