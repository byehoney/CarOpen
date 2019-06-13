$(function(){
	var sendflag=false;
	$("#popup01").click(function(){
		if(!checkPhone($(".phnum"))){return;};//手机号码是否正确
    	if(checkIsExist($(".phnum"))){
    		infoTips('.errormsg','该手机号码已经注册');
    		return;};//手机号码是否存在
    		//是否同意协议
            if(!$('.agree').hasClass('pop_agron')){infoTips('.errormsg','请同意服务协议'); return; };
    		 $(".verify").show();
    		 showOverlay(".overlay")
             $('#mobile_num').val($(".phnum").val());
	})
	
	$('.return_top').click(function(){
        $('html, body').animate({
            scrollTop: $(".ali01").offset().top,
        }, 500 ,function(){
            $(".phnum").focus();
        });
    })
    
	$("#img_code_pic").click(function(){
        $(this).attr("src",basePath+"/userInfo/getCode.do?v="+Math.random())
    })	
    $('.agree').click(function(){
        $(this).toggleClass('pop_agron');
    });
//    发送短信验证码
	$('.pop_msg_count').on('click',function(){
		sendflag=true;
        var phoneNum = $('#mobile_num').val().trim();
        var veCode = $('#img_code').val().trim();
        
        if($(this).hasClass('reSendCode')){return;}
        //手机号是否正确/存在
        if(!checkPhone($('#mobile_num'))){return;}
        if(checkIsExist($("#mobile_num"))){
        	infoTips('.errormsg','该手机号码已经注册');
        	return;}
        //图片验证码是否正确
        if (!checked_cod($("#img_code"))) {
        	return;};
        	$.ajax({
                type : "POST",
                url : basePath + "/register/sendNewRegCode.do",
                data : {
                    "userMobile" : phoneNum,
                    "type" : 8,
                    "authenType" : 1,
                    "veCode" : veCode
                },
                cache: false,
                success : function(data) {
                    if (data.code == -3) {
                        infoTips('.errormsg',data.msg);
                    }else if (data.code == -2) {
                        infoTips('.errormsg',data.msg);
                        $("#img_code_pic").click();
                    } else if(data.code == -1) {
                        infoTips('.errormsg',data.msg);
                    }else {
                    	isSend=false;
                        time($('.pop_msg_count'));
                    }
                }
            });
        
    });
	
	 //用户注册按钮
    $('#go_reg').on('click', function() {
    	if(!checkPhone($("#mobile_num"))){return;};//手机号码是否正确
    	if(checkIsExist($("#mobile_num"))){
    		infoTips('.errormsg','该手机号码已经注册');
    		return;};//手机号码是否存在
        if (!checked_cod($("#img_code"))) {//图片验证码
            return;
        };
        if(!sendflag){
        	infoTips('.errormsg','请先发送短信验证码');
        	return;
        }
        if(checkIsEmpty($("#msg_code"))){//短信验证码是否为空
        	infoTips('.errormsg','请输入短信验证码');
            return;
        };
        if(!checkPassword($("#password"))){//密码
            return;
        };
        goToRegist();
    });
    $(".serve_btn").click(function(){
    	showOverlay(".overlay");
    	$(".serve").show();
    })
    $(".secret_btn").click(function(){
    	showOverlay(".overlay");
    	$(".secret").show();
    })
    $(".xyjsp .closebtn").click(function(){
    	$(".xyjsp").hide();
    	$(".overlay").hide();
    })
    $(".verify .closebtn").click(function(){
    	$(".verify").hide();
    	$(".overlay").hide();
    })
     $(".rewardPopup .closebtn").click(function(){
    	$(".rewardPopup").hide();
    	$(".overlay").hide();
    })
	$(".overlay").click(function(){
		$(".verify").hide();
		$(".xyjsp").hide();
		$(".rewardPopup").hide();
		$(".overlay").hide();
	})
	
	
	function checkPhone(obj) {
        var checkExit = false;
        var reg = /^1[3-9]\d{9}$/;
        var phone_val = obj.val();
        if (phone_val.length == 0) {
        	infoTips('.errormsg','手机号不能为空');
            $(".phnum").focus();
            $('#mobile_num').focus();
            return false;
        } else if (!reg.test(phone_val)) {
        	infoTips('.errormsg','请输入正确的11位手机号码');
            $(".phnum").focus();
            $('#mobile_num').focus();
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
    	var url = basePath + "/checkMobileIsExist.do"
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
            	   checkIsExit = true; 
            	}else{
            	   checkIsExit = false;
               }
            }
        });
    	return checkIsExit;
    }
 // 图形验证
    function checked_cod(obj){
        var checkExit = false;
        var veCode = obj.val().trim();
        if(veCode.length == 0 ){
        	infoTips('.errormsg','请输入图片验证码');
            return;
        };
        $.ajax({
            type : "POST",
            url : basePath + "/register/checkCode.do",
            async : false,
            cache : false,
            data : {
                "veCode" : veCode
            },
            success : function(data) {
                if (data.code < 0) {
                	infoTips('.errormsg','图片验证码不正确');
                	$("#img_code_pic").click();
                    checkExit = false;
                } else {
                    checkExit = true;
                }
            }
        });
        return checkExit;
    }
//    验证密码
    function checkPassword(obj){
        //验证码
        var validNum =  obj.val().trim();
        //判断验证码
        if (validNum.length == 0) {
            return true;
        }else if(validNum.length<6||validNum.length>16){
        	obj.focus();
            infoTips('.errormsg','密码格式不正确，请重新输入');
            return false;
        }
        return true;
    } 
    function checkIsEmpty(obj){
        //验证码
        var validNum =  obj.val().trim();
        //判断验证码
        if (validNum.length == 0) {
            obj.focus();
            return true;
        }
        return false;
    }
  //注册--完成
    function goToRegist() {
    	var mobile = $('#mobile_num').val().trim();
        var code = $('#msg_code').val().trim();//短信验证码
        var pwd =$('#password').val().trim();       
        var url = basePath + "/register/newRegUser.do";
        $.post(url, {
                "mobile" : mobile,
                "authenType" : 1,
                "roles" : 1,
                "verifycode" : code,
                "password": $.md5(pwd)
            },
            function(data, varStatus) {
                if (data == 4) {
                    infoTips('.errormsg','请输入验证码');
                    return false;
                } else if (data == 0) {
                    infoTips('.errormsg','请输入手机号');
                    return false;
                } else if (data == 1) {
                    infoTips('.errormsg','手机号码格式错误');
                    return false;
                } else if (data == 10) {
                    infoTips('.errormsg','手机号已存在');
                    return false;
                } else if (data == 8) {
                    infoTips('.errormsg','请先获取验证码');
                    return false;
                } else if (data == 5) {
                    infoTips('.errormsg','<p>已3次验证码错误，</p><p>请24小时后重试</p>');
                    return false;
                } else if (data == 2) {
                    infoTips('.errormsg','请输入密码');
                    return false;
                } else if (data == 6) {
                    infoTips('.errormsg','验证码错误');
                    return false;
                } else if (data == 7) {
                    infoTips('.errormsg','<p>验证码已失效，</p><p>请重新发送</p>');
                    return false;
                } else if (data == 9) {
                    infoTips('.errormsg','注册失败');
                    return false;
                } else {//成功
                 		  window.location.href=basePath + '/toChanneldone.do?bgcolor=ffc000';
                }
            }, "text");
    }
    //短信发送倒计时
    function time(obj) {
        var time = 59, timer;
        clearInterval(timer);
        obj.html('重新发送('+time+'s)');
        obj.addClass('reSendCode');
        timer = setInterval(function() {
            if (time == 0) {
                clearInterval(timer);
                obj.html('重新发送');
                obj.removeClass('reSendCode');
                $("#img_code_pic").click();//图形验证码刷新
            } else {
                time--;
                obj.html('重新发送('+time+'s)');
            }
        }, 1000);
    }
	
    function infoTips(obj,tip){
        $(obj).html(tip).show();
        setTimeout(function  () {
        	$(obj).hide();
        }, 2000) 
    }
    function showOverlay(obj) {
        var pageHeight=$(document).height();
        var pageWidth=$(document).width();
        $(obj).height(pageHeight);
        $(obj).width(pageWidth);
        $(obj).show();
    }
	
    $('.prizeImg span').click(function(){
    	showOverlay(".overlay");
    	$('.rewardPopup').show();
    })
})