<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    // 注销登录
    $(function(){
        $("#signout").click(function(){
            $.ajax({
                url: "/signout",
                type: "get",
                success: function () {
                    // alert("您已退出");
                    window.location.href = "/";
                },
                error:function () {
                    alert("出錯了！");
                }
            });
        })
    });


    //个人中心下拉列表
    $(document).ready(function () {
        $("#dropDown").click(function () {
            var node = $("#dropDownlist");
            if(node.is(':hidden')){　　//如果node是隐藏的则显示node元素，否则隐藏
                node.show();
            }else{
                node.hide();
            }
        });
    });

</script>

<c:if test="${not empty user}">
    <header id="header" class="header">
        <section class="layout">
            <div class="l-content view-lr">
                <div class="header-l">
                    <img src="/img/logo.png" class="logo">
                </div>
                <div class="user-r">
                        <span class="search-box login-search">
                            <input type="text" class="input-search">
                            <!-- <i class="icon icon-search"></i> -->
                            <img src="/img/icon_search.png" alt="search" class="icon-search">
                        </span>
                    <a href="/myAlbum" target="_blank">
                        <img style="border-radius: 50%" id="header-avatar" src="/showT/${sessionScope.get("user").userId}" alt="我的头像" class="user">
                    </a>
                    <span class="user">${sessionScope.get("user").userName}</span>
                    <%--下拉列表--%>
                    <img src="/img/icon-dropdown.png" class="user" id="dropDown">
                        <ul id="dropDownlist">
                            <a href="/myAlbum" target="_blank"><li class="dropDownLi">我的相册</li></a>
                            <a href="/list" target="_blank"><li class="dropDownLi">我关注的</li></a>
                            <a href="/listFans" target="_blank"><li class="dropDownLi">我的粉丝</li></a>
                            <a href="/listmyLike" target="_blank"><li class="dropDownLi">我喜欢的</li></a>
                            <a href="javascript:void(0)"><li id="signout" class="dropDownLi">退出账号</li></a>
                        </ul>
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