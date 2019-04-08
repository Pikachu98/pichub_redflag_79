<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>album</title>
    <style type="text/css">
        #choiceWindow {
            display: none;
            position: absolute;
            top: 25%;
            left: 25%;
            width: 30%;
            height: 55%;
            padding: 20px;
            border: 3px solid #ccc;
            background-color: white;
            z-index:2;
            overflow: auto;
        }
        #backGround {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 1100px;
            background-color: black;
            z-index:1;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=88);
        }
        #x:hover {cursor: pointer;color: rgb(55,198,192);}
    </style>
    <script src="../js/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#addAlbum").click(function(){
                $("#choiceWindow").slideDown(300);
                $("#backGround").show();
            });

            //点击悬浮窗右上角的X按钮，关闭悬浮窗
            $("#x").click(function(){
                $("#choiceWindow").slideUp(300);
                $("#backGround").hide();
            })

            //点击悬浮窗中的取消按钮，关闭悬浮窗
            $("#cancel").click(function(){
                $("#choiceWindow").slideUp(300);
                $("#backGround").hide();
            })

            //点击悬浮窗中的取消按钮，关闭悬浮窗
            $("#doAddAlbum").click(function(){
                $("#choiceWindow").slideUp(300);
                $("#backGround").hide();

                var albumState = 1; //相册存在state为1，删除为2，彻底删除为0
                $.ajax({
                    url: "/album/create",
                    type:"POST",
                    dataType:"json",
                    async:false,
                    data: {
                        "albumName":$("#albumName").val(),
                        "albumState": albumState
                    },
                    success: function (result) {
                        alert(result.msg);
                    }
                });
            })

        });
    </script>
</head>
<body>
    <div>这是一个主界面</div><br>
    <button id="addAlbum">新建相册</button>
    <button id="delteAlbum">删除相册</button>
    <button id="uploadPicToAlbum">上传照片</button>

    <div id="choiceWindow">
        <label id="x" style="position: absolute;top:2px;left: 95%;font-size: 25px;">x</label>
        <form>
            <div class="item">
                <label for="albumName" class="item-label">相册名称：</label>
                <input type="text" id="albumName" name="albumName" class="item-text"/>
            </div>
            <div>
                <button id="doAddAlbum">新建</button>
                <button id="cancel">取消</button>
            </div>
        </form>
    </div>
    <div id="backGround">
    </div>

    <div>Album Id:${p.albumId}</div>
    <div>Album Name:${p.albumName}</div>
    <div>Creat Time:${p.createTime}</div>
    <div>Update Time:${p.updateTime}</div>
    <div>Album State:${p.albumState}</div>
    <div>User Id:${p.userId}</div>
    <div>coverThumbnailPath:${p.coverThumbnailPath}</div>


</body>
</html>
