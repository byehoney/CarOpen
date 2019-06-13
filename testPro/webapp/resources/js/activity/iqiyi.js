window.onload = function () {
    var pathUrl=environment.basePath;
    //图片验证码动态刷新
    $(".tg_code").click(function(){
        $(this).attr("src",pathUrl+"/userInfo/getCode.do?v="+Math.random())
    })
    //弹窗获取主页面手机号.
    $(".ex_popup").click(function () {
        if(checkPhone($(".phnum"))){
        	if(!checkIsExist($(".phnum"))){
	    		 $(".popup").show();
	             showOverlay();
	             $('.btn_mobnumber').val($(".phnum").val());
        	}
        }
    })
    
    function checkPhone(obj) {
        var checkExit = false;
        var reg = /^1[3-9]\d{9}$/;
        var phone_val = obj.val();
        if (phone_val == '' || phone_val == null) {
            infoTips('手机号不能为空');
            $(".phnum").focus();
            $('.btn_mobnumber').focus();
            return false;
        } else if (!reg.test(phone_val)) {
            infoTips('请输入正确的11位手机号');
            $(".phnum").focus();
            $('.btn_mobnumber').focus();
            return false;
        } else {
            checkExit = true;
        }
        return checkExit;
    }
    
    //检查手机号是否被注册
    function checkIsExist(obj) {
    	var checkIsExit = false;
    	var mobile = obj.val();
    	var url = environment.basePath + "/checkMobileIsExist.do"
    	$.ajax({
            type : "POST",
            url : url,
            async : false,
            cache : false,
            data : {
            	"mobile" : mobile
            },
            success : function(data) {
               if(data.code == 1){
            	   infoTips('手机号已存在');
            	   checkIsExit = true;              
            	}else{
            	   checkIsExit = false;
               }
            }
        });
    	return checkIsExit;
    }
    
    //2手机号输入框聚焦值清空
    $('.btn_mobnumber').blur(function(){
        checkPhone($(this))
    });
    //同意协议
    $('.agree').click(function(){
        $(this).toggleClass('pop_agron');
    });
    //弹窗点击注册按钮
    $('.go_reg').on('click', function() {
    	if(!checkPhone($(".btn_mobnumber"))){return;};//手机号码是否正确
    	if(checkIsExist($(".btn_mobnumber"))){return;};//手机号码是否存在
        if (!checked_cod()) {//图片验证码是否正确
            return;
        };
        if(!checkValidCode()){//短信验证码
            return;
        };
      //是否同意协议
        if(!$('.agree').hasClass('pop_agron')){infoTips('请同意服务协议'); return; };
        goToRegist('iqiyidone.do');
    });

    $('.pop_msg_count').on('click',function(){
        //获取短信验证码按钮交互
        var phoneNum = $('.btn_mobnumber').val().trim();
        var veCode = $('#input_code').val().trim();
        var isSend = true;
        if($(this).hasClass('reSendCode')){return false;}
        //手机号是否正确/存在
        if(!checkPhone($('.btn_mobnumber'))){return false;}
        if(checkIsExist($(".btn_mobnumber"))){return false;}
        //图片验证码是否正确
        if (!checked_cod()) {return false;};
        
        $.ajax({
            type : "POST",
            url : environment.basePath + "/register/sendNewRegCode.do",
            data : {
                "userMobile" : phoneNum,
                "type" : 8,
                "authenType" : 1,
                "veCode" : veCode
            },
            cache: false,
            success : function(data) {
                if (data.code == -3) {
                    infoTips(data.msg);
                }else if (data.code == -2) {
                    infoTips(data.msg);
                } else if(data.code == -1) {
                    infoTips(data.msg);
                }else {
                    time($('.pop_msg_count'));
                }
            }
        });
    });
    function checkValidCode(){
        //验证码
        var validNum =  $('#msg_num').val().trim();
        //判断验证码
        if (validNum.length == 0) {
            $('#msg_num').focus();
            infoTips('请输入验证码');
            return false;
        }
        return true;
    }

    //短信发送倒计时
    function time(obj) {
        var time = 59, timer;
        clearInterval(timer);
        obj.html('重新发送('+time+'s)');
        obj.removeClass('sendCode');
        obj.addClass('reSendCode');
        timer = setInterval(function() {
            if (time == 0) {
                clearInterval(timer);
                obj.html('重新发送');
                obj.addClass('sendCode');
                obj.removeClass('reSendCode');
                $(".tg_code").click();
            } else {
                time--;
                obj.html('重新发送('+time+'s)');
            }
        }, 1000);
    }

// 图片验证码--完成
    function checked_cod(){
        var checkExit = false;
        var veCode = $('#input_code').val().trim();
        if($("#input_code").val()==null || veCode=='' ){
            infoTips('请输入图片验证码');
            return;
        };
        $.ajax({
            type : "POST",
            url : environment.basePath + "/register/checkCode.do",
            async : false,
            cache : false,
            data : {
                "veCode" : veCode
            },
            success : function(data) {
                if (data.code < 0) {
                    infoTips('图片验证码不正确');
                    checkExit = false;
                } else {
                    checkExit = true;
                }
            }
        });

        return checkExit;
    }

    //注册--完成
    function goToRegist(arg) {
        var mobile = $('.btn_mobnumber').val();
        var code = $('#msg_num').val();//短信验证码
        var sr = '爱奇艺';
        var pwd = '';

        var url = environment.basePath + "/register/newRegUser.do";
        $.post(url, {
                "mobile" : mobile,
                "authenType" : 1,
                "roles" : 1,
                "verifycode" : code,
                "sr":sr,
                "password": pwd
            },
            function(data, varStatus) {
                if (data == 4) {
                    infoTips('请输入验证码');
                    return false;
                } else if (data == 0) {
                    infoTips('请输入手机号');
                    return false;
                } else if (data == 1) {
                    infoTips('手机号码格式错误');
                    return false;
                } else if (data == 10) {
                    infoTips('手机号已存在');
                    return false;
                } else if (data == 8) {
                    infoTips('请先获取验证码');
                    return false;
                } else if (data == 5) {
                    infoTips('<p>已3次验证码错误，</p><p>请24小时后重试</p>');
                    return false;
                } else if (data == 2) {
                    infoTips('请输入密码');
                    return false;
                } else if (data == 6) {
                    infoTips('验证码错误');
                    return false;
                } else if (data == 7) {
                    infoTips('<p>验证码已失效，</p><p>请重新发送</p>');
                    return false;
                } else if (data == 9) {
                    infoTips('注册失败');
                    return false;
                } else {
                    window.location.href=environment.basePath+'/'+arg+'';
                }
            }, "text");
    }


    function infoTips(tip){
        $(".error_msg").html(tip).show();
        setTimeout(function  () {
            $(".error_msg").hide();
        }, 1500)
    }

    function showOverlay() {
        var pageHeight=$(document).height();
        var pageWidth=$(document).width();
        $("#overlay").height(pageHeight);
        $("#overlay").width(pageWidth);
        $("#overlay").show();
    }

};



