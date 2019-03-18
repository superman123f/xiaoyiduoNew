<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2019/3/3
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon1.ico"/>
    <title>订单详情</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/admin/scjgl/favoriteFolder.css">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<style media="print">
    @page {
        size: auto;  /* auto is the initial value */
        margin: 0mm; /* this affects the margin in the printer settings */
    }
</style>
<body>
<input id="pageType" type="hidden" value="${type}">
<div id="printPage">
<form id="orderForm" class="layui-form" onsubmit="return false;" method="post">

    <input id="orderId" name="orderId" type="hidden" value="${order.orderId}">
    <%--<input id="buyerId" name="buyerId" type="hidden" value="${order.buyerId}">--%>
    <%--<input id="sellerId" name="sellerId" type="hidden" value="${order.sellerId}">--%>
    <%--<input id="goodId" name="goodId" type="hidden" value="${order.goodId}">--%>

    <div class="layui-form-item">
        <label class="layui-form-label">收货人姓名</label>
        <div class="layui-input-inline">
            <%--<input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">--%>
            <input id="buyerName" name="buyerName"  type="text" value="${order.buyerName}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收货人地址</label>
        <div class="">
            <input id="buyerAddress" name="buyerAddress" style="width:100%;" type="text" value="${order.buyerAddress}">
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
    <%--<div>--%>
    <%--<a id="editInfo" href="javascript:void(0);">修改信息</a>--%>
    <%--</div>--%>

    <div class="layui-form-item">
        <label class="layui-form-label">商品单价</label>
        <div class="layui-input-inline">
            <input id="singlePrice" name="singlePrice"  type="text" value="${order.singlePrice}">
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
            <input id="orderMessage" name="orderMessage" style="border:0px;" readonly="readonly" type="text" value="${order.orderMessage}">
        </div>
    </div>

    卖家信息
    <div class="layui-form-item">
        <label class="layui-form-label">卖家姓名</label>
        <div class="layui-input-inline">
            <input id="sellerName" name="sellerName"   type="text" value="${order.sellerName}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-inline">
            <input id="sellerPhone" name="sellerPhone"   type="text" value="${order.sellerPhone}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电子邮箱</label>
        <div class="layui-input-inline">
            <input id="sellerEmail" name="sellerEmail"   type="text" value="${order.sellerEmail}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">宿舍地址</label>
        <div class="layui-input-inline">
            <input id="sellerAddress" name="sellerAddress"   type="text" value="${order.sellerAddress}">
        </div>
    </div>

    <div id="saveAndCancel" class="layui-form-item">
        <div class="layui-input-block">
            <button id="mysave" class="layui-btn">保存</button>
            <button id="mycancel" class="layui-btn">取消</button>
        </div>
    </div>
</form>

    <form id="orderForm1" class="layui-form" onsubmit="return false;" method="post" style="display: none;">
        <div class="layui-form-item">
            <label class="layui-form-label">收货人姓名</label>
            <div class="layui-input-inline">
                <%--<input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">--%>
                <input style="border: 0px;" readonly="readonly" type="text" value="${order.buyerName}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">收货人地址</label>
            <div class="">
                <input  style="border: 0px;" readonly="readonly" type="text" value="${order.buyerAddress}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-inline">
                <input  style="border:0px;" readonly="readonly" type="text" value="${order.phone}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电子邮箱</label>
            <div class="layui-input-inline">
                <input  style="border:0px;" readonly="readonly" type="text" value="${order.email}">
            </div>
        </div>
        <%--<div>--%>
        <%--<a id="editInfo" href="javascript:void(0);">修改信息</a>--%>
        <%--</div>--%>

        <div class="layui-form-item">
            <label class="layui-form-label">商品单价</label>
            <div class="layui-input-inline">
                <input  style="border: 0px;" readonly="readonly" type="text" value="${order.singlePrice}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品数量</label>
            <div class="layui-input-inline">
                <input  style="border:0px;" readonly="readonly" type="text" value="${order.goodNumber}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订单总价</label>
            <div class="layui-input-inline">
                <input  style="border:0px;" readonly="readonly" type="text" value="${order.totalPrice}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订单状态</label>
            <div class="layui-input-inline">
                <input style="border:0px;" readonly="readonly" type="text" value="${order.orderStatus}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">配送方式</label>
            <div class="layui-input-inline">
                <input style="border:0px;" readonly="readonly" type="text" value="${order.deliveryMethod}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订单留言</label>
            <div class="layui-input-inline">
                <input style="border: 0px;" readonly="readonly" style="border:0px;" readonly="readonly" type="text" value="${order.orderMessage}">
            </div>
        </div>

        卖家信息
        <div class="layui-form-item">
            <label class="layui-form-label">卖家姓名</label>
            <div class="layui-input-inline">
                <input style="border: 0px;" readonly="readonly"  type="text" value="${order.sellerName}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input style="border: 0px;" readonly="readonly"  type="text" value="${order.sellerPhone}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电子邮箱</label>
            <div class="layui-input-inline">
                <input  style="border: 0px;" readonly="readonly"  type="text" value="${order.sellerEmail}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">宿舍地址</label>
            <div class="layui-input-inline">
                <input  style="border: 0px;" readonly="readonly"  type="text" value="${order.sellerAddress}">
            </div>
        </div>
    </form>
</div>
<div id="print" class="layui-form-item" style="display: none;">
    <div class="layui-input-block">
        <button id="myprint" class="layui-btn">打印</button>
        <button id="myclose" class="layui-btn">关闭</button>
    </div>
</div>
</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
</html>
<script>
    layui.use(['layer','jquery','form'],function(){
        var layer = layui.layer, $ = layui.jquery,form = layui.from;


    });

    $(function(){
        var pageType = $("#pageType").val();
        if(pageType == 1) {
            $("#saveAndCancel").css("display", "none");
            $("#orderForm").css("display", "none");
            $("#print").css("display", "");
            $("#orderForm1").css("display", "");
        }

        $("#mysave").click(function(){
            // alert("save");
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url: '/order/saveBackOrderDetail',
                data: $("#orderForm").serialize(),
                success: function(data){
                   if(data.success) {
                       layer.msg("保存成功");
                   } else {
                       layer.msg("保存失败");
                   }
                },
                error: function(){
                    layer.msg("保存失败");
                }
            });
        });

        $("#mycancel").click(function(){
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        });

        $("#myclose").click(function(){
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        });

        //打印
        $("#myprint").click(function(){
            // alert(1);
            // window.print();
            PrintPage()
        });
    });

    //打印
    function PrintPage(){
        var newstr = document.getElementById("printPage").innerHTML;
        // var oldstr = document.body.innerHTML;
        document.body.innerHTML = newstr;
        window.print();
        // document.body.innerHTML = oldstr;
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
</script>