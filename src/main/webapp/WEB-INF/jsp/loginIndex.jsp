<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: msi
  Date: 2019/3/16
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <title>这是index登陆后主页</title>
</head>
<img>
<body>
<h1>这是index登陆主页</h1>
<p>userName:${p}</p>
<script>

$(window.onload=function() {
    $.ajax({
        type: "POST",
        url: "/picturelist",
        dataType: "json",
        date: {
            "1": "123",
        },
    success:function (picList) {
            alert("shoudaoxiangy");
        alert(picList.toString());


<c:forEach items ="${picList}" var="list" >
    <div>${items.picName}</div>
</c:forEach>

    },
    error:function () {
        alert("错误");
    }
    })
})
</script>
<%--<c:forEach items ="${picList}" var="list" >
    <div>${items.picName}</div>
</c:forEach>--%>
</body>
</html>
