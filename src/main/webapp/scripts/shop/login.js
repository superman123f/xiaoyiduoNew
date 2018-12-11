//校验验证码
var show_num = [];
$(function(){

    draw(show_num);

    $("#canvas").on('click',function(){
        draw(show_num);
    })
    // $(".layui-btn").on('click',function(){
    //     var val = $("#authCode").val().toLowerCase();
    //     var num = show_num.join("");
    //     if(val==''){
    //         alert('请输入验证码！');
    //     }else if(val == num){
    //         alert('提交成功！');
    //         $("#authCode").val('');
    //         draw(show_num);
    //
    //     }else{
    //         alert('验证码错误！请重新输入！');
    //         $("#authCode").val('');
    //         draw(show_num);
    //     }
    // })
})

    //登录
    function login(){
        var phone_val = $('#phone').val(); //手机号
        var password_val = $('#password').val(); //密码
        var authCode_val = $('#authCode').val(); //验证码

        if(phone_val == '') {
            alert("请输入手机号或学号");
            $('#phone').focus();
            return false;
        }
        if(password_val == '') {
            alert("请输入密码");
            $('#password').focus();
            return false;
        }

        var val = $("#authCode").val().toLowerCase();
        var num = show_num.join("");
        if(val==''){
            alert('请输入验证码！');
            $("#authCode").focus();
            return false;
        }else if(val == num){
            alert('提交成功！');
            $("#authCode").val('');
            draw(show_num);
            return true;

        }else{
            alert('验证码错误！请重新输入！');
            $("#authCode").val('');
            $("#authCode").focus();
            draw(show_num);
            return false;
        }
    }


    layui.config({
        base: '../res/static/js/util' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['jquery','form'],function(){
        var $ = layui.$,form = layui.form;


        $("#find").click(function() {
            if(!/^1\d{10}$/.test($("#phone").val())){
                layer.msg("请输入正确的手机号");
                return false;
            }
            var obj=this;
            $.ajax({
                type:"get",
                url:"../json/login.json",
                dataType:"json",//返回的
                success:function(data) {

                    if(data.result){
                        $("#find").addClass(" layui-btn-disabled");
                        $('#find').attr('disabled',"true");
                        settime(obj);
                        $("#msg").text(data.msg);
                    }else{
                        layer.msg(data.msg);
                    }
                },
                error:function(msg) {
                    console.log(msg);
                }
            });
        })
        var countdown=60;
        function settime(obj) {
            if (countdown == 0) {
                obj.removeAttribute("disabled");
                obj.classList.remove("layui-btn-disabled")
                obj.value="获取验证码";
                countdown = 60;
                return;
            } else {

                obj.value="重新发送(" + countdown + ")";
                countdown--;
            }
            setTimeout(function() {
                    settime(obj) }
                ,1000)
        }
    })




    //生成随机验证码
    function draw(show_num) {
        var canvas_width=$('#canvas').width();
        var canvas_height=$('#canvas').height();
        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
        var aCode = sCode.split(",");
        var aLength = aCode.length;//获取到数组的长度

        for (var i = 0; i <= 3; i++) {
            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
            var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
            var txt = aCode[j];//得到随机的一个内容
            show_num[i] = txt.toLowerCase();
            var x = 10 + i * 20;//文字在canvas上的x坐标
            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
            context.font = "bold 23px 微软雅黑";

            context.translate(x, y);
            context.rotate(deg);

            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);

            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }

    function randomColor() {//得到随机的颜色值
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }