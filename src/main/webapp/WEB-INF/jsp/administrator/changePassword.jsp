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
<div><input type="button" id="btnSave" value="提交更改"></div>
</form>

<script>

    $(function () {
        $("#btnSave").on("click", function () {
            $.ajax({
                type:"post",
                url:"/doguanliyuangaimima",
                data: {
                    oldpwd:$("#old_pwd").val(),
                    newpwd:$("#new_pwd").val(),
                    connewpwd:$("#con_new_pwd").val()
                },
                success: function (result) {
                    alert(result)
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
