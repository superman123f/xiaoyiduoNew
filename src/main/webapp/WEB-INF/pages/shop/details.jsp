<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/9
  Time: 23:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校益多</title>
    <link rel="stylesheet" type="text/css" href="../../../styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="../../../styles/layui/css/layui.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

<%@ include file="../shop_header.jsp"%> <!--引入头部jsp样式-->

<!--隐藏域-->
<input type="hidden" id="goodId" value="${goodDetail.goodId}">
<input type="hidden" id="goodName" value="${goodDetail.goodName}">
<input type="hidden" id="secondPrice" value="${goodDetail.secondPrice}">


<div class="content content-nav-base datails-content">
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
    <div class="data-cont-wrap w1200">
        <div class="crumb">
            <a href="/shop/commodity">首页</a>
            <span>></span>
            <a href="/shop/commodity">所有商品</a>
            <span>></span>
            <a href="javascript:;">产品详情</a>
        </div>
        <div class="product-intro layui-clear">
            <div class="preview-wrap">
                <c:set value="${goodDetail.imgUrlResource}" var="imgUrlResource"></c:set>
                <c:forEach items="${imgUrlResource}" var="resource" end="0">
                    <a href="javascript:;"><img height="400" width="400" src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}"></a>
                </c:forEach>
            </div>
            <div class="itemInfo-wrap">
                <div class="itemInfo">
                    <div class="title">
                        <h4>${goodDetail.goodName}</h4>
                        <span><i class="layui-icon layui-icon-rate-solid"></i>收藏</span>
                    </div>
                    <div class="summary">
                        <p class="reference"><span>入手价</span> <del>${goodDetail.originPrice}</del></p>
                        <p class="activity"><span>转卖价</span><strong class="price"><i>￥</i>${goodDetail.secondPrice}</strong></p>
                        <%--<p class="address-box"><span>送&nbsp;&nbsp;&nbsp;&nbsp;至</span><strong class="address">江西&nbsp;&nbsp;南昌&nbsp;&nbsp;东湖区</strong></p>--%>
                    </div>
                    <div class="choose-attrs">
                        <%--<div class="color layui-clear"><span class="title">颜&nbsp;&nbsp;&nbsp;&nbsp;色</span> <div class="color-cont"><span class="btn">白色</span> <span class="btn active">粉丝</span></div></div>--%>
                        <div class="number layui-clear"><span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量</span>&nbsp;&nbsp;件 (库存${goodDetail.goodNumber}件)<div class="number-cont"><span class="cut btn">-</span><input onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" maxlength="4" type="" name="" value="1"><span class="add btn">+</span></div></div>
                        <input id="goodNumber" type="hidden" value="${goodDetail.goodNumber}">
                    </div>
                    <div class="choose-btns">
                        <button class="layui-btn layui-btn-primary purchase-btn">立刻购买</button>
                        <button id="addCartBtn" class="layui-btn  layui-btn-danger car-btn"><i class="layui-icon layui-icon-cart-simple"></i>加入购物车</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-clear">
            <div class="aside">
                <h4>卖家商品</h4>
                <div class="item-list">
                    <div class="item">
                        <img src="../../../images/shop/details_img2.jpg">
                        <p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>
                    </div>
                </div>
            </div>
            <div class="detail">
                <h4>详情</h4>
                <div style="margin: 18px 0px 18px 31px;">
                    <font style="font-size: 20px;font-family: Microsoft Yahei;">${goodDetail.information}</font>
                </div>
                <c:set value="${goodDetail.imgUrlResource}" var="imgUrlResource"></c:set>
                <c:forEach items="${imgUrlResource}" var="resource" begin="1">
                    <%--<a href="javascript:;"><img height="400" width="400" src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}"></a>--%>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}">
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/pages/shop_rooter.jsp" %> <!--引入尾部样式-->
</body>
<script type="text/javascript" src="../../../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../../../styles/layui/layui.js"></script>
</html>
<script type="text/javascript">
    var cur = 1;
    $(function(){
        layui.config({
            base: '${ctx}/scripts/shop/' //你存放新模块的目录，注意，不是layui的模块目录
        }).use(['mm','jquery','layer'],function(){
            var mm = layui.mm,$ = layui.$;
            cur = $('.number-cont input').val();
            var goodNumber =$("#goodNumber").val();
            // alert(goodNumber);
            $('.number-cont .btn').on('click',function(){
                if($(this).hasClass('add')){
                    if(cur < goodNumber){
                        cur++;
                    }
                }else{
                    if(cur > 1){
                        cur--;
                    }
                }
                $('.number-cont input').val(cur)
            })

        });

        $("#addCartBtn").click(function(){
            // alert(1);
            var goodName = $("#goodName").val();
            // alert(goodName);
            var secondPrice = $("#secondPrice").val();
            // alert(secondPrice);
            var cur_ = cur;
            // alert(cur);
            var goodId = $("#goodId").val();
            // alert(goodId);
            $.post("/cart/addGoodToCart",
                {
                    // cart_id: 通过uuid生成
                    // buyer_id:, 后台获取当前用户id
                    good_name: goodName,
                    single_price: secondPrice,
                    good_number: cur_,
                    good_id: goodId
                },
                function(data){
                    if(data.isLogin){
                        if(data.success){
                            layer.alert(data.msg);
                            $("#cartSpan").html(data.cartGoodCount);
                        } else {
                            layer.alert(data.msg)
                        }
                    } else {
                        layer.confirm("您还未登录，是否现在登录", {
                             btn: ['现在就去', '我在想想'],
                            btnAlign: 'c'
                        }, function(index){
                            layer.close(index);
                            location.href = "/shop/login";
                        });

                        // layer.alert("您还未登录，请先登录");
                    }
            });
        });
    })
</script>