<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/9
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校益多</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/layui/css/layui.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

<%@ include file="../shop_header.jsp"%> <!--引入头部jsp样式-->

<div class="content content-nav-base buytoday-content">
    <div id="list-cont">
        <div class="main-nav">
            <div class="inner-cont0">
                <div class="inner-cont1 w1200">
                    <div class="inner-cont2">
                        <a href="/shop/commodity">所有商品</a>
                        <a href="/shop/buytoday" class="active">今日团购</a>
                        <a href="/shop/information">商品资讯</a>
                        <a href="/shop/about">关于我们</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="banner-box">
            <div class="banner"></div>
        </div>
        <div class="product-list-box">
            <div class="product-list w1200">
                <div class="tab-title">
                    <a href="javascript:;" class="active tuang" data-content="tuangou">今日团购</a>
                    <a href="javascript:;" data-content="yukao">明日预告</a>
                </div>
                <div class="list-cont" cont = 'tuangou'>
                    <div class="item-box layui-clear">
                        <div class="item">
                            <img src="../../../images/shop/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div id="demo0" style="text-align: center;"></div>
                </div>
                <div class="list-cont layui-hide" cont = 'yukao'>
                    <div class="item-box layui-clear">
                        <div class="item">
                            <img src="../../../images/shop/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../../images/shop/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div id="demo0" style="text-align: center;"></div>
                </div>
            </div>
        </div>
        <div class="footer-wrap">
            <div class="footer w1200">
                <div class="title">
                    <h3>团购销量榜</h3>
                </div>
                <div class="list-box layui-clear" id="footerList">
                    <div class="item">
                        <img src="../../../images/shop/tuan_img5.jpg" alt="">
                        <div class="text">
                            <div class="right-title-number">1</div>
                            <div class="commod">
                                <p>宝宝打底衣棉麻透气不起球白色多色可选</p>
                                <span>￥100.00</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img src="../../../images/shop/tuan_img6.jpg" alt="">
                        <div class="text">
                            <div class="right-title-number">1</div>
                            <div class="commod">
                                <p>宝宝打底衣棉麻透气不起球白色多色可选</p>
                                <span>￥100.00</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img src="../../../images/shop/tuan_img7.jpg" alt="">
                        <div class="text">
                            <div class="right-title-number">1</div>
                            <div class="commod">
                                <p>宝宝打底衣棉麻透气不起球白色多色可选</p>
                                <span>￥100.00</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/pages/shop_rooter.jsp" %> <!--引入尾部样式-->


<!-- 模版引擎导入 -->
<!--  <script type="text/html" id="demo">
   <div class="main-nav">
     <div class="inner-cont0">
       <div class="inner-cont1 w1200">
         <div class="inner-cont2">
           <a href="commodity.html">所有商品</a>
           <a href="buytoday.html" class="active">今日团购</a>
           <a href="information.html">商品资讯</a>
           <a href="about.html">关于我们</a>
         </div>
       </div>
     </div>
   </div>
   <div class="banner-box">
     <div class="banner"></div>
   </div>
   <div class="product-list-box">
     <div class="product-list w1200">
       <div class="tab-title">
         <a href="javascript:;" class="active tuang">今日团购</a>
         <a href="javascript:;">明日预告</a>
       </div>
       <div class="list-cont">
         <div class="item-box layui-clear">
             {{# layui.each(d.productList,function(index,item){}}
             <div class="item">
               <img src="{{item.img}}" alt="">
               <div class="text-box">
                 <p class="title">{{item.title}}</p>
                 <p class="plic">
                   <span class="ciur-pic">{{item.ciurPic}}</span>
                   <span class="Ori-pic">{{item.OriPic}}</span>
                   <span class="discount">{{item.discount}}</span>
                 </p>
               </div>
             </div>
             {{#})}}
         </div>
        <div id="demo0" style="text-align: center;"></div>
       </div>
     </div>
   </div>
   <div class="footer-wrap">
     <div class="footer w1200">
       <div class="title">
         <h3>团购销量榜</h3>
       </div>
       <div class="list-box layui-clear" id="footerList">
            {{# layui.each(d.footerList,function(index,item){}}
             <div class="item">
               <img src="{{item.img}}" alt="">
               <div class="text">
                 <div class="right-title-number">1</div>
                 <div class="commod">
                   <p>{{item.title}}</p>
                   <span>{{item.price}}</span>
                 </div>
               </div>
             </div>
             {{# });}}
       </div>
     </div>
   </div>
 </script> -->
<script>

    layui.config({
        base: '../../../scripts/shop/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm','laypage','jquery'],function(){
        var laypage = layui.laypage,$ = layui.$;
        mm = layui.mm;
        laypage.render({
            elem: 'demo0'
            ,count: 100 //数据总数
        });


        $('body').on('click','*[data-content]',function(){
            $(this).addClass('active').siblings().removeClass('active')
            var dataConte = $(this).attr('data-content');
            $('*[cont]').each(function(i,item){
                var itemCont = $(item).attr('cont');
                console.log(item)
                if(dataConte === itemCont){
                    $(item).removeClass('layui-hide');
                }else{
                    $(item).addClass('layui-hide');
                }
            })
        })
        // 模版引擎导入
        //  var html = demo.innerHTML;
        //  var listCont = document.getElementById('list-cont');
        //  // console.log(layui.router("#/about.html"))
        // mm.request({
        //     url: '../json/buytoday.json',
        //     success : function(res){
        //       console.log(res)
        //       listCont.innerHTML = mm.renderHtml(html,res)
        //     },
        //     error: function(res){
        //       console.log(res);
        //     }
        //   })

    });
</script>
</body>
<script type="text/javascript" src="../../../scripts/jquery.min.js"></script> <script type="text/javascript" src="../../../styles/layui/layui.js"></script>
</html>