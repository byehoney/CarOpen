<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	Date nowTime = new Date();
	long r = nowTime.getTime();
%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-app-status-bar-style" content="black">
<meta name="apple-touch-fullscreen" content="YES">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1.0,  minimum-scale=1.0, maximum-scale=1.0">
<title>体验金-中再融</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/apptyj.css?r=<%=r %>">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/tyj.css?r=<%=r %>">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/nativeShare.css?r=<%=r %>">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jwin/jwin.css?r=<%=r %>">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jwin/avast.css?r=<%=r %>">
<script src="<%=request.getContextPath() %>/resources/js/common/jquery-1.8.3.min.js?r=<%=r %>"></script>
<script src="<%=request.getContextPath() %>/resources/js/common/jquery.qrcode.min.js?r=<%=r %>"></script>
<script src="<%=request.getContextPath() %>/resources/js/warptyj.js?r=<%=r %>"></script>
<script src="<%=request.getContextPath() %>/resources/js/jwin/jwin.js?r=<%=r %>"></script>
</head>
<script type="text/javascript">
$(function(){
	 var shareIconUrl = "<%=request.getContextPath() %>/goldWeChat/getGoldShareUrl.do?ykUserId=#userId";
	 var userId = '${userId}';
	 $(function(){
	 	shareIconUrl = shareIconUrl.replace("#userId", userId);
	 	$.ajax({type:"post",url:shareIconUrl,async:false,  
	         success : function(data){
	         	shareIconUrl = data;
	         	var browser={
          			versions:function(){          
    	      			var u = navigator.userAgent, app = navigator.appVersion;            
    	      			return {          
    		      			trident: u.indexOf('Trident') > -1, //IE内核                
    		      			presto: u.indexOf('Presto') > -1, //opera内核                
    		      			webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核                
    		      			gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核                
    	      			};
          			}()
      			};
    			if (browser.versions.webKit == true) {
    				$('.codebox').qrcode({
    					correctLevel : 0,
    					"color" : "#3a3",
    					"text" : shareIconUrl
    				});
    			} else {
    				$('.codebox').qrcode({
    					render : "table", //table方式
    					correctLevel : 1,
    					"color" : "#3a3",
    					"text" : shareIconUrl
    				});
    			}
	         }
		});
	 });
    
});
</script>
<body>
<!--导航栏-->
<div class="tyjwrap">
	<div class="tjyshare">
		<img src="<%=request.getContextPath() %>/resources/image/app/apptyj/tyjshare.jpg" />
	</div>	
	<div class="method">
		<img src="<%=request.getContextPath() %>/resources/image/app/apptyj/method.jpg" />
		<div class="codebox"></div>
	</div>
</div>
</body>
</html>