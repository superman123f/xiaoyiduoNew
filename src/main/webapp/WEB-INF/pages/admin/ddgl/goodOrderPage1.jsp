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
        <img src="${ctx}/images/qrdd2.png">
    </div>

    <input id="orderIds" name="orderIds" type="text" value="${orderIds}">


    <div class="layui-form-item">
        <label class="layui-form-label">总价</label>
        <div class="layui-input-inline">
            <input id="bigPrice" name="bigPrice" style=""  type="text" value="${bigPrice}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">余额</label>
        <div class="layui-input-inline">
            <input id="userBalance" name="userBalance" style=""  type="text" value="${user.userBalance}">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="pay" class="layui-btn" lay-submit lay-filter="formDemo">付款</button>
            <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
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
        }).use(['mm','jquery','element','car','form'],function(){
            var mm = layui.mm ,element = layui.element,car = layui.car;
            var form = layui.from, $ = layui.jquery;

            car.init()

            $(".dele-btn").click(function(){
            });
        });
    });

    $("#pay").click(function(){
        var bigPrice = $("#bigPrice").val();
        var userBalance = $("#userBalance").val();
        var orderIds = $('#orderIds').val();

        bigPrice = parseFloat(bigPrice);
        userBalance = parseFloat(userBalance);

        if(userBalance < bigPrice) {
            layer.alert("您的余额不足");
        } else {
           layer.confirm("是否付款？", {
               btn: ['是', '否'],
           }, function(index){
               userBalance -= bigPrice; //付款后的用户余额
               layer.close(index);
               $.ajax({
                   type: 'POST',
                   dataType: 'json',
                   url: '/order/updateOrderStatus',
                   data: {
                       orderIds: orderIds,
                       userBalance: userBalance
                   },
                    success: function(data){
                        if(data.success) {
                            window.location.href="/order/showGoodOrderPage3";
                        } else {
                            layer.alert("付款失败");
                        }
                    }
               });
           })
        }
    });
</script>
