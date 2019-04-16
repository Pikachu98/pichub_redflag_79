<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: msi
  Date: 2019/4/15
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>热门广场</title>
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
    <img src="/img/pho-14.png">

</div>
<div class="r">
    <div class="text first">Picture Name</div>
    <div class="text">description:</div>
    <div class="text">Tag:
        <c:forEach  items="${picTag}" var="tag" >
            ${tag}
        </c:forEach>
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