<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>为中国加油！</title> 
<%@ include file="/views/inc/inc.jsp"%>
 <link type="text/css" rel="stylesheet"
	href="${basePath}/resources/css/activity/olympic/comeOnRem.css">	
</head>
<body>
	<div class="main">
		<nav>
			<a class="logo back">中再融</a>
			<div class="redPackets">
				<p>
					<span class="redShake borRadian">10.00元现金</span><span>已到账</span>
				</p>
				<p class="smallText">输入手机号立即提现</p>
			</div>
		</nav>
		<ul class="loginBox">
			<li>
				<input id="phone" class="mobileInput borRadian" name="" type="text" placeholder="手机号" maxlength="11" />
			</li>
			<li>
				<a id="nextBtn" class="loginBtn borRadian">下一步</a>
			</li>
			<li class="tip borRadian"></li>
		</ul>
		<ul class="description clearfix">
			<li class="fl">
				<p class="iconL back"></p>
				<p class="bigP">国资平台</p>
				<p>中再生协会唯一 </p>
				<p>指定互联网金融平台</p>
			</li>
			<li class="fl">
				<p class="iconM back"></p>
				<p class="bigP">产业金融</p>
				<p>服务于再生资源产业 </p>
				<p>实现转型升级</p>
			</li>
			<li class="fl">
				<p class="iconR back"></p>
				<p class="bigP">安全保障</p>
				<p>融资担保 </p>
				<p>第三方资金托管</p>
				<p>全程投资保障</p>
			</li>
		</ul>
	</div>
	<script type="text/javascript"
		src="${basePath}/resources/js/common/jquery.md5.js"></script>
	<script type="text/javascript" 
		src="${basePath}/resources/js/activity/comeOn.js"></script>
</body>
</html>
