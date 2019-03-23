
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <title>jQueryStudy</title>
    <script src="js/jquery-3.3.1.js"></script>
    <style>
        .int{ height: 30px; text-align: left; width: 600px; }
        label{ width: 200px; margin-left: 20px; }
        .high{ color: red; }
        .msg{ font-size: 13px; }
        .onError{ color: red; }
        .onSuccess{ color: green; }
    </style>
</head>
<body>
<form>
    <div class="int">
        <label for="userName">昵称：</label>
        <input type="text" id="userName" class="required" />
    </div>
    <div class="int">
        <label for="password1">密码：</label>
        <input type="password" id="password1" class="required" />
    </div>
    <div class="int">
        <label for="password2">确认密码：</label>
        <input type="password" id="password2" class="required" />
    </div>
    <%--<div class="int">--%>
    <%--<label>性别：</label>--%>
    <%--<input type="radio" id="male" name="gender" class="gender" />男--%>
    <%--<input type="radio" id="female" name="gender" class="gender" />女--%>
    <%--<input type="radio" id="secret" name="gender" class="gender" />保密--%>
    <%--</div>--%>
    <div class="int">
        <label for="email">邮箱：</label>
        <input type="text" id="email" class="required" />
    </div>
    <div class="int">
        <label for="phone">手机：</label>
        <input type="text" id="phone" />
    </div>
    <div class="int">
        <input type="button" value="提交" id="send" style="margin-left: 70px;" />
        <input type="reset" value="重置" id="res" />
    </div>
</form>
<script>
    $(function () {
        //为表单的必填文本框添加提示信息（选择form中的所有后代input元素）
        $("form :input.required").each(function () {
            //通过jquery api：$("HTML字符串") 创建jquery对象
            var $required = $("<strong class='high'>*</strong>");
            //添加到this对象的父级对象下
            $(this).parent().append($required);
        });

        //为表单元素添加失去焦点事件
        $("form :input").blur(function(){
            var $parent = $(this).parent();
            $parent.find(".msg").remove(); //删除以前的提醒元素（find()：查找匹配元素集中元素的所有匹配元素）
            //验证姓名
            if($(this).is("#userName")){
                var nameVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
                var regName = /[~#^$@%&!*()<>:;'"{}【】  ]/;
                if(nameVal == "" || nameVal.length < 6 || regName.test(nameVal)){
                    var errorMsg = " 姓名非空，长度6位以上，不包含特殊字符！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }

            //验证密码
            if($(this).is("#password2")) {
                var pass1 = $("#password1").val();
                var pass2 = $("#password2").val();
                if (pass1 != pass2) {
                    var errorMsg = "确认密码不相同！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
            }
            //验证邮箱
            if($(this).is("#email")){
                var emailVal = $.trim(this.value);
                var regEmail = /.+@.+\.[a-zA-Z]{2,4}$/;
                if(emailVal== "" || (emailVal != "" && !regEmail.test(emailVal))){
                    var errorMsg = " 请输入正确的E-Mail住址！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
        }).keyup(function(){
            //triggerHandler 防止事件执行完后，浏览器自动为标签获得焦点
            $(this).triggerHandler("blur");
        }).focus(function(){
            $(this).triggerHandler("blur");
        });

        //点击重置按钮时，通过trigger()来触发文本框的失去焦点事件

        $("#send").on("click", function () {
            //trigger 事件执行完后，浏览器会为submit按钮获得焦点
            $("form .required:input").trigger("blur");
            var numError = $("form .onError").length;
            if (numError != 0) {
                return;
            }
            // // alert("注册成功！");
            if ($("#send").hasClass("Saving")) {
                return;
            }

            $("#send").addClass("Saving");
            $("#send").val("Saving");

            var userName=$("#userName").val();

            $.ajax({
                type:"POST",
                dataType:"json",
                url: "/user/doRegister",
                data: {
                    "userName":userName,
                    "userPassword": $("#password1").val(),
                    "userEmail": $("#email").val(),
                    "userPhone": $("#phone").val()
                },
                success: function (result) {
                    window.location.href = "index";
                }
            })
        })
    })
</script>
</body>
</html>