<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 19-3-24
  Time: 上午11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>upload</title>
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<form id="uploadForm" action="/uploadAvatar" enctype="multipart/form-data" method="post">
    <div><input type="file" name="avatar"></div>
    <div>user id :<input type="text" name="userId"></div>
    <!--<div>story :<input type="text" name="story"></div>-->
    <div><input type="submit" id="do"></div>
</form>
<form action="" method="post">
    <div><input type="button" class="layui-btn"></div>
</form>
<script>

</script>
</body>
</html>
