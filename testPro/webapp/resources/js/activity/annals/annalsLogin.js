$(function () {
    var sendflag = false;
    var flag=$('#flag').val();
    var userId=$('#userId').val();
    var openid=$('#openid').val();
    var token=getUrlParams('token');
    // 登录按钮
    $('.register_btn').click(function () {
        $('.overlay,.redpacketPup').show();
    });

    $('.check_btn,.circusee_btn').click(function () {
        window.location.href = basePath + '/annals/toAnnalsData.do?flag='+flag+'&userId='+userId+'&token='+token;
    })
    $("#img_code_pic").click(function(){
        $(this).attr("src",basePath+"/userInfo/getCode.do?v="+Math.random())
    });

    $('.next_step').unbind('click').click(function () {
        if(!checkPhone($("#mobile_num"))){return;};//手机号码是否正确
        $('#phoneSec').hide();
        $('#msgSec').show();
    });
    $('#pop_msg_count').on('click',function(){
        sendflag = true;
        var phoneNum = $('#mobile_num').val().trim();
        var veCode = $('#img_code').val().trim();
        var authenType='';

        if($(this).hasClass('reSendCode')){return;}
        //手机号是否正确/存在
        if(!checkPhone($('#mobile_num'))){return;}
        //图片验证码是否正确
        if (!checked_cod($("#img_code"))) {
            return;}
        if(checkIsExist($("#mobile_num"))){//已注册
            authenType = 13;
        }else{
            authenType = 1;
        }
        $.ajax({
            type : "POST",
            url : basePath + "/register/sendNewRegCode.do",
            data : {
                "userMobile" : phoneNum,
                "type" : 8,
                "authenType" : authenType,
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
                    time($('#pop_msg_count'));
                }
            }
        });
    });
//用户登录/注册按钮
    $('.go_step').on('click', function() {
        if(!checkPhone($("#mobile_num"))){return;};//手机号码是否正确
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

        if(checkIsExist($("#mobile_num"))){//已注册
            if(checkMsgCode()){
                goToLogin();
            }
        }else{
            goToRegist();
        }

    });
    //注册
    function goToRegist() {
        var mobile = $('#mobile_num').val().trim();
        var code = $('#msg_code').val().trim();//短信验证码
        var url = basePath + "/register/newRegUser.do";
        $.post(url, {
                "mobile" : mobile,
                "authenType" : 1,
                "roles" : 1,
                "verifycode" : code
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
                    infoTips('.errormsg','已3次验证码错误，请24小时后重试');
                    return false;
                } else if (data == 2) {
                    infoTips('.errormsg','请输入密码');
                    return false;
                } else if (data == 6) {
                    infoTips('.errormsg','短信验证码错误');
                    return false;
                } else if (data == 7) {
                    infoTips('.errormsg','验证码已失效，请重新发送');
                    return false;
                } else if (data == 9) {
                    infoTips('.errormsg','注册失败');
                    return false;
                } else {//成功
                    window.location.href=basePath + '/annals/toAnnalsLogin.do?flag='+flag+'&openid='+openid;
                }
        }, "text");
    }
    // 登录
    function goToLogin() {
        var mobile = $('#mobile_num').val().trim();
        var imgcode=$('#img_code').val().trim();//图片验证码
        var code = $('#msg_code').val().trim();//短信验证码
        var url = basePath + "/register/userlogin.do";
        $.post(url, {
                "nickname" : mobile,
                "mobileVCode": code,
                "loanCommentCode":imgcode,
                "loginItem":'vcode',
                "checkedMobileItem":true
            },
            function(data) {
                if (data == 0) {//成功
                    window.location.href=basePath + '/annals/toAnnalsLogin.do?flag='+flag+'&openid='+openid;
                } else if (data == 1) {
                    infoTips('.errormsg','用户名或密码为空');
                } else if (data == 2) {
                    infoTips('.errormsg','用户名或密码错误');
                } else if (data == 10) {
                    infoTips('.errormsg','图片验证码为空');
                } else if (data == 11) {
                    infoTips('.errormsg','图片验证码错误');
                }
                else if (data == 21) {
                    infoTips('.errormsg','短信验证码错误');
                }
            }, "text");
    }
    // 检查短信验证码
    function checkMsgCode() {
        var checkExit = false;
        var msgCode = $('#msg_code').val().trim();//短信验证码
        var mobile = $("#mobile_num").val().trim();
        var reg = /^[0-9]{6}$/;

        if (!reg.test(msgCode)) {
            infoTips('.errormsg','短信验证码错误');
            checkExit = false;
            return false;
        } else {
            $.ajax({
                type : "POST",
                url : basePath+ "/register/newRegCheckCode.do",
                data : {
                    "mobile" : mobile,
                    "verifycode" : msgCode,
                    "authenType" : 13
                },
                async : false,
                cache : false,
                success : function(data) {
                    if (data.code < 0) {
                        infoTips('.errormsg','短信验证码错误');
                        checkExit = false;
                    } else {
                        checkExit = true;
                    }
                }
            });
        }
        return checkExit;
    }
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
    //检查是否为空
    function checkIsEmpty(obj){
        var validNum =  obj.val().trim();
        if (validNum.length == 0) {
            obj.focus();
            return true;
        }
        return false;
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
            $(obj).hide().html('');
        }, 2000)
    }

    function getUrlParams (flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
})
