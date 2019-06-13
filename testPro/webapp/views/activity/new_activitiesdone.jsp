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
<%@ include file="/views/inc/inc.jsp"%>
<script src="${basePath}/resources/js/activity/new_activitiesdone.js"></script>
<link rel="stylesheet" href="${basePath}/resources/css/activity/new_activitiesdone.css">
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
    
    $(function(){
	    var timer;
	    $(".make_money").click(function(){
	    	clearInterval(timer);
	    })
    	var num = 10;
    	timer = setInterval(function () {
    		num--;
    		$(".count").text(num+"s");
    		if (num===1) {
    			clearInterval(timer);
    			window.location.href =$(".make_money").attr("href");	
    		};

    	}, 1000);
    	
    })
</script>
</head>
<body>
 	<div class="registered">
		<div class="banner">
			<div class="banner_t"></div>
			<div class="banner_b">				
				<div class="jumpto">即将为您跳转到新手项目(<span class="count"></span>)</div>
			</div>
			<div class="container">
				<a class="make_money" href="${basePath}/loan/detail/${loanId}.do">立即赚钱</a>
				<p>©️2016 中再融(北京)科技有限公司 版权所有</p>
			</div>
		</div>
	</div>
</body>
</html>