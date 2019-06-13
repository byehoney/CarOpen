window.onload = function () {
    var pathUrl=environment.basePath;
    var mobExist='';
    //图片验证码动态刷新
    $(".tg_code").click(function(){
        $(this).attr("src",pathUrl+"/userInfo/getCode.do?v="+Math.random())
    })
    //弹窗获取主页面手机号
    $(".ex_popup").click(function () {
        if(checkPhone($(".phnum"))){
            if(checkIsExist($(".phnum"))){//老用户
                $('.go_reg').addClass('go_log');
                $('.pop_agr').hide();
            }else{
                $('.go_reg').removeClass('go_log');
                $('.pop_agr').show();
            }
        	$('#mobnum').val($(".phnum").val());
             $(".popup").show();
             $("#overlay").show();;
        }
    })
    $('#overlay').click(function () {
        $(".popup,#overlay").hide();
        $(".popup input").val('');
        $(".tg_code").trigger('click');
    })
    //2手机号输入框聚焦值清空
    $('#mobnum').blur(function(){
        checkPhone($(this))
        if(checkIsExist($(this))){//老用户
            $('.go_reg').addClass('go_log');
            $('.pop_agr').hide();
        }else{
            $('.go_reg').removeClass('go_log');
            $('.pop_agr').show();
        }
    });
    //同意协议
    $('.agree').click(function(){
        $(this).toggleClass('pop_agron');
    });
    //发送短信
    $('#msgcount').on('click',function(){
        var phoneNum = $('#mobnum').val().trim();
        var veCode = $('#input_code').val().trim();
        if($(this).hasClass('reSendCode')){return false;}
        //手机号是否正确
        if(!checkPhone($('#mobnum'))){return false;}
        //图片验证码是否正确
        if (!checked_cod($("#input_code"))) {return false;};
        if(checkIsExist($("#mobnum"))){//老用户
            sendMsg(phoneNum,'20',veCode);
        }else{
            sendMsg(phoneNum,'1',veCode);
        }
    });

    //注册或登录按钮
    $('.go_reg').on('click', function() {
    	if(!checkPhone($("#mobnum"))){return;};//手机号格式是否正确
        if (!checked_cod($("#input_code"))) {//图片验证码是否正确
            return;
        };
        if(!checkValidCode($("#msg_num"))){//短信验证码是否为空
            return;
        };
        if(checkIsExist($("#mobnum"))){
            if(!checkmsgCode($("#msg_num"),$("#mobnum"))){return false;};//短信验证码是否正确
            getWerwolfKillInfo($("#mobnum").val());
            $(".popup").hide();
            $(".popup input").val('');
            $("#overlay").hide();

        }else {
            //是否同意协议
            if(!$('.agree').hasClass('pop_agron')){infoTips('请同意服务协议'); return; };
            goToRegist();
        }
    });

    function sendMsg(phoneNum,authenType,veCode) {
        $.ajax({
            type : "POST",
            url : environment.basePath + "/register/sendNewRegCode.do",
            data : {
                "userMobile" : phoneNum,
                "type" : 8,
                "authenType" : authenType,
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
                    time($('#msgcount'));
                }
            }
        });
    }
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
                mobExist = data.code;
                if(data.code == 1){
                    checkIsExit = true;
                }else{
                    checkIsExit = false;
                }
            }
        });
        return checkIsExit;
    }
    //检查狼人杀id是否绑定
    function getWerwolfKillInfo(mobile) {
        var url = environment.basePath + "/getWerwolfKillInfo.do"
        $.ajax({
            type : "POST",
            url : url,
            async : false,
            cache : false,
            data : {
                "mobile" : mobile
            },
            success : function(data) {
                $('.phbox').css({'font-size': '.24rem','text-align': 'center','line-height': '0.5rem','margin-top': '.55rem','color': '#fff'});
                $('.ex_popup').off('click');
                if(!data.data.werwolfKillId){
                    $('.phbox').html('<p>您的手机号码：'+data.data.mobile+'</p><p>您还未绑定狼人杀ID</p>');
                    $('.ex_popup').css('background-image','url('+environment.basePath+'/resources/image/activity/newwerwolf/bandid.png)');
                    $('.ex_popup').attr('href',environment.basePath+'/newwolfid.do?mobile='+mobile+'&mobExist='+mobExist);
                }else{
                    $('.phbox').html('<p>您的手机号码：'+data.data.mobile+'</p><p>您已绑定狼人杀ID：'+data.data.werwolfKillId+'</p>');
                    $('.ex_popup').css('background-image','url('+environment.basePath+'/resources/image/activity/newwerwolf/toinvest.png)');
                    if(data.data.loanId==0){
                        $('.ex_popup').attr('href',environment.basePath+'/loan/list.do');
                    }else{
                        $('.ex_popup').attr('href',environment.basePath+'/loan/detail/'+data.data.loanId+'.do');
                    }

                }
            }
        });
    }

    function checkValidCode(obj){
        //验证码
        var validNum =  obj.val().trim();
        //判断验证码
        if (validNum.length == 0) {
            obj.focus();
            infoTips('请输入验证码');
            return false;
        }
        return true;
    }
    //验证短信验证码是否正确
    function checkmsgCode(obj,mob){
    	var flag = false;
        //验证码
        var validNum =  obj.val().trim();
        var mobile = mob.val().trim();
        //判断验证码
        if (validNum.length == 0) {
            obj.focus();
            infoTips('请输入验证码');
            return flag;
        }else{
        	$.ajax({
                type : "POST",
                url : environment.basePath + "/werwolfKill/checkValidCode.do",
                async : false,
                cache : false,
                data : {
                    "vcode" : validNum,
                    "moblie" : mobile
                },
                success : function(data) {
                    if (data.code < 0) {
                        infoTips('短信验证码不正确');
                    } else if(data.code == 1){
                    	flag = true;
                    }else if(data.code == 2){
                    	infoTips('请发送短信验证码');
                    };
                }
            });
        }
        return flag;
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
    function checked_cod(obj){
        var checkExit = false;
        var veCode = obj.val().trim();
        if(obj.val()==null || veCode=='' ){
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
    function goToRegist() {
        var mobile = $('#mobnum').val();
        var code = $('#msg_num').val();//短信验证码
        var sr = '狼人杀';
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
            function(data) {
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
                    window.location.href=environment.basePath+'/newwolfid.do?mobile='+mobile+'&mobExist='+mobExist;
                }
            }, "text");
    }

    function infoTips(tip){
        $(".error_msg").html(tip).show();
        setTimeout(function  () {
            $(".error_msg").hide();
        }, 1500)
    }


};



