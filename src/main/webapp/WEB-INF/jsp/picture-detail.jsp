<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>图片详情</title>
    <link rel="stylesheet" href="/default/reset.css">
    <link rel="stylesheet" href="/default/view.css">
    <link rel="stylesheet" href="/default/base-layout.css">
    <link rel="stylesheet" href="/default/header.css">
    <link rel="stylesheet" href="/default/photo-list.css">

    <link rel="stylesheet" href="/default/detail.css">

    <link href="/default/register.css" rel="stylesheet">
    <script src="/default/js/jquery-3.3.1.js"></script>
    <script src="/default/js/jquery.validate.min.js"></script>
    <script src="/default/js/jquery.validate.extend.js"></script>
    <script src="/default/layui/layui.js"></script>

    <!-- 鼠标跟随特效 -->
    <script src="/js/stopExecutionOnTimeout.js"></script>
    <!-- <script src="theme/default/js/jquery-3.3.1.min.js"></script> -->

    <link rel="stylesheet" href="/css/load.css">

    <!-- <script src="theme/default/js/register.js"></script> -->



    <script type="text/javascript">
        function load() {
            var a= setTimeout("loading.style.transition='opacity 0.3s'",0)
            //设置透明度改变的过渡时间为0.3秒
            var b= setTimeout("loading.style.opacity=0",500)
            //0.5秒后加载动画开始变为透明
            var c= setTimeout("loading.style.display='none'",800)
            //当透明度为0的时候，隐藏掉它
        }
    </script>
    <script type="text/javascript">
        $(function() {
            $("#picture").click(function () {
                window.history.back();
            });
        });
    </script>


</head>

<body onload="load()" style="background:none;">
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

<div class="l">
    <img src="/show/${picId}">

</div>
<div class="r">
    <div style="padding-top:10px;margin-left: 93%;"><a href="javascript:void(0)" ><img src="/img/i-close.png" id="picture"></img></a></div>
    <div class="text first">Picture Description：${picture.picStory}</div>
    <div class="text">Tags：
        <c:forEach  items="${picTag}" var="tag" >
            <a href="javascript:void(0)" class="tag">${tag}</a>
        </c:forEach>
    </div>
    <div class="text">
        <c:if test="${heart==0}">
            <a><img class="heart" src="/img/i-2.png" alt="我是一颗black心"></a>
        </c:if>
        <c:if test="${heart==1}">
            <a><img class="heart" src="/img/i-2-1.png" alt="我是一颗red心"></a>
        </c:if>
        <%--<a href="javascript:void(0)"><img src="/img/heart.png"></img></a>--%>
        <a href="/downloadO/${picture.picId}" style="margin-left: 20px;"><img src="/img/i-download.png"></img></a>

    </div>
</div>


</section>
<!-- A样式通用 -->
<section class="layout layout-main">
    <!-- <div class="root"></div> -->

    <!-- <div class="l-header">
        <div class="l-title">当前最热门</div>
        <div class="l-title-en">HOT PICTURES</div>
    </div> -->

</section>
</main>
<div style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 0.5;">
    <canvas></canvas>
</div>
<!-- 鼠标跟随特效 -->
<script src="/js/stopExecutionOnTimeout.js"></script>
<script src="/js/canvas.js"></script>

</body>

</html>