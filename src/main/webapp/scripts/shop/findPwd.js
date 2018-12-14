$(function(){
    // $(".reset_password_part").css("display", "none"); //第一种方式隐藏
    // $(".reset_password_part").hide();
    $("#phone_verification_btn").click(function(){
        // alert(1);
        $(".phone_verification_part").hide();
        $(".reset_password_part").show();
    });

    $("#reset_password_btn").click(function(){
        $(".reset_password_part").hide();
        $(".phone_verification_part").show();
    });
});