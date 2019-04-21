$(document).ready(function(){//点击悬浮窗右上角的X按钮，关闭悬浮窗
        $("#x").click(function(){
            $("#choiceWindow").slideUp(300);
            $("#backGround").hide();
        })

        //点击悬浮窗中的取消按钮，关闭悬浮窗
        $(".btn-cancel").click(function(){
            $("#createWindow").slideUp(300);
            $(".backGround").hide();
        })

        //点击确定按钮创建相册
        $(".btn-confirm").click(function(){
            $("#createWindow").slideUp(300);
            $(".backGround").hide();

            var albumState = 1; //相册存在state为1，删除为2，彻底删除为0
            $.ajax({
                url: "/create",
                type:"POST",
                dataType:"json",
                async:false,
                data: {
                    "albumName":$(".create-album-name").val(),
                    "albumState": albumState
                },
                success: function (result) {
                    alert(result.msg);
                    window.location.href = "/myAlbum";
                }
            });
        })
});


