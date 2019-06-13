/**
 * Created by HFJK on 2017/11/22.
 */
var token,phoneNum;
$('.Firststep').click(function(){
    if(!checkPhone($('#mobile_num'))){
        return;
    };
    $.ajax({
        url:basePath+'/validationUserInfo.do',
        type:"POST",
        data:{mobile:$('#mobile_num').val()},
        success:function(data){
            if(data.code==0){
                token = data.data.token;
                $('.step1').hide();
                $('.overlay,.step2').show();
                $('.errormsg').html('');
                phoneNum = $('#mobile_num').val();
            }
        }
    })
});
$('#img_code_pic').click(function(){
    $(this).attr('src',basePath+'/userInfo/getCode.do?v='+Math.random()*1000);
});
$('.pop_msg_count').click(function(){
    if(!bool){
        return;
    };
    var imgCode = $('#img_code').val();
    if(!checkPhone($('#mobile_num'))){
        return;
    };
    if(imgCode==''){
        showErr($('.errormsg'),'请输入图片验证码');
        return;
    };
    $.ajax({
        url:basePath+'/graphiccode.do',
        type:"POST",
        data:{
            mobile:phoneNum,
            veCode:imgCode
        },
        success:function(data){
            if(data.code==-1){
                showErr($('.errormsg'),'校验码错误');
                $('#img_code_pic').attr('src',basePath+'/userInfo/getCode.do?v='+Math.random()*1000);
            }else if(data.code==1){
                time($('.pop_msg_count'))
            }else if(data.code==-2){
                showErr($('.errormsg'),'短信发送失败');
            }
        }
    })

});
$('.draw_btn').click(function(){
    var imgCode = $('#img_code').val();
    var msgCode = $('#msg_code').val();
    if(!checkPhone($('#mobile_num'))){
        return;
    };
    if(imgCode==''){
        showErr($('.errormsg'),'请输入图片验证码');
        return;
    };
    if(msgCode==''){
        showErr($('.errormsg'),'请输入短信验证码');
        return;
    };
    $.ajax({
        url:basePath+'/grantRedPackagesForCoupon.do',
        type:'post',
        data:{
            token:token,
            mobile:phoneNum,
            verifycode:msgCode,
            veCode:imgCode
        },
        success:function(data){
            if(data.code==0){
                showErr($('.errormsg'),'加息劵发放失败');
            }else if(data.code==2){//已发
                $('.has').show();
                $('.step2').css('z-index',0);
            }else if(data.code==-1){
                showErr($('.errormsg'),'校验码错误');
                $('#img_code_pic').attr('src',basePath+'/userInfo/getCode.do?v='+Math.random()*1000);
            }else if(data.code==1){//发成功
                $('.hasNot').show();
                $('.step2').css('z-index',0);
            }else if(data.code==-4){
                showErr($('.errormsg'),'短信验证错误');
            }else if(data.code==-2){
                showErr($('.errormsg'),data.msg);
            }else{
                showErr($('.errormsg'),data.msg);
            }
        }
    })
});

function checkPhone(_obj) {
    var checkExit = false;
    var reg = /^1[3-9]\d{9}$/;
    var phone_val = _obj.val();
    if (phone_val.length == 0) {
        showErr($('.errormsg'),'手机号不能为空');
        $('#mobile_num').focus();
        return false;
    } else if (!reg.test(phone_val)) {
        showErr($('.errormsg'),'请输入正确的11位手机号码');
        $('#mobile_num').focus();
        return false;
    } else {
        checkExit = true;
    }
    return checkExit;
}

//短信发送倒计时
var bool=true;
function time(obj){
    var time=59,timer;
    if(!bool){return;}
    bool=false;
    clearInterval(timer);
    obj.html(time+'秒重新发送');
    timer=setInterval(function(){
        if(time==0){
            bool=true;
            clearInterval(timer);
            obj.html('重新发送');
        }else{
            time--;
            obj.html(time+'秒重新发送');
        }
    },1000);
};
function showErr(obj,con){
    obj.html(con);
    setTimeout(function () {
        obj.html('')
    },3000)
}
