$(function(){
	
		//验证手机号
		function searchParse(){ 
			var resultObj = {}; 
			var search = window.location.search; 
			if(search && search.length > 1){ 
				var search = search.substring(1); 
				var items = search.split('&'); 
				for(var index = 0 ; index < items.length ; index++ ){ 
					if(! items[index]){ 
						continue; 
					} 
					var kv = items[index].split('='); 
					resultObj[kv[0]] = typeof kv[1] === "undefined" ? "":kv[1]; 
				} 
			} 
				return resultObj; 
		} 
		var searchJson = searchParse();
		var mobileNum = searchJson.mobile;
		
		$('#phone').val(mobileNum);
		$('#phone').on('blur', checked_mobile);
		function checked_mobile() {
			var checkExit = false;
			var reg = /^1[3-9]\d{9}$/;
			var phone_val = $('#phone').val();
			if (phone_val == '' || phone_val == '请输入手机号' || phone_val == null) {
				//$('.success_icon').hide();
				$('#mobileWrong').show().find('.wrongText').html('手机号不能为空');
				return false;
			} else if (!reg.test(phone_val)) {
				//$('.success_icon').hide();
				$('#mobileWrong').show().find('.wrongText').html('请输入正确的11位手机号');
				return false;
			} else {
				//$('.success_icon').show();
				$('#mobileWrong').hide();
	
				checkExit = true;
				
			}
			return checkExit;
		}

		//验证密码
		$('#password').on('blur', check_password);
		function check_password() {
			var pasd_val = $('#password').val().trim();

			if (pasd_val == '') {
				$('#passwordWrong').show().find('.wrongText').html('请输入密码');
				return false;
			}
			if (pasd_val.length<6 || pasd_val.length>16) {
				$('#passwordWrong').show().find('.wrongText').html('密码格式不正确，请输入正确的6-16位密码');
				return false;
			} else {
				$('#passwordWrong').hide();
				return true;
			}
		}

		var bool = true;
		function time(obj) {
			obj.html('120秒后重新发送');
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
					$('.msgBtn').html("重新发送").removeClass('msgRe');
				} else {
					time--;
					obj.html(time + '秒后重新发送');
				}
			}, 1000);
		}
		
		function freshVerifyCode(){
	        var loanCommentCodeid = document.getElementById("loanCommentCodeId");
	        var d = new Date();
	        loanCommentCodeid.src = environment.basePath +'/userInfo/getCode.do?a='+d.getTime();
	    }
	    $('#loanCommentCodeId').on('click',function(){
	    	
	    	freshVerifyCode();
	    	
	    })
		//图片验证码判断
		$('#loanCommentCode').on('blur', checked_cod);
		function checked_cod(){
			
			var checkExit = false;
			var veCode = $('#loanCommentCode').val().trim().toLowerCase();
			$.ajax({
				type : "POST",
				url : environment.basePath + "/register/checkCode.do",
				data : {
					"veCode" : veCode
				},
				success : function(data) {
				
					if (data.code < 0) {
						$('#codeidWrong').show().find('.wrongText').html(data.msg);
						checkExit = false;
					} else {
						$('#codeidWrong').hide();
						checkExit = true;
					}
				}
			});
			return checkExit;
		}

		//短信验证码按钮点击
		
		$('.msgBtn').on('click',function() {
			
			var phone_num = $('#phone').val().trim();
			var veCode = $('#loanCommentCode').val().trim();
			if (!checked_mobile()) {
				return;
			}
			if($(this).hasClass('msgRe')){
				return;
			}
			$.ajax({
				type : "POST",
				url : environment.basePath + "/register/sendNewRegCode.do",
				data : {
					"userMobile" : phone_num,
					"type" : 8,
					"veCode" : veCode,
					"authenType" : 1
				},
				success : function(data) {
					
					if (data.code == -3) {
						freshVerifyCode();
						$('#mobileWrong').show().find('.wrongText').html(data.msg);
					}else if (data.code == -2) {
						$('#codeidWrong').show().find('.wrongText').html(data.msg);
						
					} else if(data.code == -1) {
						$('#valWrong').show().find('.wrongText').html(data.msg);
						
					}else {
						$('#valWrong').hide();
						$('.msgBtn').addClass('msgRe');
						time($('.msgBtn'));
					}
				}
			});
		});

		
		//验证码框输入验证
		$('#valInput').on('blur', check_yzm);
		function check_yzm() {
			var checkExit = false;
			var yzm_val = $('#valInput').val().trim();
			var mobile = $("#phone").val().trim();
			var reg = /^[0-9]{6}$/;
			$('#valWrong').hide();
			if (yzm_val == '' || yzm_val == null) {
				$('#valWrong').show().find('.wrongText').html('请输入验证码');
				return false;
			} else if (!reg.test(yzm_val)) {
				$('#valWrong').show().find('.wrongText').html('请输入正确的6位验证码');
				return false;
			} else {
				$('#valWrong').hide();
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
									$('#valWrong').find('.wrongText').html(data.msg).show();
									
									checkExit = false;
								} else {
									$('#valWrong').hide();
									
									checkExit = true;
								}
							}
						});
			}
			return checkExit;
		}

		$('#register').click(function() {
			
			var result = checked_mobile();
			if (!checked_mobile()) {
				return;
			}
			;
			result = check_password();
			if (!check_password()) {
				return;
			}
			;
			result = checked_cod();
			if(checked_cod()) {
				return;
			}
			;
			result = check_yzm();
			if (!check_yzm()) {
				return;
			}
			;
			var agreement = $("#agree");
			if (agreement.attr('checked') != 'checked') {
				$('#agreementWrong').find('.wrongText').html("请同意《服务协议》和《隐私条款》");
				$('#agreementWrong').show();
				return;
			}
			register();
			
		});

		function register() {
			var mobile = $('#phone').val();
			var password = $('#password').val().trim();
			var verifycode = $('#valInput').val();
			
			
			//var code = $('#yqm_num').val();
			//var sr = $('#sr').val();
			var url = environment.basePath + "/register/newRegUser.do";
			$.post(url, {
				"mobile" : mobile,
				"password" : $.md5(password),
				"roles" : 1,
				"verifycode" : verifycode,
				"authenType" : 1,
				//"code" : code,
				"sr":searchJson.sr
			}, function(data, varStatus) {
				if (data == 4) {
					$('#valWrong').show().find('.wrongText').html('请输入验证码');
					return false;
				} else if (data == 0) {
					$('#mobileWrong').show().find('.wrongText').html('请输入手机号');
					return false;
				} else if (data == 1) {
					$('#mobileWrong').show().find('.wrongText').html('手机号码格式错误');
					return false;
				} else if (data == 10) {
					$('#mobileWrong').show().find('.wrongText').html('手机号已存在');
					return false;
				} else if (data == 8) {
					$('#valWrong').show().find('.wrongText').html('请先获取验证码');
					return false;
				} else if (data == 5) {
					$('#valWrong').show().find('.wrongText').html('已3次验证码错误，请24小时后重试');
					return false;
				} else if (data == 2) {
					$('#passwordWrong').find('.wrongText').show().html('请输入密码');
					return false;
				} else if (data == 6) {
					$('#valWrong').show().find('.wrongText').html('验证码错误');
					return false;
				} else if (data == 7) {
					$('#valWrong').show().find('.wrongText').html('验证码已失效，请重新发送');
					return false;
				} else if (data == 9) {
					//$('.yqm_wrong').show().html('注册失败');
					return false;
				} else {
					window.location.href = environment.basePath
							+ "/recharge/openAccount.session";
				}
			}, "text");
		}
});