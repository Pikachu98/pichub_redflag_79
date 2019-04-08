<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>index</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/view.css">
    <link rel="stylesheet" href="css/base-layout.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/photo-list.css">



    <link href="css/register.css" rel="stylesheet">
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/jquery.validate.extend.js"></script>
    <script src="layui/layui.js"></script>
    <!-- <script src="theme/default/js/jquery-3.3.1.min.js"></script> -->

    <script src="theme/default/js/register.js"></script>
</head>
<img>
<body>
<h1>这是index登陆主页</h1>
<p>userName:${p}</p>
<br/>
<br/>
<header id="header" class="header">
    <section class="layout">
        <div class="l-content view-lr">
            <div class="header-l">
                <img src="img/logo.png" class="logo">
            </div>
            <div class="header-r">
                        <span class="search-box">
                            <input type="text" class="input-search">
                            <!-- <i class="icon icon-search"></i> -->
                            <img src="img/icon_search.png" alt="search" class="icon-search">
                        </span>
                <a href="javascript:void(0)" class="btn-login" id="btn-lo">登录</a>

                <a href="javascript:void(0)" class="btn" id="btn">注册</a>
            </div>
        </div>
    </section>
</header>
<main id="main" class="main">
    <section class="layout layout-main">
        <!-- <div class="root"></div> -->

        <!-- <div class="l-header">
            <div class="l-title">当前最热门</div>
            <div class="l-title-en">HOT PICTURES</div>
        </div> -->
        <div class="root">
            <!-- A -->
            <ul class="view-list photo-list">
                <c:forEach items="${picsList}" var="var">
                    <!-- A样式通用 -->

                                <li class="list-item">
                                    <div class="view">
                                        <div class="view-intro">
                                            <!-- <div class="view-title"></div> -->
                                            <div class="view-other view-lr">
                                                <div class="view-l">
                                                    <a><img src="/pics/cat-10.png" alt="头像"></a>
                                                    <span class="user-name">Username</span>
                                                </div>
                                                <div class="view-r">
                                                    <a href="javascript:void(0)" class="btn-focus">关注</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="view-cover">
                                            <img src="/show/${var}"  width="301px"/>
                                        </div>
                                        <div class="description">
                                            <p>森林鹿</p>
                                        </div>
                                        <div>
                                            <img src="/pics/line.png" alt="我是一条分割线">
                                        </div>
                                        <div class="focus-msg">
                                            <a><img src="/pics/heart.png" alt="我是一颗心"></a>
                                            <span class="focus-num">218人喜欢</span>
                                        </div>
                                    </div>
                                </li>

                </c:forEach>
            </ul>
        </div>
    </section>
</main>

</body>
</html>
