<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>我要投资 - 中再融</title>
    <%@ include file="/views/inc/inc.jsp"%>
    <style> 
        .abn_content{margin:0 10px; min-height:330px} 
        .tz_icon{width:36%; margin: 40px auto 0}
        .tz_ts{margin-top:15px; text-align:center;}
        .abn_btn a{color:#fff; width:49%; display: block; height: 40px; text-align: center;line-height: 40px; border-radius:5px; margin-top:25px;}
    </style>
</head>
<body> 
<%@ include file="/views/inc/header.jsp"%>
<div id="content_height">
    <div class="abn_content ohz">
        <div class="tz_icon"><img src="${basePath}/resources/image/tz_icon.png"></div>
        <div class="tz_ts">
            亲，很抱歉投资过程出现异常：${error}<br><br>
        </div>
        <div class="abn_btn">
            <a href="${basePath}/myAccount/myAccountInfo.session" class="bg1 fl">我的账户</a>
            <a href="${basePath}/loan/list.do" class="bg3 fr">去投资</a>
        </div>
    </div>
</div>
    <%@ include file="/views/inc/footer.jsp"%>
</body>
</html>