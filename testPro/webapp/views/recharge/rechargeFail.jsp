<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>我要充值 - 中再融</title>
    <%@ include file="/views/inc/inc.jsp"%>
    <style>
        .abn_content{margin:0 20px;}
        .abn_icon{width:36%; margin:40px auto 0;}
        .abn_ts{font-size:17px; margin-top:20px; text-align:center;}
        .abn_btn a{color:#fff; width:48%; display: block; height: 40px; text-align: center;line-height: 40px; border-radius:5px; margin-top:25px;}
    </style>
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
<div id="content_height">
    <div class="abn_content ohz">
        <div class="abn_icon"><img src="${basePath}/resources/image/Abnormal_icon.png"></div>
        <div class="abn_ts">
            	很抱歉，您的充值操作提示未成功，${error}请联系客服！<br/>
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