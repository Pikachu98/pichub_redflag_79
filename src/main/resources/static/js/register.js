//验证码
var checkCode = "";

layui.use("form", function () {
    var form = layui.form;
    var $ = layui.$;

    $("#sendRegisterCheckCode").click(function () {
        var email = $("#registerEmail").val();
        if (email == null || email == "") {
            layer.msg("请输入邮箱！！！");
            return;
        }
        var index = layer.open({
            type: 3,
            content: "邮件发送中..."
        });

        $.ajax({
            url: "/getCheckCode?email=" + email,
            type: "get",
            data: {key: "checkCodeData"},
            success: function (text) {
                if (text != null && text != "") {
                    layer.close(index);
                    layer.msg("已发送");
                    // checkCode = text;
                    countDown();
                } else {
                    layer.alert("获取失败，请重新获取")
                }
            }
        });
    });

    var maxTime = 60;

    function countDown() {
        if (maxTime == 0) {
            checkCode = "";
            $("#sendRegisterCheckCode").removeClass("layui-btn-disabled");
            $("#sendRegisterCheckCode").removeAttr("disabled")
            $("#sendRegisterCheckCode").html("获取验证码");
            maxTime = 60;
        } else {
            $("#sendRegisterCheckCode").attr("disabled", "disabled");
            $("#sendRegisterCheckCode").addClass("layui-btn-disabled");
            form.render();
            $("#sendRegisterCheckCode").html(maxTime + "秒后重新获取");
            maxTime--;
            setTimeout(countDown, 1000);
        }
    }

});

$(function () {
    //为表单的必填文本框添加提示信息（选择form中的所有后代input元素）
    $("div :input.required").each(function () {
        //通过jquery api：$("HTML字符串") 创建jquery对象
        var $required = $("<strong class='high'>*</strong>");
        //添加到this对象的父级对象下
        $(this).parent().append($required);
    });

    //为表单元素添加失去焦点事件
    $("div :input").blur(function(){
        var $parent = $(this).parent();
        $parent.find(".msg").remove(); //删除以前的提醒元素（find()：查找匹配元素集中元素的所有匹配元素）
        //验证姓名
        if($(this).is("#userName")){
            var nameVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
            var regName = /[~#^$@%&!*()<>:;'"{}【】  ]/;
            if(nameVal == "" || nameVal.length < 6 || regName.test(nameVal)){
                var errorMsg = " 姓名非空，长度6位以上，不包含特殊字符！";
                //class='msg onError' 中间的空格是层叠样式的格式
                $parent.append("<span class='msg' style='color: red; position:relative; left:-55px; top:-7px'>" + errorMsg + "</span>");
            }
        }
        //验证邮箱
        if($(this).is("#registerEmail")){
            var emailVal = $.trim(this.value);
            var regEmail = /.+@.+\.[a-zA-Z]{2,4}$/;
            if(emailVal== "" || (emailVal != "" && !regEmail.test(emailVal))){
                var errorMsg = " 请输入正确的E-Mail住址！";
                $parent.append("<span class='msg' style='color: red; position:relative; left:-105px; top:-7px'>" + errorMsg + "</span>");
            }
        }
        //两次密码一致
        if($(this).is("#password2")){
            var p2 = $("#password2").value;
            var p1 = $('#password1').value;
            if(p1 == p2) {
                var errorMsg = " 两次密码不一致！";
                $parent.append("<span class='msg' style='color: red; position:relative; left:-135px; top:-7px'>" + errorMsg + "</span>");
            }
        }

/*
    $("#signupForm").validate({
        debug: true, //调试模式，即使验证成功也不会跳转到目标页面
        onkeyup: null,//当丢失焦点时才触发验证请求
        rules: {     //配置验证规则，key就是被验证的dom对象，value就是调用验证的方法(也是json格式)
            userName: {
                required: true,
                remote: {
                    url: '/user/checkUserNameExist',
                    type: 'post',
                    cache: false,
                    async: false
                }
            },
            email: {
                required: true,
                email: true,
                remote: {
                    url: '/user/checkEmailExist',
                    type: 'post',
                    cache: false,
                    async: false
                }
            },
            password1: {
                required: true,
            },
            password2: {
                required: true,
                equalTo: '#password1' //表示和id="spass"的值相同
            }
        },
        messages: {
            userName: {
                required: "请输入用户名",
                remote: "该用户名已存在！"
            },
            password1: {
                required: "请输入密码"
            },  
            password2: {
                required: "请再次输入密码",
                equalTo: "两次密码必须一致" //表示和id="spass"的值相同
            },
            email: {
                required: "请填写邮件",
                remote: "邮箱已绑定，不能重复绑定",
                email: "邮箱格式不正确"
            }
        }
*/
    });

    $("#send").on("click", function () {
        var inputCheckCode = $("#registerCheckCode").val();

        //trigger 事件执行完后，浏览器会为submit按钮获得焦点
        $("form .required:input").trigger("blur");
        var numError = $("form .onError").length;
        if (numError != 0) {
            return;
        }
        // // alert("注册成功！");
        if ($("#send").hasClass("Saving")) {
            return;
        }

        $("#send").addClass("Saving");
        $("#send").val("Saving");

        var userName = $("#userName").val();

        // if (inputCheckCode == checkCode){
        $.ajax({
            url: "/user/doRegister",
            type: "POST",
            dataType: "json",
            async: false,
            data: {
                "userName": userName,
                "userPassword": $("#password1").val(),
                "userEmail": $("#email").val(),
                // "userPhone": $("#phone").val(),
                "inputCheckCode": inputCheckCode
            },
            success: function (result) {
                alert(result.meg);
                window.location.href = "index";
            }
        });
    })
})