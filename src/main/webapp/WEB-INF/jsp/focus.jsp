<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Focus</title>

    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<div>

</div>
<%--This is a test!--%>
<div>当前用户ID：<input type="text" value="userId1" id="userId1"></div>
<div>关注用户ID：<input type="text" value="userId2" id="userId2"></div>
<div><input type="button" value="关注" id="btnFocus"></div>
<div><input type="button" value="我的关注" id="btnMyFocus"></div>
<div><input type="button" value="我的粉丝" id="btnFocusMe"></div>
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
                        alert("关注成功！")
                        $("#userId1").val(result.focusId1.toString());
                        $("#userId1").val(result.focusId2.toString());
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

                    alert("关注成功！")
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

                    alert("关注成功！")
                    $("#userId2").val(result.FocusMe.toString());
                },
                error:function () {
                    $("#btnFocusMe").removeClass("Saving");
                    $("#btnFocusMe").val("关注");
                }
            })
        })
    })
</script>
<div></div>

</body>
</html>
