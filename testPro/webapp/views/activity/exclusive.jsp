<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<%
double version = Math.random(); 
%>
<head>
<meta charset="UTF-8">
<title>中再融-国资互联网金融平台</title> 
<%@ include file="/views/inc/inc.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${basePath}/resources/css/activity/exclusive.css?v=20160908">
<script type="text/javascript">
	var environment = {basePath : '${basePath}'};
</script>
</head>
<body>
	<div class="banner">
		<a class="logo back" href="${basePath}/">中再融</a>
	</div>
	<ul class="info clearfix">
		<li class="fl">
			<i class="back gainsIcon"></i>
			<span>50元起投</span>
		</li>
		<li class="fl">
			<i class="back termIcon"></i>
			<span>期限灵活</span>
		</li>
		<li class="fl">
			<i class="back platformIcon"></i>
			<span>国资平台</span>
		</li>
	</ul>
	<div class="mobileBox">
		<p>5秒快速注册</p>
		<p class="back backP"></p>
		<p><input id="phone" class="btn" type="text" placeholder="请输入电话号码" maxlength="11" /></p>
		<p>
			<a class="btn btnReg eventBtn">注册领取100元红包</a>
		</p>
	</div>
	<section>
		<h3>为什么选择中再融？</h3>
		<div class="choseBox">
			<figure class="clearfix">
				<div class="fl">
					<p class="clearfix" style="height:0.5rem;margin-top:1rem;line-height:0.5rem;">
						<i class="fl" style="font-size:0.24rem;line-height:0.56rem;">预估</i>
						<big class="fl" style="padding-left: 0.04rem;font-size:0.34rem;transform:skewX(-10deg);">最高年收益12%</big>
					</p>
					<p>即最高1200元/每万元</p>
				</div>
			</figure>
		</div>
		<div class="itemBox">
			<figure class="clearfix">
				<div class="fr">
					<h4>
						项目期限灵活
					</h4>
					<p><big style="font-size:0.36rem;"><b>1-12</b></big>个月理财项目</p>
					<p>满足不同需求人群</p>
				</div>
				
			</figure>
		</div>
		<div class="safeBox">
			<figure class="clearfix">
				<div class="fl">
					<h4>
						资金安全有保障
					</h4>
					<p>国资背景平台</p>
					<p>第三方资金托管</p>
					<p>37道风控措施</p>
					<p>CFCA电子印章</p>
				</div>
			</figure>
		</div>
	</section>
	
	<footer>
		<p id="toTop" class="btn btnReg">立即注册领取100元红包</p>
		<p>京ICP备16002418号-1</p>
		<p>中再融(北京)科技有限公司版权所有</p>
		<p style="font-size: 0.14rem;margin-top: 0.1rem;">投资有风险&nbsp;本项目非保本产品&nbsp;不保证收益</p>
	</footer>
	
	<!--遮罩层-->
	<div class="shadowFloor">
		<ul class="regBox">
			<li class="close">×</li>
			<li class="tip" id="regTipCont"></li>
			<li>
				<input class="btn" type="text" name="mobile" value="" maxlength="11" disabled />
			</li>
			<li class="msg">
				<p class="btn clearfix">
					<input class="fl" type="text" name="msg" maxlength="6" placeholder="请输入验证码"/>
					<span class="fr sendMsg"><b>59s重新发送</b></span>
				</p>
			</li> 
			<li class="agree">
				<label><input type="checkbox" id="checkbox_a2" class="chk_1" checked /><label for="checkbox_a2"></label><span>我已阅读并同意</span></label><a href="${basePath}/views/agreement/serve_agreement.jsp">《服务协议》</a><a href="${basePath}/views/agreement/secret_agreement.jsp">《隐私条款》</a>
			</li>
			<li><a id="goReg" class="btn btnReg">立即注册</a></li>
		</ul>
	</div>
	<div class="wrongTip"></div>
<script src="${basePath}/resources/js/present/exclu.js?v=20160908"></script>
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
</body>
</html>
