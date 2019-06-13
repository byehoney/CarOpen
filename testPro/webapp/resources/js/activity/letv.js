window.onload = function () {
    var pathUrl=environment.basePath;
    //弹窗获取主页面手机号
    $(".ex_popup").click(function () {
        if(!checkPhone($(".phnum"))){return;};
        if(checkIsExist($(".phnum"))){//手机号存
        	return;
        };
        if(!$(".pop_msg_count").hasClass('reSendCode')){
        	 $(".pop_msg_count").html('立即发送');
        }
       
        $(".img_code").click();
        $(".popup input").val('');
        $(".popup").show();
        showOverlay();
        $('.btn_mobnumber').val($(".phnum").val());
    })
    
    //2手机号输入框聚焦值清空
    $('.btn_mobnumber').blur(function(){
        checkPhone($(this))
    });
    //图片验证码动态刷新
    $(".img_code").click(function(){
        $(this).attr("src",pathUrl+"/userInfo/getCode.do?v="+Math.random())
    })
     $('.pop_msg_count').on('click',function(){
        //获取短信验证码按钮交互
        var phoneNum = $('.btn_mobnumber').val().trim();
        var veCode = $('#input_code').val().trim();
        if($(this).hasClass('reSendCode')){return false;}
        //手机号是否正确
        if(!checkPhone($('.btn_mobnumber'))){return false;}
        if(checkIsExist($(".btn_mobnumber"))){return false;};
        //图片验证码是否正确
        if (!checked_cod($('#input_code'))) {return false;};
       
        $.ajax({
            type : "POST",
            url : environment.basePath + "/register/sendNewRegCode.do",
            data : {
                "userMobile" : phoneNum,
                "type" : 8,
                "authenType" : 1,
                "veCode" : veCode
            },
            success : function(data) {
                if (data.code == -3) {
                	infoTips($(".errormsg"),data.msg);
                }else if (data.code == -2) {
                    infoTips($(".errormsg"),data.msg);
                } else if(data.code == -1) {
                    infoTips($(".errormsg"),data.msg);
                }else {
                    time($('.pop_msg_count'));
                }
            }
        });
    });
    //同意协议
    $('.agree').click(function(){
        $(this).toggleClass('pop_agron');
    });
    //弹窗点击注册按钮
    $('.go_reg').on('click', function() {
        //是否同意协议
        if(!$('.agree').hasClass('pop_agron')){infoTips($(".errormsg"),'请同意服务协议'); return; };
        //手机号码是否正确
        if(!checkPhone($(".btn_mobnumber"))){return;};
        if(checkIsExist($(".btn_mobnumber"))){return false;};
        if (!checked_cod($('#input_code'))) {//图片验证码是否正确
            return;
        };
        if(!checkValidCode($('#msg_num'))){//短信验证码
            return;
        };
        goToRegist();
    });
$(".couse_btn").click(function(){
	  $(".popup").hide();
	  $("#overlay").hide();
})
   
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
            	   infoTips($(".errormsg"),'您已经注册过啦，把机会留给别人吧');
            	   checkIsExit = true;              
            	}else{
            	   checkIsExit = false;
               }
            }
        });
    	return checkIsExit;
    }
    //检查短信验证码
    function checkValidCode(obj){
        var validNum =  obj.val().trim();
        if (validNum.length == 0) {
            obj.focus();
            infoTips($(".errormsg"),'请输入短信验证码');
            return false;
        }
        return true;
    }
    //检查手机号格式
    function checkPhone(obj) {
        var checkExit = false;
        var reg = /^1[3-9]\d{9}$/;
        var phone_val = obj.val();
        if (phone_val == '' || phone_val == null) {
            infoTips($(".errormsg"),'手机号不能为空');
            $(".phnum").focus();
            $('.btn_mobnumber').focus();
            return false;
        } else if (!reg.test(phone_val)) {
            infoTips($(".errormsg"),'请输入正确的11位手机号');
            $(".phnum").focus();
            $('.btn_mobnumber').focus();
            return false;
        } else {
            checkExit = true;
        }
        return checkExit;
    }
    //短信发送倒计时
    function time(obj) {
        var time = 59, timer;
        if(obj.hasClass('reSendCode')){
        	return;
        }
        obj.addClass('reSendCode').html('重新发送('+time+'s)');
        timer = setInterval(function() {
            if (time == 0) {
                clearInterval(timer);
                obj.html('重新发送');
                obj.removeClass('reSendCode');
            } else {
                time--;
                obj.html('重新发送('+time+'s)');
            }
        }, 1000);
    }

// 图片验证码--完成
    function checked_cod(obj){
        var checkExit = false;
        var veCode = obj.val().trim();
        if(obj.val()==null || veCode=='' ){
            infoTips($(".errormsg"),'请输入图形验证码');
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
                    infoTips($(".errormsg"),'图形验证码不正确');
                    $(".img_code").click();
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
        var mobile = $('.btn_mobnumber').val();
        var code = $('#msg_num').val();//短信验证码
        var sr = '';
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
                    infoTips($(".errormsg"),'请输入验证码');
                    return false;
                } else if (data == 0) {
                    infoTips($(".errormsg"),'请输入手机号');
                    return false;
                } else if (data == 1) {
                    infoTips($(".errormsg"),'手机号码格式错误');
                    return false;
                } else if (data == 10) {
                    infoTips($(".errormsg"),'您已经注册过啦，把机会留给别人吧');
                    return false;
                } else if (data == 8) {
                    infoTips($(".errormsg"),'请先获取验证码');
                    return false;
                } else if (data == 5) {
                    infoTips($(".errormsg"),'已3次验证码错误，请24小时后重试');
                    return false;
                } else if (data == 2) {
                    infoTips($(".errormsg"),'请输入密码');
                    return false;
                } else if (data == 6) {
                    infoTips($(".errormsg"),'短信验证码错误');
                    return false;
                } else if (data == 7) {
                    infoTips($(".errormsg"),'短信验证码已失效，请重新发送');
                    return false;
                } else if (data == 9) {
                    infoTips($(".errormsg"),'注册失败');
                    return false;
                } else {
        			$('.go_reg').off('click').css({background:'#b8b8b8'});
                	getLoan();
                }
            }, "text");
    }

function getLoan(){//新手项目loanid
	$.ajax({
		url:environment.basePath + "/newproject.do",
		datatype:"text",
		 type : "POST",
		success:function(data){
	        window.location.href=environment.basePath +"/loan/detail/"+data+".do";
		}
	})
}
    function infoTips(el,tip){
        el.html(tip).show();
        setTimeout(function  () {
            el.hide();
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



