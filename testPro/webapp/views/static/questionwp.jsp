<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>问卷调查 - 中再融</title>
<meta name="keywords" content="">
<meta name="description" content="">
<%@ include file="/views/inc/inc.jsp"%>
<link href="<%=request.getContextPath()%>/resources/css/static.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
var basePath_='${basePath}';
function toLogin()
{
	window.location.href=basePath_+"/userInfo/nologin.do?refPath="+encodeURIComponent(window.location.href);
};
function question(){
	var registerForm = $("#registerForm");
	registerForm.submit();
}
</script>
</head>
<body>
	<div class="questionwp">
		<div class="banner">
		   <img src="${basePath}/resources/image/static/activity/questionnaire_1.jpg" alt="">
		</div>
		<div class="text">
		    <p class="gz">活动规则：</p>
		    <ul>
		        <li class="clearfx"><font>根据统计学算法判断前1000名认真完整填写问卷的用户将获得10元投资返现红包。投资非债转类项目满2000元即可激活。<br>
		        请于7月15日后，在“我的账户-积分红包”中查询红包并使用。</font></li>
		    </ul>
		</div>
		<c:if test="${not empty userObj }">
		 <form name="registerForm" id="registerForm"  action="http://www.sojump.com/m/5169496.aspx" method="post">
   	        <input  name="sojumpparm" type="hidden"  value="${userObj.userId}" />
		    <div class="btn"><a onclick="question()">立即填写问卷</a></div>
		</form>
		</c:if>
        <c:if test="${empty userObj }">
            <div class="btn"><a onclick="toLogin()">立即填写问卷</a></div>
         </c:if> 
	</div>
</body>
</html>
