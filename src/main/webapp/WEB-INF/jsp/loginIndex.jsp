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
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/jquery.validate.extend.js"></script>
    <script src="layui/layui.js"></script>
    <script src="js/register.js"></script>
    <!--瀑布流-->
    <script src="js/jquery.masonry.min.js"></script>
    <script src="js/register.js"></script>
    <script src="js/windowsUpDown.js"></script>
    <script src="js/changePsw.js"></script>
    <script src="js/login.js"></script>

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
    <script type="text/javascript">
        var lazyload = {
            /*对页面变量初始化*/
            init : function(opt){
                var that = this,
                    op = {
                        anim: true,
                        extend_height:0,
                        selectorName:"img", /*假文件名*/
                        realSrcAtr:"data-src"/*真文件名*/
                    };
                // 合并对象，已有的{anim:true}+用户自定义对象。也就是op = op + opt
                $.extend(op,opt);
                // 调用lazyload.img.init(op)函数
                that.img.init(op);

            },

            img : {
                init : function(n){

                    var that = this,
                        selectorName = n.selectorName,
                        realSrcAtr = n.realSrcAtr,
                        anim = n.anim;


                    // 要加载的图片是不是在指定窗口内
                    function inViewport( el ) {
                        // 当前窗口的顶部
                        var top = window.pageYOffset,
                            // 当前窗口的底部
                            btm = window.pageYOffset + window.innerHeight,
                            // 元素所在整体页面内的y轴位置
                            elTop = $(el).offset().top;
                        // 判断元素，是否在当前窗口，或者当前窗口延伸400像素内
                        return elTop >= top && elTop - n.extend_height <= btm;
                    }

                    // 滚动事件里判断，加载图片
                    $(window).on('scroll', function() {
                        $(selectorName).each(function(index,node) {
                            var $this = $(this);

                            if(!$this.attr(realSrcAtr) || !inViewport(this)){
                                return;
                            }

                            act($this);

                        })
                    }).trigger('scroll');

                    // 展示图片
                    function act(_self){
                        // 已经加载过了，则中断后续代码
                        if (_self.attr('lazyImgLoaded')) return;
                        var img = new Image(),
                            original = _self.attr('data-src');
                        // 图片请求完成后的事件，把data-src指定的图片，放到src里面，浏览器显示
                        img.onload = function() {
                            _self.attr('src', original);
                            anim && _self.css({ opacity: .8 }).animate({ opacity: 1 }, 280);
                        };/*opacity:不透明度*/
                        // 当你设置img.src的时候，浏览器就在发送图片请求了
                        original && (img.src = original);
                        _self.attr('lazyImgLoaded', true);
                    }
                }
            }
        };
        lazyload.init({
            anim:false,
            selectorName:".hot_pics"
        });
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
                        <a><img src="img/avator-1.png" alt="头像"></a>
                        <span class="user-name">${users[cou.count-1].userName}</span>
                    </div>
                    <div class="view-r"><!--关注，见photo-list-->
                        <a href="javascript:void(0)" class="btn-focus">关注</a>

                    </div><!--关注-->
                </div><!--头像+关注-->
                <div class="view-cover"><!--图片的显示，见phot-list:设置了个边框颜色？？？-->
                    <c:if test="${cou.count <4}">
                    <img class="hot_pics" src="show/${var.picId}" alt="photo-1" width="301px">
                    </c:if>
                    <c:if test="${cou.count >=4}">
                    <img class="hot_pics" src="img/whiteboard.png" data-src="show/${var.picId}" alt="photo-1" width="301px">
                    </c:if>

                </div>
                <div class="description"><!--故事，见photo-list-->
                    <p>${var.picStory}</p>
                </div>
                <div><!--分割线-->
                    <img src="img/line.png" alt="我是一条分割线">
                </div>
                <div class="focus-msg"><!--喜欢，见photo-list-->
                    <a><img src="img/heart.png" alt="我是一颗心"></a>
                    <span class="focus-num">${likeCount[cou.count-1]}人喜欢</span>
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
