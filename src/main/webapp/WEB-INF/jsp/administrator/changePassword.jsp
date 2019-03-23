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
            if ($("#new_pwd").val()==$("#con_new_pwd").val()){
                $.ajax({
                    type:"post",
                    url:"/administrator/doChangePassword",
                    data: {
                        old_pwd:$("#old_pwd").val(),
                        new_pwd:$("#new_pwd").val(),
                        con_new_pwd:$("#con_new_pwd").val()
                    },
                    success: function (result) {
                        /*  "100","原密码输入错误，请联系后台管理员更改"
                        "150","请重新登陆"
                        "200","修改成功请重新登录"*/
                        if(result==100)
                            alert("原密码输入错误，请联系后台管理员更改");
                        else if(result==150)
                            alert("请重新登录再修改");
                        else if(result==200)
                            alert("修改成功请重新登录");
                    },
                    error:function () {
                        alert("未响应请刷新页面重试！");
                    }
                })
            }
            else
                alert("两次设置的新密码不一致");

        })
    })

</script>


</body>
</html>
