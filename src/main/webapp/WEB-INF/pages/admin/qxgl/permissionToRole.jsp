<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2019/1/18
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>
<html>
<head>
    <title>角色列表</title>
    <link rel="stylesheet" href="${ctx}/styles/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/styles/admin/jpgl/banGoodAdmin.css">
</head>
<body>
<fieldset class="layui-elem-field">
    <legend>权限管理 - 角色列表</legend>
    <div class="layui-field-box">
        <form class="layui-form" action="">
            <div class="layui-form-item" style="text-align:center;">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input id="searchRole" autocomplete="off" class="layui-input" placeholder="请输入角色名称" type="text" name="searchRole" value="">
                    </div>
                </div>
                <div class="layui-inline" style="text-align:left;">
                    <div class="layui-input-inline">
                        <button id="reload" type="button" class="layui-btn" data-type="reload"><i class="layui-icon"></i>查询</button>
                    </div>
                </div>
            </div>
        </form>
        <hr>
        <div class="layui-btn-group">
            <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="/role/editRole" dw-title="关联权限" dw-width="100%" dw-height="100%">
                <i class="layui-icon">&#xe654;</i>关联权限
            </button>
            <%--<button id="deleteData" class="layui-btn layui-btn-xs layui-btn-danger" data-type="deleteData">--%>
                <%--<i class="layui-icon">&#xe640;</i>批删--%>
            <%--</button>--%>
            <%--<button class="layui-btn layui-btn-xs dw-refresh">--%>
            <%--<i class="layui-icon">&#x1002;</i>刷新--%>
            <%--</button>--%>
            <%--<button id="exportExl" class="layui-btn layui-btn-xs" data-type="exportExl">导出Excel</button>--%>
        </div>
        <hr>

        <table id="demo" lay-filter="test"></table>

    </div>
</fieldset>

<%--@*工具栏  在Table中使用 toolbar声明一个 Id  放置在任意位置皆可*@--%>
<script type="text/html" id="barDemo">
    <%--<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="detail">查看</a>--%>
    <%--<button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="create1" dw-title="新增权限" dw-width="100%" dw-height="100%">--%>
    <%--<i class="layui-icon">&#xe654;</i>新增--%>
    <%--</button>--%>

    <%--<button class="layui-btn layui-btn-xs layui-btn-normal">--%>
    <%--<i class="layui-icon">&#xe642;</i>编辑--%>
    <%--</button>--%>
    <div class="layui-btn-group">
        <button class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit">
            <i class="layui-icon">&#xe642;</i>查看权限
        </button>
        <%--<button class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">--%>
            <%--<i class="layui-icon">&#xe640;</i>删除--%>
        <%--</button>--%>
    </div>
</script>
</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
</html>
<script>
    layui.use(['table', 'layer', 'form'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.jquery;
        // +----------------------------------------------------------------------
        // | 弹出层
        // +----------------------------------------------------------------------
        $(".dw-dailog").click(function () {
            var dw_url = $(this).attr("dw-url");//URL地址，必填
            var dw_title = $(this).attr("dw-title");//弹出层标题，必填
            var dw_width = $(this).attr("dw-width");//弹出层宽度，如80%或500px；如果没有默认为屏幕宽度的50%
            var dw_height = $(this).attr("dw-height");//弹出层高度，如50%或500px；如果没有默认为屏幕高度的50%
            if (dw_url == undefined) {
                layer.msg("请给button加上dw-url属性");
                return false;
            }
            if (dw_title == undefined) {
                layer.msg("请给button加上dw-title属性");
                return false;
            }
            if (dw_width == undefined) dw_width = '50%';
            if (dw_height == undefined) dw_height = '50%';
            layer.open({
                type: 2,
                title: dw_title,
                shadeClose: true,
                shade: 0.8,
                area: [dw_width, dw_height],
                content: dw_url,
                cancel: function (index, layero) {
                    $(".layui-laypage-btn").trigger('click');
                    window.location.reload();
                    // return false;
                }
            });
        });

        //第一个实例
        table.render({
            id: 'roleId', //隐藏的列
            elem: '#demo'
            ,url: '/role/getAllRoles' //数据接口
            // ,where: {studentNo: "3"}
            ,page: true //开启分页
            // ,initSort: {field: 'studentNo', type: 'desc'} //设置初始排序
            ,cols: [[ //表头
                {type: 'checkbox'},
                {field: 'roleId', title: '角色编号', sort: true, width:200},
                // {field: 'roleId', title: '公告编号',  sort: true, hide: true} , <!--隐藏-->
                {field: 'roleName', title: '角色名称',  sort: true, width: 500},
                {field: 'userId', title: '用户编号',  sort: true, width: 500, hide: true},
                // {field: 'releaseTime', title: '发布时间', sort: true, template: "<div>{{layui.util.toDateString(releaseTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"},
                {fixed: 'right', title: '操作', toolbar: '#barDemo', width:134, align:'center', unresize: true}
            ]]
            ,height: '472'
            ,method: 'post'
        });



        // //导出数据
        // table.exportFile(['名字','性别','年龄'], [
        //     ['张三','男','20'],
        //     ['李四','女','18'],
        //     ['王五','女','19']
        // ], 'csv'); //默认导出 csv，也可以为：xls

        // table.exportFile(table.config.id, table.data); //data 为该实例中的任意数量的数据


        //搜索 ----------------------------------------------- Begin-----------------------------------------------------------
        var $ = layui.$, active =
            {
                reload: function () {
                    var roleName = $('#searchRole').val();//获取输入框的值

                    //执行重载
                    table.reload('roleId', //与table中的id要一致
                        {
                            page:
                                {
                                    curr: 1 //重新从第 1 页开始
                                }
                            , where: { roleName: roleName}//这里传参  向后台
                            ,url: '/role/searchRole'
                            // , url: '/user/searchUser'//后台做模糊搜索接口路径
                            , method: 'post'
                        });
                },

                //导出数据
                // exportExl: function(){
                // alert(111);
                // alert(222);
                //将上述表格示例导出为 csv 文件
                // table.exportFile(ins1.config.id, data, 'xls'); //data 为该实例中的任意数量的数据
                // table.exportFile(['名字','性别','年龄'], [
                //     ['张三','男','20'],
                //     ['李四','女','18'],
                //     ['王五','女','19']
                // ], 'xls'); //默认导出 csv，也可以为：xls

                //批量删除
                deleteData: function() {
                    var checkStatus = table.checkStatus('roleId') //此时的id为ender的id
                        ,data = checkStatus.data;
                    // layer.alert(JSON.stringify(data));
                    var str = "";
                    if(data.length > 0){
                        layer.alert('delete?');
                        for(var i = 0; i < data.length; i++){
                            str += data[i].roleId + "，";
                        }
                        // alert(str);
                        layer.confirm("是否删除这" + data.length + "条数据？", {icon: 3, title: '提示'}, function(index){
                            // window.location.href = "/user/deleteUserInfos?userIds=" + str;
                            $.post("/role/deleteRoleInfos",
                                {
                                    roleIds: str
                                },
                                function(data){
                                    if(data.success){
                                        // layer.msg(data.msg);
                                        // window.location.reload();
                                        $(".layui-laypage-btn").click(); ///这里用于关闭Open时触发回调函数  刷新父页面数据  一定要引入Jquery
                                    } else {
                                        layer.msg(data.msg);
                                    }
                                });
                            layer.close(index);
                        });
                    } else {
                        layer.alert("请选择要删除的数据");
                    }

                    // table.on('checkbox(test)', function(obj){
                    //     alert(obj.data);
                    //     // var data = obj.data;
                    //     // layer.alert(JSON.stringify(data));
                    // });
                }

            }

        //复选框监听
        // table.on('checkbox(test)', function(obj){
        //     alert(obj.checked);
        //     alert(obj.data);
        //     console.log(obj.checked); //当前是否选中状态
        //     console.log(obj.data); //选中行的相关数据
        //     console.log(obj.type); //如果触发的是全选，则为：all，如果触发的是单选，则为：one
        // });

        //这个是用于创建点击事件的实例
        $('#reload').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //导出数据
        $('#exportExl').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //批量删除
        $('#deleteData').on('click', function() {
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
                        title: '查看禁品信息',
                        skin: 'layui-layer-molv',
                        shadeClose: false,
                        shade: 0.8,
                        content: '/ban/banGoodInfo?banId=' + data.banId, //跳转的页面
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
                        "/role/deleteRole",
                        {roleId: data.roleId},
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
                var editBan = layer.open(
                    {
                        type: 2,
                        title: '编辑公告信息',
                        // skin: 'layui-layer-molv', //样式
                        shadeClose: false,
                        shade: 0.8,
                        area: ['500px', '250px'],
                        maxmin: true,
                        content: '/Role/editRole?roleId=' + data.roleId,//跳转的页面
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