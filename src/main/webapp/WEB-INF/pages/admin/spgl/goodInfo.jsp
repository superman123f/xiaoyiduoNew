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
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon.ico"/>
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
<%--USER_ID	用户编号--%>
<div style="margin: 25px 26px 0px 8px;">
    <form class="layui-form" action="/user/register" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>商品种类</label>
            <div class="layui-input-inline">
                <select name="fatherId" lay-verify="">
                    <option value="">请选择商品父类</option>
                    <option value="1">书籍专栏</option>
                    <option value="2">体育运动</option>
                    <option value="3">电子数码</option>
                    <option value="4">美容护理</option>
                    <option value="5">男士服装</option>
                    <option value="6">女士服装</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select id="sonId" name="sonId" lay-verify="">
                    <option value="">请选择商品子类</option>
                    <option value="1">大学课本</option>
                    <option value="2">小说</option>
                    <option value="3">篮球</option>
                    <option value="4">网球拍</option>
                    <option value="5">手机</option>
                    <option value="6">电脑</option>
                    <option value="7">发胶</option>
                    <option value="8">洗面奶</option>
                    <option value="9">羽绒服</option>
                    <option value="10">牛仔裤</option>
                    <option value="11">外套</option>
                    <option value="12">棉裤</option>
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
                <input type="text" id="goodName" name="goodName" class="layui-input" placeholder="请输入商品标题（30字以内）" maxlength="30" autocomplete="off">
            <%--<textarea name="" required lay-verify="required" placeholder="请输入标题，30字以内" class="layui-textarea"></textarea>--%>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>商品简介</label>
            <div class="layui-input-block">
                <textarea id="information" name="information" required lay-verify="required" placeholder="描述一下宝贝的转手原因、入手渠道和使用感受（250字以内）" class="layui-textarea" maxlength="250"></textarea>
            </div>
        </div>

        <!--普通上传-->
        <%--<div class="layui-form-item">--%>
            <%--<label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>商品图片</label>--%>
            <%--<div class="layui-upload">--%>
                <%--<button type="button" class="layui-btn" id="test1">上传图片</button>--%>
                <%--<div class="layui-upload-list">--%>
                    <%--<img class="layui-upload-img" id="demo1">--%>
                    <%--<p id="demoText"></p>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>

        <!--多张图片上传-->
        <div class="layui-form-item">
            <div class="layui-upload">
                <button type="button" class="layui-btn" id="test2">多图片上传</button>
                <button type="button" class="layui-btn" id="cleanImgs"> <i class="fa fa-trash-o fa-lg"></i>清空图片预览</button>
                <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                    预览图：
                    <div class="layui-upload-list" id="demo2"></div>
                </blockquote>
                <!--上传图片的路径集合-->
                <input type="hidden" id="imgUrls" name="imgUrls">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>原价</label>
            <div class="layui-input-inline">
                <input type="text" id="originPrice" name="originPrice" class="layui-input" placeholder="请输入原价" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>二手价</label>
            <div class="layui-input-inline">
                <input type="text" id="secondPrice" name="secondPrice" class="layui-input" placeholder="请输入二手价" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>新旧程度</label>
            <div class="layui-input-inline">
                <input type="text" id="degree" name="degree" class="layui-input" placeholder="请输入新旧程度" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>商品数量</label>
            <div class="layui-input-inline">
                <input type="text" id="goodNumber" name="goodNumber" class="layui-input" placeholder="请输入商品数量" autocomplete="off">
            </div>
        </div>

        <%--按钮区--%>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input id="saveGoodBtn" type="button" class="layui-btn" value="发布商品">
                <%--<input type="reset" class="layui-btn" value="重置">--%>
            </div>
        </div>
    </form>
</div>
</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/scripts/admin/spgl/image.js"></script>

</html>
<script>
    var success = 0; //图片保存成功的个数
    var fail = 0;  //图片保存失败的个数
    var imgUrls = ""; //保存上传成功的图片路径
    $(function(){
        layui.use(['upload','form','layer'], function() {
            var $ = layui.jquery
                , upload = layui.upload
                , form = layui.form
                ,layer = layui.layer;

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
                //上传单个图片大小
                ,size: 10240
                //最多上传的数量
                ,number:10
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        // alert(file);
                        // alert(result);
                        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                    });
                }
                ,done: function(res){
                    //上传完毕
                    //每个图片上传结束的回调，成功的话，就把保存好的图片路径保存起来（已重命名），作为数据提交
                    console.log(res.status);
                    if(res.status == '0'){
                        success++;
                        imgUrls += res.src + ",";
                        $("#imgUrls").val(imgUrls);
                    } else {
                        fail++;
                    }
                }
                ,allDone:function(obj){
                    layer.msg("总共要上传图片总数为：" + (fail + success) + "\n"
                                    + "其中上传成功图片数为：" + success + "\n"
                                    + "上传失败图片数为：" + fail
                    );
                }
            });
        });

        //清空预览图片
        cleanImgsPreview();
        //保存商品
        goodSave();
    });

    /**
     * 清空预览的图片及其对应的成功失败数
     * 原因：如果已经存在预览的图片的话，再次点击上选择图片时，预览图片会不断累加
     * 表面上做上传成功的个数清0，实际后台已经上传成功保存了的，只是没有使用，以最终商品添加的提交的为准
     */
    function cleanImgsPreview(){
        $("#cleanImgs").click(function(){
            success = 0;
            fail = 0;
            $("#demo2").html("");
            $("#imgUrls").val("");
        });
    }

    function goodSave(){
        $("#saveGoodBtn").click(function(){
            var sonId = $("#sonId").val();
            var goodName = $("#goodName").val();
            var information = $("#information").val();
            var originPrice = $("#originPrice").val();
            var secondPrice = $("#secondPrice").val();
            var degree = $("#degree").val();
            var goodNumber = $("#goodNumber").val();
            var imgUrls = $("#imgUrls").val();

            $.post("/good/saveGoodInfo",
                {
                    sonId: sonId,
                    goodName: goodName,
                    information: information,
                    originPrice: originPrice,
                    secondPrice: secondPrice,
                    degree: degree,
                    goodNumber: goodNumber,
                    imgUrls: imgUrls
                },function(data){
                    if (data.success){
                        layer.alert("发布成功");
                    } else {
                        layer.alert("发布失败");
                    }
            });
        });
    }
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
    <%--USER_ID	用户编号--%>
</script>
