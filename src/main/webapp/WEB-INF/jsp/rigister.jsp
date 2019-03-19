<%--
  Created by IntelliJ IDEA.
  User: msi
  Date: 2019/3/14
  Time: 23:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <script src="/js/jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
<h1>用户注册</h1>
<form id="registerForm">
    <label>昵称：</label>
    <input type="text" id="username" name="username" placeholder="请输入用户名" class="form-username" onchange="validateUsername()" /><br/>

    密码：<input type="password" id="password1" name="password1" placeholder="请输入密码" class="form-password" onchange="validatePsw()" /><br/>

    确认密码：<input type="password" id="password2" name="password2" placeholder="请确认密码" class="form-passwordAgain" onchange="validatePswAgain()" /><br/>

    性别：<input type="radio" id="male" name="gender" class="form-gender" />男
    <input type="radio" id="female" name="gender" class="form-gender" />女
    <input type="radio" id="secret" name="gender" class="form-gender" />保密
    <span style="color:red; display:none;" id="noGender">*必须选择一个性别</span><br />

    邮箱：<input type="text" id="email" name="email" placeholder="请输入邮箱" class="form-email" onchange="validateEmail()" /><br/>

    绑定手机：<input type="text" id="phone" name="phone" placeholder="请输入手机号" class="form-phone" onchange="validatePhone()" /><br/>

    <input type="button" id="btnCaptcha" class="form-email" value="假的发送验证码"/> <br/>

    <input type="button" id="btnReg" value="注册"> 
</form>


<script>

    $(document).ready(function(){
        $("#registerForm").validate({
            rules:{
                username:{
                    required:true,
                    minlength:2,
                    maxlength:16
                },
                password1:{
                    required:true,
                    minlength:2,
                    maxlength:16
                },
                password2:{
                    required:true,
                    minlength:2,
                    maxlength:16
                },
                gender:{
                    required:true,
                },
                email:{
                    required:true,
                    minlength:2,
                    maxlength:16
                },
                phone:{
                    required:true,
                    length:11
                }
            },
            message:{
                username:{
                    required:"用户名不能为空",
                    minlength:"用户名最小为2位",
                    maxlength:"用户名最大为16位",
                },
                password1:{
                    required:"必须填写密码",
                    minlength:"密码最小为2位",
                    maxlength:"密码最大为16位"
                },
                password2:{
                    required:"必须确认密码",
                    minlength:"用户名最小为2位",
                    maxlength:16
                },
                gender:{
                    required:true,
                },
                email:{
                    required:true,
                    minlength:2,
                    maxlength:16
                },
                phone:{
                    required:true,
                    length:11
                }
            }
        })

    })
    $(function () {
        //发送验证码到邮箱
        // $("#btnCaptcha").on("click", function () {
        //
        // }
        //提交注册信息
        $("#btnReg").on("click", function () {
            // 修改注册按钮，使它不能点击
            if ($("#btnReg").hasClass("Saving")) {
                return;
            }

            $("#btnReg").addClass("Saving");
            $("#btnReg").val("Saving");

            //检查确认密码是否和设定密码一样
            var pass1=$("#password1").val();
            var pass2=$("#password2").val();
            if (pass1!=pass2) {
                alert("确认密码不相同！");
                return;
            }

            //检查是否设定了性别
            if(!document.getElementById("male").checked && !document.getElementById("female").checked
                && !document.getElementById("secret").checked) {
                document.getElementById("noGender").style.display = "initial";
                return;
            }

            //检查确认密码是否和设定密码一样
            var pass1=$("#password1").val();
            var pass2=$("#password2").val();
            if (pass1!=pass2) {
                alert("确认密码不相同！");
                return;
            }

            $.ajax({
                type:"POST",
                dataType:"json",
                url:"/user/saveregister",
                data: {
                    userName:$('#username').val(),
                    password:$("#password1").val(),
                    email:$("#email").val()
                },
                success: function (result) {
                    if (result.code==200) {
                        // 成功
                        window.location.href="/home";
                    } else {
                        // 失败
                        alert(result.msg);
                    }
                }
            })
        })
    })
</script>
</body>
</html>
