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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script src="/js/jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
<form>
<div>用户名：<input type="text" id="user_email"></div>
<div>密码：<input type="text" id="user_pwd"></div>
<div><input type="button" value="Log" id="login"></div></form>
<a href="index">back</a>
<script>
    $(function () {
        $("#login").on("click", function () {
            if ($("#login").hasClass("Logging")) {
                return;
            }

            $("#login").addClass("Logging");
            $("#login").val("logging");

            var userEmail = $("#user_email").val();
            if (userEmail.trim() == "") {
                alert("User name is empty!");
                return;
            }

            var userPassword = $("#user_pwd").val();
            if (userPassword.trim() == null) {
                alert("User password is empty!");
                return;
            }

            $.ajax({
                type: "GET",
                url: "/doLogin",
                //dataType: "json",
                data: {
                    "userEmail": userEmail,
                    "userPassword": userPassword
                },
                success:function (user) {
                    $("#login").removeClass("Logging");
                    $("#login").val("Log");



                    if (user ==100) {
                        //window.location.href = "/test";
                        alert("用户名错误");
                    } else if(user==150){
                        alert("密码错误");
                    }
                    else
                        alert("成功");

                },
                 error:function () {
                     $("#login").removeClass("Logging");
                     $("#login").val("Log");
                     alert("未响应");
                 }



            })
        })
    })
</script>
</body>
</html>