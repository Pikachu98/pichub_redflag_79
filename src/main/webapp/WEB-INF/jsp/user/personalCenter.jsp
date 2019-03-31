<%--
  Created by IntelliJ IDEA.
  User: msi
  Date: 2019/3/30
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息更改页</title>
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<form id="uploadForm" enctype="multipart/form-data">
<div><input id="f" type="file" onchange="chooseImg(this)" style="display:none">
<img id="img" src="${u}" width="150" height="150" onclick="f.click()"></div>
<div><input type="button" id="btnSub" value="提交更改"></div>
</form>
<a href="changePassword">更改绑定邮箱<br></a>
<div>更改昵称等等</div>

<script type="text/javascript">

    function chooseImg(file) {
        var file = file.files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function () {
            var img = document.getElementById('img');
            img.src = this.result;
            $(function () {
                $("#btnSub").on("click",(function () {
                    $.ajax({
                        url: '/upload',
                        type: 'POST',
                        cache: false,
                        data: new FormData($("#uploadForm")[0]),
                        processData: false,
                        contentType: false
                    }).done(function(res) {
                    }).fail(function(res) {});




                    $.ajax({
                        url:"doChangeAvatar",
                        type:"post",
                        data:{
                            avatar:file
                        },
                        success:function (result) {
                            alert("sucess")
                        },
                        error:function () {
                            alert("未响应请重试");
                        }
                    })
                }))
            })
        }
    }



</script>
</body>
</html>
