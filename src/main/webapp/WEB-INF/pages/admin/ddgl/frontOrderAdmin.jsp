<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/9
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
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
    .shopcart-content .th-common{
        width: 150px;
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
                    <%--<a href="/shop/buytoday">今日团购</a>--%>
                    <%--<a href="/shop/information">商品资讯</a>--%>
                    <a href="/shop/about">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <%--大图显示--%>
    <%--<div class="banner-bg w1200">--%>
    <%--<h3>夏季清仓</h3>--%>
    <%--<p>宝宝被子、宝宝衣服3折起</p>--%>
    <%--</div>--%>
    <div class="cart w1200">
        <div class="crumb" style="margin-bottom: 23px;margin-top: 4px;">
            <a href="/shop/commodity">首页</a>
            <%--<span>></span>--%>
            <%--<a href="/shop/commodity">所有商品</a>--%>
            <span>></span>
            <a href="javascript:;">我的订单</a>
        </div>
        <div class="cart-table-th">
            <div class="th th-chk">
                <div class="select-all">
                    <div class="cart-checkbox">
                        <input class="check-all check" id="allCheckked" type="checkbox" value="true">
                    </div>
                    <label>&nbsp;&nbsp;全选</label>
                </div>
            </div>
            <div class="th th-item">
                <div class="th-inner">
                    商品
                </div>
            </div>
            <div class="th th-common">
                <div class="th-inner">
                    单价
                </div>
            </div>
            <div class="th th-common">
                <div class="th-inner">
                    数量
                </div>
            </div>
            <div class="th th-common">
                <div class="th-inner">
                    合计
                </div>
            </div>
            <div class="th th-common">
                <div class="th-inner">
                    状态
                </div>
            </div>
            <div class="th th-op">
                <div class="th-inner">
                    操作
                </div>
            </div>
        </div>
        <div class="OrderList">
            <div class="order-content" id="list-cont">
                <c:forEach items="${orderList}" var="order">
                    <ul class="item-content layui-clear">
                        <li class="th th-chk">
                            <div class="select-all">
                                <div class="cart-checkbox">
                                    <input class="CheckBoxShop check"  type="checkbox" num="all" name="select-all" value="true">
                                </div>
                            </div>
                        </li>

                        <c:set value="${order.resources}" var="resources"></c:set>
                        <li class="th th-item">
                            <div class="item-cont">
                                <c:forEach items="${resources}" var="resource" end="0">
                                    <a href="/good/toGoodDetailPage?goodId=${order.goodId}"><img src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}" alt=""></a>
                                </c:forEach>
                                <div class="text">
                                    <div class="title1"><a href="/good/toGoodDetailPage?goodId=${order.goodId}">${order.good.goodName}</a></div>
                                        <%--<p><span>粉色</span>  <span>130</span>cm</p>--%>
                                </div>
                            </div>
                        </li>
                        <li class="th th-common">
                            <span class="th-su">${order.singlePrice}</span>
                        </li>
                        <li class="th th-common">
                            <%--<div class="box-btn layui-clear">--%>
                                <%--<div class="less layui-btn">-</div>--%>
                                <%--<input class="Quantity-input" type="" name="" value="${order.goodNumber}" disabled="disabled">--%>
                                <%--<div class="add layui-btn">+</div>--%>
                            <%--</div>--%>
                            <%--<input type="text" style="border:0px;" value="${order.goodNumber}" disabled="disabled" readonly="readonly">--%>
                            ${order.goodNumber}
                        </li>
                        <li class="th th-common">
                            <span class="sum">${order.totalPrice}</span>
                        </li>
                        <li class="th th-common">
                            <span class="">${order.orderStatus}</span>
                        </li>
                        <li class="th th-op">
                                <%--<span class="dele-btn" onclick="delCartItem('${cart.cartId}');">删除</span>--%>
                            <span class="dele-btn">删除</span>
                            <span class="order_detail">详情</span>
                            <input type="hidden" id="orderId" class="orderId" value="${order.orderId}">
                        </li>
                    </ul>
                </c:forEach>
            </div>
        </div>

        <div class="FloatBarHolder layui-clear">
            <div class="th th-chk">
                <div class="select-all">
                    <div class="cart-checkbox">
                        <input class="check-all check"  name="select-all" type="checkbox"  value="true">
                    </div>
                    <label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件</label>
                </div>
            </div>
            <div class="th batch-deletion">
                <span class="batch-dele-btn">批量删除</span>
            </div>
            <%--<div class="th Settlement">--%>
                <%--<button class="layui-btn">结算</button>--%>
            <%--</div>--%>
            <%--<div class="th total">--%>
                <%--<p>应付：<span class="pieces-total">0</span></p>--%>
            <%--</div>--%>
        </div>
    </div>
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
        }).use(['mm','jquery','element','order'],function(){
            var mm = layui.mm,$ = layui.$,element = layui.element,order = layui.order;

            order.init()

            $(".dele-btn").click(function(){
                // alert(111);
                // car.init();
                // var cartId = $("#cartId").val();
                // alert(cartId);
            });
        });


    });

    // function delCartItem(cartId){
    //     $.post("/cart/deleteCartItemByCartId",
    //         {
    //             cartId: cartId
    //         },
    //         function(data){
    //             if(data.success){
    //                 console.log(data.msg);
    //             } else {
    //                 console.log(data.msg);
    //             }
    //         });
    // };

</script>