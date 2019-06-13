$(function(){
	
	
	 var mySwiper = new Swiper('.swiper-container', {
	        direction : 'vertical',
	        grabCursor : true,
	        setWrapperSize :true,
	        watchSlidesProgress : true,
	        watchSlidesVisibility : true,
	        onTransitionStart: function(swiper){
	            if(mySwiper.activeIndex == 2){
	                document.querySelector('#upIcon').style.display = "none";
	            }else{
	                document.querySelector('#upIcon').style.display = "block";
	            }
	        }

	    });
	    $('#toFirst').click(function(){
	    	mySwiper.slideTo(0, 1000, false);//切换到第一个slide，速度为1秒
	    })
	    
	    
	    
	    //sendMsg部分
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
			obj.html(time);
			obj.addClass('reSend');
			timer2 = setInterval(function() {
				if (time == 0) {
					bool = true;
					clearInterval(timer2);
					obj.html('重新发送');
					obj.removeClass('reSend');
				} else {
					time--;
					obj.html(time);
				}
			}, 1000);
		}
		function sendMsg(timeObj,tipObj,mobile){
			var obj = timeObj || $('#endMsg');
			var tip = tipObj || $('.wrongTip');
			if($('#mask').css('display') == 'block'){
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
			
			
			$('#msgMobile').html(mobileNum);
			$('#mask').show();
			$('[name=msg]').val('');
			$('#regTipCont').hide();
			$('.close').on('click',function(){
				$('#mask').hide();
				$('#sendRegReq').off('click');
				$('#sendMsg').off('click');
			});
			//注册框发送短信按钮
			$('#sendMsg').on('click',function(e){
				e.stopPropagation();
				sendMsg($('#sendMsg'), $('#regTipCont'),mobileNum);
			});
			
			//去注册
			$('#sendRegReq').on('click',function(e){
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
							//获取脉脉回调
							
							if(searchJson.mmtoken){
								var mmtoken = searchJson.mmtoken;
								$.ajax({
							        url: 'https://maimai.cn/hb_pingback',
							        async: false,
							        type: 'get',
							        dataType: 'jsonp',
							        data: {"mmtoken":mmtoken,"need_callback":1},
							        jsonp: "callback",//服务端用于接收callback调用的function名的参数
							        success : function(data){
							        	window.location.href = environment.basePath
										+ "/crayfishsuc.do";
							        },
							        error:function(){
							        	window.location.href = environment.basePath
										+ "/crayfishsuc.do";
							        }
							    });
							}else {
								window.location.href = environment.basePath
								+ "/crayfishsuc.do";
							}
								
							
							
						}
					}, "text");
				}
			});
			
		}
		$('#toReg').on('click',function(){
			var mobileNum = $('#phone').val();
			var loactionUrl = window.location.href;
			//手机号校验
			if(!checked_mobile()){
				return;
			}
			
			//判断手机号并发送短信
			if(!sendMsg($('#sendMsg'), $('.wrongTip'),mobileNum)){
				return;
			}
			
			//注册
			regFloor(mobileNum);
	    	
	    });

		
});