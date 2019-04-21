<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/4/20
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>othersalbum</title>
    <link rel="stylesheet" href="/default/reset.css">
    <link rel="stylesheet" href="/default/view.css">
    <link rel="stylesheet" href="/default/base-layout.css">
    <link rel="stylesheet" href="/default/header.css">
    <link rel="stylesheet" href="/default/photo-list.css">

    <link rel="stylesheet" href="/default/other-header.css">
    <link rel="stylesheet" href="/default/other-album.css">

    <link rel="stylesheet" href="/css/load.css">

    <script type="text/javascript">
        function load() {
            var a = setTimeout("loading.style.transition='opacity 0.3s'", 0)

            var b = setTimeout("loading.style.opacity=0", 500)

            var c = setTimeout("loading.style.display='none'", 800)

        }

    </script>
</head>

<body onload="load()">

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
                <a href="pic-index.html"><img src="/img/logo.png" class="logo"></a>
            </div>
            <div class="user-r">
                        <span class="search-box login-search">
                            <input type="text" class="input-search">

                            <img src="/img/icon_search.png" alt="search" class="icon-search">
                        </span>
                <a href="myalbum.html"><img src="/showT/${user_id}" alt="我的头像" class="user"></a>
                <span class="user">Askiran</span>
                <img src="/img/icon-dropdown.png" class="user">
            </div>
        </div>
    </section>
</header>
<!--header用King的---->


<main id="main" class="main">

    <section class="detail">
        <div>
            <div class="detail-l">
                <div class="other-avator"><img src="/showA/${user_id}" alt="我是头像">
                </div>

                <div class="other-note">
                    <div><span class="other-note-title">${user.userName}</span>   <!---------------------------->
                        <a href="javascript:void(0)" class="btn-focus other-focus-btn">关注</a>
                    </div>

                    <div class="other-note-decription">${user.userDescription}</div>
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
    <section>
        <div class="other-root">
            <table>

                <c:forEach items="${albumPics}" var="var" varStatus="cou">

                    <c:if test="${cou.count ==1 && (cou.count-1) %6==0}">
                    <tr>
                    </c:if>
                            <td>
                                <img class="hot_pics" src="/show/${var}"  alt="photo-1" width="216px" height="216px">
                            </td>
                    <c:if test="${cou.count%6==0}">
                    <tr>
                    </c:if>
                </c:forEach>

            </table>
        </div>
    </section>

</main>
<footer class="footer" id="footer">
    <section class="layout">
        <div class="l-content">
            Copyright ©红旗中学版权所有
        </div>
    </section>
</footer>
<div style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 0.5;">
    <canvas></canvas>
</div>

<script src="/js/stopExecutionOnTimeout.js"></script>
<script src="/js/canvas.js"></script>
</body>

</html>