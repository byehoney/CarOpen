<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<c:set var="user" value="${sessionScope.userObj }"></c:set>
<c:set var="dateexp" value="yyyy-MM-dd"></c:set>
<c:set var="dateslashexp" value="yyyy/MM/dd"></c:set>
<c:set var="timeexp" value="yyyy-MM-dd HH:mm:ss"></c:set>
<c:set var="datepointexp" value="yyyy.MM.dd"></c:set>
<c:set var="timehmsexp" value="HH:mm:ss"></c:set>
<c:set var="moneyexp" value="#,##0.00#"></c:set>
<c:set var="moneyexpInt" value="#,##0"></c:set>
<c:set var="aunualInterestRateExp" value="##0.0#"></c:set>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>注册即送一百元红包</title>
<meta name="author" content="m.zhongzairong.cn">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<script type="text/javascript">
	var environment = {basePath : '${basePath}'};
</script>
<link rel="icon" href="${basePath}/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
<script src="${basePath}/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<link href="${basePath}/resources/css/activity/regmember.css" type="text/css" rel="stylesheet">
<!--Google统计代码-->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75483023-1', 'auto');
  ga('send', 'pageview');
</script>

<!--PC百度统计代码-->
<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?455a255e408c3cc82f67b07d05532d54";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
</script>
<!--摩比万思DSP统计代码-->
<script src="//dsp.svc.mobivans.com/track/js/44c38924-d3dd-49a7-b94a-a622a415f8d6"></script>
<!--CNZZ监控代码-->
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan style='display:none;' id='cnzz_stat_icon_1259823916'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/z_stat.php%3Fid%3D1259823916' type='text/javascript'%3E%3C/script%3E"));</script>

</head>
<body style="background:#fff;">
    <div class="tg_banner">
	   <img src="${basePath}/resources/image/static/activity/tg_banner.jpg"/>
	</div>
	<div class="safety">
	   <ul class="clearfix">
	      <li>
		     <div class="state_owned"></div>
			 <span>国资背景</span>
			 <p>服务中再生协会</p>
		  </li>
		  <li>
		     <div class="high_yield"></div>
			 <span >稳健收益</span>
			 <p>银行活期的31倍</p>
		  </li>
		  <li>
		     <div class="safe"></div>
			 <span>安全保障</span>
			 <p>资金全程托管</p>
		  </li>
	   </ul>
	</div>
		<div class="login_content zg_bg">   
			<div class="login">
				<div class="phone_box">
					<span class="phone_icon"><img src="${basePath}/resources/image/phone_icon.png"></span>
					<div class="phone_txt">
						<input type="hidden" id="sr" value="${sr}">
						<input type="text" id="phone" placeholder="请输入手机号" maxlength="11">
					</div>
					<span class="success_icon" style="display: none;"><img style="display: none" id="mobile_success" src="${basePath}/resources/image/success_icon.png" alt="success"></span>
				</div>
				<div class="margin_box">
					<div class="error" id="mobile_wrong" style="display: none;">手机号不能为空</div>
				</div>
				<div class="password">
					<span class="password_icon"><img src="${basePath}/resources/image/password_icon.png"> </span>
					<div class="password_txt">
						<input type="text" id="password" style="display: none;" placeholder="请输入密码" maxlength="16"> <input type="password" id="password2" style="display: block;" placeholder="请输入密码" maxlength="16">
					</div>
					<span class="toggle_icon" style="display:none"></span>
				</div>
				<div class="margin_box">
					<div class="error" id="password_wrong" style="display: none;">请输密码</div>
				</div>

			<div class="yzm_box" id="imgyzm" >
            	<div class="yzm_left">
                	<div class="yzm_txt"><input type="text" id="loanCommentCode" placeholder="请输入图形中的字符" maxlength="4"></div>
            	</div>
	            <div class="yzm_right">
	                <a href="javascript:;"><img id="loanCommentCodeId" onclick="freshVerifyCode()" src="${basePath}/userInfo/getCode.do"></a>
	            </div>
	        </div>
        
		<div class="margin_box">
			<div class="error" id="codeid_wrong" style="display: none;">请输入图片验证码</div>
		</div>
				<div class="yzm_box">
					<div class="yzm_left">
						<span class="yzm_icon"><img src="${basePath}/resources/image/yzm_icon.png"></span>
						<div class="yzm_txt">
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
				<div class="margin_box" >
					<div class="error" id="yzm_wrong"></div>
					<!-- <div class="yzm_ts" id="password_ts" style="display:none">如果您收不到短信，<a href="javascript:;" id="yuying">请语音获取。</a>
					</div> -->
				</div>
  
				<div class="code_btn" style="display:none;">
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
				<div class="xy_box">
					<input type="checkbox" id="agreement" checked="checked"> <span>我已阅读并同意</span>
					《<a href="http://m.zhongzairong.cn/views/agreement/serve_agreement.jsp">服务协议</a>》
					《<a href="http://m.zhongzairong.cn/views/agreement/secret_agreement.jsp">隐私条款</a>》
				</div>
				<div class="margin_box">
					<div class="error" id="agreement_wrong"></div>
				</div>
				<div class="registration_btn">
					<a href="javascript:;" id="register">立即注册领取红包</a>
				</div>
			</div>
		</div>
		<div class="tg_title">
		   <span>关于中再融</span>
		</div>
		<div class="presentation">
		  <p>中再融服务于中国再生资源回收利用协会会员单位。通过中再融风控并推荐，您可以投资给协会下的优质借款企业，获得收益回报。</p>
		</div>
		<img src="${basePath}/resources/image/static/activity/diagram.jpg">
		<div class="tg_btn">
		   <span>注册领999元红包</span>
		   <img src="${basePath}/resources/image/static/activity/tg_btn.jpg">
		</div>
	
<!--底部-->
<div class="footer">
   <p>中再融(北京)科技有限公司 版权所有│京ICP备16002418号-1</p>
   <p>平台提醒：市场有风险,投资需谨慎</p>
</div>
<!--底部end-->
<%-- <%@ include file="/views/inc/footer.jsp"%> --%>
	<script type="text/javascript"
		src="${basePath}/resources/js/common/jquery.md5.js"></script>
	<script type="text/javascript">
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
				return false;
			} else if (!reg.test(phone_val)) {
				$('.success_icon').hide();
				$('#mobile_wrong').show().html('请输入正确的11位手机号');
				return false;
			} else {
				$('.success_icon').show();
				$('#mobile_wrong').hide();
				$('#mobile_success').show();
				checkExit = true;
				/* $.ajax({弃用此ajax，防止已注册手机号被刷
					type : 'POST',
					url : environment.basePath
							+ "/register/checkExistMobile.do",
					data : {
						"userMobile" : phone_val
					},
					async : false,
					cache : false,
					success : function(data) {
						if (data.code < 0) {
							$('#mobile_success').hide();
							$('#mobile_wrong').html(data.msg).show();
							checkExit = false;
						} else {
							$('#mobile_wrong').hide();
							$('#mobile_success').show();
							checkExit = true;
						}
					}
				}); */
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
				return false;
			}
			if (pasd_val.length<6 || pasd_val.length>16) {
				$('#password_wrong').show().html('密码格式不正确，请输入正确的6-16位密码');
				return false;
			} else {
				$('#password_wrong').hide();
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
				url : environment.basePath + "/register/checkCode.do",
				data : {
					"veCode" : veCode
				},
				success : function(data) {
					if (data.code < 0) {
						$('#codeid_wrong').html(data.msg).show();
						checkExit = false;
					} else {
						$('#codeid_wrong').hide();
						checkExit = true;
					}
				}
			});
			return checkExit;
		}

		//短信验证码按钮点击
		$('.yzm_btn').click(function() {
			var phone_num = $('#phone').val().trim();
			var veCode = $('#loanCommentCode').val().trim();
			if (!checked_mobile()) {
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

		//语音提示
		/* $('#yuying').click(
				function() {
					var val = $('#phone').val();
					if (!checked_mobile()) {
						return;
					}
					$(this).parent().html(
							'您的手机' + val.substring(0, 3) + '****'
									+ val.substring(7)
									+ '将在60秒内收到 400-068-1176 的电话，请注意接听。');
					$.ajax({
						type : "POST",
						url : environment.basePath
								+ "/register/sendNewRegCode.do",
						data : {
							"userMobile" : val,
							"type" : 500,
							"authenType" : 1
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
							} else {
								$('#yzm_wrong').hide();
							}
						}
					});
				}); */

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
				return false;
			} else if (!reg.test(yzm_val)) {
				$('#yzm_wrong').show().html('请输入正确的6位验证码');
				return false;
			} else {
				$('#yzm_wrong').hide();
				$
						.ajax({
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
								} else {
									$('#yzm_wrong').hide();
									$('#password_ts').show();
									checkExit = true;
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
			result = check_password();
			if (!check_password()) {
				return;
			}
			;
			result = checked_cod();
			if(checked_cod()) {
				return;
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
			var sr = $("#sr").val();
			var url = environment.basePath + "/register/newRegUser.do";
			$.post(url, {
				"mobile" : mobile,
				"password" : $.md5(password),
				"roles" : 1,
				"verifycode" : verifycode,
				"authenType" : 1,
				"code" : code,
				"sr" : sr
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
		
$('.tg_btn').click(function(){backdb();})
function backdb(){
   var h=$(".tg_banner").outerHeight()+"px";
   $('html,body').animate({ scrollTop:h},600);
   $(".phone_txt input").focus();
   return false;
}

	</script>
</body>
</html>