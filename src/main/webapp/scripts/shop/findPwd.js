layui.use('layer', function(){
    var layer = layui.layer;
})

$(function(){
    $("#phone_verification_btn").click(function(){
        $(".phone_verify").css("background-color", "#949494");
        $(".reset_password").css("background-color", "#009688");
        $(".phone_verification_part").hide();
        $(".reset_password_part").show();
    });

    $("#reset_password_btn").click(function(){
        var newPwd = $("#newPwd").val();
        var confrimPwd = $("#confrimPwd").val();
        var phone = $("#phone").val();
        // alert(phone);
        if(newPwd === '') {
            layer.alert("请输入新密码");
            return false;
        }
        if(confrimPwd === '') {
            layer.alert("请确认密码");
            return false;
        }
        if(newPwd != confrimPwd) {
            layer.alert("两次密码不一致");
            return false;
        }

        $.ajax({
            type: 'POST',
            dataType: 'json',
            data: {
                phone: phone,
                password: confrimPwd
            },
            url: '/user/resetPwd',
            success: function(data){

                if(data.success) {
                    layer.confirm('修改成功', { btn: '确定' },
                        function(index){
                        window.location.href="/shop/login";
                    })
                } else {
                    layer.alert("该手机号未注册！");
                }

            }
        });

    });

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
                    $("#find").addClass("layui-btn-disabled");
                    $('#find').attr('disabled',"true");
                    settime(obj);
                    layer.msg(data.msg);
                    // $("#msg").text(data.msg); //text方法，给元素赋值
                }else{
                    layer.msg(data.msg);
                    // $(".phone_verify").css("background-color", "#949494");
                    // $(".reset_password").css("background-color", "#009688");
                    // $(".phone_verification_part").hide();
                    // $(".reset_password_part").show();
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

            // alert(countdown);
            obj.value="重新发送(" + countdown + ")";
            countdown--;
        }
        setTimeout(function() {
                settime(obj) }
            ,1000)
    }
});