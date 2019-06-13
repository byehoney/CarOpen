<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<c:set var="user" value="${sessionScope.userObj }"></c:set>
<c:set var="dateexp" value="yyyy-MM-dd"></c:set>
<c:set var="dateslashexp" value="yyyy/MM/dd"></c:set>
<c:set var="timeexp" value="yyyy-MM-dd HH:mm:ss"></c:set>
<c:set var="datepointexp" value="yyyy.MM.dd"></c:set>
<c:set var="timehmsexp" value="HH:mm:ss"></c:set>
<c:set var="moneyexp" value="#,##0.00#"></c:set>
<c:set var="moneyexpInt" value="#,##0"></c:set>
<c:set var="aunualInterestRateExp" value="##0.0#"></c:set>
<meta name="author" content="m.zhongzairong.cn">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<script type="text/javascript">
	var environment = {basePath : '${basePath}'};
	var rootUrl = "<%=request.getContextPath()%>";
<%--GA代码 --%>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75483023-2', 'auto');
  ga('send', 'pageview');
</script>
<script src="${basePath}/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${basePath}/resources/js/common/commont.js" type="text/javascript"></script>
<link rel="shortcut icon" href="${basePath}/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
<link rel="icon" href="${basePath}/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
<link href="${basePath}/resources/css/common/common.css?v=201601270" type="text/css" rel="stylesheet">