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

        // 新增
        layer.open({
            type: 2,
            title: dw_title,
            shadeClose: true,
            shade: 0.8,
            offset: '20px',
            area: [dw_width, dw_height],
            content: dw_url,
            end: function(){
                //执行重载
                table.reload('userId', //与table中的id要一致
                    {
                        page:
                            {
                                curr: 1 //重新从第 1 页开始
                            }
                        , where: {}//这里传参  向后台
                        , method: 'post'
                    });
            },
            cancel: function (index, layero) {
                // $(".layui-laypage-btn").trigger('click');
            }
        });
    });

    //第一个实例
    var ins1 = table.render({
        id: 'userId' //隐藏的列
        ,title: '订单信息列表'
        // ,height: 312
        ,elem: '#demo'
        ,url: '/order/getAllOrders' //数据接口
        // ,where: {studentNo: "3"}
        ,page: true //开启分页
        // ,limits: [6, 7, 8, 9]
        // ,initSort: {field: 'studentNo', type: 'desc'} //设置初始排序
        ,cols: [[ //表头
            {type: 'checkbox'},
            {field: 'orderId', title: '订单编号',  sort: true, hide: false, width:'13%'} ,
            {field: 'buyerName', title: '收货人姓名',  sort: true, width:'10%'},
            // {field: 'buyerAddress', title: '收货地址',  sort: true},
            {field: 'phone', title: '联系电话',  sort: true, hide: true}, <!--隐藏-->
            // {field: 'email', title: '电子邮箱', sort: true},
            // {field: 'deliveryMethod', title: '配送方式', sort: true, hide: false},
            // {field: 'sellerId', title: '卖家id',  sort: true},
            {field: 'singlePrice', title: '商品单价', sort: true, width:'10%'},
            {field: 'goodNumber', title: '商品数量',  sort: true, width:'10%'},
            {field: 'totalPrice', title: '订单总价', sort: true, width:'10%'},
            {field: 'orderCreateTime', title: '订单生成时间',  sort: true, width:'15%'},
            {field: 'orderStatus', title: '订单状态',  sort: true, width:'10%'},
            // {field: 'orderMessage', title: '订单留言',  sort: true},
            // {field: 'buyerId', title: '买家id', sort: true},
            // {field: 'goodId', title: '商品id',  sort: true},
            // {fixed: 'createTime', title: '创建时间', width: 200},
            // 经检验template日期转换无效，在数据库与实体类映射时转换即可
            // {field: 'createTime', title: '创建时间', sort: true, template: "<div>{{layui.util.toDateString(createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"},
            // {field: 'createTime', title: '创建时间', width: 200, sort: true, "<div>{{layui.util.toDateString(createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"},
            {fixed: 'right', title: '操作', toolbar: '#barDemo', width:185, align:'center', unresize: true}
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
                var orderId = $('#orderId').val();//获取输入框的值
                var buyerName = $('#buyerName').val();
                var orderStatus = $('#orderStatus').val();

                //执行重载
                table.reload('userId', //与table中的id要一致
                    {
                        page:
                            {
                                curr: 1 //重新从第 1 页开始
                            }
                        , where: {
                            orderId: orderId,
                            buyerName: buyerName,
                            orderStatus: orderStatus
                        }//这里传参  向后台
                        // ,url: '/user/getAllUsers' // 注意这里调用的接口还是 /user/getAllUsers
                        // , url: '/user/searchUser'//后台做模糊搜索接口路径，未使用这个接口
                        , method: 'post'
                    });
            },

            //批量删除
            deleteData: function() {
                var checkStatus = table.checkStatus('userId') //此时的id为ender的id
                    ,data = checkStatus.data;
                // layer.alert(JSON.stringify(data));
                var str = "";
                if(data.length > 0){
                    for(var i = 0; i < data.length; i++){
                        str += data[i].orderId + "，";
                    }
                    layer.confirm("是否删除这" + data.length + "条数据？", {icon: 3, title: '提示'}, function(index){
                        // window.location.href = "/user/deleteUserInfos?userIds=" + str;
                        $.post("/order/deleteOrderInfos",
                            {
                                orderIds: str
                            },
                            function(data){
                                if(data.success){
                                    // layer.msg(data.msg);
                                    window.location.reload();
                                } else {
                                    layer.msg(data.msg);
                                }
                            });
                        layer.close(index);
                    });
                } else {
                    layer.alert("请选择要删除的数据");
                }

            }

        }

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
                    title: '查看用户信息',
                    skin: 'layui-layer-molv',
                    shadeClose: false,
                    shade: 0.8,
                    content: '/user/userInfo?userId=' + data.userId, //跳转的页面
                    area: ['880px','500px'],
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
                    "/order/deleteOrder",
                    {orderId: data.orderId},
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
                    title: '编辑订单信息',
                    maxmin: true,
                    // skin: 'layui-layer-molv', //样式
                    shadeClose: false,
                    offset: '0px',
                    shade: 0.8,
                    area: ['625px', '100%'],
                    // maxmin: true, //最大最小化
                    content: '/order/toBackOrderDetailPage?orderId=' + data.orderId,//跳转的页面
                    end: function(){ // open撤销时触发回调函数
                        $(".layui-laypage-btn").click(); // 这是分页工具中的“确定”按钮，相当于点击当前页，查询结果
                    },
                    cancel: function (index)
                    {
                        $(".layui-laypage-btn").click();//这里用于关闭Open时触发回调函数  刷新父页面数据  一定要引入Jquery
                    }

                });
        } else if(layEvent === 'print'){ //打印
            layer.open(
                {
                    type: 2,
                    title: '订单详情',
                    maxmin: true,
                    // skin: 'layui-layer-molv', //样式
                    shadeClose: false,
                    offset: '0px',
                    shade: 0.8,
                    area: ['625px', '100%'],
                    // maxmin: true, //最大最小化
                    content: '/order/toBackOrderDetailPage?orderId=' + data.orderId + "&type=1",//跳转的页面
                    end: function(){ // open撤销时触发回调函数
                        $(".layui-laypage-btn").click(); // 这是分页工具中的“确定”按钮，相当于点击当前页，查询结果
                    },
                    cancel: function (index)
                    {
                        $(".layui-laypage-btn").click();//这里用于关闭Open时触发回调函数  刷新父页面数据  一定要引入Jquery
                    }

                });
        }
    });

    //监听工具条 ----------------------------------------------- ENd-----------------------------------------------------------

});