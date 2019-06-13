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
<%
    String path = request.getContextPath();
    String baseAndPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String serverName=request.getServerName()+"/";
%>

	<div class="main">
		<nav>
			<a class="logo back">中再融</a>
			<p class="loginText">登陆中再融，立即提现吧！</p>
		</nav>
		<ul class="loginBox">
			<li>
				<input type="hidden" value="${result.data.refPath}" id="refPath">
				<input id="pasPasword" class="pasInput borRadian" name="" type="password" placeholder="密码" maxlength="16" />
			</li>
			<li>
				<a id="pasLogin" class="loginBtn borRadian">登录</a>
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
