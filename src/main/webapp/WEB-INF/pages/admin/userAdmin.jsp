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
<body bgcolor="white" style="margin:15px;">

<fieldset class="layui-elem-field">
    <legend>用户管理 - 用户列表</legend>
    <form class="layui-form" action="">
        <div class="layui-form-item" style="text-align:center;">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input id="searchUser" autocomplete="off" class="layui-input" placeholder="请输入名称" type="text" name="name" value="">
                </div>
            </div>
            <div class="layui-inline" style="text-align:left;">
                <div class="layui-input-inline">
                    <button id="reload" type="button" class="layui-btn" data-type="reload"><i class="layui-icon"></i>查询</button>
                </div>
            </div>
        </div>
    </form>
    <div style="margin:0px 10px 0px 10px;">
        <table id="demo" lay-filter="test"></table>
    </div>
</fieldset>

<%--@*工具栏  在Table中使用 toolbar声明一个 Id  放置在任意位置皆可*@--%>
<script type="text/html" id="barDemo">
    <%--<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="detail">查看</a>--%>
    <%--<button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="create1" dw-title="新增用户" dw-width="100%" dw-height="100%">--%>
        <%--<i class="layui-icon">&#xe654;</i>新增--%>
    <%--</button>--%>

    <%--<button class="layui-btn layui-btn-xs layui-btn-normal">--%>
        <%--<i class="layui-icon">&#xe642;</i>编辑--%>
    <%--</button>--%>

    <button class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit">
        <i class="layui-icon">&#xe642;</i>编辑
    </button>
    <button class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">
        <i class="layui-icon">&#xe640;</i>删除
    </button>
</script>

</body>
<script type="text/javascript" src="../../../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../../../styles/layui/layui.js"></script>
</html>
<script>
    layui.use(['table', 'layer', 'form'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        //第一个实例
        table.render({
            id: 'userId', //隐藏的列
            elem: '#demo'
            ,url: '/user/getAllUsers' //数据接口
            // ,where: {studentNo: "3"}
            ,page: true //开启分页
            ,cols: [[ //表头
                // {field: 'userId', title: '用户编号',  sort: true, fixed: 'left'} ,
                {field: 'studentNo', title: '学号',  sort: true},
                {field: 'nickname', title: '昵称',  sort: true},
                // {field: 'password', title: '密码',  sort: true},
                {field: 'realName', title: '真实姓名', sort: true},
                {field: 'sex', title: '性别',  sort: true},
                {field: 'email', title: '电子邮箱', sort: true},
                {field: 'phone', title: '手机号',  sort: true},
                {field: 'dormitoryAddress', title: '宿舍地址', sort: true},
                // {fixed: 'createTime', title: '创建时间', width: 200},
                {field: 'createTime', title: '创建时间', width: 200, sort: true, template: "<div>{{layui.util.toDateString(createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"},
                {fixed: 'right', title: '操作', toolbar: '#barDemo', width:175, align:'center'},
            ]]
            ,height: '472'
            ,method: 'post'
        });


        //搜索 ----------------------------------------------- Begin-----------------------------------------------------------
        var $ = layui.$, active =
            {
                reload: function () {
                    var studentNo = $('#searchUser').val();//获取输入框的值

                    //执行重载
                    table.reload('userId', //与table中的id要一致
                        {
                            page:
                                {
                                    curr: 1 //重新从第 1 页开始
                                }
                            , where: { studentNo: studentNo}//这里传参  向后台
                            // ,url: '/user/getAllUsers'
                            // , url: '/user/searchUser'//后台做模糊搜索接口路径
                            , method: 'post'
                        });
                }
            };
        //这个是用于创建点击事件的实例
        $('#reload').on('click', function ()
        {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        //搜索 ----------------------------------------------- End-----------------------------------------------------------

        //监听工具条 ----------------------------------------------- Begin-----------------------------------------------------------
        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if(layEvent === 'detail'){ //查看
                //do somehing
                layer.msg("click to check pages");

                layer.open(
                    {
                        type: 2, //iframe层
                        title: '查看页面',
                        skin: 'layui-layer-molv',
                        shadeClose: false,
                        shade: 0.8,
                        content: '/user/userInfo?userId=' + data.userId, //跳转的页面
                        area: ['880px','660px'],
                        cancel: function (index)
                        {
                            $(".layui-layer-molv").click(); ///这里用于关闭Open时触发回调函数  刷新父页面数据  一定要引入Jquery
                        }
                    });


            } else if(layEvent === 'del'){ //删除
                layer.confirm('真的删除行么', function(index){
                    // obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    // layer.close(index);
                    //向服务端发送删除指令
                    $.post(
                        "/user/deleteUser",
                        {userId: data.userId},
                        function(data){
                            if(data.success){
                                layer.msg(data.msg);
                                obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                layer.close(index);
                            } else {
                                layer.msg(data.msg);
                            }
                        }
                    );
                });
            } else if(layEvent === 'edit'){ //编辑
                layer.open(
                    {
                        type: 2,
                        title: '编辑页面',
                        skin: 'layui-layer-molv',
                        shadeClose: false,
                        shade: 0.8,
                        area: ['880px', '550px'],
                        maxmin: true,
                        content: '/user/userInfo?userId=' + data.userId,//跳转的页面
                        cancel: function (index)
                        {
                            $(".layui-laypage-btn").click();//这里用于关闭Open时触发回调函数  刷新父页面数据  一定要引入Jquery
                        }

                    });
                //do something
                // layer.msg('edit pages');
                //同步更新缓存对应的值
                // obj.update({
                //     username: '123'
                //     ,title: 'xxx'
                // });
            }
        });

        //监听工具条 ----------------------------------------------- ENd-----------------------------------------------------------

    });
</script>
</script>


