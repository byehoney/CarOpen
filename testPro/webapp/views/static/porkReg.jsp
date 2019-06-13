<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>中再融-注册</title> 
<%@ include file="/views/inc/inc.jsp"%>
 <link type="text/css" rel="stylesheet"
	href="${basePath}/resources/css/present/porkReg.css">
<style>
html {
    font-size : 100px;
}
@media only screen and (max-width: 320px){
	    html {
	        font-size: 50px !important;
	    }	
	}
	@media only screen and (min-width: 321px){
	    html {
	        font-size: 65px !important;
	    }
	}
	@media only screen and (min-width: 481px){
	    html {
	        font-size: 70px !important; 
	    }
	}
	@media only screen and (min-width: 569px){
	    html {
	        font-size: 80px !important; 
	    }
	}
	@media only screen and (min-width: 641px){
	    html {
	        font-size: 90px !important; 
	    }
	}
</style>	
</head>
<body>
	<%@ include file="/views/inc/header.jsp"%>
	<section class="main">
		<header></header>
		<section class="cont">
			<div class="regBox">
				<p class="lineBox">
					<i class="phoneIcon regBack"></i>
					<input id="phone" disabled="disabled" class="textInput borRadius phoneInput" type="text" placeholder="请输入手机号" maxlength="11" />
				</p>
				<div class="tip">
					<p class="wrong clearfx" id="mobileWrong">
						<i class="fl regBack"></i>
						<span class="fl wrongText"></span>
					</p>
				</div>
				<p class="lineBox">
					<i class="pasIcon regBack"></i>
					<input id="password" class="textInput borRadius pasInput" type="password" placeholder="请输入密码" maxlength="16" />
				</p>
				<div class="tip">
					<p class="wrong clearfx" id="passwordWrong">
						<i class="fl regBack"></i>
						<span class="fl wrongText">1手机号为空</span>
					</p>
				</div>
				<p class="lineBox clearfx">
					<i class="codeIcon regBack"></i>
					<input id="loanCommentCode" class="fl textInput borRadius codeInput" type="text" placeholder="请输入图形中的字符" maxlength="4" />
					<img id="loanCommentCodeId" class="fr codeImg borRadius" alt="" title="" src="${basePath}/userInfo/getCode.do" />
				</p>
				<div class="tip">
					<p class="wrong clearfx" id="codeidWrong">
						<i class="fl regBack"></i>
						<span class="fl wrongText"></span>
					</p>
				</div>
				<p class="lineBox clearfx">
					<i class="msgIcon regBack"></i>
					<input id="valInput" class="fl textInput borRadius msgInput" type="text" placeholder="请输入手机验证码" maxlength="6" />
					<span class="fr tc borRadius msgBtn">发送验证码</span>
				</p>
				<div class="tip">
					<p class="wrong clearfx" id="valWrong">
						<i class="fl regBack"></i>
						<span class="fl wrongText"></span>
					</p>
				</div>
				<p class="tip">
					<input id="agree" type="checkbox" checked="checked" />	
					<label for="agree">同意</label>
					<a href="http://m.zhongzairong.cn/views/agreement/serve_agreement.jsp">《服务协议》</a><span>、</span><a href="http://m.zhongzairong.cn/views/agreement/secret_agreement.jsp">《隐私条款》</a>
				</p>
				<div class="tip agreeTip">
					<p class="wrong agreeWrong clearfx" id="agreementWrong">
						<i class="regBack"></i>
						<span class="wrongText">请同意《服务协议》《隐私条款》</span>
					</p>
				</div>
				<p id="register" class="regBtn lineBox borRadius tc">立即注册</p>
			</div>
		</section>
		<footer>
		</footer>
	</section>
	<%@ include file="/views/inc/footer.jsp"%>
	<script type="text/javascript"
		src="${basePath}/resources/js/common/jquery.md5.js"></script>
	<script type="text/javascript" 
		src="${basePath}/resources/js/present/porkReg.js"></script>
</body>
</html>
