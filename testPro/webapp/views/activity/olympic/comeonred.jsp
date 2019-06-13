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
	String wxUserGameId = request.getParameter("wxUserGameId");
	String sign = request.getParameter("sign");
%>
	<div class="main">
		<div class="getBox">
			<div class="bTop"></div>
			<div class="bMiddle"></div>
			<div class="bBottom">
			<input id="sign" type="hidden" value="<%=sign %>"/>
				<a id="butquery" href="${basePath}/myAccount/coupon.session">点击查看</a>
			</div>
			<div class="prize">
				<a class="borRadian" href="http://www.zhongzairong.cn/olympic.shtml?wxUserGameId=<%=wxUserGameId%>&sign=<%=sign %>">我要再赢大奖</a>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${basePath}/resources/js/common/jquery.md5.js"></script>
	<script type="text/javascript" 
		src="${basePath}/resources/js/activity/comeOn.js"></script>
</body>
</html>
