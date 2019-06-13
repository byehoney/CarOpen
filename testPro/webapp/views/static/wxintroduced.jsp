<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>微信公众号</title> 
<%@ include file="/views/inc/inc.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${basePath}/resources/css/present/indexWap.css">

</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
	<section class="public">
		<div class="attention_ioc"></div>
		<div class="search_content clearfix">
			<div>
				<p>中再融理财开课了</p>
				<p>首先在微信中搜索“中再融”</p>
			</div>
			<i></i>
		</div>
		<div class="resources_ioc "></div>
		<div class="search_content click clearfix">
			<div>
				<p>找到公众号，点击【关注】</p>				
			</div>
			<i></i>
		</div>
		<div class="introduce_ioc"></div>
		<div class="attention"></div>
		<div class="search_content click easy clearfix">
			<div>
				<p>众多干货随你挑，财就是So easy！</p>				
			</div>
			<i></i>
		</div>
		<div class="opportunities"></div>
		<p class="advantages">
			<span>高利率</span>
			<span>低风险</span>
			<span>低门槛</span>
			<span>灵活多变</span>
		</p>
		<p class="advantages waiting">你还在等什么？</p>
		<a href="${basePath}/index.do"><p class="know">我知道了</p></a>		
	</section>
</body>
</html>
