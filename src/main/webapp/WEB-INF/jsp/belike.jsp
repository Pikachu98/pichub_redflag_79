<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 19-3-17
  Time: 下午3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>belike</title>
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<div>user id:<input type="text" id="userId"></div>
<div>picture id:<input type="text" id="pictureId"></div>
<input type="button" value="check" id="check">
<input type="button" value="do" id="reserse">
<script>
    $(function () {
        $("#reserse").on("click",function () {
            var uId = $("#userId").val();
            var pId = $("#pictureId").val();

            $.ajax({
                type: "GET",
                url: "/belike/reverseState",
                datatype: "json",
                data:{
                    "userId": uId,
                    "pictureId": pId
                },
                success:function (result) {
                    if(result == "{true}")
                    {
                        alert("reverse is success!");
                    }
                    else
                    {
                        alert("reverse is not success!");
                    }
                }
            })
        })

    })
</script>

</body>
</html>
