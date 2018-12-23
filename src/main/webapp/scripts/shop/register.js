// layui.use('form', function(){
//     var form = layui.form();
// });
$(function(){
    $("#registerBtn").click(function(){
        var studentNo = $("#studentNo").val();
        var nickname = $("#nickname").val();
        var password = $("#password").val();
        var phone = $("#phone").val();
        $.post("/user/register",
            {
                studentNo: studentNo,
                nickname: nickname,
                password: password,
                phone: phone
            },
            function(data){
                if(data.codeTimeOut){
                    layer.msg(data.codeMsg);
                } else {
                    if(data.success){
                        // layer.msg(data.userMsg);
                        window.location.href = "/shop/login";
                    } else {
                        layer.msg(data.userMsg);
                    }
                }

        });
    });
});

layui.config({
    base: '../../../scripts/shop' //你存放新模块的目录，注意，不是layui的模块目录
}).use(['jquery','form'],function(){
    var $ = layui.$,form = layui.form;

    $("#find").click(function() {
        if(!/^1\d{10}$/.test($("#phone").val())){
            layer.msg("请输入正确的手机号");

            // var obj=this;
            // $("#find").addClass(" layui-btn-disabled");
            // $('#find').attr('disabled',"true");
            // settime(obj);
            // $("#msg").text(data.msg);

            return false;
        }

        //获取手机验证码
        var obj=this;
        $.ajax({
            type:"post",
            url:"/user/getPhoneCode",
            dataType:"json",//返回的
            data:{
                phoneNumber: $("#phone").val()
            },
            success:function(data) {

                if(data.success){
                    $("#find").addClass(" layui-btn-disabled");
                    $('#find').attr('disabled',"true");
                    settime(obj);
                    layer.msg(data.msg);
                    // $("#msg").text(data.msg); //text方法，给元素赋值
                }else{
                    layer.msg(data.msg);
                }
            },
            error:function(msg) {
                console.log(msg);
            }
        });
    })

    var countdown=10;
    function settime(obj) {
        if (countdown == 0) {
            obj.removeAttribute("disabled");
            obj.classList.remove("layui-btn-disabled")
            obj.value="获取验证码";
            countdown = 10;
            return;
        } else {

            obj.value="重新发送(" + countdown + ")";
            countdown--;
        }
        setTimeout(function() {
                settime(obj) }
            ,1000)
    }
});