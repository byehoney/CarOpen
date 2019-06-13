$(function(){
	
	/*手机号校验begin--------------------------------------*/
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
	$(document).on('click',function(){
		$('.tip').hide();
	});
	function autoHide(){
		clearTimeout(timer);
		var timer = setTimeout(function(){
			$('.tip').hide();
		},2000);
	}
	(function(){
		function checked_mobile() {
			var checkExit = false;
			var reg = /^1[3-9]\d{9}$/;
			var phone_val = $('#phone').val();
			if (phone_val == '' || phone_val == '请输入手机号' || phone_val == null) {
			
				$('.tip').show().html('手机号不能为空');
				setTimeout(function(){
					$('.tip').hide();
				},2000);
				return false;
			} else if (!reg.test(phone_val)) {
				
				$('.tip').show().html('请输入正确的11位手机号');
				setTimeout(function(){
					$('.tip').hide();
				},2000);
				return false;
			} else {		
				$('.tip').hide();
				checkExit = true;
				
			}
			return checkExit;
		}
		
		$('#nextBtn').on('click',function(e){
			e.stopPropagation(); 
			var mobileNum = $('#phone').val();
			var wxUserGameId = $("#wxUserGameId").val();
			var sign = $("#sign").val();
			var loactionUrl = window.location.href;
			var url = environment.basePath + "/wx/loginOrRegister.do";
				if(!checked_mobile()){
					return;
				}
			
			$.post(url, {
				"phone" : mobileNum,
			}, function(data, varStatus) {
				
				if (JSON.parse(data).msg == 0) {
					
//					if(searchJson.sr){				
//						
//						window.location.href = environment.basePath
//						+ "/porkreg.do?sr="+searchJson.sr+"&mobile=" + mobileNum;
//						
//					}else{
					/*	window.location.href = environment.basePath
						+ "/porkreg.do?mobile=" + mobileNum;
					*/	
						window.location.href = environment.basePath + "/views/activity/olympic/comeonpas.jsp?" +
								"mobile=" + mobileNum+ "&wxUserGameId="+wxUserGameId+"&sign="+sign;
//					}
					
				} else {
					
//					if(searchJson.sr){				
//						
//						window.location.href = environment.basePath
//						+ "/porkreg.do?sr="+searchJson.sr+"&mobile=" + mobileNum;
//						
//					}else{
						window.location.href = environment.basePath + "/views/activity/olympic/comeonreg.jsp?" +
								"mobile=" + mobileNum+ "&wxUserGameId="+wxUserGameId+"&sign="+sign;
//						window.location.href = environment.basePath
//						+ "/porkreg.do?mobile=" + mobileNum;
//					}
				}
			}, "text");

		});
	})();
	/*手机号校验end--------------------------------------*/
	/*密码校验begin--------------------------------------*/
	;(function(){
		function ckeck_pas(pas){
			var checkExit = false;
			
			if (pas == '' || pas== '密码' || pas == null) {
			
				$('.tip').show().html('密码不能为空');
				autoHide();
				return false;
			} else {		
				$('.tip').hide();
				checkExit = true;
				
			}
			return checkExit;
		}
		function setCookie(name,value)
		{
		    var Days = 1;
		    var exp = new Date();
		    exp.setTime(exp.getTime() + Days*24*60*60*1000);
		    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
		}
		function login(mobile,pas,cheerMoney,wxUserGameId,sign) {
	        var nkName = mobile;
	        var pwd = pas;
	        var loanCommentCode = "first";
	        var url = environment.basePath+ "/wx/toLogin.do";
	        $.post(url, {
	                    "nickname": nkName,
	                    "password": $.md5(pwd),
	                    "loanCommentCode":loanCommentCode,
	                    "wxUserGameId" : wxUserGameId,
	                    "sign" : sign
	                }, function (data, varStatus) {
	                   console.log(data);
	                    if (data ==  0) {
	                        var refPath = $('#refPath').val();
	                        
	                        if(refPath!=null&&""!=refPath){
	                        	
	                        	refPath= decodeURIComponent(refPath);
	                        	if(refPath.indexOf("<%=serverName%>") == -1) {
	                        		if(refPath.indexOf("http://") != -1 || refPath.indexOf("https://") != -1 || refPath.indexOf("@") != -1) {
	                        			refPath = environment.basePath + '/';
	                        		}else{
	                        			refPath = "<%=baseAndPath%>" + refPath;
	                        		}
	                        	}
	                        	
	                        }else{
//	                        	refPath = environment.basePath + '/';
	                        	refPath = environment.basePath + '/views/activity/olympic/comeonred.jsp?wxUserGameId='+wxUserGameId+'&sign='+sign;
	                        }
	                        
	                        window.location.href = decodeURIComponent(refPath);
	                    } else if (data == 1) {
	                      
	                        $('.tip').show().html('用户名或密码为空');
	                        
	                    } else if (data == 2) {
	                        
	                        $('.tip').show().html('用户名或密码错误');
	                        $("#yzm").show();
	                        setCookie("_FIRST","1");
	                      
	                    } else if (data == 10) {
	                    	 $('.tip').show().html('验证码为空');
	                  
	                    } else if (data == 11) {
	                        $('.tip').show().html('验证码错误');
	                    }else if (data == 20) {
	                        $('.tip').show().html('用户信息错误');
	                    }
	                }, "text");
	    }
		$('#pasLogin').on('click',function(e){
			e.stopPropagation(); 
			var wxUserGameId = $("#wxUserGameId").val();
			var mobileNum = searchJson.mobile;
			var pasword = $('#pasPasword').val();
			var cheerMoney = $('#cheerMoney').val();
			var sign = $("#sign").val();
			if(!ckeck_pas(pasword)){
				return;
			}
			login(mobileNum,pasword,cheerMoney,wxUserGameId,sign);
		});
	})();
	/*密码校验end--------------------------------------*/
	/*注册校验begin---------------------------------------*/
	;(function(){
		//验证密码
		var mobileNum = searchJson.mobile;
		function check_password(pas) {
			var pasd_val = pas;

			if (pasd_val == '') {
				$('.tip').show().html('请输入密码');
				autoHide();
				return false;
			}
			if (pasd_val.length<6 || pasd_val.length>16) {
				$('.tip').show().html('密码格式不正确，请输入正确的6-16位密码');
				autoHide();
				return false;
			} else {
				$('.tip').hide();
				return true;
			}
		}

		var bool = true;
		function time(obj) {
			obj.html('59s后重发');
			var time = 59, timer;
			if (!bool) {
				return;
			}
			bool = false;
			clearInterval(timer);
			obj.html(time + 's后重发');
			timer = setInterval(function() {
				if (time == 0) {
					bool = true;
					clearInterval(timer);					
					$('.msgBtn').html("重新发送").removeClass('msgRe');
				} else {
					time--;
					obj.html(time + 's后重发');
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
		
		function checked_cod(imgcode){
			
			var checkExit = false;
			var veCode = imgcode;
			$.ajax({
				type : "POST",
				url : environment.basePath + "/wx/checkCode.do",
				async: false,
				data : {
					"veCode" : veCode
				},
				success : function(data) {
					
					if (data.code < 0) {
						$('.tip').show().html(data.msg);
						autoHide();
						checkExit = false;
					} else {
						$('.tip').hide();
						checkExit = true;
					}
				}
			});
			return checkExit;
		}

		//短信验证码按钮点击
		
		$('.msgBtn').on('click',function() {
			
			var phone_num = mobileNum;
			var veCode = $('#loanCommentCode').val().trim();
			if (!phone_num) {
				return;
			}
			if($(this).hasClass('msgRe')){
				return;
			}
			$.ajax({
				type : "POST",
				url : environment.basePath + "/wx/sendNewRegCode.do",
				data : {
					"userMobile" : phone_num,
					"type" : 8,
					"veCode" : veCode,
					"authenType" : 1
				},
				success : function(data) {
					
					if (data.code == -3) {
						freshVerifyCode();
						$('.tip').show().html(data.msg);
						autoHide();
					}else if (data.code == -2) {
						$('.tip').show().html(data.msg);
						autoHide();
						
					} else if(data.code == -1) {
						$('.tip').show().html(data.msg);
						autoHide();
					}else {
						$('。tip').hide();
						$('.msgBtn').addClass('msgRe');
						time($('.msgBtn'));
					}
				}
			});
		});

		
		//验证码框输入验证
	
		function check_yzm(msg,mobileNum) {
			
			var checkExit = false;
			var yzm_val = msg;
			var mobile = mobileNum;
			var reg = /^[0-9]{6}$/;
			
			if (yzm_val == '' || yzm_val == null) {
				$('.tip').show().html('请输入验证码');
				autoHide();
				return false;
			} else if (!reg.test(yzm_val)) {
				$('.tip').show().html('请输入正确的6位验证码');
				autoHide();
				return false;
			} else {
				$('.tip').hide();
				$.ajax({
							type : "POST",
							url : environment.basePath
									+ "/wx/newRegCheckCode.do",
							data : {
								"mobile" : mobile,
								"verifycode" : yzm_val,
								"authenType" : "1"
							},
							async : false,
							cache : false,
							success : function(data) {
								
								if (data.code < 0) {
									$('.tip').show().html(data.msg);
									autoHide();
									checkExit = false;
								} else {
									$('.tip').hide();
									
									checkExit = true;
								}
							}
						});
			}
			return checkExit;
		}

		$('#regBtn').click(function(e) {
			var imgCode = $('#loanCommentCode').val();
			var msg = $('#valInput').val();
			var pas = $('#password').val();
			var wxUserGameId = $("#wxUserGameId").val();
			var sign = $("#sign").val();
			e.stopPropagation(); 
			
			
			var result = checked_cod(imgCode);
			if(!checked_cod(imgCode)) {
				return;
			}
			;		
			
			result = check_yzm(msg,mobileNum);
			if (!check_yzm(msg,mobileNum)) {
				return;
			}
			;
			result = check_password(pas);
			if (!check_password(pas)) {
				return;
			}
			;
			
			register(wxUserGameId,sign);
			
		});

		function register(wxUserGameId,sign) {
			var mobile = mobileNum;
			var password = $('#password').val().trim();
			var verifycode = $('#valInput').val();
			var sr = $("#sr").val();
			var sign = sign;
			
			//var code = $('#yqm_num').val();
			//var sr = $('#sr').val();
			var url = environment.basePath + "/wx/newRegUser.do";
			$.post(url, {
				"mobile" : mobile,
				"password" : $.md5(password),
				"roles" : 1,
				"verifycode" : verifycode,
				"authenType" : 1,
				//"code" : code,
				//"sr":searchJson.sr,
				"sr":sr,
				"wxUserGameId" : wxUserGameId,
				"sign" : sign
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
				} else if (data == 20) {
					window.location.href = environment.basePath
					+"/views/error404.jsp";
					
				}else {
//					window.location.href = environment.basePath
//							+ "/recharge/openAccount.session";
					window.location.href = environment.basePath
					+ "/views/activity/olympic/comeonred.jsp?wxUserGameId="+wxUserGameId + "&sign="+sign;
				}
			}, "text");
		}
	})();
	
	/*注册校验end---------------------------------------*/
});