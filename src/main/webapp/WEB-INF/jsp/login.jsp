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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%--<%--%>
    <%--// 如果用户名已经存在，说明已经登录，跳转到主页--%>
    <%--String username = (String) request.getSession().getAttribute("username");--%>
    <%--if (username != null && username.length() > 0) {--%>
        <%--response.sendRedirect("index.jsp");--%>
        <%--return;--%>
    <%--}--%>
<%--%>--%>
<form action="login.do" method="post">
    username:<input type="text" name = "username" ><p>
    password:<input type="password" name = "password" ><p>
    <input type="submit" value="登录">
</form>
</body>
</html>