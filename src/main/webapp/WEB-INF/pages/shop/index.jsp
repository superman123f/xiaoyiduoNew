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
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../../../styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="../../../styles/layui/css/layui.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body id="list-cont">

<%@ include file="../shop_header.jsp"%> <!--引入头部jsp样式-->

<div class="content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="/shop/commodity" class="active">所有商品</a>
                    <a href="/shop/buytoday">今日团购</a>
                    <a href="/shop/information">商品资讯</a>
                    <a href="/shop/about">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="category-con">
        <div class="category-inner-con w1200">
            <div class="category-type">
                <h3>全部分类</h3>
            </div>
            <div class="category-tab-content">
                <div class="nav-con">
                    <ul class="normal-nav layui-clear">
                        <li class="nav-item">
                            <div class="title">奶粉辅食</div>
                            <p><a href="#">奶粉</a><a href="#">捕食</a><a href="#">营养品</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                        <li class="nav-item">
                            <div class="title">纸尿裤</div>
                            <p><a href="#">纸尿裤</a><a href="#">婴儿湿巾</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                        <li class="nav-item">
                            <div class="title">洗护用品</div>
                            <p><a href="#">商品洗护用品</a><a href="#">孕婴童用品</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                        <li class="nav-item">
                            <div class="title">儿童玩具</div>
                            <p><a href="#">婴幼玩具</a><a href="#">遥控玩具</a><a href="#">积木拼插</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                        <li class="nav-item">
                            <div class="title">车窗座椅</div>
                            <p><a href="#">婴儿推车</a><a href="#">儿童安全座骑</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                        <li class="nav-item">
                            <div class="title">儿童童鞋</div>
                            <p><a href="#">童装</a><a href="#">童鞋</a><a href="#">婴童内衣及配饰</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                        <li class="nav-item">
                            <div class="title">儿童图片</div>
                            <p><a href="#">0-2岁</a><a href="#">早教启蒙</a><a href="#">孕产育儿</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                        <li class="nav-item nobor">
                            <div class="title">孕妈专区</div>
                            <p><a href="#">孕妇装</a><a href="#">背婴带</a><a href="#">商品服务</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="category-banner">
            <div class="w1200">
                <img src="../../../images/shop/banner1.jpg">
            </div>
        </div>
    </div>
    <div class="floors">
        <div class="sk">
            <div class="sk_inner w1200">
                <div class="sk_hd">
                    <a href="javascript:;">
                        <img src="../../../images/shop/s_img1.jpg">
                    </a>
                </div>
                <div class="sk_bd">
                    <div class="layui-carousel" id="test1">
                        <div carousel-item>
                            <div class="item-box">
                                <div class="item">
                                    <a href="javascript:;"><img src="../../../images/shop/s_img2.jpg"></a>
                                    <div class="title">宝宝五彩袜棉质舒服</div>
                                    <div class="price">
                                        <span>￥49.00</span>
                                        <del>￥99.00</del>
                                    </div>
                                </div>
                                <div class="item">
                                    <a href="javascript:;"><img src="../../../images/shop/s_img3.jpg"></a>
                                    <div class="title">宝宝五彩袜棉质舒服</div>
                                    <div class="price">
                                        <span>￥49.00</span>
                                        <del>￥99.00</del>
                                    </div>
                                </div>
                                <div class="item">
                                    <a href="javascript:;"><img src="../../../images/shop/s_img4.jpg"></a>
                                    <div class="title">宝宝五彩袜棉质舒服</div>
                                    <div class="price">
                                        <span>￥49.00</span>
                                        <del>￥99.00</del>
                                    </div>
                                </div>
                                <div class="item">
                                    <a href="javascript:;"><img src="../../../images/shop/s_img5.jpg"></a>
                                    <div class="title">宝宝五彩袜棉质舒服</div>
                                    <div class="price">
                                        <span>￥49.00</span>
                                        <del>￥99.00</del>
                                    </div>
                                </div>
                            </div>
                            <div class="item-box">
                                <div class="item">
                                    <a href="javascript:;"><img src="../../../images/shop/s_img2.jpg"></a>
                                    <div class="title">宝宝五彩袜棉质舒服</div>
                                    <div class="price">
                                        <span>￥49.00</span>
                                        <del>￥99.00</del>
                                    </div>
                                </div>
                                <div class="item">
                                    <a href="javascript:;"><img src="../../../images/shop/s_img3.jpg"></a>
                                    <div class="title">宝宝五彩袜棉质舒服</div>
                                    <div class="price">
                                        <span>￥49.00</span>
                                        <del>￥99.00</del>
                                    </div>
                                </div>
                                <div class="item">
                                    <a href="javascript:;"><img src="../../../images/shop/s_img4.jpg"></a>
                                    <div class="title">宝宝五彩袜棉质舒服</div>
                                    <div class="price">
                                        <span>￥49.00</span>
                                        <del>￥99.00</del>
                                    </div>
                                </div>
                                <div class="item">
                                    <a href="javascript:;"><img src="../../../images/shop/s_img5.jpg"></a>
                                    <div class="title">宝宝五彩袜棉质舒服</div>
                                    <div class="price">
                                        <span>￥49.00</span>
                                        <del>￥99.00</del>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>






    <div class="hot-recommend-con">
        <div class="hot-con1 w1200 layui-clear">
            <div class="item">
                <h4>热销推荐</h4>
                <div class="big-img">
                    <a href="javascript:;"><img src="../../../images/shop/hot1.png"></a>
                </div>
                <div class="small-img">
                    <a href="javascript:;"><img src="../../../images/shop/hot2.png" alt=""></a>
                </div>
            </div>
            <div class="item">
                <div class="top-img">
                    <a href="javascript:;"><img src="../../../images/shop/hot5.jpg"></a>
                </div>
                <div class="bottom-img">
                    <a href="javascript:;"><img src="../../../images/shop/hot6.jpg"></a>
                    <a class="baby-cream" href="javascript:;"><img src="../../../images/shop/hot7.jpg"></a>
                </div>
            </div>
            <div class="item item1 margin0 padding0">
                <a href="javascript:;"><img src="../../../images/shop/hot8.jpg"></a>
                <a href="javascript:;"><img class="btm-img" src="../../../images/shop/hot9.jpg"></a>
            </div>
        </div>
    </div>



    <div class="product-cont w1200" id="product-cont">
        <div class="product-item product-item1 layui-clear">
            <div class="left-title">
                <h4><i>1F</i></h4>
                <img src="../../../images/shop/icon_gou.png">
                <h5>宝宝服饰</h5>
            </div>
            <div class="right-cont">
                <a href="javascript:;" class="top-img"><img src="../../../images/shop/img12.jpg" alt=""></a>
                <div class="img-box">
                    <a href="javascript:;"><img src="../../../images/shop/s_img7.jpg"></a>
                    <a href="javascript:;"><img src="../../../images/shop/s_img8.jpg"></a>
                    <a href="javascript:;"><img src="../../../images/shop/s_img9.jpg"></a>
                    <a href="javascript:;"><img src="../../../images/shop/s_img10.jpg"></a>
                    <a href="javascript:;"><img src="../../../images/shop/s_img11.jpg"></a>
                </div>
            </div>
        </div>
        <div class="product-item product-item2 layui-clear">
            <div class="left-title">
                <h4><i>2F</i></h4>
                <img src="../../../images/shop/icon_gou.png">
                <h5>奶粉辅食</h5>
            </div>
            <div class="right-cont">
                <a href="javascript:;" class="top-img"><img src="../../../images/shop/img12.jpg" alt=""></a>
                <div class="img-box">
                    <a href="javascript:;"><img src="../../../images/shop/s_img7.jpg"></a>
                    <a href="javascript:;"><img src="../../../images/shop/s_img8.jpg"></a>
                    <a href="javascript:;"><img src="../../../images/shop/s_img9.jpg"></a>
                    <a href="javascript:;"><img src="../../../images/shop/s_img10.jpg"></a>
                    <a href="javascript:;"><img src="../../../images/shop/s_img11.jpg"></a>
                </div>
            </div>
        </div>
        <div class="product-item product-item3 layui-clear">
            <div class="left-title">
                <h4><i>3F</i></h4>
                <img src="../../../images/shop/icon_gou.png">
                <h5>宝宝用品</h5>
            </div>
            <div class="right-cont">
                <a href="javascript:;" class="top-img"><img src="../../../images/shop/img12.jpg" alt=""></a>
                <div class="img-box">
                    <a href="javascript:;"><img src="../../../images/shop/s_img7.jpg"></a>
                    <a href="javascript:;"><img src="../../../images/shop/s_img8.jpg"></a>
                    <a href="javascript:;"><img src="../../../images/shop/s_img9.jpg"></a>
                    <a href="javascript:;"><img src="../../../images/shop/s_img10.jpg"></a>
                    <a href="javascript:;"><img src="../../../images/shop/s_img11.jpg"></a>
                </div>
            </div>
        </div>
    </div>

    <div class="product-list-box" id="product-list-box">
        <div class="product-list-cont w1200">
            <h4>更多推荐</h4>
            <div class="product-item-box layui-clear">
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more1.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more2.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more3.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more1.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more2.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more3.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more1.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more2.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more3.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more1.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more2.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more3.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more1.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more2.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more3.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more1.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more2.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more3.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more1.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more2.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more3.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more1.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more2.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more3.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more1.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more2.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
                <div class="list-item">
                    <a href="javascript:;"><img src="../../../images/shop/more3.jpg"></a>
                    <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
                    <span>￥100.00</span>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="ng-promise-box">
        <div class="ng-promise w1200">
            <p class="text">
                <a class="icon1" href="javascript:;">7天无理由退换货</a>
                <a class="icon2" href="javascript:;">满99元全场免邮</a>
                <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
            </p>
        </div>
    </div>
    <div class="mod_help w1200">
        <p>
            <a href="javascript:;">关于我们</a>
            <span>|</span>
            <a href="javascript:;">帮助中心</a>
            <span>|</span>
            <a href="javascript:;">售后服务</a>
            <span>|</span>
            <a href="javascript:;">商品资讯</a>
            <span>|</span>
            <a href="javascript:;">关于货源</a>
        </p>
        <p class="coty">校益多商城版权所有 &copy; 2018-2050</p>
    </div>
</div>
<%@ include file="/WEB-INF/pages/shop_rooter.jsp" %> <!--引入尾部样式-->

<script type="text/javascript">

    layui.config({
        base: '../../../scripts/shop/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm','carousel'],function(){
        var carousel = layui.carousel,
            mm = layui.mm;
        var option = {
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,arrow: 'always'
            ,height:'298'
            ,indicator:'none'
        }
        carousel.render(option);
        // 模版引擎导入
        // var ins = carousel.render(option);
        // var html = demo.innerHTML;
        // var listCont = document.getElementById('list-cont');
        // // console.log(layui.router("#/about.html"))
        //  mm.request({
        //    url: '../json/index.json',
        //    success : function(res){
        //      console.log(res)
        //      listCont.innerHTML = mm.renderHtml(html,res)
        //      ins.reload(option);
        //    },
        //    error: function(res){
        //      console.log(res);
        //    }
        //  })


    });
</script>
</body>
<script type="text/javascript" src="../../../scripts/jquery.min.js"></script> <script type="text/javascript" src="../../../styles/layui/layui.js"></script>
</html>