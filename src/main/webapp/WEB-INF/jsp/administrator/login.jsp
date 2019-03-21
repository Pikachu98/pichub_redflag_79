<%--
  Created by IntelliJ IDEA.
  User: msi
  Date: 2019/3/20
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录页</title>
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <form>
        <div>用户名：<input type="text" id="username"></div>
        <div>密&nbsp;&nbsp;&nbsp;码：<input type="password" id="password"></div>
        <div><input type="button" id="btnLogin" value="登录"></div>
    </form>

    <script>

        $(function () {
            $("#btnLogin").on("click", function () {
                $.ajax({
                    type:"post",
                    url:"/administrator/doLogin",
                    data: {
                        username:$("#username").val(),
                        password:$("#password").val()
                    },
                    success: function (result) {
                        if(result==true)
                            alert("登陆成功进入管理中心页");
                        else
                            alert("密码错误或用户名/密码不匹配");
                    },
                    error:function () {
                        alert("未响应请刷新页面重试！")
                    }
                })
            })
        })

    </script>
</body>
</html>
