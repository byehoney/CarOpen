<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="author" content="m.zhongzairong.cn">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<title>注册成功</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/alipaydone.css">
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
    <%--GA代码 --%>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75483023-2', 'auto');
  ga('send', 'pageview');
</script>
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
					$(".loadbtn").click(function(){
						alert("请在浏览器打开")
					})
				}
				if(browser.versions.ios){ 
					$(".loadbtn").click(function(){
						window.location.href="https://itunes.apple.com/us/app/zhong-zai-rong/id1116889321?l=zh&ls=1&mt=8";
					})
					} 
				if(browser.versions.android){
					$(".loadbtn").click(function(){
						window.location.href="http://a.app.qq.com/o/simple.jsp?pkgname=com.zzr";
					})
				} 
				
				//更换背景色
				var bgcolor=getadd('bgcolor');
				var member=getadd('member')
				var user_mobile=getadd('user_mobile')?getadd('user_mobile').substring(0,3)+"****"+getadd('user_mobile').substring(7,12):'';
				if(getadd('user_mobile')&&member>0){
					$(".youku").show().find("span").text(user_mobile)
				}
				if(bgcolor){
					$('.con01').css('backgroundColor','#'+ bgcolor);
					$('.con02 .loadbtn').css('backgroundColor','#'+ bgcolor);
				}
			})
		
	//app获取用户名
    function getadd(name){
         var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
         var r = window.location.search.substr(1).match(reg);
         if(r!=null)return  unescape(r[2]); return null;
    }
</script>   
</head>
<body>
	<div class="page">
		<div class="con01">
			<div class="yesicon"></div>
			<h1>注册成功</h1>
			<h4>下载app，理财更轻松</h4>
			<p class="youku">一个月会员已充值至优酷账号<span></span></p>
		</div>
		<div class="con02">
			<div class="logo"></div>
			<a class="loadbtn" href="javascript:;">点击下载app&nbsp;&nbsp;&nbsp;(5.5M)</a>
			<a class="enter" href="<%=request.getContextPath()%>/index.do">暂不下载，直接进入</a>
		</div>
	</div>
 
</body>
</html>