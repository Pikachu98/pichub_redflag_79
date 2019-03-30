<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Focus</title>

    <script src="/js/jquery-3.3.1.min.js"></script>
    <script type="text/css">

    </script>
</head>
<body>
<table align="center">
    <tr>
        <td><input type="button" value="关注/取消" id="btnFocus"></td>
        <td>当前用户ID：</td>
        <td><input type="text" value="userId1" id="userId1"></td>
    </tr>
    <tr>
        <td><input type="button" value="我的关注" id="btnMyFocus"></td>
        <td>关注用户ID：</td>
        <td><input type="text" value="userId2" id="userId2"></td>
    </tr>
    <tr>
        <td><input type="button" value="我的粉丝" id="btnFocusMe"></td>
        <td>我的粉丝ID：</td>
        <td><input type="text" value="userId3" id="userId3"></td>
    </tr>
    <tr>
        <td><input type="button" value="我喜欢的" id="btnMyLike"></td>
        <td>我喜欢的图片ID：</td>
        <td><input type="text" value="userId4" id="userId4"></td>
    </tr>
    <tr>
        <td><input type="button" value="我de相册" id="btnMyAlbum"></td>
        <td>我的相册ID：</td>
        <td><input type="text" value="userId5" id="userId5"></td>
    </tr>
    <tr>
        <td><input type="button" value="改变昵称" id="btnChangeName"></td>
        <td>新的昵称：</td>
        <td><input type="text" value="userId6" id="userId6"></td>
    </tr>
</table>

<script>
    $(function (){
        $("#btnFocus").on("click",function () {

            $.ajax({
                type:"POST",
                url:"/user/doInsertFocus",
                dataType:"json",
                data:{
                    "loginState":true
                },
                success:function (result) {
                    $("#btnFocus").removeClass("Saving");
                    $("#btnFocus").val("关注");

                    if (result.backMsg == true) {
                        alert("关注成功！");
                        $("#userId1").val(result.focusId1.toString());
                        $("#userId2").val(result.focusId2.toString());
                    } else if (result.backMsg == false) {
                        alert("关注失败！");
                    } else{
                        alert(result.backMsg.toString());
                    }
                },
                error:function () {
                    $("#btnFocus").removeClass("Saving");
                    $("#btnFocus").val("关注");
                }
            })
        })

        $("#btnMyFocus").on("click",function () {
            $.ajax({
                type:"POST",
                url:"/user/doShowMyFocus",
                dataType:"json",
                data:{
                    "loginState":true
                },
                success:function (result) {
                    $("#btnMyFocus").removeClass("Saving");
                    $("#btnMyFocus").val("关注");

                    $("#userId2").val(result.MyFocus.toString());
                },
                error:function () {
                    $("#btnMyFocus").removeClass("Saving");
                    $("#btnMyFocus").val("关注");
                }
            })
        })

        $("#btnFocusMe").on("click",function () {
            $.ajax({
                type:"POST",
                url:"/user/doShowFocusMe",
                dataType:"json",
                data:{
                    "loginState":true
                },
                success:function (result) {
                    $("#btnFocusMe").removeClass("Saving");
                    $("#btnFocusMe").val("关注");

                    $("#userId3").val(result.FocusMe.toString());
                },
                error:function () {
                    $("#btnFocusMe").removeClass("Saving");
                    $("#btnFocusMe").val("关注");
                }
            })
        })

        $("#btnMyLike").on("click",function () {
            $.ajax({
                type:"POST",
                url:"/user/doShowMyLike",
                dataType:"json",
                data:{
                    "loginState":true
                },
                success:function (result) {
                    $("#btnMyLike").removeClass("Saving");
                    $("#btnMyLike").val("关注");

                    $("#userId4").val(result.MyLike.toString());
                },
                error:function () {
                    $("#btnMyLike").removeClass("Saving");
                    $("#btnMyLike").val("关注");
                }
            })
        })

        $("#btnMyAlbum").on("click",function () {
            $.ajax({
                type:"POST",
                url:"/user/doShowMyAlbum",
                dataType:"json",
                data:{
                    "loginState":true
                },
                success:function (result) {
                    $("#btnMyAlbum").removeClass("Saving");
                    $("#btnMyAlbum").val("关注");

                    $("#userId5").val(result.MyAlbum.toString());
                },
                error:function () {
                    $("#btnMyAlbum").removeClass("Saving");
                    $("#btnMyAlbum").val("关注");
                }
            })
        })

        $("#btnChangeName").on("click",function () {
            $.ajax({
                type:"POST",
                url:"/user/doChangeUserName",
                dataType:"json",
                data:{
                    "loginState":true,
                    "newUsername":$("#userId6").val()
                },
                success:function (result) {
                    $("#btnChangeName").removeClass("Saving");
                    $("#btnChangeName").val("关注");

                    //$("#userId6").val(result.changeName.toString());
                    alert("改变成功");
                },
                error:function () {
                    $("#btnChangeName").removeClass("Saving");
                    $("#btnChangeName").val("关注");
                }
            })
        })
    })
</script>
<div></div>

</body>
</html>
