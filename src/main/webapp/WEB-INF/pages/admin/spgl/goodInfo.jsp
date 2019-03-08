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
            <div class="layui-input-inline" style="max-height: 300px;">
                <select id="fatherId" name="fatherId" lay-verify="" lay-filter="fatherId">
                    <c:if test="${not empty father}">
                        <option value="${father.fatherId}">${father.fatherName}</option>
                    </c:if>
                    <c:if test="${empty father}">
                        <option value="">请选择商品父类</option>
                    </c:if>
                    <c:forEach items="${fatherList}" var="father">
                        <option value="${father.fatherId}">${father.fatherName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="layui-input-inline" style="max-height: 300px;">
                <select id="sonId" name="sonId" lay-verify="">
                    <c:if test="${not empty father}">
                        <option value="${son.sonId}" >${son.sonName}</option>
                        <c:forEach items="${goodSonList}" var="son">
                            <option value="${son.sonId}">${son.sonName}</option>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty father}">
                        <option value="">请选择商品子类</option>
                    </c:if>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>商品标题</label>
            <div class="layui-input-block">
                <input type="text" id="goodName" name="goodName" class="layui-input" placeholder="请输入商品标题（30字以内）" maxlength="30" autocomplete="off" value="${good.goodName}">
            <%--<textarea name="" required lay-verify="required" placeholder="请输入标题，30字以内" class="layui-textarea"></textarea>--%>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>商品简介</label>
            <div class="layui-input-block">
                <textarea id="information" name="information" required lay-verify="required" placeholder="描述一下宝贝的转手原因、入手渠道和使用感受（250字以内）" class="layui-textarea" maxlength="250">${good.information}</textarea>
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
            <div class="layui-upload custom_upload">
                <button type="button" class="layui-btn" id="test2">多图片上传</button>
                <button type="button" class="layui-btn" id="cleanImgs"> <i class="fa fa-trash-o fa-lg"></i>清空图片</button>
                <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                    预览图：
                    <div class="layui-upload-list" id="demo2">
                        <c:set value="${good.imgUrlResource}" var="resources"/>
                        <c:forEach items="${resources}" var="resource">
                            <img src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}" alt="" class="layui-upload-img"/>
                        </c:forEach>
                    </div>
                </blockquote>
                <!--上传图片的路径集合-->
                <input type="hidden" id="imgUrls" name="imgUrls">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>原价</label>
            <div class="layui-input-inline">
                <input type="text" id="originPrice" name="originPrice" class="layui-input" placeholder="请输入原价" autocomplete="off" value="${good.originPrice}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>二手价</label>
            <div class="layui-input-inline">
                <input type="text" id="secondPrice" name="secondPrice" class="layui-input" placeholder="请输入二手价" autocomplete="off" value="${good.secondPrice}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>新旧程度</label>
            <div class="layui-input-inline">
                <input type="text" id="degree" name="degree" class="layui-input" placeholder="请输入新旧程度" autocomplete="off" value="${good.degree}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>商品数量</label>
            <div class="layui-input-inline">
                <input type="text" id="goodNumber" name="goodNumber" class="layui-input" placeholder="请输入商品数量" autocomplete="off" value="${good.goodNumber}">
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
</html>
<script>
    var success = 0; //图片保存成功的个数
    var fail = 0;  //图片保存失败的个数
    var imgUrls = ""; //保存上传成功的图片路径
    var banGoodNames = ""; // 保存禁品名称
    var baiDuExceptionMsg = ""; // 识别异常

    $(function(){
        layui.use(['upload','form','layer'], function() {
            var $ = layui.jquery
                , upload = layui.upload
                , form = layui.form
                , layer = layui.layer;
            var index;

            //监听form下拉菜单栏
            form.on('select(fatherId)', function(data){
                // alert(data.value);
                //获取父类商品的子类商品项
                $.post("/good/getGoodSonType",
                    {
                        fatherId: data.value
                    },
                    function(data){
                        var goodSonTypeHtml = "";
                        for(var i = 0; i < data.length; i++) {
                            goodSonTypeHtml += '<option value="'+data[i].sonId+'">'+data[i].sonName+'</option>';
                        }
                        $("#sonId").html("").append('<option value="">请选择商品子类</option>'+goodSonTypeHtml);
                        form.render('select'); //必须写上这句
                });
            });

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
                // ,loading: true
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        // imgUrls = ""; // 重新上传，清除保存的url
                        // $("#imgUrls").val(imgUrls); // 清除input中的url
                        // cleanImgsPreview(); // 清空预览区域
                        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                    });
                    index = layer.load(0);
                }
                ,done: function(res){
                    //上传完毕
                    //每个图片上传结束的回调，成功的话，就把保存好的图片路径保存起来（已重命名），作为数据提交
                    console.log(res.status);
                    if(res.status == '0'){ // 0图片保存成功
                        success++;
                        imgUrls += res.src + ",";
                        $("#imgUrls").val(imgUrls);
                    } else {
                        if(res.isBaiDuException == '0'){
                            baiDuExceptionMsg = res.msg;
                        } else {
                            if(res.isBanGood == "0") { // 0是禁品
                                if(banGoodNames.search(res.msg) == -1){
                                    banGoodNames += res.msg + " ";
                                };
                            }
                        }
                        fail++;
                    }
                }
                ,allDone:function(obj){
                    layer.close(index);
                    // alert(baiDuExceptionMsg);

                    if(baiDuExceptionMsg != "") {
                        layer.alert(baiDuExceptionMsg);
                        baiDuExceptionMsg = "";
                    } else {
                        if(banGoodNames == "") {
                            layer.msg("总共要上传图片总数为：" + (fail + success) + "\n"
                                + "其中上传成功图片数为：" + success + "\n"
                                + "上传失败图片数为：" + fail
                            );
                        } else {
                            layer.alert("您上传的图片含有违禁品：" + banGoodNames + "，请清空图片！");
                        }
                    }

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
            banGoodNames = "";
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
</script>
