//右上角注册按钮
 $(document).ready(function () {
     $("#btn-regi").click(function () {
        $("#registerWindow").slideDown(300);
        $(".backGround").show();
     });
     $(".x").click(function () {
        $("#registerWindow").slideUp(300);
        $(".backGround").hide();
     })
    });

//右上角登录按钮
$(document).ready(function () {
    $("#btn-lo").click(function () {
        $("#loginWindow").slideDown(300);
        $(".backGround").show();

    });
    $(".x").click(function () {
        $("#loginWindow").slideUp(300);
        $(".backGround").hide();
    })
});

//登录弹窗内重置密码按钮
$(document).ready(function () {
    $("#btn-reset").click(function () {
        $("#resetWindow").slideDown(300);
        $("#loginWindow").slideUp(300);
        $(".backGround").show();

    });
    $(".x").click(function () {
        $("#resetWindow").slideUp(300);
        $(".backGround").hide();
    })
});


//登录弹窗内注册按钮
$(document).ready(function () {
    $("#btn-register").click(function () {
        $("#registerWindow").slideDown(300);
        $("#loginWindow").slideUp(300);
        $(".backGround").show();

    });
    $(".x").click(function () {
        $("#registerWindow").slideUp(300);
        $(".backGround").hide();
    })
});

//注冊弹窗内登录按钮
$(document).ready(function () {
    $("#btn-login").click(function () {
        $("#loginWindow").slideDown(300);
        $("#registerWindow").slideUp(300);
        $(".backGround").show();

    });
    $(".x").click(function () {
        $("#loginWindow").slideUp(300);
        $(".backGround").hide();
    })
});
