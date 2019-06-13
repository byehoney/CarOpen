<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<%
String verCode = "?v=Version20160928";
%>
<head>
<meta charset="UTF-8">
<title>中再融-国资互联网金融平台</title> 
<%@ include file="/views/inc/inc.jsp"%>
<link href="<%=request.getContextPath()%>/resources/css/activity/crayfish.css<%=verCode%>" rel="stylesheet" type="text/css">
</head>
<body class="cray-suc">
    <div class="head-back"></div>
    <h3>登陆成功</h3>
    <p class="expiration">理财送小龙虾活动截止至10月23日</p>
    <p class="date">麻小E卡会在10月28日以快递形式发送</p>
    <p>我们会添加您的微信，便于核对发货信息</p>    
    <p>敬请留意</p>
    <div class="text-box"><a href="${basePath}/loan/list.do">马上参与活动</a></div>
    <p><a class="to-invest" href="${basePath}/crayfish.do">回到活动页</a></p>
<%@ include file="/views/inc/statistics.jsp"%>
</body>
</html>
