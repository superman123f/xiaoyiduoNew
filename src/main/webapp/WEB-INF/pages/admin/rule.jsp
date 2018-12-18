<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/5
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<html>
<head>
    <title>用户管理测试</title>
    <link rel="stylesheet" type="text/css" href="../../../styles/layui/css/layui.css">
</head>
<body bgcolor="white">
<table id="demo" lay-filter="test"></table>
</body>
<script type="text/javascript" src="../../../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../../../styles/layui/layui.js"></script>
</html>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 312
            ,url: '/user/getAllUsers' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'userId', title: '用户编号', width:80, sort: true, fixed: 'left'}
                ,{field: 'studentNo', title: '用户名', width:80, sort: true}
                ,{field: 'nickname', title: '昵称', width:80, sort: true}
                ,{field: 'password', title: '密码', width:80, sort: true}
                ,{field: 'realName', title: '真实姓名', width: 177, sort: true}
                ,{field: 'sex', title: '性别', width: 80, sort: true}
                ,{field: 'email', title: '电子邮箱', width: 80, sort: true}
                ,{field: 'phone', title: '手机号', width: 80, sort: true}
                ,{field: 'dormitoryAddress', title: '宿舍地址', width: 135, sort: true}
            ]]
        });

    });
</script>
</script>


