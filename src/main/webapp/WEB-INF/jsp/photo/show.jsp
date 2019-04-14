<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/31
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Photo</title>
    <script src="/js/jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
<c:if test="${empty count}">
    <div>Get</div>
</c:if>
<c:if test="${not empty count}">
    <div>Insert ${count}</div>
</c:if>
<div>Photo Id:${p.picId}</div>
<div>Photo Name:${p.picName}</div>
<%--<div>User Id:${p.picId}</div>--%>
</body>
</html>