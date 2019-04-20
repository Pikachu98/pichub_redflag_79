<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>修改个人资料</title>
    <link rel="stylesheet" href="theme/default/reset.css">
    <link rel="stylesheet" href="theme/default/view.css">
    <link rel="stylesheet" href="theme/default/base-layout.css">
    <link rel="stylesheet" href="theme/default/header.css">
    <link rel="stylesheet" href="theme/default/photo-list.css">

    <link rel="stylesheet" href="theme/default/other-header.css">
    <link rel="stylesheet" href="theme/default/other-album.css">

    <link rel="stylesheet" href="theme/default/myalbum.css">
    <link rel="stylesheet" href="theme/default/mylike.css">

    <link rel="stylesheet" href="theme/default/userlist.css">

    <link rel="stylesheet" href="css/load.css">

    <link rel="stylesheet" href="theme/default/edit.css">
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
<header id="header" class="header">
    <section class="layout">
        <div class="l-content view-lr">
            <div class="header-l">
                <a href="pic-index.html"><img src="img/logo.png" class="logo"></a>
            </div>
            <div class="user-r">
                        <span class="search-box login-search">
                            <input type="text" class="input-search">
                            <!-- <i class="icon icon-search"></i> -->
                            <img src="img/icon_search.png" alt="search" class="icon-search">
                        </span>
                <img src="img/avator.png" alt="我的头像" class="user">
                <span class="user">Crush</span>
                <img src="img/icon-dropdown.png" class="user">
            </div>
        </div>
    </section>
</header>
<main id="main" class="main">
    <section class="detail">
        <div>
            <div class="detail-l">
                <div class="other-avator"><img src="img/other-avator.png" alt="我是头像">
                </div>

                <div class="other-note">
                    <div><span class="other-note-title">南巷清风</span>
                    </div>
                    <div class="other-note-decription">一个男人要走多少路，才能称之为男人。</div>
                    <div class="other-focus">
                        <div class="fans">
                            <div class="number">178</div>
                            <div class="ch">粉丝</div>
                        </div>
                        <div class="focus-person">
                            <div class="v-line"><img src="img/line-vertical.png"></div>
                            <div class="number">125</div>
                            <div class="ch">关注</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="myL">
        <div class="sidebar">
            <div class="sidebar-btn"><a href="myalbum.html"><img src="img/i-1.png"
                                                                 class="icon-my">我的相册</a></div>
            <div class="sidebar-btn"><a href="mylike.html"><img src="img/i-2.png"
                                                                class="icon-my">我喜欢的</a></div>
            <div class="sidebar-btn"><a href="myfans.html"><img src="img/i-3.png"
                                                                class="icon-my">我的粉丝</a></div>
            <div class="sidebar-btn"><a href="myfocus.html"><img src="img/i-4.png"
                                                                 class="icon-my">我关注的</a></div>
            <div class="focus-now"><a href="editPersonal.html"><img src="img/i-5-1.png"
                                                                    class="icon-my">修改个人资料</a></div>
        </div>
        <div class="edit">
            <div class="no-avator">
                <span class="lbl">头像</span>
                <img src="img/no-avator.png" class="pic-ava">
            </div>
            <hr class="hr" />
            <div>
                <span class="lbl">昵称</span>
                <input type="text" class="name-now" placeholder="我是现在的用户名">
                <a href="javascript:void(0)" style="color:#2EBDE6">修改</a>
            </div>
            <div>
                <span class="lbl">性别</span>
                <input type="radio" name="gender"><span class="gender-choice">男</span>
                <input type="radio" name="gender"><span class="gender-choice">女</span>
                <input type="radio" name="gender"><span class="gender-choice">保密</span>
            </div>
            <div>
                <span class="lbl">QQ</span>
                <input type="text" placeholder="1531881520" class="name-now">
                <a href="javascript:void(0)" style="color:#2EBDE6">绑定</a>
            </div>
            <div>
                <span class="lbl">邮箱</span>
                <input type="email" placeholder="请输入邮箱" class="name-now">
            </div>
            <div>
                <span class="lbl">签名</span>
                <input type="text" class="name-now intro" placeholder="不超过20字">
            </div>

            <div class="acc">
                <span class="account">关联社交账号</span>
                <img src="img/QQ.png" class="pic-ava QQ">
            </div>
            <hr class="hr" />
            <div class="btn-save">
                <a href="javascript:void(0)">保存设置</a>
            </div>
        </div>
    </section>

</main>
<footer class="footer" id="footer">
    <section class="layout">
        <div class="l-content my-footer">
            Copyright ©红旗中学版权所有
        </div>
    </section>
</footer>
<div style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 0.5;">
    <canvas></canvas>
</div>
<!-- 鼠标跟随特效 -->
<script src="js/stopExecutionOnTimeout.js"></script>
<script src="js/canvas.js"></script>
</body>

</html>