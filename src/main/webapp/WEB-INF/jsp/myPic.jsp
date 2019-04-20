<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

<head>
    <meta charset="UTF-8">
    <title>Pictures in the Album</title>
    <link rel="stylesheet" href="theme/default/reset.css">
    <link rel="stylesheet" href="theme/default/view.css">
    <link rel="stylesheet" href="theme/default/base-layout.css">
    <link rel="stylesheet" href="theme/default/header.css">
    <link rel="stylesheet" href="theme/default/photo-list.css">
    <link rel="stylesheet" href="theme/default/other-header.css">
    <link rel="stylesheet" href="theme/default/other-album.css">
    <link rel="stylesheet" href="theme/default/myalbum.css">
    <link rel="stylesheet" href="theme/default/edit.css">

    <script src="theme/default/js/jquery-3.3.1.js"></script>

    <link rel="stylesheet" href="css/load.css">

    <script type="text/javascript">
        function load() {
            var a = setTimeout("loading.style.transition='opacity 0.3s'", 0)
            //设置透明度改变的过渡时间为0.3秒
            var b = setTimeout("loading.style.opacity=0", 500)
            //0.5秒后加载动画开始变为透明
            var c = setTimeout("loading.style.display='none'", 800)
            //当透明度为0的时候，隐藏掉它
        }

    </script>

    <script type="text/javascript">
        //点击上传相片，出现悬浮窗
        $(document).ready(function () {
            $("#btn-upload").click(function () {
                $("#uploadWindow").slideDown(300);
                $(".backGround").show();
            });

            $(".x").click(function () {
                $("#uploadWindow").slideUp(300);
                $(".backGround").hide();
            })
        });
    </script>
</head>

<body onload="load()">
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

<%@include file="header.jsp"%>

<main id="main" class="main">
    <section class="detail">
        <div>
            <div class="detail-l">
                <div class="other-avator"><img src="showT/${sessionScope.get("user").userId}" alt="我是头像">
                </div>

                <div class="other-note">
                    <div><span class="other-note-title">南巷清风</span>
                    </div>
                    <div class="other-note-decription">${sessionScope.get("user").userDescription}</div>
                    <div class="other-focus">
                        <div class="fans">
                            <div class="number">${FocusMe}</div>
                            <div class="ch">粉丝</div>
                        </div>
                        <div class="focus-person">
                            <div class="v-line"><img src="img/line-vertical.png"></div>
                            <div class="number">${MyFocus}</div>
                            <div class="ch">关注</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="sidebar">
            <div class="focus-now"><a href="/myalbum"><img src="img/i-1-1.png"
                                                               class="icon-my">我的相册</a></div>
            <div class="sidebar-btn"><a href="/mylike"><img src="img/i-2.png"
                                                                class="icon-my">我喜欢的</a></div>
            <div class="sidebar-btn"><a href="/myfans"><img src="img/i-3.png"
                                                                class="icon-my">我的粉丝</a></div>
            <div class="sidebar-btn"><a href="/myfocus"><img src="img/i-4.png"
                                                                 class="icon-my">我关注的</a></div>
            <div class="sidebar-btn"><a href="/editPersonal"><img src="img/i-5.png"
                                                                      class="icon-my">修改个人资料</a></div>
        </div>

        <div class="toolsbar">
            <a href="javascript:void(0)" class="myalbum-btn1" id="btn-upload">上传照片</a>
            <a href="javascript:void(0)" class="btn-focus myalbum-btn2" id="btn-create">创建相册</a>
            <a href="javascript:void(0)" class="btn-focus myalbum-btn2">展示设置</a>
            <a href="javascript:void(0)" class="myalbum-btn3">
                <img src="img/edit.png" class="icon-edit">
                <span>编辑</span>
            </a>
        </div>

        <div class="my-root">
            <ul class="my-album">
                <c:forEach items="${listPicture}" var="var" varStatus="cou">
                    <li class="cover-item my-cover-item">
                        <div class="album-cover">
                            <img class="cover" src="show/${var.picId}" alt="photo-1" width="301px">
                        <div>${var.picName}</div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <div class="choose-page">
                <a href="javascript:void(0)" class="choose-btn">上一页</a>
                <span class="page-now">1/20</span>
                <a href="javascript:void(0)" class="choose-btn">下一页</a>
            </div>

        </div>
        <!--上传悬浮窗-->
        <div id="uploadWindow">
            <div style="float: right">
                <label class="x" style="margin-top:2px;margin-left: -169%;font-size: 25px;">-</label>
            </div>

            <div class="uploadPic">
                <span class="uploadP">上传照片</span>
                <span class="uploadPath">上传到</span>
                <select class="upload-album">
                    <option>相册一</option>
                    <option>相册二</option>
                    <option>相册三</option>
                </select>
            </div>
            <div class="choosed">
                <a class="btn-choose-pic"><img src="img/pic.png"
                                               style="vertical-align:middle;height: 25px;padding-bottom: 5px;">选择照片</a>
            </div>
            <div class="upload-footer">
                <a href="javascript:void(0)" class="btn-start-upload">开始上传</a>
                <a href="javascript:void(0)" class="btn-add">继续添加</a>
                <span class="continue">共5张照片（上传过程中请不要删除原始照片）</span>
            </div>
        </div>
        <div class="backGround"></div>
        <!--上传窗口-->
        <!--创建相册悬浮窗-->
        <div id="createWindow">
            <div style="float: right">
                <label class="x" style="margin-top:2px;margin-left: -169%;font-size: 25px;">-</label>
            </div>

            <div style="background-color:#F8F8F8">
                <span class="create-title">创建相册</span>
            </div>
            <div class="about-album">
                <span class="lbl-create1">相册名称：</span>
                <input type="text" class="create-album-name">
                <span>0/30</span>
            </div>
            <div class="album-des">
                <span>相册描述：</span>
                <textarea class="create-description"></textarea>
                <span>0/2000</span>
            </div>
            <div class="album-authority">
                <span>权限：</span>
                <select class="create-album-name">
                    <option value="">仅自己查看</option>
                    <option value="">公开</option>
                </select>
            </div>
            <div class="create-footer">
                <a href="javascript:void(0)" class="btn-confirm">确认</a>
                <a href="javascript:void(0)" class="btn-cancel">取消</a>
            </div>
        </div>
        <div class="backGround"></div>
        <!--创建相册窗口-->
    </section>

</main>
<footer class="footer" id="footer">
    <section class="layout">
        <div class="l-content my-footer">
            Copyright ©红旗中学 &nbsp;&nbsp;ICP备案号：<a href="http://www.miibeian.gov.cn" target="_blank" >苏ICP备19014708号</a>
        </div>
    </section>
</footer>

</body>

</html>