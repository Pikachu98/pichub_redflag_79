<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 19-4-13
  Time: 上午9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>myalbum</title>
    <link rel="stylesheet" href="/default/reset.css">
    <link rel="stylesheet" href="/default/view.css">
    <link rel="stylesheet" href="/default/base-layout.css">
    <link rel="stylesheet" href="/default/header.css">
    <link rel="stylesheet" href="/default/photo-list.css">

    <link rel="stylesheet" href="/default/other-header.css">
    <link rel="stylesheet" href="/default/other-album.css">

    <link rel="stylesheet" href="/default/myalbum.css">
    <link rel="stylesheet" href="/default/edit.css">

    <link rel="stylesheet" href="/css/bootstrap.css" >

    <script src="/default/js/jquery-3.3.1.js"></script>

    <script src="/js/bootstrap3.0.3.min.js"></script>
    <script src="/js/album.js"></script>

    <script type="text/javascript">
        <%--上传相片--%>
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

        //重命名相册
        $(document).ready(function () {
            $(".rename").click(function () {
                $("#renameWindow").slideDown(300);
                $("#fake").attr("album",$(this).attr("album"));
            })

            $(".x").click(function () {
                $("#renameWindow").slideUp(300);
            })

        });

        //创建相册
        $(document).ready(function () {
            $("#btn-create").click(function () {
                $("#createWindow").slideDown(300);
                $(".backGround").show();
            });

            $(".x").click(function () {
                $("#createWindow").slideUp(300);
                $(".backGround").hide();
            })
        });

        //查看相册内容
        $(document).ready(function () {
            $(".cover").click(function () {
                window.location.href("/myAlbum/listPicture");
                /*$.ajax({
                    type: "post",
                    url: "/myAlbum/listPicture",
                    data: {"albumId": albumId},
                    success: function (result) {
                        var valu = result;
                        if (valu.toString() == "") {
                            alert("此相册下没有图片");
                        }
                        else {
                            $("#albumContent").slideDown(300);
                            $(".backGround").show();
                            $(".x").click(function () {
                                $("#albumContent").slideUp(300);
                                $(".backGround").hide();
                            })
                        }
                    },
                    error: function () {
                        alert("未响应请刷新页面重试！")
                    }
                })*/
            })
        });


    </script>
    <script type="text/javascript">
        function select() {
            var index = $("#album-list option:selected");
            var getAlbumId = index.attr("var");
            $("#album-id").attr("value",getAlbumId);
            $(".btn-start-upload").css("visibility","visible");
            $("#point-out").css("visibility","hidden");
        }
    </script>

    <script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector("#test");
            var file    = document.querySelector('input[type=file]').files[0];
            var reader  = new FileReader();
            var visi = document.getElementById("label_sele");
            visi.style.visibility="hidden";
            visi.style.marginLeft=-135;
            visi.style.marginTop=0;

            var picvisi = document.getElementById("test");
            picvisi.style.visibility="visible";

            // $(".btn-choose-pic").visibility=hidden;

            reader.onloadend = function () {
                preview.src = reader.result;
            }


            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>

    <script>
        $(function () {

            $(".delAlbum").click(function () {
                $.ajax({
                    type:"POST",
                    url:"/deleteAlbum",
                    dataType:"json",
                    data:{
                        "albumId":$("#fake").attr("album")
                    },
                    success:function () {
                        alert("删除成功");
                    },
                    error:function () {
                        alert("删除失败");
                    }
                })
            })

            $(".btn-rename").click(function () {
                $.ajax({
                    type:"POST",
                    url:"/changeAlbumName",
                    dataType:"json",
                    data:{
                        "albumId":$("#fake").attr("album"),
                        "name":$(".newName").val()
                    },
                    success:function () {
                        window.location.reload();
                    },
                    error:function () {
                        window.location.reload();
                    }
                })
            })


        })
    </script>

</head>

<body>
<%@include file="header.jsp"%>
<main id="main" class="main">
    <section class="detail">
        <div>
            <div class="detail-l">
                <div class="other-avator"><img style="border-radius:50%" src="/showA/${sessionScope.get("user").userId}" alt="我是头像">
                </div>

                <div class="other-note">
                    <div><span class="other-note-title">${sessionScope.get("user").userName}</span>
                    </div>
                    <div class="other-note-decription">${sessionScope.get("user").userDescription}</div>
                    <div class="other-focus">
                        <div class="fans">
                            <div class="number">${FocusMe}</div>
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
        <div class="sidebar">
            <div class="focus-now"><a href="/myAlbum"><img src="/img/i-1-1.png"
                                                           class="icon-my">我的相册</a></div>
            <div class="sidebar-btn"><a href="/listmyLike"><img src="/img/i-2.png"
                                                                class="icon-my">我喜欢的</a></div>
            <div class="sidebar-btn"><a href="/listFans"><img src="/img/i-3.png"
                                                              class="icon-my">我的粉丝</a></div>
            <div class="sidebar-btn"><a href="/list"><img src="/img/i-4.png"
                                                          class="icon-my">我关注的</a></div>
            <div class="sidebar-btn"><a href="/editPersonal"><img src="/img/i-5.png"
                                                                  class="icon-my">修改个人资料</a></div>
        </div>

        <div class="toolsbar">
            <a href="javascript:void(0)" class="myalbum-btn1" id="btn-upload">上传照片</a>
            <a href="javascript:void(0)" class="btn-focus myalbum-btn2" id="btn-create">创建相册</a>
            <a href="javascript:void(0)" class="btn-focus myalbum-btn2">展示设置</a>
            <a href="javascript:void(0)" class="myalbum-btn3">
                <img src="/img/edit.png" class="icon-edit">
                <%--<span>编辑</span>--%>
            </a>
        </div>

        <section>
        <div class="other-root">
                <%--<c:if test="${errorMessage == \"这个相册是空的\"}">--%>
                    <%--<span>errorMessage</span>--%>
                <%--</c:if>--%>
                <%--<c:if test="${errorMessage != \"这个相册是空的\"}">--%>
                <table>
                    <c:forEach items="${picsList}" var="list" varStatus="cou" >
                        <c:if test="${cou.count ==1 && (cou.count-1) %4==0}">
                            <tr>
                        </c:if>
                        <td>
                            <c:if test="${cou.count <= 18}">
                                <div class="album-cover">
                                    <a href="/picture-detail/${list.picId}">
                                    <img src= "/show/${list.picId}" alt='photo-1' class='cover'>
                                    </a>
                                </div>
                            </c:if>
                            <c:if test="${cou.count > 18}">
                                <div class="album-cover">
                                    <a href="/picture-detail/${list.picId}">
                                    <img src="/show/${list.picId}" onerror="javascript:this.src='/img/pho-18.png'" alt="photo-1" class="cover"><%--相册封面图片--%>
                                    </a>
                                </div>
                            </c:if>
                        </td>
                        <c:if test="${cou.count%4==0}">
                            </tr>
                        </c:if>
                    </c:forEach>
                </table>
                <%--</c:if>--%>
            </div>
        </section>

        <div class="choose-page">
            <a href="javascript:void(0)" class="choose-btn">上一页</a>
            <span class="page-now">1/20</span>
            <a href="javascript:void(0)" class="choose-btn">下一页</a>
        </div>

        <%--</div>--%>
        <!--重命名悬 浮窗-->
        <div id="renameWindow" >
            <div style="float: right">
                <label class="x" style="margin-top:2px;margin-left: -169%;font-size: 25px;">-</label>
            </div>
            <div>
                <div class="item">
                    <input type="text" class="item-text newName" placeholder="新名称" />
                </div>
                <div>
                    <button class="btn btn-rename">确认</button>
                </div>
                <label style="visibility: hidden;" id="fake" album=""></label>
            </div>
        </div>
        <!--上传悬浮窗-->
        <form id="uploadWindow" action="/uploadFile" enctype="multipart/form-data" method="post" >
            <div style="float: right">
                <label class="x" style="margin-top:2px;margin-left: -169%;font-size: 25px;">-</label>
            </div>

            <div class="uploadPic">
                <span class="uploadP">上传照片</span>
                <span class="uploadPath">上传到</span>
                <select class="upload-album" id = "album-list" onchange="select()">
                    <option>请选择相册</option>
                    <c:forEach items="${albumList}" var="var">
                        <option var="${var.albumId}">${var.albumName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="choosed">
                <!--<a class="btn-choose-pic">--><!--<img src="img/pic.png"
                                style="vertical-align:middle;height: 25px;padding-bottom: 5px;">选择照片-->
                <label for="upload" class="btn-choose-pic" id="label_sele">
                    <img src="/img/pic.png" style="vertical-align:middle;height: 25px;padding-bottom: 5px;">选择照片</label>
                <input type="file" name="file" id="upload" onchange="previewFile()" style="display: none;">
                <img src="" height="200px" id="test" alt="Image preview...">
                <input type="text" name="album" id="album-id" value="" style="display: none">
                <!--</a>-->
            </div>
            <div class="upload-footer">
                <%--<a href="javascript:void(0)" class="btn-start-upload">开始上传</a>--%>
                <input type="submit" class="btn-start-upload" style="visibility: hidden" value="开始上传">
                <label id="point-out" style="visibility: visible">请选择相册</label>
                <label for="upload" class="btn-start-upload">重新选择</label>
                <span class="continue">共1张照片（上传过程中请不要删除原始照片）</span>
            </div>
        </form>
        <div class="backGround"></div>
        <!--上传窗口-->

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
