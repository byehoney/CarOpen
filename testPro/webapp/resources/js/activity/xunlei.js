window.onload = function () {
	var loanId = $('#loanId').val();
	var sendflag=false;
	var loginFlag=true;
	var logstatus=$("#logstatus").val();
    var xluserid=$("#xluserid").val();
    var referfrom=$("#referfrom").val();
    
	if(logstatus<0||logstatus=='null'){//值为-1时，未登录迅雷账号
		$(".overlay").show();
		$(".warmTip").show();
	};
	$(".rule_btn").click(function(){
	    $(".activity_rules,.overlay_two").show();
        $(".rules_count").niceScroll().hide().show().resize();
    })
    $(".close_btn").click(function(){
        $(".activity_rules,.overlay_two").hide();
    })

    $('.regLoginModule .gone a').click(function(){
        $(this).parents('.gone').hide().siblings('.gone').show();
        $('.regLoginModule input').val('');
        $("#img_code_pic").click();
        if($(this).text()=="登录"){
            $('.msgLi,.agree,#go_reg').hide();
            $('#go_login').show();
            $('.regLoginModule p.bind').hide();
        }else{
            $('.msgLi,.agree,#go_reg').show();
            $('#go_login').hide();
            $('.regLoginModule p.bind').show()
        }
    })
	
    //图片验证码动态刷新
    $("#img_code_pic").click(function(){
        $(this).attr("src",basePath+"/userInfo/getCode.do?v="+Math.random())
    })

    //同意协议
    $('.radio').click(function(){
        $(this).toggleClass('pop_agron');
    });
    //用户注册按钮
    $('#go_reg').on('click', function() {
        if(loginFlag){
            if(!checkPhone($("#mobile_num"))){return;};//手机号码是否正确
            if(checkIsExist($("#mobile_num"))){
                infoTips('.errormsg','该手机号码已经注册，请直接登录');
                return;};//手机号码是否存在
            if (!checked_cod($("#img_code"))) {//图片验证码是否为空
                return;
            };
            if(!sendflag){
                infoTips('.errormsg','请先发送短信验证码');
                return;
            }
            if(!checkValidCode($("#msg_code"))){//短信验证码是否为空
                return;
            };
            if(!checkPassword($("#password"))){//密码是否为空
                return;
            };

            //是否同意协议
            if(!$('.radio').hasClass('pop_agron')){infoTips('.errormsg','请同意服务协议'); return; };
            goToRegist();
        }
    });
    
  //用户登录
    $('#go_login').on('click', function() {
    	if(!checkPhone($("#mobile_num"))){return;};//手机号码是否正确
    	if(!checkIsExist($("#mobile_num"))){
    		infoTips('.errormsg','该手机号码未注册，请先注册');
    		return;};//手机号码是否存在
        if (!checked_cod($("#img_code"))) {//图片验证码是否正确
            return;
        };
        if(!checkPassword($("#password"))){//密码是否为空
            return;
        };
        goToLogin();
    });

    //发送短信
    var isSend=true;
    $('.pop_msg_count').on('click',function(){
        //获取短信验证码按钮交互
        var phoneNum = $('#mobile_num').val().trim();
        var veCode = $('#img_code').val().trim();
        sendflag = true;
        if($(this).hasClass('reSendCode')){return false;}
        //手机号是否正确/存在
        if(!checkPhone($('#mobile_num'))){return false;}
        if(checkIsExist($("#mobile_num"))){
        	infoTips('.errormsg','该手机号码已经注册，请直接登录');
        	return false;}
        //图片验证码是否正确
        if (!checked_cod($("#img_code"))) {
        	return false;};
        if(isSend){
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
        }
        
    });
    
    
    function checkPhone(obj) {
        var checkExit = false;
        var reg = /^1[3-9]\d{9}$/;
        var phone_val = obj.val();
        if (phone_val == '' || phone_val == null) {
            infoTips('.errormsg','手机号不能为空');
            $('#mobile_num').focus();
            return false;
        } else if (!reg.test(phone_val)) {
            infoTips('.errormsg','请输入正确的11位手机号');
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
    
    function checkValidCode(obj){
        //验证码
        var validNum =  obj.val().trim();
        //判断验证码
        if (validNum.length == 0) {
            obj.focus();
            infoTips('.errormsg','请输入验证码');
            return false;
        }
        return true;
    }
    function checkPassword(obj){
        //验证码
        var validNum =  obj.val().trim();
        //判断验证码
        if (validNum.length == 0) {
            obj.focus();
            infoTips('.errormsg','请输入密码');
            return false;
        }else if(validNum.length<6||validNum.length>16){
        	obj.focus();
            infoTips('.errormsg','密码格式不正确，请重新输入');
            return false;
        }
        return true;
    } 

    //短信发送倒计时
    function time(obj) {
        var time = 59, timer;
        clearInterval(timer);
        obj.html('重新发送('+time+'s)');
        obj.addClass('reSendCode');
        timer = setInterval(function() {
            if (time == 0) {
            	isSend=true;
                clearInterval(timer);
                obj.html('重新发送');
                obj.removeClass('reSendCode');
                $("#img_code_pic").click();//图形验证码刷新
            } else {
            	isSend=false;
                time--;
                obj.html('重新发送('+time+'s)');
            }
        }, 1000);
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

    //注册--完成
    function goToRegist() {
        loginFlag=false;
    	var mobile = $('#mobile_num').val().trim();
        var code = $('#msg_code').val().trim();//短信验证码
        var sr = 'xunleiWAP';
        var pwd =$('#password').val().trim();       
        var url = basePath + "/register/newRegUser.do";
        $.post(url, {
                "mobile" : mobile,
                "authenType" : 1,
                "roles" : 1,
                "verifycode" : code,
                "password": $.md5(pwd),
                "sr":sr,
                'xluserid':xluserid,
                'referfrom':referfrom
            },
            function(data) {
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
                    infoTips('.errormsg','已3次验证码错误，请24小时后重试');
                    return false;
                } else if (data == 2) {
                    infoTips('.errormsg','请输入密码');
                    return false;
                } else if (data == 6) {
                    infoTips('.errormsg','验证码错误');
                    return false;
                } else if (data == 7) {
                    infoTips('.errormsg','验证码已失效，请重新发送');
                    return false;
                } else if (data == 9) {
                    infoTips('.errormsg','注册失败');
                    return false;
                } else {//成功
                	if(loanId!=-2&&loanId!='null'){
                 		  window.location.href = basePath +"/loan/detail/"+loanId+".do";
                 	  }else{
                 		  window.location.href=basePath + '/loan/list.do';
                 	  }
                }
            }, "text");
        setTimeout(function () {
            loginFlag=true;
        },2000)
    }
    //登录
    function goToLogin() {
    	 var mobile = $('#mobile_num').val().trim();
         var imgcode=$('#img_code').val().trim();
         var pwd =$('#password').val().trim(); 
               
        var url = basePath + "/register/userlogin.do";
        $.post(url, {
        	"nickname" : mobile,
            "password": $.md5(pwd),
           "loanCommentCode":imgcode,
           "loginItem":"password",
           "checkedMobileItem":false
            },
            function(data) {
                if (data == 0) {//成功
                	if(loanId!=-2&&loanId!='null'){
               		  window.location.href = basePath +"/loan/detail/"+loanId+".do";
               	  }else{
               		  window.location.href=basePath + '/loan/list.do';
               	  }
                } else if (data == 1) {
                	infoTips('.errormsg','用户名或密码为空');
                } else if (data == 2) {
                	infoTips('.errormsg','用户名或密码错误');
                } else if (data == 10) {
                	infoTips('.errormsg','验证码为空');
                } else if (data == 11) {
                	infoTips('.errormsg','验证码错误');
                }
                else if (data == 21) {
                	infoTips('.errormsg','短信验证码登录错误');
                }
            }, "text");
    }

    function infoTips(ele,tip){
        $(ele).html(tip);
        setTimeout(function  () {
            $(ele).html('');
        }, 2000)
    }
    var mySwiper = new Swiper('.swiper-container',{
        autoplay:2000,
        loop: true,
        pagination : '.swiper-pagination'
    })

    $(".rules_count").niceScroll({
        cursorwidth:8,
        cursorcolor:'#ca7a5c',
        cursorborder:'none',
        cursorborderradius:8,
        autohidemode:false,
        background:'#efc28f',
        railoffset:'top'
    });

};



