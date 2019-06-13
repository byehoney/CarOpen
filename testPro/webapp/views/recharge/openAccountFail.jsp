<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>开户 - 中再融</title>
    <style>
        .abn_content{margin:0 10px;} 
        .abn_icon{width:36%; margin:40px auto 0;}
        .abn_ts{font-size:17px; margin-top:20px; text-align:center;}
        .abn_btn a{color:#fff; width:49%; display: block; height: 40px; text-align: center;line-height: 40px; border-radius:5px; margin-top:25px;}
    	.abn_btn a:hover{color:#fff; text-decoration: none;} 
    </style>
    <%@ include file="/views/inc/inc.jsp"%>
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
<div id="content_height">
    <div class="abn_content ohz">
        <div class="abn_icon"><img src="${basePath}/resources/image/Abnormal_icon.png"></div>
        <div class="abn_ts">
            很抱歉，
            <c:if test="${not empty error}">${error}</c:if>
            <c:if test="${empty error}">第三方资金托管账户开小差了</c:if><br/>
            请重新开户！
        </div>
        <div class="abn_btn">
            <a href="tel:4001-156-157" class="bg1 fl">联系客服</a>
            <a href="${basePath}/myAccount/myAccountInfo.session" class="bg2 fr">我知道了</a>
        </div>
    </div>
  </div>
    <%@ include file="/views/inc/footer.jsp"%>
</body>
</html>