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

    <link rel="stylesheet" href="css/bootstrap.css" >

    <script src="/default/js/jquery-3.3.1.js"></script>

    <script src="js/bootstrap3.0.3.min.js"></script>
    <script src="/js/album.js"></script>

    <script type="text/javascript">

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

</head>

<body>
<%@include file="header.jsp"%>
<main id="main" class="main">
    <section class="detail">
        <div>
            <div class="detail-l">
                <div class="other-avator"><img style="border-radius:50%" src="showA/${sessionScope.get("user").userId}" alt="我是头像">
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

        <div class="my-root">
            <ul class="my-album">
                        <c:forEach items="${listAlbum}" var="list" varStatus="cou" ><!--一个循环元素一个包装-->
                <div class="listAlbum"><li class="cover-item my-cover-item">


                                <a href="javascript:void(0);" onclick="a(${list.albumId})">
                                    <div class="album-cover">
                                        <img src="show/${coverIds[cou.count-1]}" onerror="javascript:this.src='/img/pho-18.png'" alt="photo-1" class="cover" height="100" width="100"><%--相册封面图片--%>
                                    </div>
                                    <div>${list.albumName}</div><%--相册名字--%>
                                </a>
                        <a href="javascript:void(0);" onclick="a(${list.albumId})">
                            <div class="album-cover">
                                <img src="/img/pho-18.png" alt="photo-1" class="cover" height="100" width="100"><%--相册封面图片--%>
                            </div>
                            <div>${list.albumName}</div><%--相册名字--%>
                        </a>
                        <div class="btn-group" style="position: absolute;right:1px;top:21px;">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" style="height: 5px;">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">删除</a></li>
                                <li><a href="#">重命名</a></li>
                                <li><a href="#">Help</a></li>
                            </ul>
                        </div>




                    </li>
                </div>
                        </c:forEach>

            </ul>
            <script>
                function a(albumId) {
                    $.ajax({
                        type: "post",
                        url: "/myAlbum/listPicture",
                        data:{"albumId":albumId}
                        ,
                        success: function (result) {
                          var valu=result;
                          if(valu.toString()==""){
                              alert("此相册下没有图片");
                              var trs="<div class='listPicture'> " +
                                  "<a href='#' >" +
                                  "<div class='album-cover'>" +
                                      "此相册下没有图片"+
                                  "</div>" +
                                  "  </a> " +
                                  "</div>";
                              //$(".my-album").append(trs);
                          }else {
                              $.each(result,function(n,value) {
                                  $(".listAlbum").remove();
                                  var trs = "";
                                  trs += "<div class='listPicture' style='display:relative;'> " +
                                      "<a href='#' >" +
                                      "<div class='album-cover'>" +
                                      "<img src= "+"/show/"+value.picId+" "+"alt='photo-1' class='cover' height='150' width='250'><%--相册封面图片--%> "+
                                      "</div>" +
                                      "<div class='btn-group' style='position: absolute;right:1px;top:21px;'>"+
                                      "<button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown' style='height: 5px;'>"+
                                      "<span class='caret'></span>"+
                                      "</button>"+
                                      "<ul class='dropdown-menu' role='menu'>"+
                                      "<li><a href='#'>删除</a></li>"+
                                      "<li><a href='#'>description</a></li>"+
                                  "<li><a href='#'>重命名</a></li>"+
                                  "<li><a href='#'>Help</a></li>"+
                                  "</ul>"+
                                  "</div>"+
                                      <%-- +"<div>"+value.picName+"</div><%--相册名字--%>
                                      "  </a> " +
                                      "</div>";

                                  /*                               trs += " < tr > <td > " + value.picPath +" < /td> <td>"
                                                                     + value.picName +"</td > </tr>";*/
                                  var tbody = "";
                                  tbody += trs;
                                  $(".my-album").append(tbody);
                              });
                          }

                            /*alert("加载相册内照片完成");*/
                            //放置listpic
                        },
                        error: function () {
                            alert("未响应请刷新页面重试！")
                        }
                    })
                }

            </script>

            <div class="choose-page">
                <a href="javascript:void(0)" class="choose-btn">上一页</a>
                <span class="page-now">1/20</span>
                <a href="javascript:void(0)" class="choose-btn">下一页</a>
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
                <a href="javascript:void(0)" class="btn-add">继续添加</a>
                <span class="continue">共1张照片（上传过程中请不要删除原始照片）</span>
            </div>
        </form>
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
            <%--<div class="album-authority">--%>
                <%--<span>权限：</span>--%>
                <%--<select class="create-album-name">--%>
                    <%--<option value="">仅自己查看</option>--%>
                    <%--<option value="">公开</option>--%>
                <%--</select>--%>
            <%--</div>--%>
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
