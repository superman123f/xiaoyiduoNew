<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon1.ico"/>
    <title>校益多</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/admin/scjgl/favoriteFolder.css">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<style>
    .pay_success {
        float: left;
        position: relative;
        width: 360px;
        margin-top: 52px;
        margin-left: calc(50% - 180px);
    }
    .pay_img {
        width: 135px;
        height: 135px;
    }
    .pay_son {
        width: 100%;
        float: left;
    }
    .pay_pic {
        float: left;
    }
    .word_pay {
        width: 100px;
        margin-bottom: 17px;
        font-size: 22px
    }
    .word_price {
        width: 100px;
        font-size: 20px;
    }
    .word_title {
        margin-top: 32px;
        margin-left: 10px;
        float: left;
    }
    .link_to_order {
        margin-left: 25px;
        margin-top: 9px;
        float: left;
    }
    .footer {
        margin-top: 360px;
    }
</style>

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
    <div style="margin-left: calc(100% - 535px);">
        <img src="${ctx}/images/qrdd3.png">
    </div>

    <div class="pay_success">
        <div class="pay_son">
            <div class="pay_pic">
                <img class="pay_img" src="${ctx}/images/pay.png">
            </div>
            <div class="word_title">
                <div class="word_pay">
                    <span>付款成功</span>
                </div>
                <div class="word_price">
                    ${bigPrice}元
                </div>
            </div>
        </div>
        <div class="link_to_order">
            点击转至&nbsp;&nbsp;<a href="/order/toFrontOrderAdminPage">我的订单</a>
        </div>
    </div>

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
