<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2018/12/25
  Time: 23:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<html>
<head>
    <title>商品信息</title>
    <link rel="stylesheet" href="${ctx}/styles/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/styles/admin/spgl/goodInfo.css">
</head>
<body>
<%--GOOD_ID	商品编号--%>
<%--SON_ID	子类别编号--%>
<%--GOOD_NAME	商品名称--%>
<%--INFORMATION	商品简介--%>
<%--ORIGIN_PRICE	原价--%>
<%--SECOND_PRICE	二手价--%>
<%--DEGREE	新旧程度--%>
<%--COLLECT_NUMBER	收藏数--%>
<%--GOOD_NUMBER	商品数量--%>
<%--STATUS	商品状态（1售卖中，2已售出，3已下架）--%>
<%--SELLER_NAME	卖家姓名--%>
<div style="margin: 25px 26px 0px 8px;">
    <form class="layui-form" action="/user/register" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>商品种类</label>
            <div class="layui-input-inline">
                <select name="goodFather" lay-verify="">
                    <option value="">请选择商品父类</option>
                    <option value="010">书籍</option>
                    <option value="021">电子产品</option>
                    <option value="0571">化妆品</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="goodSon" lay-verify="">
                    <option value="">请选择商品子类</option>
                    <option value="010">大学课本</option>
                    <option value="021">小说</option>
                    <option value="0571">养生</option>
                </select>
            </div>
            <%--<div class="layui-input-block">--%>
                <%--<select name="city" lay-verify="">--%>
                    <%--<option value="">请选择一个城市</option>--%>
                    <%--<option value="010">北京</option>--%>
                    <%--<option value="021">上海</option>--%>
                    <%--<option value="0571">杭州</option>--%>
                <%--</select>--%>
            <%--</div>--%>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>商品标题</label>
            <div class="layui-input-block">
                <input type="text" id="goodName" name="goodName" class="layui-input" placeholder="请输入商品标题,30字以内" autocomplete="off">
            <%--<textarea name="" required lay-verify="required" placeholder="请输入标题，30字以内" class="layui-textarea"></textarea>--%>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>商品简介</label>
            <div class="layui-input-block">
                <textarea name="information" required lay-verify="required" placeholder="描述一下宝贝的转手原因、入手渠道和使用感受" class="layui-textarea"></textarea>
            </div>
        </div>

        <!--普通上传-->
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>商品图片</label>
            <div class="layui-upload">
                <button type="button" class="layui-btn" id="test1">上传图片</button>
                <div class="layui-upload-list">
                    <img class="layui-upload-img" id="demo1">
                    <p id="demoText"></p>
                </div>
            </div>
        </div>

        <!--多张图片上传-->
        <div class="layui-form-item">
            <div class="layui-upload">
                <button type="button" class="layui-btn" id="test2">多图片上传</button>
                <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                    预览图：
                    <div class="layui-upload-list" id="demo2"></div>
                </blockquote>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>原价</label>
            <div class="layui-input-block">
                <input type="text" id="originPrice" name="originPrice" class="layui-input" placeholder="请输入原价" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>二手价</label>
            <div class="layui-input-block">
                <input type="text" id="secondPrice" name="secondPrice" class="layui-input" placeholder="请输入二手价" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>新旧程度</label>
            <div class="layui-input-block">
                <input type="text" id="degree" name="degree" class="layui-input" placeholder="请输入新旧程度" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>商品数量</label>
            <div class="layui-input-block">
                <input type="text" id="goodNumber" name="goodNumber" class="layui-input" placeholder="请输入商品数量" autocomplete="off">
            </div>
        </div>

        <%--按钮区--%>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input id="registerBtn" type="button" class="layui-btn" value="发布商品">
                <%--<input type="reset" class="layui-btn" value="重置">--%>
            </div>
        </div>
    </form>
</div>
</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
</html>
<script>
    layui.use(['upload','form'], function() {
        var $ = layui.jquery
            , upload = layui.upload
            , form = layui.form;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: '/good/testUploadImage/'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    // alert(result);
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }else{
                    //上传成功
                    layer.msg('上传成功');
                }

            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });

        //多图片上传
        upload.render({
            elem: '#test2'
            ,url: '/good/testMultipleUpload/'
            ,multiple: true
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    alert(file);
                    alert(result);
                    $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                });
            }
            ,done: function(res){
                //上传完毕
            }
        });

    });
</script>
