<%@ page import="com.xh.xiaoyiduo.shop.pojo.S_USER" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="${ctx}/styles/layui/css/layui.css">
<link rel="stylesheet" href="${ctx}/styles/shop/shop_header.css">

<div class="site-nav-bg">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="/shop/commodity">首页</a>
        </p>


        <div class="sn-quick-menu">

            <%--<div class="sp-cart" style="margin-right: 22px;"><a href="/documents/shiro-jstl.html">帮助文档</a></div>--%>
            <div class="login" style="margin-right: 22px;"><a id="notice" href="javascript:void(0);">公告</a></div>
            <shiro:hasAnyRoles name="admin,seller">
                <div class="sp-cart" style="margin-right: 22px;"><a href="/admin/portal">后台管理</a></div>
            </shiro:hasAnyRoles>

            <%--<shiro:hasAnyRoles name="seller,buyer">--%>
            <div class="sp-cart" style="margin-right: 22px;"><a href="/cart/seeCartList">购物车</a><span id="cartSpan">${sessionScope.cartGoodCount}</span></div>
            <div  style="margin-right: 22px;"><a href="/favorite/toFavoritePage"><span class="favoriteFolder"><i id="favoriteIcon" class="layui-icon layui-icon-rate-solid" style="font-size: 14px; color: #9c9c9c; margin-right: 1px;"></i>收藏夹</span></a></div>
            <div  style="margin-right: 22px;"><a href="/order/toOrderPage">我的订单</a></div>
        <%--</shiro:hasAnyRoles>--%>
            <%--${sessionScope.currentUser.getResources().getType()}--%>
            <%--<%--%>
                <%--S_USER currentUser = (S_USER) session.getAttribute("currentUser");--%>
                <%--out.println(currentUser.getUserId());--%>
            <%--%>--%>

            <shiro:guest>
                <div class="login"><a href="/shop/login">登录</a></div>
            </shiro:guest>
            <shiro:authenticated>
                <div class="sp-cart dropdown" style="margin-right: 22px;">
                    <%--<div class="dropdown">--%>
                        <button class="dropdown-a" href="javascript;">
                            <c:set value="${currentUser.resources}" var="userResources"/>
                                <c:forEach items="${userResources}" var="resource" end="0">
                                    <img id="userHeadImg" class="userImg"  src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}" class="layui-nav-img1">
                                </c:forEach>
                            <%--<img class="userImg" src="http://t.cn/RCzsdCq" class="layui-nav-img1">--%>
                            <shiro:principal property="nickname"></shiro:principal>
                        </button>
                        <div class="dropdown-content">
                            <a href="/user/seeUserInfo">个人资料</a>
                            <a href="/user/logout">退出</a>
                        </div>
                    <%--</div>--%>
                </div>
                <%--<div class="login" style="margin-right: 22px;"><a href="/user/logout">退出</a></div>--%>
            </shiro:authenticated>
        </div>
    </div>
</div>

<div class="header">
    <div class="headerLayout w1200">
        <div class="headerCon">
            <h1 class="mallLogo">
                <a href="#" title="校益多商城">
                    <img width="97" height="32" src="../../../images/shop/logo.png">
                </a>
            </h1>
            <div class="mallSearch">
                <form class="layui-form" novalidate>
                    <input id="goodName" type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
                    <button type="button" id="searchBtn" class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" name="" value="">
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>

<script>
    $(".favoriteFolder").hover(function () {
        $("#favoriteIcon").css("color", "red");
        $(".favoriteFolder").css("color", "red");
    },function(){
        $("#favoriteIcon").css("color", "grey");
        $(".favoriteFolder").css("color", "grey");
    });

    $(function(){
        layui.use(['layer'],function(){
            var layer = layui.layer;

            $("#notice").click(function(){
                // layer.open({
                    // type: 2,
                    // title: false,
                    // closeBtn: 1, //不显示关闭按钮
                    // shade: [0],
                    // area: ['340px', '215px'],
                    // offset: 'rb', //右下角弹出
                    // time: 2000, //2秒后自动关闭
                    // anim: 2,
                    // content: ['test/guodu.html', 'no'], //iframe的url，no代表不显示滚动条
                    // end: function(){ //此处用于演示
                    //     layer.open({
                    //         type: 2,
                    //         title: '公告须知',
                    //         shadeClose: true,
                    //         shade: false,
                    //         // maxmin: true, //开启最大化最小化按钮
                    //         area: ['893px', '600px'],
                    //         content: '//fly.layui.com/'
                    //     });
                    // }
                // });
                layer.open({
                    type: 2,
                    title: '公告须知',
                    shadeClose: true,
                    shade: false,
                    maxmin: true, //开启最大化最小化按钮
                    area: ['750px', '90%'],
                    content: '/notice/toNoticePage'
                });
            });
        });
    });

</script>
