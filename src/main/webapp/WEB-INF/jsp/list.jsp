<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Horizon
  Date: 2019/4/13
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <c:set var="totalUsers" value="${requestScope.totalUsers}"/>
    <c:set var="usersPerPage" value="${requestScope.usersPerPage}"/>
    <c:set var="totalPages" value="${requestScope.totalPages}"/>
    <c:set var="beginIndex" value="${requestScope.beginIndex}"/>
    <c:set var="endIndex" value="${requestScope.endIndex}"/>
    <c:set var="page" value="${requestScope.page}"/>
    <c:set var="currentPageUsers" value="${requestScope.users.subList(beginIndex,endIndex)}"/>
    <p>用户总数:${totalUsers}</p>
    <p>每页用户数:${usersPerPage}</p>
    <p>总页数:${totalPages}</p>
    <p>当前数:${page}</p>

    <table class="table table-hover table-responsive table-striped table-bordered">
        <thead>
        <tr>
            <td>用户编号</td>
            <td>姓名</td>
            <td>密码</td>
            <td>生日</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${currentPageUsers}">
            <tr>
                <td>${user.userId}</td>
                <td>${user.userName}</td>
                <td>${user.userPassword}</td>
                <td>${user.createTime}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <hr>

    <div class="text-center">
        <nav>
            <ul class="pagination">
                <li><a href="<c:url value="/?page=1"/>"></a></li>
                <li><a href="<c:url value="/?page=${page-1>1?page-1:1}"/>">&laquo;</a></li>

                <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                    <c:set var="active" value="${loop.index==page?'active':''}"/>
                    <li class="${active}">
                        <a href="<c:url value="/?page=${loop.index}"/>">${loop.index}</a>
                    </li>
                </c:forEach>
                <li>
                    <a href="<c:url value="/?page=${page+1<totalPages?page+1:totalPages}"/>">&raquo;</a>

                </li>
                <li>
                    <a href="<c:url value="/?page=${totalPages}"/>">尾页</a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<%@include file="_footer.jsp" %>
</body>
</html>
