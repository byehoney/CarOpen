<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>零食礼包大派送</title> 
<%@ include file="/views/inc/inc.jsp"%>
<link rel="stylesheet" href="${basePath}/resources/css/present/selectPage.css"/>
<style type="text/css">
@media screen and (max-width: 320px){html{font-size:40px!important;}}
@media screen and (min-width: 320px){html{font-size:50px!important;}}
@media screen and (min-width: 375px){html{font-size:58.75px!important;}}
@media screen and (min-width: 410px){html{font-size:65px!important;}}
@media screen and (min-width: 500px){html{font-size:75px!important;}}
@media screen and (min-width: 620px){html{font-size:96px!important;}}
@media screen and (min-width: 760px){html{font-size:120px!important;}}
</style>
</head>
<body>
	<section class="contBox">
		<img class="banner_t" src="${basePath}/resources/image/static/present/banner_t.png"/>
		<img class="banner_b" src="${basePath}/resources/image/static/present/banner_b.png"/>
		<img class="parasol" src="${basePath}/resources/image/static/present/parasol_ioc.png"/>
		<a class="logo pubBack" href="http://m.zhongzairong.cn/">中再融</a>
		 <form class="formBox">
			<p class="textAllW textRadian textH posiP">
				<span class="phoneIcon pubBack icon"></span>
				<input id="phone" class="textW phoneInput left" type="text" placeholder="请输入手机号" maxlength="11" />
			</p>
			<div class="tip">
				<p class="wrong clear" id="mobileWrong">
					<i class="pubBack wrongIcon left"></i>
					<span class="wrongText left"></span>
				</p>
			</div>
			<p class="textAllW textH posiP textRadian">
				<span class="pasIcon pubBack icon"></span>
				<input id="password" class="textW pasInput" type="password" placeholder="请输入密码" maxlength="16" />
			</p>
			<div class="tip">
				<p class="wrong clear" id="passwordWrong">
					<i class="pubBack wrongIcon left"></i>
					<span class="wrongText left"></span>
				</p>
			</div>	
			<p class="clear textH posiP">
				<span class="codeIcon pubBack icon"></span>
				<input id="loanCommentCode" class="textW textInput left codeInput" type="text" placeholder="请输入图形中的字符" maxlength="4"/>
				<img id="loanCommentCodeId" class="validatorImg right textH" src='${basePath}/userInfo/getCode.do'/>
			</p>
			<div class="tip">
				<p class="wrong clear" id="codeidWrong">
					<i class="pubBack wrongIcon left"></i>
					<span class="wrongText left"></span>
				</p>
			</div>
			<p class="textAllW clear textH posiP">
				<span class="valiIcon pubBack icon"></span>
				<input type="hidden" id="sr" value="${sr}">
				<input id="valInput" class="textW textInput valiInput left" type="text" placeholder="请输入手机验证码" maxlength="6" />
				<span class="sendVal textRadian textCenter right">
					<i class="valBtn">发送验证码</i>
					<i class="valTime">120秒后重新发送</i>
				</span>
			</p>
			<div class="tip">
				<p class="wrong clear" id="valWrong">
					<i class="pubBack wrongIcon left"></i>
					<span class="wrongText left"></span>
				</p>
			</div>	
			<p class="acceptBox clear">
				<input class="left" type="checkbox" id="agree" checked="checked"/>
				<label for="agree" class="acceptWord left">同意</label>
				<a class="acceptWord left" href="${basePath}/views/agreement/serve_agreement.jsp">《服务协议》、</a>
				<a class="acceptWord left" href="${basePath}/views/agreement/secret_agreement.jsp">《隐私条款》</a>
			</p>
			<div class="tip">
				<p class="wrong clear" id="agreementWrong">
					<i class="pubBack wrongIcon left"></i>
					<span class="wrongText left"></span>
				</p>
			</div>
			<p id="register" class="textRadian textAllW textCenter textH gift">点击领取大礼包！</p>
		</form>
	</section>
	<footer>
	   	<div class="nav">
	   		<a href="http://m.zhongzairong.cn/">首页</a><span style="display:none;">/</span><a style="display:none;" href="${basePath}/download.do">下载客户端</a><span>/</span><a href="http://www.zhongzairong.cn/index.shtml">电脑版</a><span>/</span><a href="tel:4001-156-157">联系客服</a>
	   </div>
	   <p>中再融(北京)科技有限公司 版权所有</p>
	   <p>京ICP备16002418号-1</p>

	</footer>
	<%@ include file="/views/inc/footer.jsp"%>
	<script type="text/javascript"
		src="${basePath}/resources/js/common/jquery.md5.js"></script>
	<script type="text/javascript" 
		src="${basePath}/resources/js/present/selectPage.js"></script>
		<script>
		function freshVerifyCode(){
	        var loanCommentCodeid = document.getElementById("loanCommentCodeId");
	        var d = new Date();
	        loanCommentCodeid.src = '${basePath}/userInfo/getCode.do?a='+d.getTime();
	    }
		</script>

</body>
</html>
