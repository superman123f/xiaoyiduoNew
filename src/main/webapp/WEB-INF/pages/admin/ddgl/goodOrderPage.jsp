<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon.ico"/>
    <title>校益多</title>
    <link rel="stylesheet" type="text/css" href="../../../styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="../../../styles/layui/css/layui.css">
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
    订单编号${order.orderId}<br>
    用户编号${order.userId}<br>
    买家id${order.buyerId}<br>
    收货人姓名${order.buyerName}<br>
    收货地址${order.buyerAddress}<br>
    联系电话${order.phone}<br>
    电子邮箱${order.email}<br>
    订单生成时间${order.orderCreateTime}<br>
    订单总价${order.totalPrice}<br>
    订单状态${order.orderStatus}<br>
    配送方式${order.deliveryMethod}<br>
    卖家id${order.sellerId}<br>
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
        }).use(['mm','jquery','element','car'],function(){
            var mm = layui.mm,$ = layui.$,element = layui.element,car = layui.car;

            car.init()

            $(".dele-btn").click(function(){
            });
        });
    });
</script>
