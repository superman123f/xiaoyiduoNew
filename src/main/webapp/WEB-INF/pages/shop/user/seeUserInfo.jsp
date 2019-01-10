<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校益多</title>
    <link rel="stylesheet" type="text/css" href="../../../../styles/shop/main.css">
    <link rel="stylesheet" type="text/css" href="../../../../styles/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/admin/scjgl/favoriteFolder.css">
    <%--Jcrop样式--%>
    <link rel="stylesheet" href="${ctx}/scripts/plugs/Jcrop/jquery.Jcrop.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>

<body>
<%@ include file="../../shop_header.jsp"%> <!--引入头部jsp样式-->
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

    <%--<div style="display: block">--%>
        <%--<form action="/user/testCutUserHead" method="POST" enctype="multipart/form-data" onsubmit="return checkCoords();">--%>
            <%--<input type="file" id="pictureFile" onchange="change(event)"--%>
                 <%--name="pictureFile" multiple> <img src="" id="element_id">--%>
            <%--<input type="hidden" id="x" name="x" />--%>
            <%--<input type="hidden" id="y" name="y" />--%>
            <%--<input type="hidden" id="w" name="w" />--%>
            <%--<input type="hidden" id="h" name="h" />--%>
            <%--<input type="submit" value="上传图片" class="btn btn-large btn-inverse" />--%>

        <%--</form>--%>
        <%--<div style="width:100px; height:100px; margin-left: 300px; border-radius: 50%;" id="preview-pane">--%>
            <%--<div style="width: 100px; height: 100px; overflow: hidden; border-radius: 50%;" class="preview-container">--%>
                <%--<img src="/images/1.jpg" class="jcrop-preview" alt="Preview" />--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--测试实现异步上传图片<br>--%>
    <%--<div style="display: block">--%>
        <%--&lt;%&ndash;<form action="/user/testCutUserHead" method="POST" enctype="multipart/form-data" onsubmit="return checkCoords();">&ndash;%&gt;--%>
            <%--<input type="file" id="pictureFile" onchange="change(event)"--%>
                   <%--name="pictureFile" multiple> <img src="" id="element_id">--%>
            <%--<input type="hidden" id="x" name="x" />--%>
            <%--<input type="hidden" id="y" name="y" />--%>
            <%--<input type="hidden" id="w" name="w" />--%>
            <%--<input type="hidden" id="h" name="h" />--%>
            <%--<input id="upload" type="submit" value="上传图片" class="btn btn-large btn-inverse" />--%>

        <%--&lt;%&ndash;</form>&ndash;%&gt;--%>
        <%--<div style="width:100px; height:100px; margin-left: 300px; border-radius: 50%;" id="preview-pane">--%>
            <%--<div style="width: 100px; height: 100px; overflow: hidden; border-radius: 50%;" class="preview-container">--%>
                <%--<img src="/images/1.jpg" class="jcrop-preview" alt="Preview" />--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>

    <!--用户头像-->
    <div>
    <c:set value="${user.resources}" var="userResources"/>
    <div class="userHead">
        <c:forEach items="${userResources}" var="resource">
            <img id="userImg" style="width: 118px;height: 118px; border-radius: 50%;" src="${pageContext.request.contextPath}/good/displayImage?imageUrl=${resource.url}">
        </c:forEach>
        <a id="cutImg1" class="cutImg1">修改头像</a>
    </div>

    <div style="margin:16px 19px 0px 0px;">
        <form class="layui-form" action="/user/updateUserInfo" method="post">
            <%--隐藏用户id--%>
            <input id="userId" type="hidden" name="userId" value="${user.userId}">

            <div class="layui-form-item">
                <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>学号</label>
                <div class="layui-input-block">
                    <input type="text" id="studentNo" name="studentNo" autocomplete="off" class="layui-input" value="${user.studentNo}" placeholder="请输入学号">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>昵称</label>
                <div class="layui-input-block">
                    <input type="text" id="nickname" name="nickname" autocomplete="off" name="studentNo" class="layui-input" value="${user.nickname}" placeholder="请输入昵称">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">真实姓名</label>
                <div class="layui-input-block">
                    <input type="text" id="realName" name="realName" autocomplete="off" class="layui-input" value="${user.realName}" placeholder="请输入真实姓名">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="text" id="sex" name="sex" autocomplete="off" class="layui-input" value="${user.sex}" placeholder="请输入性别">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">电子邮箱</label>
                <div class="layui-input-block">
                    <input type="text" id="email" name="email" autocomplete="off" class="layui-input" value="${user.email}" placeholder="请输入邮箱">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><font style="color:red;margin-right:7px;">*</font>手机号</label>
                <div class="layui-input-block">
                    <input type="text" id="phone" name="phone" autocomplete="off" class="layui-input" value="${user.phone}" placeholder="请输入手机号">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">宿舍地址</label>
                <div class="layui-input-block">
                    <input type="text" id="dormitoryAddress" name="dormitoryAddress" autocomplete="off" class="layui-input" value="${user.dormitoryAddress}" placeholder="请输入宿舍地址">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input id="saveBtn" type="button" class="layui-btn" value="保存">
                    <input type="reset" class="layui-btn" value="重置">
                </div>
            </div>
        </form>
    </div>
    </div>
</div>
<%@ include file="/WEB-INF/pages/shop_rooter.jsp" %> <!--引入尾部样式-->
</body>
<script type="text/javascript" src="../../../../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../../../../styles/layui/layui.js"></script>
<%--Jcrop插件--%>
<script type="text/javascript" src="${ctx}/scripts/plugs/Jcrop/jquery.Jcrop.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/plugs/Jcrop/imgCropUpload.js"></script>
</html>
<%--<script type="text/javascript">--%>
    <%--$(function() {--%>
        <%--Crop.init({--%>
            <%--id: 'TCrop',--%>
            <%--/* 上传路径 */--%>
            <%--url: '/user/testCutUserHead',--%>
            <%--/* 允许上传的图片的后缀 */--%>
            <%--allowsuf: ['jpg', 'jpeg', 'png'],--%>
            <%--/* JCrop参数设置 */--%>
            <%--cropParam: {--%>
                <%--minSize: [200, 200],          // 选框最小尺寸--%>
                <%--maxSdize: [0, 0],        // 选框最大尺寸--%>
                <%--aspectRatio: 1/1,       // 宽高比--%>
                <%--allowSelect: false,          // 允许新选框--%>
                <%--allowMove: true,            // 允许选框移动--%>
                <%--allowResize: true,          // 允许选框缩放--%>
                <%--dragEdges: true,            // 允许拖动边框--%>
                <%--boxWidth:200,--%>
                <%--onChange: function(c) {},   // 选框改变时的事件，参数c={x, y, x1, y1, w, h}--%>
                <%--onSelect: function(c) {}    // 选框选定时的事件，参数c={x, y, x1, y1, w, h}--%>
            <%--},--%>
            <%--/* 是否进行裁剪，不裁剪则按原图上传，默认进行裁剪 */--%>
            <%--isCrop: true,--%>
            <%--/* 图片上传完成之后的回调，无论是否成功上传 */--%>
            <%--onComplete: function() {--%>

            <%--}--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>
<script>
    function change(ev) {
        // layer.alert("fdsf");
        var element_id = document.getElementById("element_id");
        var event = window.event || ev;
        var files = "";
        element_id.src = "";
        var imgPreview = document.getElementById("imgPreview");
        imgPreview.src = "";
        // var r = new FileReader();
        // r.readAsDataURL(files);
        // r.onload = function (e) { element_id.src = e.target.result };
        if(files != "") {
            // URL.revokeObjectURL(files);
            element_id.src = URL.revokeObjectURL(files);;
            files = event.target.files[0];
            element_id.src = URL.createObjectURL(files);
            imgPreview.src = URL.createObjectURL(files);
        } else {
            files = event.target.files[0];
            element_id.src = URL.createObjectURL(files);
            imgPreview.src = URL.createObjectURL(files);
        }
        // element_id.src = URL.createObjectURL("");;
        // element_id.src = URL.createObjectURL(files);

        // Create variables (in this scope) to hold the API and image size
        var jcrop_api,
            boundx,
            boundy,

            // Grab some information about the preview pane
            $preview = $('#preview-pane'),
            $pcnt = $('#preview-pane .preview-container'),
            $pimg = $('#preview-pane .preview-container img'),

            xsize = $pcnt.width(),
            ysize = $pcnt.height();

        console.log('init',[xsize,ysize]);

        $('#element_id').Jcrop({
            boxWidth : 250,
            boxHeight : 250,
            allowsuf: ['jpg', 'jpeg', 'png'],
            onChange : updatePreview,
            onSelect : updateCoords, // 选框选定时的事件，参数c={x, y, x1, y1, w, h}
            setSelect : [ 0, 0, 200, 200],
            // allowResize : false,



            minSize: [200, 200],          // 选框最小尺寸
            // maxSdize: [0, 0],        // 选框最大尺寸
            aspectRatio: 1/1,       // 宽高比
            allowSelect: false,          // 允许新选框
            // allowMove: true,            // 允许选框移动
            allowResize: true,          // 允许选框缩放
            // dragEdges: true,            // 允许拖动边框

            // boxWidth:200,
        },function(){
            // Use the API to get the real image size
            var bounds = this.getBounds();
            boundx = bounds[0];
            // alert(bundx);
            boundy = bounds[1];
            // Store the API in the jcrop_api variable
            jcrop_api = this;

            // Move the preview into the jcrop container for css positioning
            $preview.appendTo(jcrop_api.ui.holder);
        });
        function updateCoords(c) {
            $('#x').val(c.x);
            $('#y').val(c.y);
            $('#w').val(c.w);
            $('#h').val(c.h);
            // updatePreview(c);
            // if (parseInt(c.w) > 0)
            // {
            //     var rx = xsize / c.w;
            //     var ry = ysize / c.h;
            //
            //     // alert(xsize)
            //     // alert(c.w);
            //     // alert(rx);
            //     // alert(boundx);
            //     $pimg.css({
            //         width: Math.round(rx * boundx) + 'px',
            //         height: Math.round(ry * boundy) + 'px',
            //         marginLeft: '-' + Math.round(rx * c.x) + 'px',
            //         marginTop: '-' + Math.round(ry * c.y) + 'px'
            //     });
        };

        function updatePreview(c)
        {
            if (parseInt(c.w) > 0)
            {
                var rx = xsize / c.w;
                var ry = ysize / c.h;

                // alert(xsize)
                // alert(c.w);
                // alert(rx);
                // alert(boundx);
                $pimg.css({
                    width: Math.round(rx * boundx) + 'px',
                    height: Math.round(ry * boundy) + 'px',
                    marginLeft: '-' + Math.round(rx * c.x) + 'px',
                    marginTop: '-' + Math.round(ry * c.y) + 'px'
                });
            }
        };

        $("#pictureFile").hide();

    }
    function checkCoords() {
        if (parseInt($('#w').val()))
            return true;
        alert('Please select a crop region then press submit.');
        return false;
    };
</script>

<%--实战用户头像裁剪--%>
<script>
    $(function(){
        layui.use(['layer'],function(){
            var layer = layui.layer;
            // layer.alert("1");
            // testLayer();
            // function change(ev) {
        });
    })

    $(function(){
        $("#cutImg1").click(function(){
            //页面层
            var editImg = layer.open({
                title: '头像编辑',
                type: 1,
                skin: 'layui-layer-rim', //加上边框
                area: ['685px', '350px'], //宽高
                content: ' <input type="file" id="pictureFile" onchange="change(event)"\n' +
                    '                   name="pictureFile" multiple> <img src="" id="element_id">\n' +
                    '            <input type="hidden" id="x" name="x" />\n' +
                    '            <input type="hidden" id="y" name="y" />\n' +
                    '            <input type="hidden" id="w" name="w" />\n' +
                    '            <input type="hidden" id="h" name="h" />\n' +
                    '            <div style="bottom: 4px; position: absolute; margin-left: calc(50% - 102px);">' +
                    '                <input id="upload" type="button" value="上传图片" class="btn btn-large btn-inverse layui-btn" />\n' +
                    '                <input id="cancelUpload" type="button" value="取消上传" class="layui-btn" />\n' +
                    '            </div>' +
                    '            <div style="width:100px; height:100px; margin-left: 380px; border-radius: 50%;" id="preview-pane">\n' +
                    '               <div style="width: 150px; height: 150px; overflow: hidden; border-radius: 50%;" class="preview-container">\n' +
                    '                  <img id="imgPreview" src="" class="jcrop-preview" />\n' +
                    '               </div>\n' +
                    '               <div style="float:right;z-index: 19999;">\n' +
                    '                  <span class="">头像预览</span>\n' +
                    '                </div>' +
                    '           </div>'
            });

            $("#upload").click(function () {
                // $("#imgWait").show();
                var x = $('#x').val();
                var y = $('#y').val();
                var w = $('#w').val();
                var h = $('#h').val();
                // alert(x);
                var formData = new FormData();
                formData.append("pictureFile", document.getElementById("pictureFile").files[0]);
                formData.append("x", x);
                formData.append("y", y);
                formData.append("w", w);
                formData.append("h", h);

                $.ajax({
                    url: "/user/testCutUserHead",
                    type: "POST",
                    data: formData,
                    /**
                     *必须false才会自动加上正确的Content-Type
                     */
                    contentType: false,
                    /**
                     * 必须false才会避开jQuery对 formdata 的默认处理
                     * XMLHttpRequest会对 formdata 进行正确的处理
                     */
                    processData: false,
                    success: function (data) {
                        // alert(1);
                        if (data.status) {
                            layer.msg("上传成功！");
                            var elementId = document.getElementById("userImg");
                            var elementId_1 = document.getElementById("userHeadImg");

                            elementId.src = '${pageContext.request.contextPath}/good/displayImage?imageUrl='+data.userImgUrl;
                            elementId_1.src = '${pageContext.request.contextPath}/good/displayImage?imageUrl='+data.userImgUrl;
                            layer.close(editImg);
                        } else {
                            alert(data.msg);
                        }
                        // $("#imgWait").hide();
                    },
                    error: function () {
                        alert("上传失败！");
                        // $("#imgWait").hide();
                    }
                });
            });
            $("#cancelUpload").click(function(){
                layer.close(editImg);
            });
        });
    });

    // $(function(){
    //     $("#upload").click(function () {
    //         // $("#imgWait").show();
    //         var x = $('#x').val();
    //         var y = $('#y').val();
    //         var w = $('#w').val();
    //         var h = $('#h').val();
    //         // alert(x);
    //         var formData = new FormData();
    //         formData.append("pictureFile", document.getElementById("pictureFile").files[0]);
    //         formData.append("x", x);
    //         formData.append("y", y);
    //         formData.append("w", w);
    //         formData.append("h", h);
    //
    //         $.ajax({
    //             url: "/user/testCutUserHead",
    //             type: "POST",
    //             data: formData,
    //             /**
    //              *必须false才会自动加上正确的Content-Type
    //              */
    //             contentType: false,
    //             /**
    //              * 必须false才会避开jQuery对 formdata 的默认处理
    //              * XMLHttpRequest会对 formdata 进行正确的处理
    //              */
    //             processData: false,
    //             success: function (data) {
    //                 // alert(1);
    //                 if (data.status) {
    //                     alert("上传成功！");
    //                 } else {
    //                     alert(data.msg);
    //                 }
    //                 // $("#imgWait").hide();
    //             },
    //             error: function () {
    //                 alert("上传失败！");
    //                 // $("#imgWait").hide();
    //             }
    //         });
    //     });
    // });

</script>