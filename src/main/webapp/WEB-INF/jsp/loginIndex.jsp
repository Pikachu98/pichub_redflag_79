<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>index</title>
    <link rel="stylesheet" href="/default/reset.css">
    <link rel="stylesheet" href="/default/view.css">
    <link rel="stylesheet" href="/default/base-layout.css">
    <link rel="stylesheet" href="/default/header.css">
    <link rel="stylesheet" href="/default/photo-list.css">
    <link rel="stylesheet" href="/default/register.css">
    <script src="/js/jquery-3.3.1.js"></script>
    <script src="/js/jquery.validate.min.js"></script>
    <script src="/js/jquery.validate.extend.js"></script>
    <script src="/layui/layui.js"></script>
    <script src="/js/register.js"></script>
    <!--瀑布流-->
    <script src="/js/jquery.masonry.min.js"></script>
    <script src="/js/register.js"></script>
    <script src="/js/windowsUpDown.js"></script>
    <script src="/js/changePsw.js"></script>
    <script src="/js/login.js"></script>

   <script>
        $(document).ready(function(){
            var $container = $('#masonry');
            $container.imagesLoaded(function(){
                $container.masonry({
                    itemSelector: '.view',
                    columnWidth: 13//每两列之间的间隙为8像素
                });
            });
        });
    </script>

    <script>
        $(function () {
            $(".btn-focus").on("click",function () {
                var focusId = $(this).parents(".view-other").find("#user-id").attr("user_id");
                var loginUser = $(this).parents(".view-other").find(".view-r").attr("butn_id");
                if(loginUser != ""){
                    if($(this).val() == "已关注")
                    {
                        $(this).val("关注");
                    }
                    else
                    {
                        $(this).val("已关注");
                        // alert($(this).val());
                    }
                }

                else{
                    alert("请先登录");
                }


                $.ajax({
                    type: "Get",
                    url: "/user/doInsertFocus",
                    dataType: "json",
                    data:{
                        "userId1": focusId
                    },
                    success:function (result) {

                    }
                })
            })
        })
    </script>
    <script>
        $(function () {
            $(".heart").on("click",function () {
                var likeId = $(this).parents(".view").find(".view-cover").find(".hot_pics").attr("pic_id");
                var count = $(this).parents(".focus-msg").find(".focus-num").attr("count");
                if($(this).attr("src") == "img/i-2.png")
                {
                    $(this).attr("src","img/i-2-1.png");
                    $(this).parents(".focus-msg").find(".focus-num").attr("count",++count);
                    $(this).parents(".focus-msg").find(".focus-num").text(count + "人喜欢");

                }
                else 
                {
                    $(this).attr("src","img/i-2.png");
                    $(this).parents(".focus-msg").find(".focus-num").attr("count",--count);
                    $(this).parents(".focus-msg").find(".focus-num").text(count + "人喜欢");
                }
                
                $.ajax({
                    type: "Get",
                    url: "/belike/reverseState",
                    dataType: "json",
                    data: {
                        "pictureId": likeId
                    },
                    success:function (result) {
                        
                    }
                })
                
            })
        })
    </script>
</head>

<body>

<%@include file="header.jsp"%>

<main id="main" class="main">
    <section class="layout layout-banner">
        <!--注册悬浮窗-->
        <div id="registerWindow">
            <label class="x" style="margin-top:2px;margin-left: 93%;font-size: 25px;">-</label>
            <div id="signupForm">
                <div class="btn-change">
                    <a href="javascript:void(0)" class="log-he btn-noues" id="btn-login">登录</a>
                    <a href="javascript:void(0)" class="btn-use">注册</a>
                </div>
                <div class="item item-name">
                    <input type="text" id="userName" name="userName" class="layui-input item-text" placeholder="昵称"/>
                </div>
                <div class="item">
                    <input type="password" id="password1" name="password1" class="layui-input item-text" placeholder="密码"/>
                </div>
                <div class="item">
                    <input type="password" id="password2" name="password2" class="layui-input item-text" placeholder="确认密码" />
                </div>
                <div class="item">
                    <input type="email" id="registerEmail" name="email" class="layui-input item-text" lay-verify="required" placeholder="邮箱"/>
                </div>
                <div class="item">
                    <input type="text" id="registerCheckCode" name="checkCode" class="layui-input item-text item-check" lay-verify="required" placeholder="验证码"/>
                    <button id="sendRegisterCheckCode" type="button" class="check-btn layui-btn layui-btn-normal">获取验证码</button>
                </div>
                <div class="law-check">
                    <input type="checkbox" class="radio-btn">
                    <span class="law">我已阅读并接受《红旗中学》条款</span>
                </div>
                <div class="layui-input-block">
                    <button lay-submit lay-filter="register" id="send" class="btn-sub">注册</button>
                </div>
                <div class="o-way">
                    <img src="img/other-way.png">
                </div>
                <div class="QQ">
                    <a href="javascript:void(0)"><img src="img/QQ.png"></a>
                </div>
            </div>
        </div>
        <div class="backGround"></div>
        <!--注册窗口-->
        <!--登陆悬浮窗-->
        <div id="loginWindow">
            <label class="x" style="margin-top:2px;margin-left: 93%;font-size: 25px;">-</label>
            <div id="signinForm">
                <div class="btn-change">
                    <a href="javascript:void(0)" class="log-he btn-use">登录</a>
                    <a href="javascript:void(0)" id="btn-register" class="btn-nouse">注册</a>
                </div>
                <div class="item item-name">
                    <input type="text" id="user_email" name="email" class="item-text" lay-verify="required" placeholder="请输入邮箱或用户名"/>
                </div>
                <div class="item">
                    <input type="password" id="user_pwd"  name="password1" class="item-text" placeholder="密码"/>
                </div>

                <div class="law-check">
                    <input type="checkbox" class="radio-btn">
                    <span class="law">自动登录</span>
                    <a href="javascript:void(0)" class="reset-pass" id="btn-reset">重置密码</a>
                </div>

                <div >
                    <button lay-submit lay-filter="register" id="login" class="btn-sub">登录</button>
                </div>
                <div class="o-way">
                    <img src="img/other-waylo.png">
                </div>
                <div class="QQ">
                    <a href="javascript:void(0)"><img src="img/QQ.png"></a>
                </div>
            </div>
        </div>
        <div class="backGround"></div>
        <!--登陆窗口-->

        <!--重置悬浮窗-->
        <div id="resetWindow">
            <label class="x" style="margin-top:2px;margin-left: 93%;font-size: 25px;">-</label>
            <div id="resetForm">
                <div class="btn-change">
                    <a href="javascript:void(0)" id="resetTitle" class="log-he btn-use">重置密码</a>
                </div>
                <div class="item item-name">
                    <input type="text" name="username" id="email" class="item-text" placeholder="已绑定邮箱"/>
                </div>
                <div class="item">
                    <input type="text" id="checkCode" name="checkCode" class="item-text item-check" lay-verify="required" placeholder="验证码"/>
                    <button id="sendCheckCode" type="button" class="check-btn">获取验证码</button>
                </div>
                <div class="item">
                    <input type="password" id="new_pwd" class="item-text" placeholder="旧密码"/>
                </div>
                <div class="item">
                    <input type="password" id="con_new_pwd" class="item-text" placeholder="新密码" />
                </div>


                <div >
                    <button lay-submit lay-filter="register" id="btnSub" class="btn-sub">重置</button>
                </div>

            </div>
        </div>
        <div class="backGround"></div>
        <!--重置窗口-->
        <div class="l-content">
            <div>
                <img src="img/itro_logo.png" alt="BigLogo">
            </div>
            <div class="index-btn">
                <a href="javascript:void(0)">
                    <img src="img/banner-button.png" alt="加入我们">
                </a>
            </div>

        </div>
    </section>
    <!-- A样式通用 -->
    <section class="layout layout-main">
        <div id="masonry" class="photo-list"> <!--主页下方所有图片窗体元素-->
        <c:forEach items="${picsList}" var="var" varStatus="cou"><!--一个循环元素一个包装-->

            <div class="view">   <!--这里设置了边框格式-->

                <div class="view-other view-lr"><!--把头像和关注放在一起，见photo-list(line-height:60px)-->
                    <div class="view-l"><!--头像 photo-list和description一起-->
                        <a><img src="/showT/${users[cou.count-1].userId}" alt="头像"></a>
                        <span class="user-name">${users[cou.count-1].userName}</span>
                        <span id="user-id" user_id="${users[cou.count-1].userId}" style="opacity: 0">${users[cou.count-1].userId}</span>
                    </div>
                    <div class="view-r" butn_id="${sessionScope.get("user").userName}"><!--关注，见photo-list-->
                        <c:if test="${focusList[cou.count-1] == 0}">
                            <input type="button" class="btn-focus" value="关注">
                        </c:if>
                        <c:if test="${focusList[cou.count-1] == 1}">
                            <input type="button" class="btn-focus" value="已关注">
                        </c:if>
                    </div><!--关注-->
                </div><!--头像+关注-->

                <%--<div class="view-cover"><!--图片的显示，见phot-list:设置了个边框颜色？？？-->--%>

                    <%--<img class="hot_pics" src="show/${var.picId}" pic_id="${var.picId}" alt="photo-1" width="301px">--%>


                    <div class="view-cover"><!--图片的显示，见photo-list:设置了个边框颜色？？？-->
                        <a href="/picture-detail/${var.picId}">
                        <img class="hot_pics" src="show/${var.picId}" pic_id="${var.picId}" alt="photo-1" width="301px">
                        </a>
                    </div>


                <div class="description"><!--故事，见photo-list-->
                    <p>${var.picStory}</p>
                </div>
                <div><!--分割线-->
                    <img src="img/line.png" alt="我是一条分割线">
                </div>
                <div class="focus-msg"><!--喜欢，见photo-list-->
                    <c:if test="${belikeList[cou.count-1] == 0}">
                        <a><img class="heart" src="img/i-2.png" alt="我是一颗black心"></a>
                    </c:if>
                    <c:if test="${belikeList[cou.count-1] == 1}">
                        <a><img class="heart" src="img/i-2-1.png" alt="我是一颗red心"></a>
                    </c:if>
                    <span class="focus-num" count="${likeCount[cou.count-1]}">${likeCount[cou.count-1]}人喜欢</span>
                </div>
            </div><!--这里是一整套的包装-->

        </c:forEach>
        </div>
    </section>
</main>
<%--<footer class="footer" id="footer">--%>
    <%--<section class="layout">--%>
        <%--<div class="l-content">--%>
            <%--Copyright ©红旗中学版权所有--%>
        <%--</div>--%>
    <%--</section>--%>
<%--</footer>--%>

</body>
</html>
