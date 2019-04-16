<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Horizon
  Date: 2019/4/13
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/bootstrap-paginator.js"></script>

<head>
    <meta charset="UTF-8">
    <title>myfans</title>
    <link rel="stylesheet" href="default/reset.css">
    <link rel="stylesheet" href="default/view.css">
    <link rel="stylesheet" href="default/base-layout.css">
    <link rel="stylesheet" href="default/header.css">
    <link rel="stylesheet" href="default/photo-list.css">

    <link rel="stylesheet" href="default/other-header.css">
    <link rel="stylesheet" href="default/other-album.css">

    <link rel="stylesheet" href="default/myalbum.css">
    <link rel="stylesheet" href="default/mylike.css">

    <link rel="stylesheet" href="default/userlist.css">

    <link rel="stylesheet" href="css/load.css">
    <link rel="stylesheet" href="css/bootstrap.css" >


    <script src="js/bootstrap3.0.3.min.js"></script>
    <script src="js/bootstrap-paginator.js"></script>


    <script type="text/javascript">
        function load() {
            var a = setTimeout("loading.style.transition='opacity 0.3s'", 0)
            //设置透明度改变的过渡时间为0.3秒
            var b = setTimeout("loading.style.opacity=0", 500)
            //0.5秒后加载动画开始变为透明
            var c = setTimeout("loading.style.display='none'", 800)
            //当透明度为0的时候，隐藏掉它
        }

    </script>
</head>

<body onload="load()">
<!-- 页面加载动画 -->
<div id="loading">
    <div id="loading-center">
        <div id="loading-center-absolute">
            <div class="object" id="object_four"></div>
            <div class="object" id="object_three"></div>
            <div class="object" id="object_two"></div>
            <div class="object" id="object_one"></div>
        </div>
    </div>
</div>
<header id="header" class="header">
    <section class="layout">
        <div class="l-content view-lr">
            <div class="header-l">
                <a href="pic-index.html"><img src="img/logo.png" class="logo"></a>
            </div>
            <div class="user-r">
                        <span class="search-box login-search">
                            <input type="text" class="input-search">
                            <!-- <i class="icon icon-search"></i> -->
                            <img src="img/icon_search.png" alt="search" class="icon-search">
                        </span>
                <img src="img/avator.png" alt="我的头像" class="user">
                <span class="user">Crush</span>
                <img src="img/icon-dropdown.png" class="user">
            </div>
        </div>
    </section>
</header>
<main id="main" class="main">
    <section class="detail">
        <div>
            <div class="detail-l">
                <div class="other-avator"><img src="showA/${sessionScope.get("user").userId}" alt="我是头像">
                </div>

                <div class="other-note">
                    <div><span class="other-note-title">${sessionScope.get("user").userName}</span>
                    </div>
                    <div class="other-note-decription">${sessionScope.get("user").userDescription}</div>
                    <div class="other-focus">
                        <div class="fans">
                            <div class="number">${FocusMe}</div>
                            <div class="ch">粉丝</div>
                        </div>
                        <div class="focus-person">
                            <div class="v-line"><img src="img/line-vertical.png"></div>
                            <div class="number">${MyFocus}</div>
                            <div class="ch">关注</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="myL">
        <div class="sidebar">
            <div class="sidebar-btn"><a href="myalbum.html"><img src="img/i-1.png"
                                                                 class="icon-my">我的相册</a></div>
            <div class="sidebar-btn"><a href="mylike.html"><img src="img/i-2.png"
                                                                class="icon-my">我喜欢的</a></div>
            <div class="sidebar-btn"><a href="myfans.html"><img src="img/i-3.png"
                                                              class="icon-my">我的粉丝</a></div>
            <div class="focus-now"><a href="myfocus.html"><img src="img/i-4-1.png"
                                                                 class="icon-my">我关注的</a></div>
            <div class="sidebar-btn"><a href="editPersonal.html"><img src="img/i-5.png"
                                                                      class="icon-my">修改个人资料</a></div>
        </div>

        <div class="my-root">
            <div class="container">

                <c:set var="totalUsers" value="${requestScope.totalUsers}"/>
                <c:set var="usersPerPage" value="${requestScope.usersPerPage}"/>
                <c:set var="totalPages" value="${requestScope.totalPages}"/>
                <c:set var="beginIndex" value="${requestScope.beginIndex}"/>
                <c:set var="endIndex" value="${requestScope.endIndex}"/>
                <c:set var="page" value="${requestScope.page}"/>
                <c:set var="currentPageUsers" value="${requestScope.users.subList(beginIndex,endIndex)}"/>
                <span>用户总数:${totalUsers}</span>
                <span>每页用户数:${usersPerPage}</span>
                <span>总页数:${totalPages}</span>
                <span>当前页:${page}</span>

                <%--<table class="table table-hover table-responsive table-striped table-bordered">--%>
                    <%--<thead>--%>
                    <%--<tr>--%>
                        <%--<td>用户编号</td>--%>
                        <%--<td>姓名</td>--%>
                        <%--<td>密码</td>--%>
                        <%--<td>创建日期</td>--%>
                    <%--</tr>--%>
                    <%--</thead>--%>
                    <%--<tbody>--%>
                    <%--<c:forEach var="user" items="${currentPageUsers}">--%>
                        <%--<tr>--%>
                            <%--<td>${user.userId}</td>--%>
                            <%--<td>${user.userName}</td>--%>
                            <%--<td>${user.userPassword}</td>--%>
                            <%--<td>${user.createTime}</td>--%>
                        <%--</tr>--%>
                    <%--</c:forEach>--%>
                    <%--</tbody>--%>
                <%--</table>--%>


                    <ul class="my-fan">
                        <c:forEach var="user" items="${currentPageUsers}">
                        <li class="user-item">
                            <div class="user-cover">
                                <img src="showA/${sessionScope.get("user").userId}" alt="photo-1">
                            </div>
                            <div class="userName">
                                ${user.userName}
                            </div>
                            <div class="h-line">
                                <img src="img/h-line.png">
                            </div>
                            <div class="grey">
                                    ${FocusMe}粉丝
                            </div>
                            <div class="btn-foc"><a href="javascript:void(0)">关注</a></div>
                        </li>
                        </c:forEach>
                    </ul>


                <hr>

                <div class="text-center">
                    <nav>
                        <ul class="pagination">
                            <li><a href="<c:url value="/list?page=1"/>">首页</a></li>
                            <li><a href="<c:url value="/list?page=${page-1>1?page-1:1}"/>">&laquo;</a></li>

                            <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                <c:set var="active" value="${loop.index==page?'active':''}"/>
                                <li class="${active}"><a
                                        href="<c:url value="/list?page=${loop.index}"/>">${loop.index}</a>
                                </li>
                            </c:forEach>
                            <li>
                                <a href="<c:url value="/list?page=${page+1<totalPages?page+1:totalPages}"/>">&raquo;</a>
                            </li>
                            <li><a href="<c:url value="/list?page=${totalPages}"/>">尾页</a></li>
                        </ul>
                    </nav>
                </div>

            </div>

        </div>
    </section>

</main>
<footer class="footer" id="footer">
    <section class="layout">
        <div class="l-content my-footer">
            Copyright ©红旗中学版权所有
        </div>
    </section>
</footer>

<div style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 0.5;">
    <canvas></canvas>
</div>
<!-- 鼠标跟随特效 -->
<script src="js/stopExecutionOnTimeout.js"></script>
<script src="js/canvas.js"></script>
</body>

</html>