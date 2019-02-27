<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon.ico"/>
    <title>校益多</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/admin/scjgl/favoriteFolder.css">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>

<body>

<%@ include file="../../shop_header.jsp"%> <!--引入头部jsp样式-->
<div class="content content-nav-base shopcart-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="/shop/commodity" class="active">所有商品</a>
                    <a href="/shop/about">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <br>
    <form class="layui-form" action="/order/saveGoodOrder" method="post">

        <input id="buyerId" name="buyerId" type="hidden" value="${order.buyerId}">
        <input id="sellerId" name="sellerId" type="hidden" value="${order.sellerId}">
        <input id="goodId" name="goodId" type="hidden" value="${order.goodId}">

        <div class="layui-form-item">
            <label class="layui-form-label">收货人姓名</label>
            <div class="layui-input-inline">
                <%--<input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">--%>
                <input id="buyerName" name="buyerName" style="border:0px;" readonly="readonly" type="text" value="${order.buyerName}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">收货人地址</label>
            <div class="">
                <input id="buyerAddress" name="buyerAddress" style="border:0px; width:100%;" readonly="readonly" type="text" value="${order.buyerAddress}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-inline">
                <input id="phone" name="phone" style="border:0px;" readonly="readonly" type="text" value="${order.phone}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电子邮箱</label>
            <div class="layui-input-inline">
                <input id="email" name="email" style="border:0px;" readonly="readonly" type="text" value="${order.email}">
            </div>
        </div>
        <div>
            <a id="editInfo" href="javascript:void(0);">修改信息</a>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品单价</label>
            <div class="layui-input-inline">
                <input id="singlePrice" name="singlePrice" style="border:0px;" readonly="readonly" type="text" value="${order.singlePrice}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品数量</label>
            <div class="layui-input-inline">
                <input id="goodNumber" name="goodNumber" style="border:0px;" readonly="readonly" type="text" value="${order.goodNumber}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订单总价</label>
            <div class="layui-input-inline">
                <input id="totalPrice" name="totalPrice" style="border:0px;" readonly="readonly" type="text" value="${order.totalPrice}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订单状态</label>
            <div class="layui-input-inline">
                <input id="orderStatus" name="orderStatus" style="border:0px;" readonly="readonly" type="text" value="${order.orderStatus}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">配送方式</label>
            <div class="layui-input-inline">
                <input id="deliveryMethod" name="deliveryMethod" style="border:0px;" readonly="readonly" type="text" value="${order.deliveryMethod}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订单留言</label>
            <div class="layui-input-inline">
                <input id="orderMessage" name="orderMessage" style=""  type="text" value="${order.orderMessage}">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">提交订单</button>
                <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
            </div>
        </div>
    </form>
    <%--订单编号${order.orderId}<br>--%>
    <%--&lt;%&ndash;用户编号${order.userId}<br>&ndash;%&gt;--%>
    <%--买家id${order.buyerId}<br>--%>
    <%--收货人姓名${order.buyerName}<br>--%>
    <%--收货地址${order.buyerAddress}<br>--%>
    <%--联系电话${order.phone}<br>--%>
    <%--电子邮箱${order.email}<br>--%>
    <%--&lt;%&ndash;订单生成时间${order.orderCreateTime}<br>&ndash;%&gt;--%>
    <%--商品单价${order.singlePrice}<br>--%>
    <%--商品数量${order.goodNumber}<br>--%>
    <%--订单总价${order.totalPrice}<br>--%>
    <%--订单状态${order.orderStatus}<br>--%>
    <%--配送方式${order.deliveryMethod}<br>--%>
    <%--订单留言${order.orderMessage}<br>--%>
    <%--卖家id${order.sellerId}<br>--%>
</div>
<%@ include file="/WEB-INF/pages/shop_rooter.jsp" %> <!--引入尾部样式-->
</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
</html>
<script type="text/javascript">
    $(function(){
        layui.config({
            base: '${ctx}/scripts/shop/' //你存放新模块的目录，注意，不是layui的模块目录
        }).use(['mm','jquery','element','car','form'],function(){
            var mm = layui.mm ,element = layui.element,car = layui.car;
            var form = layui.from, $ = layui.jquery;

            car.init()

            $(".dele-btn").click(function(){
            });
        });
    });

    $("#editInfo").click(function(){
        var buyerId = $("#buyerId").val();
        layer.open({
            type: 2,
            title: '修改资料',
            area: ['650px', '500px'],
            content: '/user/userInfo1?userId=' + buyerId,
            end: function(){
                //刷新收货地址信息
                $.post(
                    '/order/updateReceiverAddress',
                    {

                    },
                    function(data){
                        $("#buyerAddress").val(data.dormitoryAddress);
                        $("#email").val(data.email);
                    }
                );
            }
        });
    });
</script>
