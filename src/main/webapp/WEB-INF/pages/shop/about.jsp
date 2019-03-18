<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/9
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon1.ico"/>
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../../../styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="../../../styles/layui/css/layui.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

<%@ include file="../shop_header.jsp"%> <!--引入头部jsp样式-->

<div class="content content-nav-base about-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="/shop/commodity">所有商品</a>
                    <%--<a href="/shop/buytoday">今日团购</a>--%>
                    <%--<a href="/shop/information">商品资讯</a>--%>
                    <a href="/shop/about"  class="active">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <%--<div class="banner-box">--%>
        <%--<div class="banner"></div>--%>
    <%--</div>--%>
    <%--<div class="brief-content layui-clear w1200">--%>
        <%--<div class="img-box">--%>
            <%--<img src="${ctx}/images/shop/us_img1.jpg">--%>
            <%--<img class="top" src="${ctx}/images/shop/us_img2.jpg">--%>
        <%--</div>--%>
        <%--<div class="text">--%>
            <%--<p>我们的商品产业2016年涉足商品行业，以品牌经销为主，在强大市场的推动下，于2016年创立自己的独立品牌。公司立足于江西南昌，2年的品牌沉淀和运营经验让我们在行业中获得良好的口碑和市场份额。以直营+连锁加盟模式，让成功可复制，成为越来越多中小投资者的优选项目，更多的妈妈青睐我们的产品。</p>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="banner-text">--%>
        <%--<div class="w1200">--%>
            <%--<p>我们的商品产业2016年涉足商品行业，以品牌经销为主，在强大市场的推动下，于2016年创立自己的独立品牌。公司立足于江西南昌，2年的品牌沉淀和运营经验让我们在行业中获得良好的口碑和市场份额。以直营+连锁加盟模式，让成功可复制，成为越来越多中小投资者的优选项目，更多的妈妈青睐我们的产品。</p>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="after-sale w1200">--%>
        <%--<h4>配送售后</h4>--%>
        <%--<div class="item-box">--%>
            <%--<div class="item item1">--%>
                <%--<div class="img-box">--%>
                    <%--<img src="${ctx}/images/shop/us_icon1.png">--%>
                <%--</div>--%>
                <%--<p>7天无理由退换货</p>--%>
            <%--</div>--%>
            <%--<div class="item item2">--%>
                <%--<div class="img-box">--%>
                    <%--<img src="${ctx}/images/shop/us_icon2.png">--%>
                <%--</div>--%>
                <%--<p>全场满99元顺丰包邮</p>--%>
            <%--</div>--%>
            <%--<div class="item item3">--%>
                <%--<div class="img-box">--%>
                    <%--<img src="${ctx}/images/shop/us_icon3.png">--%>
                <%--</div>--%>
                <%--<p>优质客服服务</p>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
</div>
<%@ include file="/WEB-INF/pages/shop_rooter.jsp" %> <!--引入尾部样式-->

</body>
<script type="text/javascript" src="../../../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../../../styles/layui/layui.js"></script>
</html>
<script type="text/javascript">

    layui.config({
        // base: '../../../scripts/shop/' //你存放新模块的目录，注意，不是layui的模块目录
        base: '${ctx}/scripts/shop/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm'],function(){
        var
            mm = layui.mm;



    });
</script>
