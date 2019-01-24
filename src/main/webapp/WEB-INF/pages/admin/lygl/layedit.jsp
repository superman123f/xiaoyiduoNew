<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2019/1/24
  Time: 0:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/header.jsp" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/layui/css/layui.css">
</head>
<style>
    .send-msg-btn{
        float: right;
        margin-right: 10px;
        margin-top: -12px;
    }
</style>
<body>
<!--隐藏域-->
<input id="messageId" type="hidden" value="${messageId}"></input>

<textarea id="mylayedit" style="display: none;"></textarea>
<div class="site-demo-button" style="margin-top: 20px;">
    <button class="layui-btn site-demo-layedit send-msg-btn" data-type="content">发表留言</button>
</div>
</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/layui/layui.js"></script>
</html>
<script>
    $(function(){
        layui.use(['layedit', 'layer'], function(){
            var layedit = layui.layedit, layer = layui.layer;

            //layedit富文本编辑
            var layedit_index = layedit.build('mylayedit', {
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
                    var messageId = $("#messageId").val(); // 商品编号
                    var replyContent = layedit.getContent(layedit_index); // 留言内容

                    $.post("/reply/insertReplyMessage",
                        {
                            messageId: messageId,
                            replyContent: replyContent
                        },
                        function(data){
                            if(data.success){
                                layer.msg(data.msg);
                                // getMessages(curr, limit);
                                // messageCount = data.messageCount;
                            } else {
                                layer.msg(data.msg);
                            }
                        });
                }
            };

            // 监听所选按钮
            $('.site-demo-layedit').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });

            // ------------------- layedit 富文本编辑 end --------------------//
        });
    });

</script>