<%--
  Created by IntelliJ IDEA.
  User: msi
  Date: 2019/3/30
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更改绑定邮箱</title>
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<form>
<div>旧邮箱：<input type="email" id="old_Email"><input id="sendOldCheckCode" type="button" value="获取验证码"></div>
<div>输入旧邮箱验证码：<input type="text" id="old_checkCode"></div>
<div>新邮箱：<input type="email" id="new_Email"><input id="sendNewCheckCode" type="button" value="获取验证码"></div>
<div>输入新邮箱验证码：<input type="text" id="new_checkCode"></div>
<div><input type="button" id="btnSub" value="提交更改"></div>
</form>

<script>
    $(function () {
        $("#sendOldCheckCode").on("click",(function () {
            if ($("#old_Email").val()!=""){
                $.ajax({
                    url:"/doCheckEmail/"+$("#old_Email").val(),
                    type:"get",
                    success:function (result) {
                        if (result==10){
                            $.ajax({
                                url:"/getCheckCode?email="+$("#old_Email").val(),
                                type:"get",
                                data:{key:"oldEmailCheckCode"},
                                success:function (text) {
                                    if (text != null && text != ""){
                                        alert("已发送");
                                    } else{
                                        alert("邮箱格式错误请检查");
                                    }
                                }
                            })
                        } else{
                            alert("邮箱不存在或未注册");
                        }
                    }
                })
            }
            else
                alert("请输入邮箱");
        }))

        $("#sendNewCheckCode").on("click",(function () {
            if ($("#new_Email").val()!=""){
                $.ajax({
                    url:"/doCheckEmail/"+$("#old_Email").val(),
                    type:"get",
                    success:function (result) {
                        if (result==15){
                            $.ajax({
                                url:"/getCheckCode?email="+$("#new_Email").val(),
                                type:"get",
                                data:{key:"newEmailCheckCode"},
                                success:function (text) {
                                    if (text != null && text != ""){
                                        alert("已发送");
                                    } else{
                                        alert("邮箱格式错误请检查");
                                    }
                                }
                            })
                        }else{
                            alert("邮箱不存在或已被注册");
                        }
                    }
                })
            }
            else
                alert("请输入邮箱");
        }))

        $("#btnSub").on("click",(function () {
            $.ajax({
                url:"doChangeEmail",
                type:"post",
                data:{
                    oldEmail:$("#old_Email").val(),
                    oldCheckCode:$("#old_checkCode").val(),
                    newEmail:$("#new_Email").val(),
                    newCheckCode:$("#new_checkCode").val(),
                    },
                success:function (result) {
                    //result==100验证码错误
                    //result==150旧邮箱未被绑定
                    //result==200新邮箱已被绑定
                    //result==250修改绑定邮箱成功
                    if(result==100){
                        alert("验证码错误");
                    }
                    else if(result==150){
                        alert("旧邮箱未被绑定");
                    }
                    else if(result==200){
                        alert("新邮箱已被绑定");
                    }else if(result==250){
                        alert("修改绑定邮箱成功");
                    }
                    else
                        alert("未知错误请重试");
                },
                error:function () {
                    alert("未响应请重试");
                }
            })
        }))
    })

</script>
</body>
</html>
