/**
 * Created by jack on 2015/4/22.
 */

//ajax
function send_ajax(type,url,data,fn){
    $.ajax({
        type:type,
        url:url,
        data:data,
        success:function(){
            if(fn){
                fn();
            }
        }
    });
}

var bool=true;
function time(obj){
    var time=50,timer;
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
}

//验证手机号
$('#phone').on('blur',checked_mobile);
function checked_mobile() {
    var reg = /^1[3-9]\d{9}$/;
    var phone_val = $('#phone').val();
    if (phone_val == '' || phone_val == '请输入手机号' || phone_val==null) {
    	$('.success_icon').hide();
        $('#mobile_wrong').show().html('手机号不能为空');
        return false;
    }else if(!reg.test(phone_val)){
    	$('.success_icon').hide();
        $('#mobile_wrong').show().html('请输入正确的11位手机号');
        return false;
    }else{
    	$('.success_icon').show();
        $.ajax({
            type: 'POST',
            url: environment.basePath + "/register/checkExistMobile.do",
            data: {"userMobile":phone_val},
            success: function(data) {
                if(data.code < 0){
                    $('#mobile_success').hide();
                    $('#mobile_wrong').html(data.msg).show();
                    return false;
                }else{
                    $('#mobile_wrong').hide();
                    $('#mobile_success').show();
                    return true;
                }
            }
        });
    }
}
//文本与密文切换


$('.toggle_icon').click(function(){
	if($(".password_txt input").eq(1).css("display")=="none"){
		var text=$(".password_txt input").eq(0).val();
		if(text==""||text==null){
			return false;
		}else{
			var va=$(".password_txt input").eq(0).val();
		    $(".password_txt input").css("display","none").eq(1).css("display","block").val(va);
            return true;
		}
	}else{
		var pwd=$(".password_txt input").eq(1).val();
		if(pwd==""||pwd==null){
			return false;	
		}else{
			var va=$(".password_txt input").eq(1).val();
		    $(".password_txt input").css("display","none").eq(0).css("display","block").val(va);
            return true;	
		}
		
	}
})




//验证码按钮点击
$('.yzm_btn').click(function(){
    var phone_num=$('#phone').val().trim();
    if(phone_num == ''){
        return;
    }
    $('.yzm_btn').hide();
    $('.yzm_time').show();
    time($('.yzm_time'));
    $.ajax({
        type:"POST",
        url:environment.basePath + "/register/sendNewRegCode.do",
        data:{"userMobile":phone_num,"type":8,"authenType":1},
        success:function(data){
            if(data.code < 0){
                $('#yzm_wrong').html(data.msg).show();
                $('#password_ts').hide();
            }else{
                $('#yzm_wrong').hide();
                $('#password_ts').show();
            }
        }
    });
});
//验证码框输入验证
$('#yzm').on('blur',check_yzm);
function check_yzm(){
    var yzm_val=$('#yzm').val().trim();
    var mobile=$("#phone").val().trim();
    var reg=/^[0-9]{6}$/;
    $('#password_ts').hide();
    $('#yzm_wrong').hide();
    if(yzm_val=='' || yzm_val==null){
        $('#yzm_wrong').show().html('请输入验证码');
    }else if(!reg.test(yzm_val)){
        $('#yzm_wrong').show().html('请输入正确的6位验证码');
    }else{
        $('#yzm_wrong').hide();
        $.ajax({
            type:"POST",
            url:environment.basePath + "/register/newRegCheckCode.do",
            data:{"mobile":mobile,"verifycode":yzm_val,"authenType":"1"},
            success:function(data){
                if(data.code < 0){
                    $('#yzm_wrong').html(data.msg).show();
                    $('#password_ts').hide();
                }else{
                    $('#yzm_wrong').hide();
                    $('#password_ts').show();
                }
            }
        });
    }
}
//语音提示
$('#yuying').click(function(){
    var val=$('#phone').val();
    if(val == ''){
        return;
    }
    $(this).parent().html('您的手机'+val.substring(0,3)+'****'+val.substring(7)+'将在60秒内收到 400-068-1176 的电话，请注意接听。');
    $.ajax({
        type:"POST",
        url:environment.basePath + "/register/sendNewRegCode.do",
        data:{"userMobile":val,"type":500,"authenType":1},
        success:function(data){
            if(data.code < 0){
                $('#yzm_wrong').html(data.msg).show();
            }else{
                $('#yzm_wrong').hide();
            }
        }
    });
});

////邀请码验证
$('#yqm_num').blur(function(){
   var val=$(this).val().trim();
   if(val==''|| val==null || val=='请输入邀请码'){
       return;
   }
   $.ajax({
        type:"POST",
        url:environment.basePath + "/register/existsCode.do",
        data:{"code":val},
        success:function(data){
            if(data.code < 0){
                $('#yqm_wrong').html(data.msg).show();
            }else{
                if(data.msg == '1'){
                    $('#yqm_wrong').html("邀请码不存在").show();
                }else{
                    $('#yqm_wrong').hide();
                }
            }
        }
    });
});