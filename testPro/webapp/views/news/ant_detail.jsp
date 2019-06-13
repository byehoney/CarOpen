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
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<link href="<%=request.getContextPath()%>/resources/css/common/common.css?v=201601270" type="text/css" rel="stylesheet">
<title>公告详情页</title>
<script>
<!--PC百度统计代码-->
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?455a255e408c3cc82f67b07d05532d54";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
<!--热力图-->
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
<style>
	body{
		background-color: #fff;
	}
	.ant_page{
		width: 94%;
		margin: 0 auto;
		font-size: 14px;
		font-family: "Microsoft Yahei",arial,tahoma,'Hiragino Sans GB',\5b8b\4f53,sans-serif;
		overflow:hidden;
	}
	.ant_page img{
		width: inherit;
    	margin: 0 auto;
		max-width: 100%;
	}
	.ant_page h3{
		font-size:16px;
		font-weight: bold;
		margin:1em 0;
		text-align: center;
	}
	.ant_page .date p{
		text-align: right;
		margin:1em 0;
	}
	.ant_page .content{
		color: #666;
	}
	</style>
</head>
<body>
	<div class="ant_page">
		<h3></h3>
		<div class="content"></div>
	</div>
	<script>
	var rootUrl = "<%=request.getContextPath()%>";
	if(getadd("newsid")!=null){
		$.ajax({
			type:"post",
			dataType:"json",
			url:rootUrl+"/news/getWapNewDetails/"+getadd("newsid")+".do",
			success:function(rdata){
				var data=rdata.data;
				if(1==rdata.code){
					$('.ant_page h3').html(data.title);
					$('title').html(data.title);
					$('.ant_page .content').html(data.content);
				}else if(0==rdata.code){
					alert('系统错误！');
				}else if(2==rdata.code){
					alert('未检测到公告id！');
				}	
			},
			error:function (){
				alert('系统错误！');
			}
		})
	}else{
		alert('未检测到公告id！');
	}
	
		function getadd(name){
		     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		     var r = window.location.search.substr(1).match(reg);
		     if(r!=null)return  unescape(r[2]); return null;
		}
	</script>
</body>
</html>