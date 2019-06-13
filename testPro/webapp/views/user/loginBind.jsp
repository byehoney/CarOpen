<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录 - 中再融</title>
    <%@ include file="/views/inc/inc.jsp"%>
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/login.css?varsion=1.9">
    <script type="text/javascript">
        var headerConfig = {
            navType: 0
        };
    </script>
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
<div id="content_height">
	<div class="login_content">
    <div class="login pt25">
        <h3 class="login-bind-title"><img src="${basePath}/resources/image/icon_search.png" /><span>绑定手机随时关注投资信息</span></h3>
        <div class="phone_box"> 
            <span class="phone_icon"><img src="${basePath}/resources/image/phone_icon.png"></span>
            <div class="phone_txt"><input type="text" id="phone_login" placeholder="请输入用户名/手机/邮箱" maxlength="32"></div>
            <span class="success_icon"><img src="${basePath}/resources/image/success_icon.png" alt="success"></span>
        </div>
        <div class="margin_box"><div class="error" id="mobile_wrong"></div></div>
        <div class="password">
            <span class="password_icon"><img src="${basePath}/resources/image/password_icon.png"> </span>
            <div class="password_txt">
            	<input type="text" id="password" style="display:none;" placeholder="请输入密码" maxlength="16">
            	<input type="password" id="password2" placeholder="请输入密码" maxlength="16">
            </div>
            <span class="toggle_icon">
<%--             	<img src="${basePath}/resources/image/toggle_icon.png"> --%>
            </span>
<!--             <span class="icon_hr">|</span> -->
<%--             <span class="clear_icon"><img src="${basePath}/resources/image/clear_icon.png" alt="success"></span> --%>
        </div>
        <div class="margin_box"><div class="error" id="password_wrong"></div></div>
        <div class="yzm_box" id="yzm">
            <div class="yzm_left">
                <span class="yzm_icon"><img src="${basePath}/resources/image/yzm_icon.png"></span>
                <div class="yzm_txt"><input type="text" id="loanCommentCode" placeholder="请输入验证码" maxlength="4"></div>
            </div>
            <div class="yzm_right">
                <a href="javascript:;"><img id="loanCommentCodeId" onClick="freshVerifyCode()" src='${basePath}/userInfo/getCode.do'></a>
            </div>
        </div>
        <div class="margin_box"><div class="error" id="yzm_wrong">请输验证码</div></div>
		<div class="xy_box" style="display:none">
			<input type="checkbox" id="agreeBindWx" checked="checked"> <span>帮您绑定微信号，接受账户变动及投资项目更及时，登录更便捷</span>
		</div>
        <div class="login_btn bg1" id="login_btn">绑定微信帐号</div>
        <div class="go-register"><a href="${basePath}/wxBind/toBindRegister.do?bindClickSource=loginBind">没有帐号？ 立即注册 ></a></div>
        <input type="hidden" value="${result.data.refPath}" id="refPath">
    </div>
	</div>
	<div class="mark_box"></div>
	<div class="Delta_box">
	    <h2>忘记密码提示</h2>
	    <p>尊敬的用户您好，请访问电脑版中再融找回密码。</p>
	    <div class="Delta_btn bg1" id="iknow">
	        <a href="javascript:;">我知道了</a>
	    </div>
	</div>
</div>
<%@ include file="/views/inc/footer.jsp"%>
<script src="${basePath}/resources/js/common/jquery.md5.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.toggle_icon').click(function(){
		if($('#password2').val()==''|| $('#password').val()==''){return false;};
//			var parent = $(this).parent().find('.password_txt');
		if ($('#password2').css('display') == 'inline-block'
				|| $('#password2').css('display') == 'block') {
//				var pVal = parent.find('#password2').val();
			$('#password2').css('display', 'none'); 
			$(this).addClass('toggle_open');
			$('#password').css('display', 'block');
		} else {
//				var tVal = parent.find('#password').val();
			$('#password2').css('display', 'block');
			$(this).removeClass('toggle_open');
			$('#password').css('display', 'none');
		}
	})
	
	
	var isfirst=getCookie("_FIRST");
        if("1"!=isfirst){
            $("#yzm").hide();
        }
});

$('#phone_login').live('blur',checked_login_mobile);
function checked_login_mobile(){
    var phone_val = $('#phone_login').val().trim();
    if (phone_val == '' || phone_val == '请输入用户名/手机/邮箱' || phone_val==null) {
        $('.success_icon').hide();
        $('#mobile_wrong').show().html('请输入用户名/手机/邮箱不能为空');
        return false;
    }else {
        $('.success_icon').show();
        $('#mobile_wrong').hide();
        return true;
    }
}


//验证密码
$('#password,#password2').live('blur',check_password);
//判断密码框后面的清除按钮是否出现
$('#password,#password2').live('keyup',function(e){
	if($('#password').css('display')=='block'){
		var val=$('#password').val();
		$('#password2').val(val);
	}else{
		var val=$('#password2').val();
		$('#password').val(val);
	}
});
function check_password(){
    var pasd_val=$('#password').val().trim()||$('#password2').val().trim();
    if(pasd_val==''){
        $('#password_wrong').show().html('请输入密码');
        return false;
    }
    if(pasd_val.length<6 || pasd_val.length>16){
        $('#password_wrong').show().html('密码格式不正确，请输入正确的6-16位密码');
        return false;
    }else{
        $('#password_wrong').hide();
        return true;
    }
}
//清除密码框
$('.clear_icon').click(function(){
    var pasd_val=$('#password').val().trim();
    if(pasd_val!=null || pasd_val!='' || pasd_val!='请输入密码'){
        $(this).parents('.password').find('input').val('');
    }
});

//提交按钮
$('#login_btn').click(function(){
    if(!checked_login_mobile()){return;}
    if(!check_password()){return;}
    login();
});

function login() {
        var nkName = $("#phone_login").val();
        var pwd = $('#password').val().trim()||$('#password2').val().trim();
        var loanCommentCode = "";
        var agreeBindWx = $("#agreeBindWx").attr("checked");
        if( $("#yzm").css("display")==='none'){
            loanCommentCode = "first";
        }else{
            loanCommentCode = $("#loanCommentCode").val();
        }
        var url = "${basePath}/wxBind/wxBindLogin.do";
        $.post(url, {
                    "nickname": nkName,
                    "password": $.md5(pwd),
                    "loanCommentCode":loanCommentCode,
                    "agreeBindWx":agreeBindWx
                }, function (data, varStatus) {
                    $("#loginloading").hide();
                    if (data ==  0) {
                        var refPath = $('#refPath').val();
                        if(refPath == null || refPath == ''){
                            refPath = '${basePath}/wxBind/toBindSuccess.do';
                        }
                        window.location.href = decodeURIComponent(refPath);
                    } else if (data == 1) {
                        $('.success_icon').hide();
                        $('#mobile_wrong').show().html('用户名或密码为空');
                    } else if (data == 2) {
                        $('.success_icon').hide();
                        $('#mobile_wrong').show().html('用户名或密码错误');
                        $("#yzm").show();
                        setCookie("_FIRST","1");
                    } else if (data == 10) {
                        $("#yzm_wrong").show().html('验证码为空');
                        freshVerifyCode();
                    } else if (data == 11) {
                        $("#yzm_wrong").show().html('验证码错误');
                        freshVerifyCode();
                    }
                }, "text");
    }

function freshVerifyCode(){
        var loanCommentCodeid = document.getElementById("loanCommentCodeId");
        var d = new Date();
        loanCommentCodeid.src = '${basePath}/userInfo/getCode.do?a='+d.getTime();
    }

function setCookie(name,value)
{
    var Days = 1;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

//读取cookies
function getCookie(name)
{
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
 
    if(arr=document.cookie.match(reg))
 
        return unescape(arr[2]);
    else
        return null;
}
</script>
</body>
</html>