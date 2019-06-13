<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>兑换红包</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
	<%@ include file="/views/inc/inc.jsp"%>
	<link type="text/css" rel="stylesheet" href="${basePath}/resources/css/activity/experienceMoney/public.css">
	<link type="text/css" rel="stylesheet" href="${basePath}/resources/css/activity/experienceMoney/sweep.css">	
	<link href="${basePath}/resources/css/present/indexWap.css" rel="stylesheet" type="text/css">	
	</head>
	<body> 
	<%@ include file="/views/inc/header.jsp"%>
	
	
	
	<!--兑换红包-->
	    <div class="sweep_exchange">
	        <div class="sweep_exchange_cont">
	            <div class="sweep_bg">
	                <!--兑换-->
	                <div class="exchange_pic"></div>
	                <!--兑换 end-->
	                <!--请输入正确的兑换码-->
	                <div class="errorTips">您的兑换码已经被使用啦，请检查后重新输入！</div>
	                <!--请输入正确的兑换码 end-->
	                <!--请输入兑换码-->
	                <input class="txt exeCode" type="text" maxlength="8" placeholder="请输入兑换码"/>
	                <!--请输入兑换码 end-->
	                <!--立即兑换-->
	                <div class="use" id="convertBtn">
	                    <a class="exeBtn" href="javascript:;">立即兑换</a>
	                </div>
	                <!--立即兑换 end-->
	            </div>
	            <div class="rules">
	                <p>兑换规则：</p>
	                <p>1.在兑换框中输入您的兑换码，点击“兑换”后，即可兑换成功。</p>                    <p>2.兑换后的红包，请在“我的账户”-“我的红包”页面查看。</p>
	            </div>
	        </div>
	    </div>
	    <!--兑换红包 end-->
	    
	     <!--底部导航-->
		<footer>
			<ul class="nav whiteBack clearfix">
				<li class="fl">
					<a href="${basePath}/index.do">
						<p class="iconBack indexIcon"></p>
						<p>主页</p>
					</a>
				</li>
				<li class="fl">
					<a href="${basePath}/loan/list.do">
						<p class="iconBack investIcon"></p>
						<p>投资</p>
					</a>
				</li>
				<li class="fl">
					<a href="${basePath}/myAccount/myAccountInfo.session" class="act">
						<p class="iconBack accountIcon"></p>
						<p>我的账户</p>
					</a>
				</li>
			</ul>
		</footer>
	    
	    <%@ include file="/views/inc/footer.jsp"%>
		<div class="successBox">
			<p>已兑换成功</p>
			<p>请在【我的红包】查看</p>
		</div>
	    <div class="exeCover"></div>
	    <script type="text/javascript" src="${basePath}/resources/js/activity/experienceMoney/experienceMoney.js"></script>
	</body>
</html>
