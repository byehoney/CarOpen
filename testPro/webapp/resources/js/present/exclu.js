$(function(){
	var timer2 = null;
	function hide5s(obj){
		//错误提示框消失
		var timer = null;
		var obj = obj || $('.wrongTip');
		clearTimeout(obj.timer);
		obj.timer = setTimeout(function(){
			obj.hide().html('');
		},3000);
		obj.on('click',function(){
			obj.hide().html('');
		});
	}
	//短信发送
	function time(obj,isSend) {
		
		var time = 59;
		if(!isSend){
			return;
		}
		
		clearInterval(timer2);
		obj.html(time + 's重新发送');
		obj.addClass('reSend');
		timer2 = setInterval(function() {
			if (time == 0) {
				bool = true;
				clearInterval(timer2);
				obj.html('重新发送');
				obj.removeClass('reSend');
			} else {
				time--;
				obj.html(time + 's重新发送');
			}
		}, 1000);
	}
	function sendMsg(timeObj,tipObj,mobile){
		var obj = timeObj || $('.sendMsg');
		var tip = tipObj || $('.wrongTip');
		if($('.shadowFloor').css('display') == 'block'){
			if(obj.hasClass('reSend')){		
				return;
			}
		}
		
		var isSend = true;
		var tipText = '';
		$.ajax({
		    type: "POST",
		    url: environment.basePath +"/register/checkMobileSendCode.do" ,
		    dataType : 'json',
		    async: false,
		    data: {
	    		"phone":mobile
		    },
		    success: function(data){
		    	
		          if(data){
		            if(data.msg == 0){
		            	
		            	tipText = '手机号已存在';
		            	tip.text(tipText);
		            	tip.show();
		            	hide5s();
		            	isSend = false; 
		            	return;
		            }else if(data.msg == 2){
		            	
		            	tipText = '手机号码为空';
		            	tip.text(tipText);
		            	tip.show();
		            	hide5s();
		            	isSend = false; 
		            	return;
		            }else if(data.msg == 3){
		            	tipText = '每天只能发送5次验证码哦，如果您收不到验证码，请拨打我们的4001-156-157，寻求客服的帮助。';
		            	tip.text(tipText);
		            	tip.show();
		            	hide5s();
		            	isSend = false; 
		            	return;
		            	
		            }
		          }
		          time(obj,isSend);
		     }
		});
		
		return isSend;
	}
	
	$('#toTop').on('click',function(){
		 $('body,html').animate({scrollTop:0});  
	});
	//验证手机号
	//$('#phone').on('blur', checked_mobile);
	
	function checked_mobile() {
		var checkExit = false;
		var reg = /^1[3-9]\d{9}$/;
		var phone_val = $('#phone').val();
		if (phone_val == '' || phone_val == '请输入手机号' || phone_val == null) {
		
			$('.wrongTip').show().html('手机号不能为空');
			hide5s();
			return false;
		} else if (!reg.test(phone_val)) {
			
			$('.wrongTip').show().html('请输入正确的11位手机号');
			hide5s();
			return false;
		} else {
			
			$('.wrongTip').hide();

			checkExit = true;
			
		}
		return checkExit;
	}
	function regFloor(mobileNum){
		//注册层出现
		$('input[name=mobile]').val(mobileNum);
		$('.shadowFloor').show();
		$('[name=msg]').val('');
		$('#regTipCont').hide();
		$('.close').on('click',function(){
			$('.shadowFloor').hide();
			//clearInterval(timer2);
			$('#goReg').off('click');
			$('.sendMsg').off('click');
		});
		//注册框发送短信按钮
		$('.sendMsg').on('click',function(e){
			e.stopPropagation();
			sendMsg($('.sendMsg'), $('#regTipCont'),mobileNum);
		});
		
		//去注册
		$('#goReg').on('click',function(e){
			e.stopPropagation();
			if($('input[name=msg]').val() == ''){
				$('#regTipCont').show().html('验证码不能为空');
				hide5s($('#regTipCont'));
				return;
			}
			if(!$('#checkbox_a2').prop('checked')){
				$('#regTipCont').show().html('请同意《服务协议》和《隐私条款》');
				hide5s($('#regTipCont'));
				return;
			}
			register();
			
			
			
			function register() {
				var mobile = mobileNum;				
				var code = $('[name=msg]').val();
				var sr = '';
				var pwd = '';
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
				if(searchJson.sr){
					sr = searchJson.sr;
				}
				
				var url = environment.basePath + "/register/newRegUser.do";
				$.post(url, {
					"mobile" : mobile,
					"authenType" : 1,
					"roles" : 1,
					"verifycode" : code,
					"sr":sr,
					"password": pwd
				}, function(data, varStatus) {
					
					if (data == 4) {
						$('#regTipCont').show().html('请输入验证码');
						hide5s($('#regTipCont'));
						return false;
					} else if (data == 0) {
						$('#regTipCont').show().html('请输入手机号');
						hide5s($('#regTipCont'));
						return false;
					} else if (data == 1) {
						$('#regTipCont').show().html('手机号码格式错误');
						hide5s($('#regTipCont'));
						return false;
					} else if (data == 10) {
						
						$('#regTipCont').show().html('手机号已存在');
						
						hide5s($('#regTipCont'));
						return false;
					} else if (data == 8) {
						$('#regTipCont').show().html('请先获取验证码');
						hide5s($('#regTipCont'));
						return false;
					} else if (data == 5) {
						$('#regTipCont').show().html('每天只能发送5次验证码哦，如果您收不到验证码，请拨打我们的4001-156-157，寻求客服的帮助。');
						hide5s($('#regTipCont'));
						return false;
					} else if (data == 2) {
						$('#regTipCont').show().html('请输入密码');
						hide5s($('#regTipCont'));
						return false;
					} else if (data == 6) {
						
						$('#regTipCont').show().html('验证码错误');
						hide5s($('#regTipCont'));
						return false;
					} else if (data == 7) {
						$('#regTipCont').show().html('验证码已失效，请重新发送');
						hide5s($('#regTipCont'));
						return false;
					} else if (data == 9) {
						$('#regTipCont').show().html('注册失败');
						hide5s($('#regTipCont'));
						return false;
					} else {
						
						window.location.href = environment.basePath
								+ "/register/toregsuccess.do";
					}
				}, "text");
			}
		});
		
	}
	$('.eventBtn').on('click',function(e){
		e.stopPropagation();
		var mobileNum = $('#phone').val();
		var loactionUrl = window.location.href;
		//var url = environment.basePath + "/register/checkMobileSendCode.do";
		//手机号校验
		if(!checked_mobile()){
			return;
		}
		//判断手机号并发送短信
		if(!sendMsg($('.sendMsg'), $('.wrongTip'),mobileNum)){
			return;
		}
		
		//注册
		regFloor(mobileNum);
		
		
	});
	
	
	//跳转页面
	toIndex();
	function toIndex(){
		var delay = document.querySelector('#time').innerHTML;
		var toIndexTimer = setInterval(function(){
			if(delay > 1){
				delay--;
				document.querySelector('#time').innerHTML = delay;
			}else {
				clearInterval(toIndexTimer);
				window.location.href = "http://m.zhongzairong.cn/";
			}
		},1000);
	}
	
	
});