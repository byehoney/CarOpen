window.onload = function () {
	var pathUrl=environment.basePath;
	//图片验证码动态刷新
$(".tg_code").click(function(){
		$(this).attr("src",pathUrl+"/userInfo/getCode.do?v="+Math.random())
})
	//弹窗获取主页面手机号	
	$(".red_popup").click(function () {
        if(!checkPhone($(".usermobNum"))){return;};//手机号码是否正确
        if(checkIsExist($(".usermobNum"))){//手机号码是否存在
            infoTips('该手机号码已经注册');
            return;
        };
			$(".popup").show();
			$("#overlay").show();
			$('#phoneNum').val($(".usermobNum").val());
	})
	$('.return_top').click(function(){
		$('html, body').animate({ 
		    scrollTop: "0",	   
		  }, 500 ,function(){
			  $(".usermobNum").focus();
		  });
	})
    $("#overlay").click(function () {
        $(".popup").hide();
        $("#overlay").hide();
        $(".popup input").val('');
    })
	function checkPhone(obj) {
		var checkExit = false;
		var reg = /^1[3-9]\d{9}$/;
		var phone_val = obj.val();
		if (phone_val == '' || phone_val == null) {	
			infoTips('手机号不能为空');
			$(".usermobNum").focus();
			$('#phoneNum').focus();
			return false;
		} else if (!reg.test(phone_val)) {		
			infoTips('请输入正确的11位手机号');
			$(".usermobNum").focus();
			$('#phoneNum').focus();
			return false;
		} else {
			checkExit = true;		
		}
		return checkExit;
	}
	//2手机号输入框聚焦值清空
	$('#phoneNum').blur(function(){
		checkPhone($(this))	
	});
	//同意协议
	$('.agree').click(function(){
		$(this).toggleClass('pop_agron');
	});
	//弹窗点击注册按钮
	 $('#reg_btn').on('click', function() {
         if(!checkPhone($("#phoneNum"))){return;}; //手机号码是否正确
         if(checkIsExist($("#phoneNum"))){//手机号码是否存在
             infoTips('该手机号码已经注册');
             return;
         };
		//是否同意协议
		 if(!$('.agree').hasClass('pop_agron')){infoTips('请同意服务协议'); return; };

	     if (!checked_cod()) {//图片验证码是否正确
	      return;
	   	};
	   	if(!checkValidCode()){//短信验证码
	      return;
	    };
	   goToRegist();
	  });
	  
	$('.pop_msg_count').on('click',function(){
	//获取短信验证码按钮交互
		var phoneNum = $('#phoneNum').val().trim();
		var veCode = $('#input_code').val().trim();
		var isSend = true;
	   	if($(this).hasClass('reSendCode')){return false;}
		//手机号是否正确
	  	if(!checkPhone($('#phoneNum'))){return false;}
        if(checkIsExist($("#phoneNum"))){//手机号码是否存在
            infoTips('该手机号码已经注册');
            return;
        };
	    //图片验证码是否正确
	    if (!checked_cod()) {return false;};
			$.ajax({
				type : "POST",
				url : environment.basePath + "/register/sendNewRegCode.do",
				data : {
					"userMobile" : phoneNum,
					"type" : 8,
					"authenType" : 1,
					"veCode" : veCode
				},
				success : function(data) {
					if (data.code == -3) {
						infoTips(data.msg);
					}else if (data.code == -2) {
						infoTips(data.msg);
					} else if(data.code == -1) {
						infoTips(data.msg);
					}else {
						time($('.pop_msg_count'));
					}
				}
			});
		});
	function checkValidCode(){
	  //验证码
	  var validNum =  $('#msg_num').val().trim();
	  //判断验证码
	  if (validNum.length == 0) { 
	      $('#msg_num').focus();
	       infoTips('请输入验证码');
	      return false;
	  }
	  return true;
	}
    //检查手机号是否被注册
    function checkIsExist(obj) {
        var checkIsExit = false;
        var mobile = obj.val();
        var url = environment.basePath + "/checkMobileIsExist.do"
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
	//短信发送倒计时
	function time(obj) {
	  var time = 59, timer;	  
	  clearInterval(timer);
	  obj.html(time + 's');
	  obj.removeClass('sendCode');
	  obj.addClass('reSendCode');
	  timer = setInterval(function() {
	    if (time == 0) {
	      clearInterval(timer);
	      obj.html('重新发送');
	      obj.addClass('sendCode');
	      obj.removeClass('reSendCode');
	    } else {
	      time--;
	      obj.html(time + 's');
	    }
	  }, 1000);
	}
	
// 图片验证码--完成
	function checked_cod(){		
			var checkExit = false;
			var veCode = $('#input_code').val().trim();
			if($("#input_code").val()==null || veCode=='' ){
				 infoTips('请输入图片验证码');
			      return;
		    };
			$.ajax({
				type : "POST",
				url : environment.basePath + "/register/checkCode.do",
				async : false,
				cache : false,
				data : {
					"veCode" : veCode
				},
				success : function(data) {	
					if (data.code < 0) {
						infoTips('图片验证码不正确');
						checkExit = false;
					} else {
						checkExit = true;
					}
				}
			});
			
			return checkExit;
		}

	//注册--完成
	function goToRegist() {
		var mobile = $('#phoneNum').val();
		var code = $('#msg_num').val();//短信验证码
		var sr = '';
		var pwd = '';
		var yqm=getUrlParams('yqm')?getUrlParams('yqm'):'';
		var url = environment.basePath + "/register/newRegUser.do";
		$.post(url, {
			"mobile" : mobile,
			"authenType" : 1,
			"roles" : 1,
			"verifycode" : code,
			"sr":sr,
			"password": pwd,
			"code" : yqm
		},
		function(data, varStatus) {
			if (data == 4) {
				infoTips('请输入验证码');
				return false;
			} else if (data == 0) {
				infoTips('请输入手机号');
				return false;
			} else if (data == 1) {
				infoTips('手机号码格式错误');
				return false;
			} else if (data == 10) {
				infoTips('手机号已存在');
				return false;
			} else if (data == 8) {
				infoTips('请先获取验证码');
				return false;
			} else if (data == 5) {
				infoTips('<p>已3次验证码错误，</p><p>请24小时后重试</p>');
				return false;
			} else if (data == 2) {
				infoTips('请输入密码');
				return false;
			} else if (data == 6) {
				infoTips('验证码错误');
				return false;
			} else if (data == 7) {
				infoTips('<p>验证码已失效，</p><p>请重新发送</p>');
				return false;
			} else if (data == 9) {
				infoTips('注册失败');
				return false;
			} else {
				window.location.href=environment.basePath+'/redpacketsdone.do';
			}
		}, "text");
	}


	function infoTips(tip){
		$(".error_msg").html(tip).show();
		setTimeout(function  () {
    		$(".error_msg").hide();
    	}, 1500)
	}
    //app获取用户名
    function getUrlParams(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
    // 微信分享
	var shareUrl=location.href.split('#')[0];
    // var arrtitle=['好友送你100元红包，点击领取','狂欢双11，6重壕礼送不停！','奉上100元红包证明我在关心你！','20g金条送给你，一起来狂欢啊！','我在中再融投资很久了，给你准备了超值的奖励！','您收到一份11.11狂欢礼包，快看看是什么！'];
    // var arrdesc=['新手专享15%年化收益！诚心推荐中再融（已签约存管），国资平台安全可信赖！','唯有壕礼暖人心，金条、电视、红包...新手15%的年化收益，请收下中再融这份心意吧！','我一直在安全可信赖的国资平台（已签约存管）中再融理财，特邀你一起来赚钱！新用户即送100元红包哦~','11.11，投资即送金条、电视、扫地机...是真的有这样的好事呢','100元红包+15%年化收益+无限量壕礼，就差你了','厉害了！每日加息2%，新手还可享15%年化收益，戳我领走→'];
	var arrtitle="点击领取999元红包！手慢无！";
	var arrdesc="好友喊你领红包";
    function GetRandomNum(Min,Max){
        var Range = Max - Min;
        var Rand = Math.random();
        return(Min + Math.round(Rand * Range));
    }
    var sj = GetRandomNum(0,5);
    $.ajax({
        type : "POST",
        dataType:"JSON",
        url : environment.basePath + "/WxShare.do",
        async : false,
        cache : false,
        data : {'shareUrl':shareUrl},
        success : function(data) {
            wx.config({
                debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                appId: data.appId, // 必填，公众号的唯一标识
                timestamp: data.timestamp, // 必填，生成签名的时间戳
                nonceStr: data.nonceStr, // 必填，生成签名的随机串
                signature: data.signature,// 必填，签名，见附录1
                jsApiList: ['onMenuShareTimeline','onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
            });
        }
    });
    wx.ready(function(){
        //分享朋友圈
        wx.onMenuShareTimeline({
            title:  arrtitle,// 分享标题
            link: shareUrl, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: 'https://m.zhongzairong.cn/resources/image/common/wxShare.png', // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
        // 分享朋友
        wx.onMenuShareAppMessage({
            title:arrtitle, // 分享标题
            desc:arrdesc, // 分享描述
            link: shareUrl, // 分享链接
            imgUrl: 'https://m.zhongzairong.cn/resources/image/common/wxShare.png', // 分享图标
            type: '', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
    });
};



