<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2019/1/8
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="${ctx}/images/shop/icon.ico"/>
    <title>校益多</title>
    <link rel="stylesheet" href="${ctx}/scripts/plugs/Jcrop/jquery.Jcrop.min.css">
    <script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/scripts/plugs/Jcrop/jquery.Jcrop.min.js"></script>
    <script type="text/javascript" src="${ctx}/scripts/plugs/Jcrop/imgCropUpload.js"></script>
</head>
<style type="text/css">
    body {
        font-size: 16px;
        font-family:"Microsoft YaHei",Arial, Helvetica, sans-serif
    }
    *,
    *:before,
    *:after {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        -ms-box-sizing: border-box;
        box-sizing: border-box;
    }

    .crop-picker-wrap {
        position: relative;
        width: 100px;
        height: 30px;
        overflow: hidden;
    }
    .crop-picker {
        width: 100%;
        height: 100%;
        line-height: 1;

        -webkit-appearance: none;
        margin: 0;
        border: none;
        border-radius: 5px;
        padding: 9px 0;
        background-color: #1ab2ff;

        color: #fff;
        cursor: pointer;
    }
    .crop-picker-file {
        position: absolute;
        top: 0;
        right: 0;
        height: 100%;
        opacity: 0;
        cursor: pointer;
        filter: alpha(opacity=0);
    }

    .crop-wrapper {
        display: inline-block;
        min-width: 750px;
        margin: 10px 0;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 0 5px 2px #ccc;
    }

    .crop-container {
        font-size: 0;
    }

    .crop-container img[src=""] {
        visibility: hidden;
    }

    .crop-area-wrapper,
    .crop-preview-wrapper {
        display: inline-block;
        vertical-align: top;
    }
    .crop-area-wrapper {
        width: 500px;
        height: 400px;
    }
    .crop-preview-wrapper {
        width: 200px;
        height: 200px;
        margin-left: 28px;
        overflow: hidden;
    }
    .crop-preview-container {
        position: relative;
        overflow: hidden;
    }
    .crop-operate {
        text-align: center;
        margin: 10px 0;
    }
    .crop-save,
    .crop-cancel {
        display: inline-block;
        vertical-align: middle;

        width: 150px;
        height: 50px;
        line-height: 50px;

        -webkit-appearance: none;
        margin: 0 5px;
        border: none;
        border-radius: 5px;
        background-color: #1ab2ff;

        color: #fff;
        cursor: pointer;
    }
    .crop-hidden {
        display: none;
    }
</style>
<body>
<div id="TCrop"></div>
<script type="text/javascript">
    $(function() {
        Crop.init({
            id: 'TCrop',
            /* 上传路径 */
            url: '/user/testCutUserHead',
            /* 允许上传的图片的后缀 */
            allowsuf: ['jpg', 'jpeg', 'png'],
            /* JCrop参数设置 */
            cropParam: {
                minSize: [200, 200],          // 选框最小尺寸
                maxSdize: [0, 0],        // 选框最大尺寸
                aspectRatio: 1/1,       // 宽高比
                allowSelect: false,          // 允许新选框
                allowMove: true,            // 允许选框移动
                allowResize: true,          // 允许选框缩放
                dragEdges: true,            // 允许拖动边框
                boxWidth:200,
                onChange: function(c) {},   // 选框改变时的事件，参数c={x, y, x1, y1, w, h}
                onSelect: function(c) {}    // 选框选定时的事件，参数c={x, y, x1, y1, w, h}
            },
            /* 是否进行裁剪，不裁剪则按原图上传，默认进行裁剪 */
            isCrop: true,
            /* 图片上传完成之后的回调，无论是否成功上传 */
            onComplete: function(data) {
                console.log('upload complete!');
                if(data.success){
                    alert(1);
                }
            }
        });
    });
</script>
</body>
</html>
