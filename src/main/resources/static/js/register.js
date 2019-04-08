
        //验证码
        var checkCode = "";

        layui.use("form",function () {
            var form = layui.form;
            var $ = layui.$;

            $("#sendCheckCode").click(function () {
                var email = $("#email").val();
                if (email == null || email == ""){
                    layer.msg("请输入邮箱！！！");
                    return;
                }
                var index = layer.open({
                    type:3,
                    content:"邮件发送中..."
                });

                $.ajax({
                    url:"/getCheckCode?email="+email,
                    type:"get",
                    data:{key:"checkCodeData"},
                    success:function (text) {
                        if (text != null && text != ""){
                            layer.close(index);
                            layer.msg("已发送");
                            // checkCode = text;
                            countDown();
                        } else{
                            layer.alert("获取失败，请重新获取")
                        }
                    }
                });
            });

            var maxTime = 60;
            function countDown(){
                if (maxTime == 0){
                    checkCode = "";
                    $("#sendCheckCode").removeClass("layui-btn-disabled");
                    $("#sendCheckCode").removeAttr("disabled")
                    $("#sendCheckCode").html("获取验证码");
                    maxTime = 60;
                }else{
                    $("#sendCheckCode").attr("disabled","disabled");
                    $("#sendCheckCode").addClass("layui-btn-disabled");
                    form.render();
                    $("#sendCheckCode").html(maxTime+"秒后重新获取");
                    maxTime--;
                    setTimeout(countDown,1000);
                }
            }

        });

        $(function () {
            $("#signupForm").validate({
                debug:true, //调试模式，即使验证成功也不会跳转到目标页面
                onkeyup:null,//当丢失焦点时才触发验证请求
                rules:{     //配置验证规则，key就是被验证的dom对象，value就是调用验证的方法(也是json格式)
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
                        email:true,
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
                        equalTo:'#password1' //表示和id="spass"的值相同
                    }
                },
                messages:{
                    userName:{
                        required:"请输入用户名",
                        remote:"该用户名已存在！"
                    },
                    password1:{
                        required:"请输入密码"
                    },
                    password2:{
                        required:"请再次输入密码",
                        equalTo:"两次密码必须一致" //表示和id="spass"的值相同
                    },
                    email:{
                        required:"请填写邮件",
                        remote:"邮箱已绑定，不能重复绑定",
                        email:"邮箱格式不正确"
                    }
                }
            });

            $("#send").on("click", function () {
                var inputCheckCode = $("#checkCode").val();

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

                var userName=$("#userName").val();

                // if (inputCheckCode == checkCode){
                $.ajax({
                    url: "/user/doRegister",
                    type:"POST",
                    dataType:"json",
                    async:false,
                    data: {
                        "userName":userName,
                        "userPassword": $("#password1").val(),
                        "userEmail": $("#email").val(),
                        "userPhone": $("#phone").val(),
                        "inputCheckCode": inputCheckCode
                    },
                    success: function (result) {
                        alert(result.meg);
                        window.location.href = "index";
                    }
                });
            })
        })
        // })