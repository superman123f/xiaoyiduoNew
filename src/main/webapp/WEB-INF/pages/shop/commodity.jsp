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
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon.ico"/>
    <title>校益多</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/layui/css/layui.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

<%@ include file="../shop_header.jsp"%> <!--引入头部jsp样式-->

<!--隐藏域-->
<%--<input id="sonGoodCount" type="text" value="11">--%>

<div class="content content-nav-base commodity-content">
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
    <div class="commod-cont-wrap">
        <div class="commod-cont w1200 layui-clear">
            <div class="left-nav">
                <div class="title">所有分类</div>
                <div class="list-box">
                    <c:forEach items="${goodFatherList}" var="goodFather">
                        <dl>
                            <dt>${goodFather.fatherName}</dt>
                            <c:set value="${goodFather.goodSons}" var="goodSons"></c:set>
                            <c:forEach items="${goodSons}" var="goodSon">
                                <dd><a href="javascript:;" onclick="getSonGoodList('${goodSon.sonId}');">${goodSon.sonName}</a></dd>
                            </c:forEach>
                        </dl>
                    </c:forEach>
                </div>
            </div>
            <div class="right-cont-wrap">
                <div class="right-cont">
                    <div class="sort layui-clear">
                        <a class="active" href="javascript:;" event = 'volume'>时间</a>
                        <a href="javascript:;" event = 'price'>价格</a>
                        <a href="javascript:;" event = 'newprod'>新品</a>
                        <a href="javascript:;" event = 'collection'>收藏</a>
                    </div>
                    <div class="prod-number">
                        <span>200个</span>
                    </div>
                    <div class="cont-list layui-clear" id="list-cont">
                        <div id="goodBody">
                            <%--<c:forEach items="${sonGoodList}" var="sonGood" >--%>
                                <%--<div class="item">--%>
                                    <%--<c:set value="${sonGood.imgUrlResource}" var="resources"></c:set>--%>
                                    <%--<c:forEach items="${resources}" var="resource" end="0">--%>
                                        <%--<div class="img">--%>
                                            <%--&lt;%&ndash;<input type="text" value="${resource.url}">&ndash;%&gt;--%>
                                            <%--<a href="/good/toGoodDetailPage?goodId=${sonGood.goodId}"><img id="mutationImage" style="height:280px;width:280px;" src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}"/></a>--%>
                                        <%--</div>--%>
                                    <%--</c:forEach>--%>
                                    <%--<div class="text">--%>
                                        <%--<p class="title">${sonGood.goodName}</p>--%>
                                        <%--<p class="price">--%>
                                            <%--<span class="nub">${sonGood.originPrice}</span>--%>
                                            <%--<span class="pri">${sonGood.secondPrice}</span>--%>
                                        <%--</p>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</c:forEach>--%>
                        </div>
                    </div>
                    <!-- 模版引擎导入 -->
                    <!-- <script type="text/html" id="demo">
                      {{# layui.each(d.menu.milk.content,function(index,item){}}
                        <div class="item">
                          <div class="img">
                            <a href="javascript:;"><img src="{{item.img}}"></a>
                          </div>
                          <div class="text">
                            <p class="title"></p>
                            <p class="price">
                              <span class="pri">{{item.pri}}</span>
                              <span class="nub">{{item.nub}}</span>
                            </p>
                          </div>
                        </div>
                      {{# }); }}
                    </script> -->
                    <div id="demo0" style="text-align: center;"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/pages/shop_rooter.jsp" %> <!--引入尾部样式-->
</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
</html>

<script>
    var currentPage = 1; //当前页，初始值设为1
    var pageSize = 3; //每页条数， 初始值设为10
    var total; //总记录数
    var sonId = ""; //初始为4的子类商品，实际该变量的初始值没用到
    var goodName = ""; //初始商品搜索内容

    $(function(){
        getInfo(sonId, goodName); //获取数据
        toPage(); //进行分页

        //商品搜索功能
        $("#searchBtn").click(function(){
            sonId = ""; //置空，此时按照商品名称查询
            goodName = $.trim($("#goodName").val());
            // alert(goodName);
            getInfo(sonId, goodName); //获取数据
            toPage(); //进行分页
        });


        //商品菜单栏收缩功能
        $('.sort a').on('click',function(){
            $(this).addClass('active').siblings().removeClass('active');
        })
        $('.list-box dt').on('click',function(){
            if($(this).attr('off')){
                $(this).removeClass('active').siblings('dd').show()
                $(this).attr('off','')
            }else{
                $(this).addClass('active').siblings('dd').hide()
                $(this).attr('off',true)
            }
        })
    });

    //获取数据
    function getInfo(sonId, goodName) {

        //原异步，有问题，没有取消异步的方法
        // $.post("/good/getSonGoodList1",
        //     {
        //         sonId: sonId,
        //         currentPage: currentPage,
        //         pageSize: pageSize
        //     },
        //     function(pager){
        //
        //         successFul(pager);
        //         // if(pager.success){
        //         //     $("#sonGoodCount").val(pager.sonGoodCount);
        //         //     // alert(data.sonGoodCount);
        //         //     successFul(pager);
        //         // } else {
        //         //     alert("商品列表获取失败");
        //         // }
        //
        //         // toPage(); //进行分页
        //     });

        $.ajax({
            type:"post",
            url:"/good/getSonGoodList1",//对应controller的URL
            async:false, //这一步很关键，同步，否则无法获得total的值
            dataType: 'json',
            data:{
                "sonId":sonId,
                "goodName":goodName,
                "currentPage":currentPage,
                "pageSize":pageSize
            },
            success:function(pager){
                total = pager.total;  //设置总条数
                console.log(pager);

                //判断是否为空
                if(typeof(pager.total) == 'undefined' || pager.total == null) {
                    $("#goodBody").html("此类暂无商品信息");
                    return;
                }

                var data = pager.data;
                var html = "";
                for(var i = 0; i < data.length; i++){
                    var resources = data[i].imgUrlResource;

                    html += '<div class="item" style="padding-bottom: 10px;">'
                    html +=    '<div class="img">'
                    for(var j in resources) {
                        if(j == 0) {
                            // alert(resources[j].url);
                            html +=    '<a href="/good/toGoodDetailPage?goodId='+data[i].goodId+'"><img id="mutationImage" style="height:280px;width:280px;" src="${pageContext.request.contextPath}/good/displayImage?imageUrl='+resources[j].url+'"/></a>'

                        }
                    }
                    html +=    '</div>'
                    html +=    '<div class="text">'
                    html +=    '<p class="title">'+data[i].goodName+'</p>'
                    html +=    '<p class="price">'
                    html +=    '<span class="nub">原价&nbsp;<del>'+data[i].originPrice+'</del></span>'
                    html +=    '转卖价&nbsp;<span class="pri"><i>￥</i>'+data[i].secondPrice+'</span>'
                    html +=    '</p>'
                    html +=    '</div>'
                    html +=    '</div>';
                }

                $("#goodBody").empty().append(html); //清空后再嵌入商品信息
            }
        });
    }

    //数据请求成功（不用该方法）
    function successFul(pager){
        // alert(pager.data.sonId.value);
        //1.清空原数据
        $("#goodBody").html("");

        //2.重置页码
        currentPage = pager.currentPage;
        pageSize = pager.pageSize;
        total = pager.total;

        //3.渲染数据
        if(pager.total == 0) {
            $("#goodBody").html("此类暂无商品信息");
            return;
        }

        var text = "";
        $.each(pager.data, function(i, item){
            // $.each(item,function(key,val2){
            //     alert(val2.resourceId);
            // })
            text += '<div class="item">\n' +
            '<div class="img">\n' +
            '<a href="/good/toGoodDetailPage?goodId='+item.goodId+'"><img id="mutationImage" style="height:280px;width:280px;" src="${pageContext.request.contextPath}/good/displayImage?imageUrl=E:/guyuanhui/NewGraduateProject/xiaoyiduo/resources/shop/386d85821eef4c87aa5a154fbb8ac341.jpg"/></a>\n'+
            '</div>\n'+
            '<div class="text">\n'+
            '<p class="title">'+item.goodName+'</p>\n'+
            '<p class="price">\n'+
            '<span class="nub">'+item.originPrice+'</span>\n'+
            '<span class="pri">'+item.secondPrice+'</span>\n'+
            '</p>\n'+
            '</div>\n'+
            '</div>\n';
        });

         $("#goodBody").html(text);
    }

    function toPage(){
        layui.config({
            base: '${ctx}/scripts/shop/' //你存放新模块的目录，注意，不是layui的模块目录
        }).use(['mm','laypage','jquery'],function(){
            var laypage = layui.laypage,$ = layui.$,
                mm = layui.mm;

            var sonGoodCount = $("#sonGoodCount").val();
            // alert(sonGoodCount);
            laypage.render({
                elem: 'demo0'
                ,limit: pageSize
                ,count: total //数据总数
                //自定义每页条数的选择项
                ,limits: [3, 6, 9, 12, 15]
                ,first: '首页'
                ,last: '尾页'
                ,prev: '<em><<</em>' //自定义上一页
                ,next: '<em>>></em>' //自定义下一页
                ,theme: "#FF5722" //自定义主题
                ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
                ,jump: function(data, first){
                    //data包含了当前分页的所有参数
                    //重置分页
                    currentPage = data.curr;
                    pageSize = data.limit;

                    //首次不执行
                    if(!first) {
                        getInfo(sonId, goodName);
                    }
                }
            });


            // 模版引擎导入
            //  var html = demo.innerHTML;
            //  var listCont = document.getElementById('list-cont');
            //  // console.log(layui.router("#/about.html"))
            // mm.request({
            //     url: '../json/commodity.json',
            //     success : function(res){
            //       console.log(res)
            //       listCont.innerHTML = mm.renderHtml(html,res)
            //     },
            //     error: function(res){
            //       console.log(res);
            //     }
            //   })



        });
    }

    function getSonGoodList(goodSonId){
        goodName = ""; //置空，此时按照分类查找商品
        // alert(goodSonId);
        sonId = goodSonId;
        getInfo(sonId, goodName); //获取数据
        toPage(); //进行分页
    }
</script>