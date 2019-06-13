<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<title>扫码兑红包</title>
<%@ include file="/views/inc/inc.jsp"%>
<link rel="stylesheet" href="${basePath}/resources/css/activity/experienceMoney/sweep.css">
<link rel="stylesheet" href="${basePath}/resources/css/activity/experienceMoney/envelope_popup.css">
<link rel="stylesheet" href="${basePath}/resources/css/activity/experienceMoney/public.css">
</head>
<body>
 	<!--兑换红包-->
        <div class="sweep_exchange">
            <div class="sweep_exchange_cont">
                <div class="sweep_bg">
                    <!--兑换-->
                    <div class="experience_amount">
                        <div class="money">
                            <p>${experienceMoney}<em>元</em></p>
                        </div>
                        <div class="experience_title">体验金</div>
                    </div>
                    <!--兑换 end-->
                    <!--立即兑换-->
                     <c:if test="${experienceStatus eq 0}">                      
					 	<a id="scanUseBtn" class="use newBtn" style="display:block;" href="<%=request.getContextPath()%>/userInfo/nologin.do?conversionCode=${conversionCode}" >立即使用</a> 					 	
                     </c:if>
                     <c:if test="${experienceStatus eq 1}">
					 	<a class="use newBtn" style="display:block;" href="<%=request.getContextPath()%>/userInfo/nologin.do" >该兑换码已经被使用</a> 
					 </c:if>
                    <!--立即兑换 end-->
                </div>
            </div>
        </div> 
        <!--兑换红包 end-->
        <script type="text/javascript" src="${basePath}/resources/js/activity/experienceMoney/experienceMoney.js"></script>         
</body>
</html>