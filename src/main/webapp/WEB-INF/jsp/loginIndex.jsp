<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <title>这是index登陆后主页</title>
</head>
<img>
<body>
<h1>这是index登陆主页</h1>
<p>userName:${p}</p>
<br/>
<br/>


<c:forEach items="${picsList}" var="var">
    <img src="/show/${var}"  width="301px"/>
</c:forEach>


<ul class="view-list photo-list">
    <li class="list-item">
        <div class="view">
            <div class="view-intro">
                <!-- <div class="view-title"></div> -->
                <div class="view-other view-lr">
                    <div class="view-l">
                        <a><img src="static\111.jpg" alt="头像"></a>
                        <span class="user-name">Username</span>
                    </div>
                    <div class="view-r">
                        <a href="javascript:void(0)" class="btn-focus">关注</a>
                    </div>
                </div>
            </div>
            <div class="view-cover">
                <img src="static/cat-10.png" alt="photo-1">
            </div>
            <div class="description">
                <p>森林鹿</p>
            </div>
            <div>
                <img src="img/line.png" alt="我是一条分割线">
            </div>
            <div class="focus-msg">
                <a><img src="img/heart.png" alt="我是一颗心"></a>
                <span class="focus-num">218人喜欢</span>
            </div>
        </div>
    </li>
</ul>


</body>
</html>
