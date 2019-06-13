<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>中再融-app下载</title> 
<%@ include file="/views/inc/inc.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${basePath}/resources/css/present/indexWap.css">

</head>
<body class="appPage">
	<div class="appImg"></div>
	<div class="appText">
		<p>中再融App上线啦  投资理财更便捷</p>
		<p class="comeDownload">
			<i class="stripes iconBack"></i>
			<span>快来下载吧!</span>
			<i class="stripes iconBack"></i>
		</p>
		<img class="QRcode" src="<%=request.getContextPath()%>/resources/image/static/present/QR_code.jpg" alt="二维码" title="二维码" />
		<p class="goWap">
			<a href="${basePath}/index.do">暂不下载，直接进入wap站</a>
		</p>
	</div>
</body>
</html>
