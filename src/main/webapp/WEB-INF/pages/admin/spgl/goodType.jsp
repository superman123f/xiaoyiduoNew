<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2019/2/13
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon.ico"/>
    <title>商品类目</title>
    <link rel="stylesheet" href="${ctx}/styles/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/styles/admin/spgl/goodType.css">
</head>
<body bgcolor="white" style="margin:15px;">
<fieldset class="layui-elem-field">
    <legend>商品管理 - 商品类目</legend>
    <%--Tab选项卡--%>
    <div class="layui-tab layui-tab-card" lay-filter="docDemoTabBrief">
        <ul class="layui-tab-title">
            <li class="layui-this">商品父类</li>
            <li>商品子类</li>
        </ul>

        <div class="layui-tab-content">
            <%--商品父类content--%>
            <div class="layui-tab-item layui-show">
                <div class="layui-field-box">
                    <%--<form class="layui-form" action="">--%>
                    <%--<div class="layui-form-item" style="text-align:center;">--%>
                    <%--<div class="layui-inline">--%>
                    <%--<div class="layui-input-inline">--%>
                    <%--<input id="searchUser" autocomplete="off" class="layui-input" placeholder="学号" type="text" name="name" value="">--%>
                    <%--</div>--%>
                    <%--<div class="layui-input-inline">--%>
                    <%--<input id="nickname" autocomplete="off" class="layui-input" placeholder="昵称" type="text" name="nickname" value="">--%>
                    <%--</div>--%>
                    <%--<div class="layui-input-inline">--%>
                    <%--<input id="realName" autocomplete="off" class="layui-input" placeholder="真实姓名" type="text" name="realName" value="">--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="layui-inline" style="text-align:left;">--%>
                    <%--<div class="layui-input-inline">--%>
                    <%--<button id="reload" type="button" class="layui-btn" data-type="reload"><i class="layui-icon"></i>查询</button>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</form>--%>
                    <hr>
                    <div class="layui-btn-group">
                        <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="/type/editGoodFatherType" dw-title="新增商品父类" dw-width="880px" dw-height="500px">
                            <i class="layui-icon">&#xe654;</i>新增
                        </button>
                        <button id="deleteData" class="layui-btn layui-btn-xs layui-btn-danger" data-type="deleteData">
                            <i class="layui-icon">&#xe640;</i>批删
                        </button>
                        <%--<button class="layui-btn layui-btn-xs dw-refresh">--%>
                        <%--<i class="layui-icon">&#x1002;</i>刷新--%>
                        <%--</button>--%>
                        <%--<button id="exportExl" class="layui-btn layui-btn-xs" data-type="exportExl">导出Excel</button>--%>
                    </div>
                    <hr>

                    <table id="demo" lay-filter="test"></table>

                </div>



            </div>
            <%--商品子类内容--%>
            <div class="layui-tab-item">
                <div class="layui-tab-content">
                    <div class="layui-field-box">
                        <%--商品父类选项--%>
                        <form class="layui-form">
                            <div class="layui-form-item">
                                <label class="layui-form-label">商品种类</label>
                                <div class="layui-input-inline" style="max-height: 300px;">
                                    <select id="fatherId" name="fatherId" lay-verify="" lay-filter="fatherId">
                                        <option value="">请选择商品父类</option>
                                        <c:forEach items="${father}" var="father">
                                            <option value="${father.fatherId}">${father.fatherName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </form>
                        <%--<form class="layui-form" action="">--%>
                        <%--<div class="layui-form-item" style="text-align:center;">--%>
                        <%--<div class="layui-inline">--%>
                        <%--<div class="layui-input-inline">--%>
                        <%--<input id="searchUser" autocomplete="off" class="layui-input" placeholder="学号" type="text" name="name" value="">--%>
                        <%--</div>--%>
                        <%--<div class="layui-input-inline">--%>
                        <%--<input id="nickname" autocomplete="off" class="layui-input" placeholder="昵称" type="text" name="nickname" value="">--%>
                        <%--</div>--%>
                        <%--<div class="layui-input-inline">--%>
                        <%--<input id="realName" autocomplete="off" class="layui-input" placeholder="真实姓名" type="text" name="realName" value="">--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="layui-inline" style="text-align:left;">--%>
                        <%--<div class="layui-input-inline">--%>
                        <%--<button id="reload" type="button" class="layui-btn" data-type="reload"><i class="layui-icon"></i>查询</button>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</form>--%>
                        <hr>
                        <div class="layui-btn-group">
                            <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="/type/editGoodFatherType" dw-title="新增商品父类" dw-width="880px" dw-height="500px">
                                <i class="layui-icon">&#xe654;</i>新增
                            </button>
                            <button id="deleteData" class="layui-btn layui-btn-xs layui-btn-danger" data-type="deleteData">
                                <i class="layui-icon">&#xe640;</i>批删
                            </button>
                            <%--<button class="layui-btn layui-btn-xs dw-refresh">--%>
                            <%--<i class="layui-icon">&#x1002;</i>刷新--%>
                            <%--</button>--%>
                            <%--<button id="exportExl" class="layui-btn layui-btn-xs" data-type="exportExl">导出Excel</button>--%>
                        </div>
                        <hr>

                        <table id="demo1" lay-filter="test"></table>

                    </div>

                </div>
            </div>
        </div>
    </div>
</fieldset>
<%--@*工具栏  在Table中使用 toolbar声明一个 Id  放置在任意位置皆可*@--%>
<script type="text/html" id="barDemo">
    <%--<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="detail">查看</a>--%>
    <%--<button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="create1" dw-title="新增用户" dw-width="100%" dw-height="100%">--%>
    <%--<i class="layui-icon">&#xe654;</i>新增--%>
    <%--</button>--%>

    <%--<button class="layui-btn layui-btn-xs layui-btn-normal">--%>
    <%--<i class="layui-icon">&#xe642;</i>编辑--%>
    <%--</button>--%>
    <div class="layui-btn-group">
        <button class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit">
            <i class="layui-icon">&#xe642;</i>编辑
        </button>
        <button class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">
            <i class="layui-icon">&#xe640;</i>删除
        </button>
    </div>
</script>

</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/spgl/goodType.js"></script>
</html>
