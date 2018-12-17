<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/5
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<html><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="${ctx}/styles/layui/css/layui.css">
    <link id="layuicss-layer" rel="stylesheet" href="http://www.17sucai.com/preview/4989/2018-05-25/admin/layui/css/modules/layer/default/layer.css?v=3.1.1" media="all"></head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@ include file="../admin_header.jsp"%> <!--引入admin头部jsp样式-->

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item"><a href="index">控制台</a></li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">系统设置<span class="layui-nav-more"></span></a>
                    <dl class="layui-nav-child">
                        <dd><a class="layui-this" href="sysConfig">系统变量</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">用户管理<span class="layui-nav-more"></span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="admin">用户列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">权限管理<span class="layui-nav-more"></span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="rule">规则列表</a></dd>
                        <dd><a href="role">角色列表</a></dd>
                        <dd><a href="adminRole">用户角色</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">会员管理<span class="layui-nav-more"></span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="member">会员列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">开发者工具<span class="layui-nav-more"></span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="control">一键生成</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">集成Demo<span class="layui-nav-more"></span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="upload">文件上传</a></dd>
                        <dd><a href="upload">Execel导出</a></dd>
                    </dl>
                </li>
                <span class="layui-nav-bar"></span></ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field">
                <legend>系统设置 - 系统变量</legend>
                <div class="layui-field-box">
                    <div class="layui-btn-group">
                        <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="create" dw-title="新增系统变量">
                            <i class="layui-icon"></i>新增
                        </button>
                        <button class="layui-btn layui-btn-xs dw-refresh">
                            <i class="layui-icon">ဂ</i>刷新
                        </button>
                    </div>
                    <hr>
                    <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">输入框</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" required="" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码框</label>
                            <div class="layui-input-inline">
                                <input type="password" name="password" required="" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">辅助文字</div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">选择框</label>
                            <div class="layui-input-block">
                                <select name="city" lay-verify="required">
                                    <option value=""></option>
                                    <option value="0">北京</option>
                                    <option value="1">上海</option>
                                    <option value="2">广州</option>
                                    <option value="3">深圳</option>
                                    <option value="4">杭州</option>
                                </select><div class="layui-unselect layui-form-select"><div class="layui-select-title"><input type="text" placeholder="请选择" value="" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i></div><dl class="layui-anim layui-anim-upbit"><dd lay-value="" class="layui-select-tips">请选择</dd><dd lay-value="0" class="">北京</dd><dd lay-value="1" class="">上海</dd><dd lay-value="2" class="">广州</dd><dd lay-value="3" class="">深圳</dd><dd lay-value="4" class="">杭州</dd></dl></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">复选框</label>
                            <div class="layui-input-block">
                                <input type="checkbox" name="like[write]" title="写作"><div class="layui-unselect layui-form-checkbox" lay-skin=""><span>写作</span><i class="layui-icon"></i></div>
                                <input type="checkbox" name="like[read]" title="阅读" checked=""><div class="layui-unselect layui-form-checkbox layui-form-checked" lay-skin=""><span>阅读</span><i class="layui-icon"></i></div>
                                <input type="checkbox" name="like[dai]" title="发呆"><div class="layui-unselect layui-form-checkbox" lay-skin=""><span>发呆</span><i class="layui-icon"></i></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">开关</label>
                            <div class="layui-input-block">
                                <input type="checkbox" name="switch" lay-skin="switch"><div class="layui-unselect layui-form-switch" lay-skin="_switch"><em></em><i></i></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">单选框</label>
                            <div class="layui-input-block">
                                <input type="radio" name="sex" value="男" title="男"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>男</div></div>
                                <input type="radio" name="sex" value="女" title="女" checked=""><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><div>女</div></div>
                            </div>
                        </div>
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">文本域</label>
                            <div class="layui-input-block">
                                <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit="" lay-filter="formDemo">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </fieldset>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script type="text/javascript" src="${ctx}/scripts/admin/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/sys_config.js"></script>

</body></html>