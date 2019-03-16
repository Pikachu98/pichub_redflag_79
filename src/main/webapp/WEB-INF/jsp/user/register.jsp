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
</head>
<body>
<div>

</div>
<input type="button" id="btnSave">

<script>
    $(function () {
        $("#btnSave").on("click", function () {
            $.ajax({
                url:"/user/saveregister",

                data: {
                    userName:"1323",
                    password:"",
                    phone:""
                },
                success: function (result) {

                }
            })
        })
    })
</script>
</body>
</html>
