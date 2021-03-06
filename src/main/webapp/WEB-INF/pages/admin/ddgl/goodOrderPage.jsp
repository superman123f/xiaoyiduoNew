<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    .order_main{
        margin: 10px 75px 48px 75px;
    }
    .shopcart-content .item-content1{
        border:1px solid #ececee;
        border-bottom: 0;
        height: 100px;
        /*padding:59px 0;*/
        box-sizing: border-box;
        position: relative;}
    .shopcart-content .item_1 {
        width: 44%;
        text-align: left;
        box-sizing: border-box;
        position: relative;
    }
    .shopcart-content .item_2 {
        width: 20%;
        text-align: left;
        box-sizing: border-box;
    }
    .inner_item1 {
        text-align: center;
    }
    .inner_item2 {
        /*text-align: center;*/
    }
    .img_size {
        width: 70px;
        height: 70px;
        float: left;
    }
    .my-mark {
        margin-top: 22px;
        /* width: 100%; */
        height: 90px;
        /*margin-left: 15px;*/
        /*margin-right: 15px;*/
        border-bottom: 1px solid #e4e4e4
    }
    .title1 {
        float: left;
        /* margin-top: 38px; */
        margin-left: 88px;
        width: calc(100% - 150px);
        position: absolute;
    }
    .th-su {
        /*margin-left: calc(20% - 20px);*/
    }
    .box-btn {
        /*margin-left: calc(20% - 6px);*/
    }
    .sum {
        /*margin-left: calc(20% - 17px);*/
    }
    .order-item {
        margin-left: 64px;
        margin-top: 50px;
        float: left;
        position: absolute;
    }
    .shopcart-content .FloatBarHolder {
        line-height: 78px;
        border: 1px solid #ececee;
        background: #f5f5f5;
        position: relative;
        /*margin-top: 22px;*/
        float: left;
        width: 100%;
    }
    .shopcart-content .FloatBarHolder .total{
        margin-right: 150px;
    }
    .shopcart-content .item-content1{
        border: 1px solid #ececee;
        border-bottom: 0;
        height: auto;
        /* padding: 59px 0; */
        box-sizing: border-box;
        position: relative;
    }
    .item-cont {
        margin-left: 15px;
    }
    ._total{
        margin-left: 78%;
    }
    .shopcart-content .FloatBarHolder ._total span {
        color: #ee0000;
        font-size: 26px;
        font-weight: bold;
        padding-left: 5px;
    }
    .myform {
        margin-top: 36px;
        margin-bottom: 44px;
    }
    .front{
        font-size: 15px;
    }
    .form-top {
        margin-bottom: 18px;
    }
    .form-foot {
        margin-left: 30px;
    }
    .form-foot a{
        color: blue;
    }
    .form-foot a:hover{
        color: red;
    }
</style>

<body>
<%@ include file="../../shop_header.jsp"%> <!--引入头部jsp样式-->
<input id="buyerAddress1" type="hidden" value="${user.dormitoryAddress}">
<input id="buyerName1" type="hidden" value="${user.realName}">
<input id="phone1" type="hidden" value="${user.phone}">

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
    <%--订单主体部分--%>
    <div class="order_main">
    <div style="margin-left: calc(100% - 535px);">
        <img src="${ctx}/images/qrdd1.png">
    </div>
    <form class="layui-form myform" action="/order/saveGoodOrder" method="post">
        <div class="form-top">
            <span class="front">确认收货地址</span>
        </div>
        <div class="form-foot">
            <input id="buyerId" name="buyerId" type="hidden" value="${order.buyerId}">
            <input id="sellerId" name="sellerId" type="hidden" value="${order.sellerId}">

            <input id="buyerAddress" name="buyerAddress" style="border:0px;" readonly="readonly" type="hidden" value="${user.dormitoryAddress}">
            <input id="buyerName" name="buyerName" style="border:0px; width: 40px;" readonly="readonly" type="hidden" value="${user.realName}">
            <input id="phone" name="phone" style="border:0px;" readonly="readonly" type="hidden" value="${user.phone}">

            <span id="address2">${user.dormitoryAddress}</span>
            <span id="realName2">（${user.realName}&nbsp;&nbsp;收）</span>
            <span id="phone2">${user.phone}</span>
            <a id="editInfo" href="javascript:void(0);">修改信息</a>
        </div>
    </form>

        <span class="front"> 确认订单信息</span>
        <div class="cart-table-th">
            <%--<div class="th th-chk">--%>
            <%--<div class="select-all">--%>
            <%--<div class="cart-checkbox">--%>
            <%--<input class="check-all check" id="allCheckked" type="checkbox" value="true">--%>
            <%--</div>--%>
            <%--<label>&nbsp;&nbsp;全选</label>--%>
            <%--</div>--%>
            <%--</div>--%>
            <div class="th item_1">
                <div class="inner_item1">
                    商品
                </div>
            </div>
            <div class="th item_2">
                <div class="inner_item2">
                    单价
                </div>
            </div>
            <div class="th item_2">
                <div class="inner_item2">
                    数量
                </div>
            </div>
            <div class="th">
                <div class="inner_item2">
                    小计
                </div>
            </div>
            <%--<div class="th th-op">--%>
                <%--<div class="th-inner">--%>
                    <%--操作--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>
        <div class="OrderList">
            <div class="order-content" id="list-cont">
                <ul class="item-content1 layui-clear">
                    <c:forEach items="${orderList}" var="order" varStatus="status">
                        <div id="my-mark" class="my-mark">
                        <%--<form id="myForm" class="myForm">--%>
                            <%--订单列表--%>
                            <%--订单编号--%>
                            <input id="orderId_${status.index}" name="orderId__${status.index}" type="hidden" value="${order.orderId}">
                            <%--商品编号--%>
                            <input id="goodId_${status.index}" name="goodId_${status.index}" type="hidden" value="${order.goodId}">
                                <%--商品名称--%>
                            <li class="th item_1">
                                <div class="item-cont">
                                    <c:set value="${order.good.imgUrlResource}" var="resources"/>
                                    <c:forEach items="${resources}" var="resource" end="0">
                                        <%--${resource.url}--%>
                                        <a href="/good/toGoodDetailPage?goodId=${order.goodId}"><img class="img_size" width="100" height="100" src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}" alt=""></a>
                                        <div class="title1">
                                            ${order.good.goodName}
                                        </div>
                                        <%--订单留言--%>
                                        <div class="layui-form-item order-item">
                                            <label class="layui-form-label" style="padding: 0px 0px;">订单留言</label>
                                            <div class="layui-input-inline" style="margin-left: 7px;">
                                                <input id="orderMessage_${status.index}" name="orderMessage_${status.index}" style=""  type="text" value="${order.orderMessage}">
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </li>
                            <%--商品单价--%>
                            <li class="th item_2">
                                <span class="th-su">
                                    <input id="singlePrice_${status.index}" name="singlePrice_${status.index}" style="border:0px;" readonly="readonly" type="text" value="${order.singlePrice}">
                                </span>
                            </li>
                            <%--商品数量--%>
                            <li class="th item_2">
                                <div class="box-btn layui-clear">
                                        <%--<div class="less layui-btn">-</div>--%>
                                        <%--<input class="Quantity-input" type="" name="" value="${cart.goodNumber}" disabled="disabled">--%>
                                    <input id="goodNumber_${status.index}" name="goodNumber_${status.index}" style="border:0px;" readonly="readonly" type="text" value="${order.goodNumber}">
                                        <%--<div class="add layui-btn">+</div>--%>
                                </div>
                            </li>
                            <%--小计--%>
                            <li class="th">
                                <span class="sum">
                                    <%--<input id="totalPrice_${status.index}" name="totalPrice_${status.index}" type="text" value="${order.singlePrice * order.goodNumber}">--%>
                                    ${order.singlePrice * order.goodNumber}
                                </span>
                            </li>
                            <%--订单留言--%>
                            <%--<div class="layui-form-item">--%>
                                <%--<label class="layui-form-label">订单留言</label>--%>
                                <%--<div class="layui-input-inline">--%>
                                    <%--<input id="orderMessage_${status.index}" name="orderMessage_${status.index}" style=""  type="text" value="${order.orderMessage}">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--</form>--%>
                        </div>

                    </c:forEach>


                <%--<c:forEach items="${cartList}" var="cart">--%>

                        <%--<li class="th th-chk">--%>
                            <%--<div class="select-all">--%>
                                <%--<div class="cart-checkbox">--%>
                                    <%--<input class="CheckBoxShop check"  type="checkbox" num="all" name="select-all" value="true">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</li>--%>

                        <%--<c:set value="${cart.resources}" var="resources"></c:set>--%>





                            <%--<li class="th th-op">--%>
                            <%--&lt;%&ndash;<span class="dele-btn" onclick="delCartItem('${cart.cartId}');">删除</span>&ndash;%&gt;--%>
                            <%--<span class="dele-btn">删除</span>--%>
                            <%--<input type="hidden" id="cartId" class="cartId" value="${cart.cartId}">--%>
                            <%--</li>--%>
                    </ul>

                <%--</c:forEach>--%>
            </div>
        </div>

        <div class="FloatBarHolder layui-clear">
            <%--<div class="th th-chk">--%>
            <%--<div class="select-all">--%>
            <%--<div class="cart-checkbox">--%>
            <%--<input class="check-all check"  name="select-all" type="checkbox"  value="true">--%>
            <%--</div>--%>
            <%--<label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件</label>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="th batch-deletion">--%>
            <%--<span class="batch-dele-btn">批量删除</span>--%>
            <%--</div>--%>
            <%--<div class="th Settlement">--%>
                <%--<button class="layui-btn">结算</button>--%>
            <%--</div>--%>
            <div class="th _total">
                <p>应付：<span class="pieces-total">
                    ${bigPrice}
                    <%--<input name="bigTotalPrice" type="text" value="12">--%>
                </span></p>
            </div>
        </div>

        <form id="myForm" action="/order/saveGoodOrder" method="post">

            <%--JSON隐藏域--%>
            <input id="orderListJson" name="orderListJson" type="hidden" value="">
            <input id="cartIds" name="cartIds" type="hidden" value="${cartIds}">
            <input id="source" name="source" type="hidden" value="${source}">
            <%--JSON隐藏域--%>
            <%--<input name="bigTotalPrice" type="text" value="12">--%>
            <div class="layui-form-item">
                <div class="layui-input-block" style="float: right;">
                    <%--<button class="layui-btn" lay-submit lay-filter="formDemo">提交订单</button>--%>
                    <input type="submit" class="layui-btn" value="提交订单">
                </div>
            </div>
        </form>

        <%--<div class="layui-form-item">--%>
            <%--<div class="layui-input-block">--%>
                <%--<button class="layui-btn" lay-submit lay-filter="formDemo">提交订单</button>--%>
                <%--&lt;%&ndash;<button type="reset" class="layui-btn layui-btn-primary">重置</button>&ndash;%&gt;--%>
            <%--</div>--%>
        <%--</div>--%>
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

            // car.init()

            $("my-mark").each(function(index, value){
                alert(1);
            });
            $(".dele-btn").click(function(){
            });
        });


        // myTest();

    });

    function getOrderListJson(){
        var buyerAddress = $('#buyerAddress').val();
        var buyerName = $('#buyerName').val();
        var phone = $('#phone').val();

        var jsonData = []; //封装的orderList的json
        var length = "${fn:length(orderList)}";
        for(var i = 0; i < length; i++) {
            var order = {
                orderId: $('#orderId_'+i+'').val(),
                goodId: $('#goodId_'+i+'').val(),
                // singlePrice: $('#singlePrice_'+i+'').val(),
                goodNumber: $('#goodNumber_'+i+'').val(),
                // totalPrice: $('#totalPrice_'+i+'').val(),
                orderMessage: $('#orderMessage_'+i+'').val(),
                buyerAddress: buyerAddress,
                buyerName: buyerName,
                phone: phone
            };
            jsonData.push(order);
        }
        var orderListJson = JSON.stringify(jsonData);
        $('#orderListJson').val(orderListJson);
    }

    //提交表单
    var myForm = document.getElementById('myForm');
    myForm.onsubmit = function(){
        getOrderListJson();
        return true;
    }

    function mySubmit(){
        alert(1);
        return false;
    }

    $("#editInfo").click(function(){
        layer.open({
            type: 2,
            title: '修改资料',
            area: ['650px', '500px'],
            content: '/user/userInfo1',
            end: function(){
                var address = $("#buyerAddress1").val();
                // var realName = $("#buyerName1").val();
                // var phone = $("#phone1").val();
                $("#address2").html(address);
                // $("#realName2").html(realName);
                // $("#phone2").html(phone);

                //刷新收货地址信息
                // $.post(
                //     '/order/updateReceiverAddress',
                //     {
                //
                //     },
                //     function(data){
                //         $("#buyerAddress").val(data.dormitoryAddress);
                //         $("#email").val(data.email);
                //     }
                // );
            }
        });
    });
</script>
