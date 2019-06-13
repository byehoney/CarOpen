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
<title>输入狼人杀ID</title>
<%@ include file="/views/inc/inc.jsp"%>
<script src="${basePath}/resources/js/activity/newwerwolfid.js${verCode }"></script>
<link rel="stylesheet" href="${basePath}/resources/css/activity/newwerwolfid.css${verCode }">
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
</head>
<body>
  <div class="page">
        <div class="bindId">
            <div class="msg">绑定狼人杀ID，以便为您发放奖励</div>
            <div class="idcon">
                <input class="idnum" type="text" placeholder="请输入狼人杀ID" maxlength="10">
                <input id = "mobile" value="${mobile }" type="hidden"/>
            </div>
            <a class="en_btn"></a>
        </div>
        <div class="h_search">
            <h3>在哪儿可以找到我的ID?</h3>
            <h5>第一步：点击主页头像</h5>
            <div class="o_step"></div>
            <h5>第二步：查看我的ID</h5>
            <div class="t_step"></div>
        </div>
        <div class="error_msg" style="display:none"></div>
    </div>
    <script src="https://qiyukf.com/script/058b227c7dcc287d28e0900f681436c7.js" defer async></script>
</body>
</html>