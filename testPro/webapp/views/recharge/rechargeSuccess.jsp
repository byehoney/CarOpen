<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>充值成功 - 中再融</title>
    <%@ include file="/views/inc/inc.jsp"%>
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/delta.css">
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
<div id="content_height">
    <c:if test="${not empty channel}">
    <div class="registration_nav">
        <c:if test="${channel == 2}">
        
    <div class="left">
        <p class="num_list wd_list">1</p>
        <p>开户</p>
    </div>
    
    <div class="center">
        <p class="num_list wd_list">2</p>
        <p>充值</p>
    </div>
    
    <div class="right"> 
        <p class="num_list wd_list">3</p>
        <p>充值成功</p>
    </div>
    <div class="line linebg"></div>
    <div class="line2 linebg"></div>
    
        </c:if>

        <c:if test="${channel == 3 || channel == 4}">
        
    <div class="left">
        <p class="num_list wd_list">1</p>
        <p>开户</p>
    </div>
    
    <div class="center">
        <p class="num_list wd_list">2</p>
        <p>充值</p>
    </div>
    
    <div class="right"> 
        <p class="num_list">3</p>
        <p>成功投资</p>
    </div>
    <div class="line linebg"></div>
    <div class="line2"></div>
        
        </c:if>
    </div>
    </c:if>
    
<div class="delta_content">
    <div class="delta_icon">
        <img src="${basePath}/resources/image/delta_success.png">
    </div> 
    <div class="delta_chzhi">充值成功</div>
    <div class="delta_jine">充值金额:<span><fmt:formatNumber  value="${result.data.amount}"  pattern="${moneyexp}"/></span>元</div>
    <div class="delta_back">
        <a href="${basePath}/myAccount/myAccountInfo.session">返回我的账户</a>
    </div>
</div>
</div>
<%@ include file="/views/inc/footer.jsp"%>
</body>
</html>