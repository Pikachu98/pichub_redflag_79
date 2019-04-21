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
    <script src="/js/jquery-3.3.1.min.js"></script>

    <script type="text/javascript">
        function load() {
            var a = setTimeout("loading.style.transition='opacity 0.3s'", 0)

            var b = setTimeout("loading.style.opacity=0", 500)

            var c = setTimeout("loading.style.display='none'", 800)

        }

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
    <script>
        $(function () {
            $(".btn-focus").on("click",function () {
                var focusId = ${user_id};
                var loginUser = $(".other-note").attr("butn_id");
                var count = $("#fanNumber").attr("count");
                if(loginUser != ""){
                    if($(".btn-focus").text() == "已关注")
                    {
                        $(".btn-focus").text("关注");
                        $("#fanNumber").attr("count",--count);
                        $("#fanNumber").text(count);
                    }
                    else
                    {
                        $(".btn-focus").text("已关注");
                        $("#fanNumber").attr("count",++count);
                        $("#fanNumber").text(count);
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

<%@include file="header.jsp"%>

<!--header用King的---->
<main id="main" class="main">

    <section class="detail">
        <div>
            <div class="detail-l">
                <div class="other-avator"><img  style="border-radius: 50%;" src="/showA/${user_id}" alt="我是头像">
                </div>

                <div class="other-note" butn_id="${sessionScope.get("user").userName}">
                    <div><span class="other-note-title">${user.userName}</span>   <!---------------------------->
                        <c:if test="${checkFocus == 0}">
                            <a href="javascript:void(0)" class="btn-focus">关注</a>
                        </c:if>
                        <c:if test="${checkFocus == 1}">
                            <a href="javascript:void(0)" class="btn-focus">已关注</a>
                        </c:if>
                    </div>

                    <div class="other-note-decription">${user.userDescription}</div>
                    <div class="other-focus">
                        <div class="fans">
                            <div class="number" id="fanNumber" count="${FocusMe}">${FocusMe}</div>
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
                            <td id="pics_td">
                                <c:if test="${cou.count <= 18}">
                                    <a href="/picture-detail/${var}">
                                        <img class="hot_pics" src="/show/${var}"  alt="photo-1" width="216px" height="216px">
                                    </a>
                                </c:if>
                                <c:if test="${cou.count > 18}">
                                    <a href="/picture-detail/${var}">
                                        <img class="hot_pics" src="/img/whiteboard.png" data-src="/show/${var}"  alt="photo-1" width="216px" height="216px">
                                    </a>
                                </c:if>
                            </td>
                    <c:if test="${cou.count%6==0}">
                    </tr>
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