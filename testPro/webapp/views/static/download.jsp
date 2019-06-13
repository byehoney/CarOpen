<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
	<head>
    	<meta name="author" content="m.zhongzairong.cn">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        <meta http-equiv="Expires" content="-1">
        <meta http-equiv="Cache-Control" content="no-cache">
        <meta http-equiv="Pragma" content="no-cache">
		<title>APP下载 - 中再融</title>
		<script src="https://www.zhongzairong.cn/js/v2/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" href="../../resources/css/activity/download_page.css"/>	
		<link href="<%=request.getContextPath()%>/resources/css/common/common.css?v=201601270" type="text/css" rel="stylesheet">				
        <script type="text/javascript">
			var browser={
			    versions:function(){
			        var u = navigator.userAgent, app = navigator.appVersion;
			        return {
			            trident: u.indexOf('Trident') > -1, //IE内核
			            presto: u.indexOf('Presto') > -1, //opera内核
			            webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
			            gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1,//火狐内核
			            mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
			            ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
			            android: u.indexOf('Android') > -1 || u.indexOf('Adr') > -1, //android终端
			            iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器
			            iPad: u.indexOf('iPad') > -1, //是否iPad
			            webApp: u.indexOf('Safari') == -1, //是否web应该程序，没有头部与底部
			            weixin: u.indexOf('MicroMessenger') > -1, //是否微信 （2015-01-22新增）
			            qq: u.match(/\sQQ/i) == " qq" //是否QQ
			        };
			    }(),
			    language:(navigator.browserLanguage || navigator.language).toLowerCase()  
			}
			$(function(){
				
				if(browser.versions.weixin){
					$(".apple").click(function(){

						alert("请在Safari浏览器打开")
					})
				}
				if(browser.versions.ios){ 
					$(".android").hide();
					$(".apple").attr('href','https://itunes.apple.com/us/app/zhong-zai-rong/id1116889321?l=zh&ls=1&mt=8');
					//window.location.href="https://itunes.apple.com/us/app/zhong-zai-rong/id1116889321?l=zh&ls=1&mt=8";
					} 


				if(browser.versions.android){
					$(".apple").hide();
					//$(".android").attr('href','http://a.app.qq.com/o/simple.jsp?pkgname=com.zzr');
					window.location.href="http://a.app.qq.com/o/simple.jsp?pkgname=com.zzr";
				} 
			})
        </script>      
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
	<section class="download_content">
		<div class="page_t"></div>
		<div class="page_c">
			<div></div>
		</div>
		<div class="page_b">
			<a  class="apple" href="javascript:;">客户端下载</a>
			<a  class="android" href="javascript:;">客户端下载</a>
		</div>
	</section>	
</body>
</html>