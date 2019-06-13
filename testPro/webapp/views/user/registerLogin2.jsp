<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
	
	<%
    String path = request.getContextPath();
    String baseAndPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String serverName=request.getServerName()+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册 - 中再融</title>
<%@ include file="/views/inc/inc.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${basePath}/resources/css/login.css">
</head>
<body>
	<%@ include file="/views/inc/header.jsp"%>
	<div id="content_height">
		
		<div class="monety_hint" style="display:none;">注册成功就拿999元红包</div>
		<div class="login_content">   
			<div class="login">
			
			<div id="phoneDiv">
				<div class="phone_box">
					<span class="phone_icon"><img
						src="${basePath}/resources/image/phone_icon.png"></span>
					<div class="phone_txt">
						<input type="text" id="phone" placeholder="请输入手机号" maxlength="11">
					</div>
					<span class="success_icon"><img style="display: none"
						id="mobile_success"
						src="${basePath}/resources/image/success_icon.png" alt="success"></span>
				</div>
				<div class="margin_box">
					<div class="error" id="mobile_wrong">请输入正确的11位手机号码</div> 
				</div>
			</div>	
			
			<div id="passwordDiv" style="display:none;">	
				<div class="password" >
					<span class="password_icon"><img
						src="${basePath}/resources/image/password_icon.png"> </span>
					<div class="password_txt">
						<input type="text" id="password" style="display: none;"
							placeholder="请输入密码" maxlength="16"> <input type="password"
							id="password2" style="display: block;" placeholder="请输入密码" maxlength="16">
					</div>
					<span class="toggle_icon"></span>
				</div>
				<div class="margin_box">
					<div class="error" id="password_wrong">请输密码</div>
				</div>
			</div>
			
			<div id="imgyzmDiv"  style="display:none;">
				<div class="yzm_box" id="imgyzm">
	            	<div class="yzm_left">
	                	<div class="yzm_txt"><input type="text" id="loanCommentCode" placeholder="请输入图形中的字符" maxlength="4"></div>
	            	</div>
		            <div class="yzm_right">
		                <a href="javascript:;"><img id="loanCommentCodeId" onClick="freshVerifyCode()" src='${basePath}/userInfo/getCode.do'></a>
		            </div>
	        	</div>
	        	<div class="margin_box">
					<div class="error" id="codeid_wrong">请输入图形中的字符</div>
				</div>
        	</div>
        

			<div id="phoneyzmDiv" style="display:none;">				
				<div class="yzm_box" id="phoneyzm" >
					<div class="yzm_left">
						<span class="yzm_icon"><img
							src="${basePath}/resources/image/yzm_icon.png"></span>
						<div class="yzm_txt">
						<input type="hidden" id="sr" value="${sr}">
							<input type="text" id="yzm" placeholder="请输入手机验证码" maxlength="6">
						</div>
					</div>
					<div class="yzm_right">
						<div class="yzm_btn">
							<a href="javascript:;">发送验证码</a>
						</div>
						<div class="yzm_time">120秒后重新发送</div>
					</div>
				</div>
				
				<div class="margin_box">
					<div class="error" id="yzm_wrong"></div>
					<!-- <div class="yzm_ts" id="password_ts">如果您收不到短信，<a href="javascript:;" id="yuying">请语音获取。</a>
					</div> -->
				</div>
  
			</div>
  
  
  
  
			<div id="yaoqingmaDiv" style="display:none;">
				<div class="code_btn"  id="yaoqingma">
					<a href="javascript:;" class="code_btn_a">使用邀请码</a>
				</div>

				<div class="code_box">
					<div class="code_icon">
						<img src="${basePath}/resources/image/code_img.png">
					</div>
					<div class="code_txt">
						<input type="text" id="yqm_num" placeholder="请输入邀请码（选填）" maxlength="8">
					</div>
				</div>

				<div class="margin_box">
					<div class="error" id="yqm_wrong"></div>
				</div>
				
			</div>
			
			
			
				<div class="registration_btn bg1" style="background-color:#cfcfcf"  id="judgePhoneExist" >
					<a href="javascript:judgePhoneExist();" >下一步</a>
				</div>
				
				<div class="registration_btn bg1"  id="registerDiv" style="display:none;">
					<a href="javascript:;" id="register">立即注册</a>
				</div>
				<div class="registration_btn bg1" id="loginDiv" style="display:none;">
					<a href="javascript:;" id="login">登录</a>
				</div>
				
				<div class="xy_box" style="display:none;">
					<input type="checkbox" id="agreement" checked="checked"> <span>同意</span>
					<a href="${basePath}/views/agreement/serve_agreement.jsp">《服务协议》</a>
					<a href="${basePath}/views/agreement/secret_agreement.jsp">《隐私条款》</a>
				</div>
				<div class="margin_box">
					<div class="error" id="agreement_wrong"></div>
				</div>
				
				<div id="loginByPasswordDiv" style="display:none"> <a href="javascript:loginByItem('password')">使用密码登录</a></div>
				<div id="checkedMoblieCodeDiv" style="display:none"> <a href="javascript:loginByItem('mobileVcode')">使用验证码登录</a></div>
				<div id="checkedMobileDiv" style="display:none"> <a href="javascript:checkedMobile()">重新输入手机号</a></div>
			
			
			</div>
		</div>
	</div>
	<%@ include file="/views/inc/footer.jsp"%>
	<script type="text/javascript"
		src="${basePath}/resources/js/common/jquery.md5.js"></script>
	<script type="text/javascript">
	
	var checkedMobileItem = false;
	var loginItem = false;
	var imageVCodeItem = false;
	var registerLoginItem = 'register';
	
	function freshVerifyCode(){
        var loanCommentCodeid = document.getElementById("loanCommentCodeId");
        var d = new Date();
        loanCommentCodeid.src = '${basePath}/userInfo/getCode.do?a='+d.getTime();
    }
	
	
		//验证手机号
		$(function() {   
			$('.code_btn_a').click(function() {
				$(this).hide();
				$('.code_box').show();
			})

			$('.toggle_icon').click(
					function() {
						if($('#password2').val()==''|| $('#password').val()==''){return false;};
// 						var parent = $(this).parent().find('.password_txt');
						if ($('#password2').css('display') == 'inline-block'
								|| $('#password2').css('display') == 'block') {
// 							var pVal = parent.find('#password2').val();
							$('#password2').css('display', 'none'); 
							$(this).addClass('toggle_open');
							$('#password').css('display', 'block');
						} else {
// 							var tVal = parent.find('#password').val();
							$('#password2').css('display', 'block');
							$(this).removeClass('toggle_open');
							$('#password').css('display', 'none');
						}
					})  
		})
	
		$('#phone').on('blur', checked_mobile);
		function checked_mobile() {
			var checkExit = false;
			var reg = /^1[3-9]\d{9}$/;
			var phone_val = $('#phone').val();
			if (phone_val == '' || phone_val == '请输入手机号' || phone_val == null) {
				$('.success_icon').hide();
				$('#mobile_wrong').show().html('手机号不能为空');
				
				buttonsClick('judgePhoneExist',0);
				return false;
			} else if (!reg.test(phone_val)) {
				$('.success_icon').hide();
				$('#mobile_wrong').show().html('请输入正确的11位手机号');
				
				buttonsClick('judgePhoneExist',0);
				return false;
			} else {
				$('.success_icon').show();
				$('#mobile_wrong').hide();
				$('#mobile_success').show();
				
				if(checkedMobileItem)
					buttonsClick('judgePhoneExist',0);
				else
					buttonsClick('judgePhoneExist',1);
				checkExit = true;
				
			}
			
			return checkExit;
		}

		
		//验证密码
		$('#password,#password2').live('keyup',function(){
			if($('#password').css('display')=='block'){
				var val=$('#password').val();
				$('#password2').val(val);
			}else{
				var val=$('#password2').val();
				$('#password').val(val);
			}
		})
		
		$('#password,#password2').live('blur', check_password);
		function check_password() {
			var pasd_val = $('#password').val().trim()
					|| $('#password2').val().trim();
			if (pasd_val == '') {
				$('#password_wrong').show().html('请输入密码');
				buttonsClick(registerLoginItem,0);
				return false;
			}
			if (pasd_val.length<6 || pasd_val.length>16) {
				$('#password_wrong').show().html('密码格式不正确，请输入正确的6-16位密码');
				buttonsClick(registerLoginItem,0);
				return false;
			} else {
				$('#password_wrong').hide();
				buttonsClick(registerLoginItem,1);
				return true;
			}
		}

		var bool = true;
		function time(obj) {
			var time = 120, timer;
			if (!bool) {
				return;
			}
			bool = false;
			clearInterval(timer);
			obj.html(time + '后秒重新发送');
			timer = setInterval(function() {
				if (time == 0) {
					bool = true;
					clearInterval(timer);
					obj.html('120秒后重新发送');
					$('.yzm_btn').html("重新发送");
					$('.yzm_btn').show();
					obj.hide();
				} else {
					time--;
					obj.html(time + '秒后重新发送');
				}
			}, 1000);
		}
		
		//图片验证码判断
		$('#loanCommentCode').on('blur', checked_cod);
		function checked_cod(){
			var checkExit = false;
			var veCode = $('#loanCommentCode').val().trim();
			$.ajax({
				type : "POST",
				url : environment.basePath + "/registerLogin/checkCode.do",
				data : {
					"veCode" : veCode
				},
				success : function(data) {
					
					if (data.code < 0) {
						$('#codeid_wrong').html(data.msg).show();
						buttonsClick('judgePhoneExist',0);
						checkExit = false;
						
					} else {
						$('#codeid_wrong').hide();
						buttonsClick('judgePhoneExist',1);
						checkExit = true;
						imageVCodeItem = true;
				//		alert("1"+checkExit)
					}
				}
			});
		//	alert("2"+checkExit)
			return checkExit;
		}

		//短信验证码按钮点击
		$('.yzm_btn').click(function() {
			var phone_num = $('#phone').val().trim();
	//		var veCode = $('#loanCommentCode').val().trim();
			if (!checked_mobile()) {
				return;
			}
			
			var authenType = 1;
			if(registerLoginItem == 'login')
				authenType = 13;
			
			$.ajax({
				type : "POST",
				url : environment.basePath + "/registerLogin/sendNewRegCode.do",
				data : {
					"userMobile" : phone_num,
					"type" : 8,
					"authenType" : authenType
				},
				success : function(data) {
					if (data.code == -3) {
						freshVerifyCode();
						$('#mobile_wrong').html(data.msg).show();
					}else if (data.code == -2) {
						$('#codeid_wrong').html(data.msg).show();
						$('#password_ts').hide();
					} else if(data.code == -1) {
						$('#yzm_wrong').html(data.msg).show();
						$('#password_ts').hide();
					}else {
						$('#yzm_wrong').hide();
						$('#password_ts').show();
						$('.yzm_btn').hide();
						$('.yzm_time').show();
						time($('.yzm_time'));
					}
				}
			});
		});

		//验证码框输入验证
		$('#yzm').live('focus',function(){
			$(this).css('color','#333');
		})
		$('#yzm').live('blur', check_yzm);
		function check_yzm() {
			var checkExit = false;
			var yzm_val = $('#yzm').val().trim();
			var mobile = $("#phone").val().trim();
			var reg = /^[0-9]{6}$/;
			$('#password_ts').hide();
			$('#yzm_wrong').hide();
			if (yzm_val == '' || yzm_val == null) {
				$('#yzm_wrong').show().html('请输入验证码');
				buttonsClick(registerLoginItem,0);
				return false;
			} else if (!reg.test(yzm_val)) {
				$('#yzm_wrong').show().html('请输入正确的6位验证码');
				buttonsClick(registerLoginItem,0);
				return false;
			} else {
				$('#yzm_wrong').hide();
				$.ajax({
							type : "POST",
							url : environment.basePath
									+ "/register/newRegCheckCode.do",
							data : {
								"mobile" : mobile,
								"verifycode" : yzm_val,
								"authenType" : "1"
							},
							async : false,
							cache : false,
							success : function(data) {
								if (data.code < 0) {
									$('#yzm_wrong').html(data.msg).show();
									$('#password_ts').hide();
									checkExit = false;
									buttonsClick(registerLoginItem,0);
								} else {
									$('#yzm_wrong').hide();
									$('#password_ts').show();
									checkExit = true;
									buttonsClick(registerLoginItem,1);
								}
							}
						});
			}
			return checkExit;
		}

		//邀请码验证
		$('#yqm_num').on('blur', check_yqm);
		function check_yqm() {
			var checkExit = false;
			var val = $('#yqm_num').val().trim();
			if (val == '' || val == null || val == '请输入邀请码（选填）') {
				
				$('#yqm_wrong').html("");
				$('#yqm_wrong').hide();
				return true;
			}

			$.ajax({
				type : "POST",
				url : environment.basePath + "/register/existsCode.do",
				data : {
					"code" : val
				},
				async : false,
				cache : false,
				success : function(data) {
					if (data.code < 0) {
						$('#yqm_wrong').html(data.msg).show();
						checkExit = false;
					} else {
						if (data.msg == '1') {
							$('#yqm_wrong').html("邀请码不存在").show();
							checkExit = false;
						} else {
							$('#yqm_wrong').html("");
							$('#yqm_wrong').hide();
							checkExit = true;
						}
					}
				}
			});
			return checkExit;
		}

		$('#register').click(function() {
			var result = checked_mobile();
			if (!checked_mobile()) {
				return;
			}
			;
			/* result = check_password();
			if (!check_password()) {
				return;
			}
			; */
			if(checkedMobileItem){
				result = checked_cod();
				if(checked_cod()) {
					return;
				}
				;
			}
			result = check_yzm();
			if (!check_yzm()) {
				return;
			}
			;
			result = check_yqm();
			if (!check_yqm()) {
				return;
			}
			;
			var agreement = $("#agreement");
			if (agreement.attr('checked') != 'checked') {
				$('#agreement_wrong').html("请同意《服务协议》和《隐私条款》");
				$('#agreement_wrong').show();
				return;
			}
			register();
		});

		function register() {
			var mobile = $('#phone').val();
			var password = $('#password').val().trim()
					|| $('#password2').val().trim();
			var verifycode = $('#yzm').val();
			
			
			var code = $('#yqm_num').val();
			var sr = $('#sr').val();
			var url = environment.basePath + "/register/newRegUser.do";
			$.post(url, {
				"mobile" : mobile,
				"password" : $.md5(password),
				"roles" : 1,
				"verifycode" : verifycode,
				"authenType" : 1,
				"code" : code,
				"sr":sr
			}, function(data, varStatus) {
				if (data == 4) {
					$('#yzm_wrong').show().html('请输入验证码');
					return false;
				} else if (data == 0) {
					$('.mobile_wrong').show().html('请输入手机号');
					return false;
				} else if (data == 1) {
					$('.mobile_wrong').show().html('手机号码格式错误');
					return false;
				} else if (data == 10) {
					$('.mobile_wrong').show().html('手机号已存在');
					return false;
				} else if (data == 8) {
					$('.yzm_wrong').show().html('请先获取验证码');
					return false;
				} else if (data == 5) {
					$('.yzm_wrong').show().html('已3次验证码错误，请24小时后重试');
					return false;
				} else if (data == 2) {
					$('.password_wrong').show().html('请输入密码');
					return false;
				} else if (data == 6) {
					$('.yzm_wrong').show().html('验证码错误');
					return false;
				} else if (data == 7) {
					$('.yzm_wrong').show().html('验证码已失效，请重新发送');
					return false;
				} else if (data == 9) {
					$('.yqm_wrong').show().html('注册失败');
					return false;
				} else {
					window.location.href = environment.basePath
							+ "/recharge/openAccount.session";
				}
			}, "text");
		}
		
		
		function judgePhoneExist(){
			var phone = $("#phone").val();
			var item = "";
			if(checkedMobileItem){
				if(imageVCodeItem) {
					item = "1";
				}else{
					item = "2";
				}
			}
			if (!checked_mobile()) {
				return;
			}
		//	alert("item="+item)
			if(item != "2"){
			$.ajax({
				type : "GET",
				url : environment.basePath + "/registerLogin/judgePhone.do",
				data : {
					"phone" : phone
				},
				async : false,
				cache : false,
				success : function(data) {
				//	alert(JSON.stringify(data));
					if (data.msg == 0) {
						
						$("#phoneDiv").hide();
						$("#phoneyzmDiv").show();
						$("#imgyzmDiv").hide();
						$("#yaoqingmaDiv").hide();
						$("#loginDiv").show();
						$("#checkedMobileDiv").show();
						$("#loginByPasswordDiv").show();
						$("#judgePhoneExist").hide();
						registerLoginItem = 'login';
						
					} else {
						$("#phoneDiv").hide();
						$("#phoneyzmDiv").show();
						$("#imgyzmDiv").hide();
						$("#yaoqingmaDiv").show();
						$("#judgePhoneExist").hide();
						$("#registerDiv").show();
						$("#checkedMobileDiv").show();
						registerLoginItem = 'register';
						
					}
					
					buttonsClick(registerLoginItem,0);
				}
			});
			}
		}

		function checkedMobile(){
			checkedMobileItem = true;
			$("#phoneDiv").show();
			$("#phoneyzmDiv").hide();
			$("#passwordDiv").hide();
			$("#imgyzmDiv").show();
			$("#yaoqingmaDiv").hide();
			$("#loginDiv").hide();
			$("#checkedMobileDiv").show();
			$("#loginByPasswordDiv").show();
			$("#judgePhoneExist").show();
			$("#registerDiv").hide();
			$("#checkedMobileDiv").hide();
			$("#checkedMoblieCodeDiv").hide();
			$("#loginDiv").hide();
			$("#loginByPasswordDiv").hide();
			buttonsClick('judgePhoneExist',0);
		}
		
		function loginByItem(item){
			if(item == 'password'){
				loginItem = 'password';
				$("#passwordDiv").show();
				$("#imgyzmDiv").hide();
				$("#phoneyzmDiv").hide();
				$("#yaoqingmaDiv").hide();
				$("#judgePhoneExist").hide();
				$("#registerDiv").hide();
				$("#checkedMobileDiv").show();
				$("#checkedMoblieCodeDiv").show();
				$("#loginDiv").show();
				$("#loginByPasswordDiv").hide();
				
			}else{
				loginItem = 'mobileVCode';
				$(".password").hide();
				$("#phoneyzm").show();
				$("#yaoqingma").hide();
				$("#judgePhoneExist").hide();
				$("#registerDiv").hide();
				$(".phone_box").hide();
				$(".xy_box").hide();
				$("#checkedMobileDiv").show();
				$("#checkedMoblieCodeDiv").hide();
				$("#loginDiv").show();
				$("#loginByPasswordDiv").show();
				$("#imgyzm").hide();
			}
			
			
		}
	
		
		$('#login').click(function() {
			
			login();
		});
		
		function login() {
	        var nkName = $("#phone").val();
	        var pwd = '';
	        var mobileVCode = '';
	        var loanCommentCode = "";
	        if(checkedMobileItem){
	            loanCommentCode = $("#loanCommentCode").val();
	        }
	        if(loginItem == 'password'){
	        	pwd = $('#password').val().trim()||$('#password2').val().trim();
	        }else{
	        	mobileVCode = $('#yzm').val().trim();
	        }
	        var url = "${basePath}/registerLogin/userlogin.do";
	        $.post(url, {
	                    "nickname": nkName,
	                    "password": $.md5(pwd),
	                    "loanCommentCode":loanCommentCode,
	                    "mobileVCode":mobileVCode,
	                    "loginItem":loginItem,
	                    "checkedMobileItem":checkedMobileItem
	                }, function (data, varStatus) {
	                    $("#loginloading").hide();
	                    if (data ==  0) {
	                        var refPath = $('#refPath').val();
	                       
	                        if(refPath!=null&&""!=refPath){
	                        	
	                        	refPath= decodeURIComponent(refPath);
	                        	if(refPath.indexOf("<%=serverName%>") == -1) {
	                        		if(refPath.indexOf("http://") != -1 || refPath.indexOf("https://") != -1 || refPath.indexOf("@") != -1) {
	                        			refPath = '${basePath}/';
	                        		}else{
	                        			refPath = "<%=baseAndPath%>" + refPath;
	                        		}
	                        	}
	                        	
	                        }else{
	                        	refPath = '${basePath}/';
	                        }
	                        
	                        window.location.href = decodeURIComponent(refPath);
	                    } else if (data == 1) {
	                        $('.success_icon').hide();
	                        $('#mobile_wrong').show().html('用户名或密码为空');
	                        freshVerifyCode();
	                    } else if (data == 2) {
	                        $('.success_icon').hide();
	                        $('#mobile_wrong').show().html('用户名或密码错误');
	                        $("#yzm").show();
	                        setCookie("_FIRST","1");
	                        freshVerifyCode();
	                    } else if (data == 10) {
	                        $("#yzm_wrong").show().html('验证码为空');
	                        freshVerifyCode();
	                    } else if (data == 11) {
	                        $("#yzm_wrong").show().html('验证码错误');
	                        freshVerifyCode();
	                    }
	                    else if (data == 21) {
	                        $("#yzm_wrong").show().html('手机验证码登录错误');
	                        freshVerifyCode();
	                    }
	                }, "text");
	    }
		
		
		function buttonsClick(button,item){
			if(item == "1"){
				$("#"+button).css("background-color","#fd8010");
				$("#"+button).removeAttr("href");
			}else{
				$("#"+button).css("background-color","#cfcfcf");
				$("#"+button).attr('href', '#');
			}
		}
		
	</script>
</body>
</html>
