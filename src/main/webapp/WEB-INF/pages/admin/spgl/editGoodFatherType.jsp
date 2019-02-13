<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2019/2/13
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>
<html>
<head>
    <title>编辑商品父类类目信息</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/layui/css/layui.css">
</head>
<body>
<div style="margin:16px 19px 0px 0px;">
    <form class="layui-form" action="/ban/updateBanGoodInfo" method="post">
        <%--隐藏用户id--%>
        <input id="fatherId" type="hidden" name="fatherId" value="${father.fatherId}">
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>商品父类名称</label>
            <div class="layui-input-block">
                <input type="text" id="fatherName" name="fatherName" autocomplete="off" class="layui-input" value="${father.fatherName}" placeholder="请输入商品父类名称">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input id="saveBtn" type="button" class="layui-btn" value="保存">
                <input type="reset" class="layui-btn" value="重置">
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

    $("#saveBtn").click(function(){

        var fatherId = $("#fatherId").val();
        var fatherName = $("#fatherName").val();

        $.post("/type/updateGoodFatherType",
            {
                fatherId: fatherId,
                fatherName: fatherName
            },
            function(data){
                if(data.success){
                    layer.msg(data.msg);
                    // var mylay = parent.layer.getFrameIndex(window.name);
                    // parent.layer.close(mylay);
                    // table.reload();
                } else {
                    // alert(data.msg);
                    layer.msg(data.msg);
                }
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