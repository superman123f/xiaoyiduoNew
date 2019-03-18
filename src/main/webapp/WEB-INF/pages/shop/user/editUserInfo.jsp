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
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon1.ico"/>
    <title>编辑用户信息</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/layui/css/layui.css">
</head>
<body>
<div style="margin:16px 19px 0px 0px;">
    <form class="layui-form" action="/user/updateUserInfo" method="post">
        <%--隐藏用户id--%>
        <input id="userId" type="hidden" name="userId" value="${user.userId}">

        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>学号</label>
            <div class="layui-input-block">
                <input type="text" id="studentNo" name="studentNo" autocomplete="off" class="layui-input" value="${user.studentNo}" placeholder="请输入学号" required="true" readonly="true">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>昵称</label>
            <div class="layui-input-block">
                <input type="text" id="nickname" name="nickname" autocomplete="off" name="studentNo" class="layui-input" value="${user.nickname}" placeholder="请输入昵称" readonly="true">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">真实姓名</label>
            <div class="layui-input-block">
                <input type="text" id="realName" name="realName" autocomplete="off" class="layui-input" value="${user.realName}" placeholder="请输入真实姓名">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <c:if test="${user.sex == '男'}">
                    <input type="radio" name="sex" value="男" title="男" checked>
                    <input type="radio" name="sex" value="女" title="女">
                </c:if>
                <c:if test="${user.sex == '女'}">
                    <input type="radio" name="sex" value="男" title="男">
                    <input type="radio" name="sex" value="女" title="女" checked>
                </c:if>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电子邮箱</label>
            <div class="layui-input-block">
                <input type="text" id="email" name="email" autocomplete="off" class="layui-input" value="${user.email}" placeholder="请输入邮箱">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>手机号</label>
            <div class="layui-input-block">
                <input type="text" id="phone" name="phone" autocomplete="off" class="layui-input" value="${user.phone}" placeholder="请输入手机号" readonly="true">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">宿舍地址</label>
            <div class="layui-input-block">
                <input type="text" id="dormitoryAddress" name="dormitoryAddress" autocomplete="off" class="layui-input" value="${user.dormitoryAddress}" placeholder="请输入宿舍地址">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <input id="saveBtn" type="button" class="layui-btn" value="保存">
                <input id="celBtn" type="button" class="layui-btn" value="取消">
            </div>
        </div>
    </form>
</div>
</body>
<script type="text/javascript" src="../../../../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../../../../styles/layui/layui.js"></script>
</html>

<script>
    layui.use(['form', 'layer'], function(){
        var form = layui.form();
        var layer = layui.layer();
    });

    // 保存
    $("#saveBtn").click(function(){
        var userId = $("#userId").val();
        var studentNo = $("#studentNo").val();
        var nickname = $("#nickname").val();
        var realName = $("#realName").val();
        // 获取选中单选按钮的值
        var sex = $('input[name="sex"]:checked').val();
        var email = $("#email").val();
        var phone = $("#phone").val();
        var dormitoryAddress = $("#dormitoryAddress").val();

        $.post("/user/updateUserInfo",
            {
                userId: userId,
                studentNo: studentNo,
                nickname: nickname,
                realName: realName,
                sex: sex,
                email: email,
                phone: phone,
                dormitoryAddress: dormitoryAddress
            },
            function(data){
                if(data.success){
                    // layer.msg(data.msg);
                    // 关闭iframe自身
                    var myIndex = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(myIndex);
                } else {
                    layer.msg(data.msg);
                }
            });
    });

    // 取消
    $("#celBtn").click(function(){
        var myIndex = parent.layer.getFrameIndex(window.name);
        parent.layer.close(myIndex);
    });
    //异步实例
    // $("button").click(function(){
    //     $.post("/try/ajax/demo_test_post.php",
    //         {
    //             name:"菜鸟教程",
    //             url:"http://www.runoob.com"
    //         },
    //         function(data,status){
    //             alert("数据: \n" + data + "\n状态: " + status);
    //         });
    // });
</script>
