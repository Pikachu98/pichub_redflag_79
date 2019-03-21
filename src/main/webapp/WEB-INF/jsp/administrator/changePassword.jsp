<%--
  Created by IntelliJ IDEA.
  User: msi
  Date: 2019/3/19
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员修改密码</title>
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<form>
<div>旧密码：<input type="password" id="old_pwd"></div>
<div>新密码：<input type="password" id="new_pwd"></div>
<div>确认新密码：<input type="password" id="con_new_pwd"></div>
<div><input type="button" id="btnSub" value="提交更改"></div>
</form>

<script>

    $(function () {
        $("#btnSub").on("click", function () {
            $.ajax({
                type:"post",
                url:"/administrator/doChangePassword",
                data: {
                    old_pwd:$("#old_pwd").val(),
                    new_pwd:$("#new_pwd").val(),
                    con_new_pwd:$("#con_new_pwd").val()
                },
                success: function (result) {
                    /*  "100","用户名不存在"
                    "150","密码错误或用户名/密码不匹配"
                    "200","登陆成功"*/
                    if(result=100)
                        alert("用户名错误");
                    else if(result=150)
                        alert("密码错误或用户名/密码不匹配");
                    else if(result=200)
                        alert("登陆成功进入管理中心页");
                },
                error:function () {
                    alert("未响应请刷新页面重试！");
                }
            })
        })
    })

</script>


</body>
</html>
