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
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon1.ico"/>
    <title>校益多</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/admin/reply/reply.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/shop/details.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

<%@ include file="../shop_header.jsp"%> <!--引入头部jsp样式-->

<!--隐藏域-->
<input type="hidden" id="goodId" value="${goodDetail.goodId}">
<input type="hidden" id="goodName1" value="${goodDetail.goodName}">
<input type="hidden" id="secondPrice" value="${goodDetail.secondPrice}">
<input type="hidden" id="noFavorite" value="${noFavorite}">
<input type="hidden" id="messageCount" value="${messageCount}">
<input type="hidden" id="isLogin" value="<shiro:principal property="userId"></shiro:principal>">


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
                        <span onclick="addFavorite();"><i id="star" class="layui-icon layui-icon-rate-solid" style="color:grey;"></i>收藏</span>
                    </div>
                    <div class="summary">
                        <p class="reference"><span>入手价</span> <del>${goodDetail.originPrice}</del></p>
                        <p class="activity"><span>转卖价</span><strong class="price"><i>￥</i>${goodDetail.secondPrice}</strong></p>
                        <%--<p class="address-box"><span>送&nbsp;&nbsp;&nbsp;&nbsp;至</span><strong class="address">江西&nbsp;&nbsp;南昌&nbsp;&nbsp;东湖区</strong></p>--%>
                    </div>
                    <div class="choose-attrs">
                        <%--<div class="color layui-clear"><span class="title">颜&nbsp;&nbsp;&nbsp;&nbsp;色</span> <div class="color-cont"><span class="btn">白色</span> <span class="btn active">粉丝</span></div></div>--%>
                        <div class="number layui-clear"><span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量</span>&nbsp;&nbsp;件 (库存${goodDetail.goodNumber}件)<div  class="number-cont"><span class="cut btn">-</span><input id="goodNum" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" maxlength="4" type="" name="" value="1"><span class="add btn">+</span></div></div>
                        <input id="goodNumber" type="hidden" value="${goodDetail.goodNumber}">
                    </div>
                    <div class="choose-btns">
                        <button id="buy_now_btn" class="layui-btn layui-btn-primary purchase-btn">立刻购买</button>
                        <button id="addCartBtn" class="layui-btn  layui-btn-danger car-btn"><i class="layui-icon layui-icon-cart-simple"></i>加入购物车</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-clear">
            <div class="aside">
                <h4>${userName}商品橱窗</h4>
                <div class="item-list">
                    <%--原模板样式--%>
                    <%--<div class="item">--%>
                    <%--<img src="../../../images/shop/details_img2.jpg">--%>
                    <%--<p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>--%>
                    <%--</div>--%>
                    <c:forEach items="${userGoodList}" var="userGood">
                        <div class="item" style="width: 280px;">
                            <c:set value="${userGood.imgUrlResource}" var="resources"/>
                            <c:forEach items="${resources}" var="resource" end="0">
                                <a href="/good/toGoodDetailPage?goodId=${userGood.goodId}"><img width="280" height="280" src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}"></a>
                            </c:forEach>
                            <p style="color: #333333;"><a href="/good/toGoodDetailPage?goodId=${userGood.goodId}">${userGood.goodName}</a></p>
                            <%--<p><span>${userGood.goodName}</span></p>--%>
                            <p style="position: relative;">
                                <span style="color: #ee0000;">￥${userGood.secondPrice}</span>
                                <!--后期改为收藏数-->
                                <span style="position: absolute; right: 13px; color:#999999;"><del>${userGood.originPrice}</del></span>
                            </p>

                            <%--<span class="pric">${userGood.secondPrice}</span>--%>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!--layui Tab页签-->
            <div class="layui-tab layui-tab-brief detail" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this">详情</li>
                    <li>留言</li>
                </ul>

                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div style="margin: 18px 0px 18px 0px;">
                            <font style="font-size: 20px;font-family: Microsoft Yahei;">${goodDetail.information}</font>
                        </div>
                        <c:set value="${goodDetail.imgUrlResource}" var="imgUrlResource"></c:set>
                        <c:forEach items="${imgUrlResource}" var="resource" begin="1">
                            <%--<a href="javascript:;"><img height="400" width="400" src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}"></a>--%>
                            <div class="item">
                                <img style="width: 628px;height: 500px;" src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}">
                            </div>
                        </c:forEach>
                    </div>
                    <div class="layui-tab-item">
                        <textarea id="layedit" style="display: none;"></textarea>
                        <div class="site-demo-button" style="margin-top: 20px;">
                            <button class="layui-btn site-demo-layedit" data-type="content">发表留言</button>
                        </div>
                        <c:if test="${empty messageList}">
                            <div style="margin-top: 16px">
                                <span>暂无留言</span>
                            </div>
                        </c:if>
                        <c:if test="${not empty messageList}">
                            <div id="messageArea" class="messageArea">
                                <c:forEach items="${messageList}" var="message">
                                    <div class="message_content">
                                        <%--用户头像：--%>
                                        <div class="user">
                                            <a href=""><img src="/good/displayImage?imageUrl=${message.userImgUrl}"></a>
                                            <%--用户昵称：--%>
                                            <a href="">${message.nickname}</a>
                                        </div>
                                        <div class="message">
                                            <%--留言内容：--%>
                                            ${message.messageContent}
                                            &nbsp;&nbsp;&nbsp;&nbsp;<a scr="javascript:void(0);" onclick="replyMessage('${message.messageId}');">回复</a>
                                        </div>
                                        <div class="message_time">
                                            <%--留言时间：--%>
                                            <fmt:formatDate value="${message.messageTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                        </div>
                                    </div>
                                    <div id="replyArea" class="replyArea">
                                        <c:set value="${message.replyList}" var="replyList"/>
                                        <c:forEach items="${replyList}" var="replyMessage">
                                            <div class="reply_content">
                                                    <%--用户头像：--%>
                                                <div class="reply_user">
                                                    <a href=""><img width="32" height="32" style="border-radius: 50%" src="/good/displayImage?imageUrl=${replyMessage.userImgUrl}"></a>
                                                        <%--用户昵称：--%>
                                                    <a href="">${replyMessage.nickname}</a>
                                                </div>
                                                <div class="reply">
                                                        <%--留言内容：--%>
                                                        ${replyMessage.replyContent}
                                                    <%--&nbsp;&nbsp;&nbsp;&nbsp;<a scr="javascript:void(0);" onclick="replyMessage('${message.messageId}');">回复</a>--%>
                                                </div>
                                                <div class="reply_time">
                                                        <%--留言时间：--%>
                                                    <fmt:formatDate value="${replyMessage.replyTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:forEach>
                            </div>
                            <!--laypage分页-->
                            <div id="laypage"></div>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/pages/shop_rooter.jsp" %> <!--引入尾部样式-->
</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/reply/reply.js"></script>
</html>
<script type="text/javascript">
    var layer;

    var messageCount; // 留言总数
    var curr = 1; // 当前页
    var limit = 10; // 页面大小

    var cur = 1;
    var star;

    // 获取留言及回复
    function getMessages(curr, limit){
        var goodId = $("#goodId").val();
        $.ajax({
            type:"post",
            url:"/message/getAllMessageAndReply",//对应controller的URL
            async:false, //这一步很关键，同步，否则无法获得total的值
            dataType: 'json',
            data:{
                "goodId":goodId,
                "curr":curr,
                "limit":limit
            },
            success:function(data){
                // total = pager.total;  //设置总条数
                // console.log(pager);

                var html = "";
                for(var i = 0; i < data.length; i++){
                    html +=    '<div class="message_content">';
                    html +=    '<div class="user">';
                    html +=    '<a href=""><img width="32" height="32" style="border-radius: 50%" src="/good/displayImage?imageUrl='+data[i].userImgUrl+'"></a>';
                    html +=    '<a href="">'+data[i].nickname+'</a>';
                    html +=    '</div>';
                    html +=    '<div class="message">';
                    html +=    data[i].messageContent;
                    html +=    '&nbsp;&nbsp;&nbsp;&nbsp;<a scr="javascript:void(0);" onclick="replyMessage(\''+data[i].messageId+'\');">回复</a>';
                    html +=    '</div>';
                    html +=    '<div class="message_time">';
                    html +=    data[i].messageTime;
                    html +=    '</div>';
                    html +=    '</div>';

                    html +=    '<div id="replyArea" class="replyArea">';
                    for(var j = 0; j < data[i].replyList.length; j++){
                        html +=   '<div class="reply_content">'
                        html +=   '<div class="reply_user">'
                        html +=   '<a href=""><img width="32" height="32" style="border-radius: 50%" src="/good/displayImage?imageUrl='+data[i].replyList[j].userImgUrl+'"></a>'
                        html +=   '<a href="">'+data[i].replyList[j].nickname+'</a>'
                        html +=   '</div>'
                        html +=   '<div class="reply">'
                        html +=   data[i].replyList[j].replyContent
                        html +=   '</div>'
                        html +=   '<div class="reply_time">'
                        html +=   data[i].replyList[j].replyTime
                        html +=   '</div>'
                        html +=   '</div>'
                    }
                    html +=    '</div>';
                }

                $("#messageArea").empty().append(html); //清空后再嵌入商品信息
            }
        });
    }

    // 回复留言
    function replyMessage(messageId){
        // alert(messageId);
        $.post("/user/checkUserLogin",
            {

            },
            function(data){
                if(data.success == false){
                    layer.confirm("您还未登录，是否现在登录", {
                        btn: ['现在就去', '我再想想'],
                        btnAlign: 'c'
                    }, function(index){
                        layer.close(index);
                        location.href = "/shop/login";
                    });
                } else {
                    layer.open({
                        type: 2,
                        area: ['550px', '326px'],
                        content: '/reply/toLayEdit?messageId='+messageId,
                        end: function(){
                            getMessages(curr, limit);
                        }
                    })
                }
            });
    }

    $(function(){

        messageCount = $("#messageCount").val();
        star = $("#noFavorite").val(); //当前用户是否收藏此商品
        // alert(star);
        if(star == 'true') {
            // alert(1);
            $("#star").css("color", "grey");
        } else {
            // alert(4);
            $("#star").css("color", "red");
        }

        layui.config({
            base: '${ctx}/scripts/shop/' //你存放新模块的目录，注意，不是layui的模块目录
        }).use(['mm','jquery','layer','layedit','laypage'],function(){
            var mm = layui.mm, $ = layui.$, layer = layui.layer, layedit = layui.layedit, laypage = layui.laypage;

            //laypage分页
                laypage.render({
                    elem: 'laypage' //注意，这里的 test1 是 ID，不用加 # 号
                    ,count: messageCount //数据总数，从服务端得到
                    ,jump: function(obj, first){
                        curr = obj.curr;
                        limit = obj.limit;
                        //首次不执行
                        if(!first){
                            // 获取留言
                            getMessages(curr, limit);

                        }
                    }
                });
            // ------------------- laypage end --------------------//

            //layedit富文本编辑
            var layedit_index = layedit.build('layedit', {
                height: 180,
                tool: [ //工具栏
                    'strong' //加粗
                    ,'italic' //斜体
                    ,'underline' //下划线
                    ,'del' //删除线
                    ,'|' //分割线
                    ,'left' //左对齐
                    ,'center' //居中对齐
                    ,'right' //右对齐
                    ,'face' //表情
                ]
            });

            //编辑器外部操作
            var active = {
                content: function(){
                    // alert(layedit.getContent(layedit_index)); //获取编辑器内容
                    var goodId = $("#goodId").val(); // 商品编号
                    var messageContent = layedit.getContent(layedit_index); // 留言内容
                    var isLogin = $("#isLogin").val(); // 判断用户是否登录

                    if(isLogin){
                        // 用户已经登录
                        if(messageContent == "" || messageContent == null || messageContent == 'undefined'){
                            layer.alert("输入内容不能为空");
                        } else {
                            $.post("/message/insertMessage",
                                {
                                    goodId: goodId,
                                    messageContent: messageContent
                                },
                                function(data){
                                    if(data.success){
                                        layer.msg(data.msg);
                                        getMessages(curr, limit);
                                        messageCount = data.messageCount;
                                    } else {
                                        // layer.msg(data.msg);
                                        layer.confirm("您还未登录，是否现在登录", {
                                            btn: ['现在就去', '我再想想'],
                                            btnAlign: 'c'
                                        }, function(index){
                                            layer.close(index);
                                            location.href = "/shop/login";
                                        });
                                    }
                                });
                        }
                    } else { // 未登录，提示是否“现在登录”
                        layer.confirm("您还未登录，是否现在登录", {
                            btn: ['现在就去', '我再想想'],
                            btnAlign: 'c'
                        }, function(index){
                            layer.close(index);
                            location.href = "/shop/login";
                        });
                    }

                }
            };

            // 监听所选按钮
            $('.site-demo-layedit').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });

            // ------------------- layedit 富文本编辑 end --------------------//

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

        //立即购买
        $("#buy_now_btn").click(function(){
            var goodIds = $("#goodId").val();
            var goodNums = $("#goodNum").val();
            var cartIds = "";
            var source = "buynow";
            //检测是否登录
            $.post("/user/checkUserLogin",
                {

                },
                function(data) {
                    if (data.success == false) {
                        layer.confirm("您还未登录，是否现在登录", {
                            btn: ['现在就去', '我再想想'],
                            btnAlign: 'c'
                        }, function (index) {
                            layer.close(index);
                            location.href = "/shop/login";
                        });
                    } else {
                        // 生成订单
                        window.location.href = "/order/createGoodOrderInfo?goodIds=" + goodIds + "&goodNums=" + goodNums + "&cartIds=" + cartIds + "&source=" + source;
                    }
                });
        });

        //加入购物车
        $("#addCartBtn").click(function(){

            var goodName = $("#goodName1").val(); //不知道为啥要换个id名称才可以获取值，使用goodName不行
            var secondPrice = $("#secondPrice").val();
            var cur_ = cur;
            var goodId = $("#goodId").val();

            $.post("/cart/addGoodToCart",
                {
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
                             btn: ['现在就去', '我再想想'],
                            btnAlign: 'c'
                        }, function(index){
                            layer.close(index);
                            location.href = "/shop/login";
                        });
                    }
            });
        });
    });

    function addFavorite(){
        // star = true;
        var goodId = $("#goodId").val();
        // alert(goodId);
        $.post("/favorite/addToFavorite",
            {
                goodId: goodId,
                star: star
            },
            function(data){
                if(data.isLogin == false){
                    // alert(1);
                    layer.confirm("您还未登录，是否现在登录", {
                        btn: ['现在就去', '我再想想'],
                        btnAlign: 'c'
                    }, function(index){
                        layer.close(index);
                        location.href = "/shop/login";
                    });
                } else {
                    if(data.success) {
                        $("#star").css("color", "red");
                        star = false;
                        layer.msg("收藏成功");
                    } else {
                        $("#star").css("color", "grey");
                        star = true;
                        layer.msg("取消收藏");
                    }
                }
        });

    };
</script>