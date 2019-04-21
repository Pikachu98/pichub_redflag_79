
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
                    "newUsername":$("#newUserName").val()
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