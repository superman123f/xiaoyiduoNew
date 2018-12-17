<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="layui-header">
    <div class="layui-logo">效益多后台管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item"><a href="admin">用户列表</a></li>
        <li class="layui-nav-item"><a href="member">会员列表</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item"><a href="/shop/commodity">首页</a></li>
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                贤心
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="/user/logout">退了</a></li>
    </ul>
</div>