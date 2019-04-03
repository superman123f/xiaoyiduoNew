<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2019/1/18
  Time: 23:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>
<html>
<head>
    <title>编辑公告信息</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/layui/css/layui.css">
</head>
<body>
<div style="margin:16px 19px 0px 0px;">
    <form class="layui-form" action="/ban/updateBanGoodInfo" method="post">
        <%--隐藏用户id--%>
        <input id="noticeId" type="hidden" name="noticeId" value="${notice.noticeId}">
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>公告标题</label>
            <div class="layui-input-block">
                <input type="text" id="title" name="title" autocomplete="off" class="layui-input" value="${notice.title}" placeholder="请输入公告标题">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>公告内容</label>
            <div class="layui-input-block">
                <input type="text" id="content" name="content" autocomplete="off" class="layui-input" value="${notice.content}" placeholder="请输入公告内容">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <input id="saveBtn" type="button" class="layui-btn" value="保存">
                <input id="closeBtn" type="button" class="layui-btn" value="关闭">
            </div>
        </div>
    </form>
</div>
</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
</html>
<script>
    layui.use(['form', 'layer', 'table'], function(){
        var form = layui.form();
        var layer = layui.layer();
        var table = layui.table();
    });

    $("#closeBtn").click(function(){
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    });

    $("#saveBtn").click(function(){
        var noticeId = $("#noticeId").val();

        var title = $("#title").val();
        var content = $("#content").val();

        $.post("/notice/updateNoticeInfo",
            {
                noticeId: noticeId,
                title: title,
                content: content,
            },
            function(data){
                if(data.success){
                    // layer.msg(data.msg);
                    // var mylay = parent.layer.getFrameIndex(window.name);
                    // parent.layer.close(mylay);
                    // table.reload();
                } else {
                    // alert(data.msg);
                    // layer.msg(data.msg);
                }
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            });
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