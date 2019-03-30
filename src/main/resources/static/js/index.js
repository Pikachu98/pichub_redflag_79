$(function(){
    // var oValiLen = $("#register-form").find("input").size();
    // var oValArray = new Array();
    // for(var i=0;i<oValiLen-1;i++){
    //     oValArray[i] = $("#register-form").find("input").eq(i).prop("id"); 
    //     oValArray[i] = '#'+oValArray[i] ;
    // };


    
    
    //表单验证
	$("#register-form").validate();
    
 	//用户名
	$("#username").rules('add',{
		required:true,
		minlength:4,
        maxlength:20,
		messages:{
			required:'请输入帐号！',
			minlength:'帐号不能小于{0}位！',
            maxlength:'帐号不能小于{0}位！'
		}
	});
    //手机
    $("#phone").rules('add',{
        required:true,
        rangelength:[11,11],
        digits:true,
        phone:true,
        messages:{
            required:'请输入您的手机号！',
            rangelength:'请输入正确的手机号！',
            digits:'请输入正确的手机号！',
            phone:'请输入正确的手机号！'
        }
    });
    //邮箱
    $("#email").rules('add',{
        required:true,
        email:true,
        messages:{
            required:'请输入您的邮箱！',
            email:'请输入正确的邮箱！',
        }
    });

    //生日
    $("#birthday").rules('add',{
        required:true,
        date:true,
        messages:{
            required:'请选择生日，如1993-03-29！', 
            date:'生日格式不正确'        
        }

    });
    //密码
    $("#password").rules('add',{
        required:true,
        minlength:6,
        maxlength:20,
        pass:true,
        messages:{
            required:'请输入6-20位密码，数字和字母！',
            minlength:'密码不能小于{0}位！',
            maxlength:'密码不能超过{0}位！',
            pass:'密码不能含数字和字母以外的符号！'
        }
    });
    //确认密码
    $("#notpass").rules('add',{
        required:true,
        equalTo:'#password',
        messages:{
            required:'请再次输入密码',
            equalTo:'密码输入不一致',
        }
    });
    // $(".accept").parents(".form-group").find("i").css("margin-right","5px");
    $("#accept").rules('add',{
        required:true,
        messages:{
            required:'请接受版权声明和隐私保护！'
        },
        highlight : function(element,errorClass){     
            setTimeout(function(){
                if($("#accept-error").get(0)){
                    $("#accept-error").css("display","block")
                    $(".accept").insertBefore("#accept-error");

                }
            },0);        
        },
    });

    // 邮箱自动补全
    
    $("#email").autocomplete({
        delay:0,
        //autoFoucs:true,
        source:function(request,response){
            var hosts = ['qq.com','163.com','126.com','sina.com.cn','263.com'],
                term = request.term, //获取用户输入的内容
                name =term,          //邮箱的用户名
                host ='',            //邮箱的域名
                ix = term.indexOf('@'),  //@的位置
                result = [];
                
            //当有@的时候，重新分配用户名和域名
            if(ix > -1){
                name =term.slice(0,ix);
                host = term.slice(ix+1);
            }
            if(name){
                //如果用户已经输入@和后面的域名，
                //那么就找到相关的提示，比如bnbbs@1,就提示bnbbs@163.com
                //如果用户还没有输入@，那就提示所有域名
                var findedHosts = [];
                if(host){
                    findedHosts = $.grep(hosts,function(value,index){
                        return  value.indexOf(host) > -1
                    });
                }else{
                    findedHosts =hosts;
                }
                var findedResult = $.map(findedHosts,function(value,index){
                    return name+'@'+value;
                })
                if(findedResult==''){
                    result.push(term)
                }

                result = result.concat(findedResult);
            }
            response(result);

        }
    });


    //邮箱验证规则
    $.validator.addMethod('email',function(value,element){
        var email =  /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
        return this.optional(element)||(email.test(value));
    });
    //手机验证规则
    $.validator.addMethod('phone',function(value,element){
        var phone = /^1[3|4|5|7|8][0-9]\d{8}$/;
        return this.optional(element)||(phone.test(value));
    });
    //密码验证规则
    $.validator.addMethod('pass',function(value,element){
        var pass = /^[\w]+$/
        return this.optional(element)||(pass.test(value));
    });
    //生日验证规则
    $.validator.addMethod('date',function(value,element){
        var date = /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/;
        return this.optional(element)||(date.test(value));
    });

    

    


    










	
})