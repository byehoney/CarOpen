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
<script src="${basePath}/resources/js/activity/werwolfdone.js"></script>
<link rel="stylesheet" href="${basePath}/resources/css/activity/iqiyidone.css">
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
    <div class="ico_suc"></div>
    <h3>注册成功</h3>
    <p class="txt">为您推荐新手专享项目</p>
    <p class="txt">期限灵活，利息更高</p>
    <div class="con">
        <div class="tit_icon">新手专享</div>
        <div class="con_per clearfx">
            <div class="strong_per fl">
                <p class="bold_per">15<i>%</i></p>
                <p class="per_txt">预期年化收益</p>
            </div>
            <div class="nor_date fr">
                <p class="date_per">30<i>天</i></p>
                <p class="per_txt">定存期限</p>
            </div>
        </div>
        <a class="btn" href="${basePath}/loan/detail/${loanId}.do">立即理财得VIP</a>
        <div class="jumpto"><span class="count">10</span> 秒后自动为您跳转</div>
    </div>
</div>

</body>
</html>