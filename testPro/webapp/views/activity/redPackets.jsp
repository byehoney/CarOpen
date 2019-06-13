<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="author" content="m.zhongzairong.cn">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<title>新手专享12%年化收益</title>
<%@ include file="/views/inc/inc.jsp"%>
<script src="${basePath}/resources/js/activity/redPackets.js"></script>
<script src="${basePath}/resources/js/common/jweixin-1.0.0.js"></script>
<link rel="stylesheet" href="${basePath}/resources/css/activity/redPackets.css">
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

<!--热力图-->
<script type="text/javascript">
    window._pt_lt = new Date().getTime();
    window._pt_sp_2 = [];
    _pt_sp_2.push('setAccount,392d7037');
    var _protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    (function() {
        var atag = document.createElement('script'); atag.type = 'text/javascript'; atag.async = true;
        atag.src = _protocol + 'js.ptengine.cn/pta.js';
        var stag = document.createElement('script'); stag.type = 'text/javascript'; stag.async = true;
        stag.src = _protocol + 'js.ptengine.cn/pts.js';
        var s = document.getElementsByTagName('script')[0]; 
        s.parentNode.insertBefore(atag, s); s.parentNode.insertBefore(stag, s);
    })();
</script>
</head>
<body>
 	<div class="page">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;overflow:auto;-webkit-overflow-scrolling : touch;">
    	<!-- banner图 手机号领取 -->
			<div class="top">
				<div class="top_banner">
					<div class="top_banner01">
						<a href="javascript:;" target="_blank">
							<img src="${basePath}/resources/image/activity/redPackets/logo.png" alt="中再融">
						</a>
					</div>
					<div class="top_banner02"></div>
					<div class="top_banner03"></div>
					<div class="red_packet01"></div>
				</div>
				<div class="red_packet">
					
					<div class="red_packet02">
						<input class="btn usermobNum" type="text" placeholder="请输入手机号" maxlength="11">
					</div>
					<div class="red_packet03">
						<a  class="btn red_popup" href="javascript:;">
							立即注册领红包
						</a>
						<p class="pk_tip1">中再融不会在任何地方泄露您的手机号码</p>
						<p class="pk_tip2">（理财有风险 入市需谨慎）</p>
					</div>
				</div>
			</div>
		<!-- 选择理由 -->
			<div class="con_reason">
				<h2>为什么选择中再融</h2>
				<ul>
					<li class="rea_item1 clearfx">
						<div class="pic"></div>
						<div class="txt">
							<h3>可靠的国资背景</h3>
							<p>中国再生资源回收利用协会战略入股。</p>
						</div>
					</li>
					<li class="rea_item2 clearfx">
						<div class="pic"></div>
						<div class="txt">
							<h3>资金托管更安全</h3>
							<p>资金全程由第三方平台汇付天下托管，资金更安全。</p>
						</div>
					</li>
					<li class="rea_item3 clearfx">
						<div class="pic"></div>
						<div class="txt">
							<h3>丰富的理财福利</h3>
							<p>注册即可领取红包，新用户专享12%预期年化收益</p>
						</div>
					</li>
					<li class="rea_item4 clearfx">
						<div class="pic"></div>
						<div class="txt">
							<h3>投资理财灵活快捷</h3>
							<p>App随时理财，50元起投，T+1快速提现。</p>
						</div>
					</li>
				</ul>
				<a class="btn return_top" href="javascript:;">
							立即注册领红包
				</a>
				<p class="pk_tip1">中再融不会在任何地方泄露您的手机号码</p>
				<p class="pk_tip2">（理财有风险 入市需谨慎）</p>
			</div>
		</div>
		<!-- 弹窗 -->
			<div class="popup">
			<!-- 输入手机号 -->
				<input id="phoneNum" class="btn btn_mobnumber" type="text" maxlength="11" >
			<!-- 文字验证码 -->
				<div class="pop_check_txt">
					<input id="input_code" class="pop_num" type="text" maxlength="4">
					<img class="img-code tg_code" src="${basePath}/userInfo/getCode.do" alt="验证码" title="验证码">
				</div>
			<!-- 短信验证 -->
				<div class="pop_check_msg">
					<input class="pop_num" id="msg_num" type="text" maxlength="6" >
					<span class="pop_msg_count">发送验证码</span>
					
				</div>
				<a id="reg_btn" class="btn" href="javascript:;">
							立即注册领红包
				</a>
				<div class="pop_agr clearfx">				
					<i class="agree pop_agron"></i>
					<span>同意<a href="${basePath}/views/agreement/serve_agreement.jsp">《服务协议》</a>、<a href="${basePath}/views/agreement/secret_agreement.jsp">《隐私条款》</a>
					</span>
				</div>			 
			</div>
			<div id="overlay"></div>
			<div class="error_msg" style="display:none"></div>
		</div>

</body>
</html>