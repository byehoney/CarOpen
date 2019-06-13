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
			<p class="regText">呀，您还未注册中再融，获取验证码注册提现吧！</p>
		</nav>
		<ul class="regBox">
			<li class="clearfix">
				<input id="loanCommentCode" class="valInput borRadian fl" name="" type="text" placeholder="校验码" maxlength="4" />
				<span class="fr imgSpan borRadian">
					<img id="loanCommentCodeId" class="borRadian" alt="" title="" src="${basePath}/userInfo/getCode.do" />
				</span>
			</li>
			<li class="clearfix">
				<input id="valInput" class="msgInput borRadian fl" name="" type="text" placeholder="短信验证码" maxlength="6" />
				<span class="fr msgBtn borRadian">发送验证码</span>
			</li>
			<li>
				<input id="password" class="pasInput borRadian" name="" type="password" placeholder="输入密码" maxlength="16" />
			</li>
			<li>
				<a id="regBtn" class="loginBtn borRadian">注册</a>
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
