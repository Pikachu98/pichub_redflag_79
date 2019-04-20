<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty user}">
    <header id="header" class="header">
        <section class="layout">
            <div class="l-content view-lr">
                <div class="header-l">
                    <a href="myalbum.jsp"><img src="/img/logo.png" class="logo"></a>
                </div>
                <div class="user-r">
                        <span class="search-box login-search">
                            <input type="text" class="input-search">
                            <!-- <i class="icon icon-search"></i> -->
                            <img src="/img/icon_search.png" alt="search" class="icon-search">
                        </span>
                    <a href="/myAlbum" target="_blank">
                        <img id="header-avatar" src="showT/${sessionScope.get("user").userId}" alt="我的头像" class="user">
                    </a>
                    <span class="user">${sessionScope.get("user").userName}</span>
                    <img src="/img/icon-dropdown.png" class="user">
                </div>
            </div>
        </section>
    </header>
</c:if>


<c:if test="${empty user}">
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
                    <a href="javascript:void(0)" class="btn" id="btn-regi">注册</a>
                </div>
            </div>
        </section>
    </header>
</c:if>