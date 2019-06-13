$(function () {
    // var rcode=3;
    var sendflag=false;
    var rcode=$('#code').val();
    var openId='';
    var nickName='';
    var headImgUrl='';
    //1、首页领取按钮
    $('#receiveBtn').click(function () {
        window.location.href = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx91de33454c7f56f2&redirect_uri=https%3a%2f%2fm.zhongzairong.cn%2fwx%2foauth.do&response_type=code&scope=snsapi_userinfo&state=taili#wechat_redir';
        //window.location.href = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc9c86e867be64488&redirect_uri=http%3a%2f%2f192.168.6.141%3a8080%2fwx%2foauth.do&response_type=code&scope=snsapi_userinfo&state=taili#wechat_redir';
    })
    //2、手机号判断
    if(rcode == 0){
        openId=$('#openId').val();
        nickName=$('#nickName').val();
        headImgUrl=$('#headImgUrl').val();

        $('#nextStep').click(function () {
            var mob=$("#mobile_num").val();
            if(!checkPhone($("#mobile_num"))){return;};//手机号码是否正确
            if(checkIsExist($("#mobile_num"))){
                getRedpackage(openId,nickName,headImgUrl,mob);
            }else {
                $('#pop02,#receive').show();
                $('#pop01,#nextStep').hide();
            }
        })
        $("#img_code_pic").click(function(){
            $(this).attr("src",basePath+"/userInfo/getCode.do?v="+Math.random())
        })
        $('.redpacket_pup .close_btn').click(function () {
            $('.redpacket_pup,.overlay').hide();
            $('.redpacket_pup input').val('');
        })
        //立即领取按钮点击出弹窗
        $('#popupBtn').click(function () {
            $('.redpacket_pup,.overlay,#pop01,#nextStep').show();
            $('#pop02,#receive').hide();
        })


    //    发送短信验证码
        $('#pop_msg_count').on('click',function(){
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
                        time($('#pop_msg_count'));
                    }
                }
            });

        });
        //用户注册按钮
        $('#receive').on('click', function() {
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
            goToRegist();
        });
    }
    //领取红包
    function getRedpackage(openid,name,imgurl,mob) {
        $.ajax({
            url: basePath+'/taili/takeRedPackage.do',
            type: 'POST',
            data:{
                openId :openid,
                nickName : name,
                headImgUrl : imgurl,
                mobile:mob
            },
            success:function (rdata) {
                if(rdata.code == 0){//领取成功
                    window.location.href = basePath+'/taili/takeRedPackage/success.do?amount='+rdata.data.amount+'&month='+rdata.data.month;
                }else if(rdata.code == 1){//已领取
                    window.location.href = basePath+'/taili/takeRedPackage/tips.do?code=6';
                }else if(rdata.code == 2){
                    window.location.href = basePath+'/taili/takeRedPackage/tips.do?code=-1';
                }
            }
        })
    }
    function goToRegist() {
        var mobile = $('#mobile_num').val().trim();
        var code = $('#msg_code').val().trim();//短信验证码
        var url = basePath + "/register/newRegUser.do";
        $.post(url, {
                "mobile" : mobile,
                "authenType" : 1,
                "verifycode" : code,
                "sr":'taili',
                "roles":"1"
            },
            function(data, varStatus) {
                if (data == 0) {
                    infoTips('.errormsg','请输入手机号');
                    return false;
                } else if (data == 1) {
                    infoTips('.errormsg','手机号码格式错误');
                    return false;
                }else if (data == 2) {
                    infoTips('.errormsg','请输入密码');
                    return false;
                }else if (data == 4) {
                    infoTips('.errormsg','请输入验证码');
                    return false;
                }else if (data == 5) {
                    infoTips('.errormsg','<p>已3次验证码错误，</p><p>请24小时后重试</p>');
                    return false;
                } else if (data == 6) {
                    infoTips('.errormsg','短信验证码错误');
                    return false;
                } else if (data == 7) {
                    infoTips('.errormsg','<p>验证码已失效，</p><p>请重新发送</p>');
                    return false;
                }else if (data == 8) {
                    infoTips('.errormsg','请先获取验证码');
                    return false;
                }  else if (data == 9) {
                    window.location.href = basePath+'/taili/takeRedPackage/tips.do?code=-1';
                    return false;
                }else if (data == 10) {
                    // infoTips('.errormsg','手机号已存在');
                    getRedpackage(openId,nickName,headImgUrl,mobile);
                    return false;
                } else {//成功
                    getRedpackage(openId,nickName,headImgUrl,mobile);
                }
            }, "text");
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

})
