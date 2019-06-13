<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>中再融</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <%@ include file="/views/inc/inc.jsp"%>
    <style>
        .error_icon{width:33%; margin:40px auto 0;}
        .error_content{ text-align: center; margin-top:25px;}
        .error404_btn{margin:20px auto 0; width:50%; height:40px; text-align: center; color:#fff; border-radius:5px; line-height: 40px; font-size:20px; letter-spacing: 5px;}
    </style>
    
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
<div id="content_height">
 <div class="error_icon">
        <img src="<%=request.getContextPath()%>/resources/image/404_icon.png">
    </div>
    <div class="error_content">
        <span class="f50" style="font-size:35px">出错啦!</span><br>
        <span style="font-size:12px">非常报歉，页面加载失败。</span>
    </div>
    <div class="error404_btn bg1"><a href="tel:4001-156-157">联系客服</a></div>
   </div>
    <%@ include file="/views/inc/footer.jsp"%>
</body>
</html>