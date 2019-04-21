<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: Horizon
  Date: 2019/4/20
  Time: 14:40
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
    <title>mylike</title>
    <link rel="stylesheet" href="/default/reset.css">
    <link rel="stylesheet" href="/default/view.css">
    <link rel="stylesheet" href="/default/base-layout.css">
    <link rel="stylesheet" href="/default/header.css">
    <link rel="stylesheet" href="/default/photo-list.css">

    <link rel="stylesheet" href="/default/other-header.css">
    <link rel="stylesheet" href="/default/other-album.css">

    <link rel="stylesheet" href="/default/myalbum.css">
    <link rel="stylesheet" href="/default/mylike.css">

    <link rel="stylesheet" href="/css/load.css">
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
                <a href="/"><img src="img/logo.png" class="logo"></a>
            </div>
            <div class="user-r">
                        <span class="search-box login-search">
                            <input type="text" class="input-search">
                            <!-- <i class="icon icon-search"></i> -->
                            <img src="/img/icon_search.png" alt="search" class="icon-search">
                        </span>
                <img src="showT/${sessionScope.get("user").userId}" alt="我的头像" class="user">
                <span class="user">${sessionScope.get("user").userName}</span>
                <img src="/img/icon-dropdown.png" class="user">
            </div>
        </div>
    </section>
</header>
<main id="main" class="main">
    <section class="detail">
        <div>
            <div class="detail-l">
                <div class="other-avator"><img src="/showA/${sessionScope.get("user").userId}" alt="我是头像">
                </div>

                <div class="other-note">
                    <div><span class="other-note-title">${sessionScope.get("user").userName}</span>
                    </div>
                    <div class="other-note-decription">${sessionScope.get("user").userDescription}&nbsp;</div>
                    <div class="other-focus">
                        <div class="fans">
                            <div class="number">${FocusMe}</div>
                            <div class="ch">粉丝</div>
                        </div>
                        <div class="focus-person">
                            <div class="v-line"><img src="/img/line-vertical.png"></div>
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
            <div class="sidebar-btn"><a href="/myAlbum"><img src="img/i-1.png"
                                                             class="icon-my">我的相册</a></div>
            <div class="focus-now"><a href="/listmyLike"><img src="img/i-2-1.png"
                                                                class="icon-my">我喜欢的</a></div>
            <div class="sidebar-btn"><a href="/listFans"><img src="img/i-3.png"
                                                            class="icon-my">我的粉丝</a></div>
            <div class="sidebar-btn"><a href="/list"><img src="img/i-4.png"
                                                          class="icon-my">我关注的</a></div>
            <div class="sidebar-btn"><a href="/editPersonal"><img src="img/i-5.png"
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
            <c:set var="currentPageUsers" value="${requestScope.photos.subList(beginIndex,endIndex)}"/>

            <ul class="my-album">
                <c:forEach var="photo" items="${currentPageUsers}" varStatus="cou">
                <li class="cover-item my-cover-item">
                    <div class="album-cover" style="width:216px;height:216px;overflow: hidden;">

                        <img src="show/${photo}" alt="photo" class="cover">
                    </div>
                </li>
                </c:forEach>
            </ul>

            <hr>

            <div class="text-center">
                <nav>
                    <ul class="pagination">
                        <li><a href="<c:url value="/listmyLike?page=1"/>">首页</a></li>
                        <li><a href="<c:url value="/listmyLike?page=${page-1>1?page-1:1}"/>">&laquo;</a></li>

                        <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                            <c:set var="active" value="${loop.index==page?'active':''}"/>
                            <li class="${active}"><a
                                    href="<c:url value="/listmyLike?page=${loop.index}"/>">${loop.index}</a>
                            </li>
                        </c:forEach>
                        <li>
                            <a href="<c:url value="/listmyLike?page=${page+1<totalPages?page+1:totalPages}"/>">&raquo;</a>
                        </li>
                        <li><a href="<c:url value="/listmyLike?page=${totalPages}"/>">尾页</a></li>
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
            Copyright ©红旗中学 &nbsp;&nbsp;ICP备案号：<a href="http://www.miibeian.gov.cn" target="_blank" >苏ICP备19014708号</a>
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
