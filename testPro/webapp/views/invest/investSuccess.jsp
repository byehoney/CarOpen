<%@page import="com.kunpeng.zzr.constant.CommonDef"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%
	String mongoPic = CommonDef.MONGO_FILE_SHOW_PATH;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>投资成功 - 中再融</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <%@ include file="/views/inc/inc.jsp"%>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
	<%--<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/doubleDan/popup.css"/>--%>
    <style>
        .tz_content{
			/*margin:0 20px; */
			min-height:300px;
		}
        .tz_icon{width:30%; margin:0 auto;}
        .tz_sm{color:#2b2b2b; font-size:15px; text-align:center;}
        .tz_btn{width:90%;margin-left:5%;height:45px; margin-top:25px; color:#fff; text-align:center; line-height:40px; font-size:17px; letter-spacing: 3px; border-radius:5px;}
    	.tz_btn a{display:block; color:#fff; text-decoration: none}
    	.tz_btn a:active{text-decoration: none}
		.actBanner{
			margin-top: .2rem;
			display: block;
		}
		.actBanner img{
			display: block;
			width: 93.33%;
			margin: 0 auto;
		}
		.bgIphone{background-color: #298fe6}
		.tz_btn.activityBtn{
			width: 80%;
			height: 1rem;
			line-height: 1rem;
			background: url(../../resources/image/activity/mayActivity/wap_invest_btn.png) no-repeat 0 0;
			background-size: 100% 100%;
		}
		.activityBtn a{
			color:#fff;
		}
		.tip{
			font-size: .3rem;
			color:#666;
			text-align:center;
			margin-top: 10px;
		}
    </style>
	<script>
		var basePath='<%=request.getContextPath()%>';
	</script>
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
<div id="content_height">
    <c:if test="${not empty channel && (channel == 3 || channel == 4)}">
	<div class="registration_nav">
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
	        <p>成功投资</p>
	    </div>
	    <div class="line linebg"></div>
	    <div class="line2 linebg"></div>
	</div>
	</c:if>
	
	<div class="tz_content">
	    <div class="tz_icon"><img src="${basePath}/resources/image/tz_success.png"></div>
	    <div class="tz_sm">恭喜您投资成功！<fmt:formatNumber  pattern="#,##0.00#" type="currency"  value="${investorAmount}"/></div>
		<c:if test="${campaignSetStatus==1}">
			<c:if test="${detail!=''}">
				<p class="tip">${detail}</p>
			</c:if>
		</c:if>
		<div class="tz_btn"><a>继续投资</a></div>
		<c:if test="${!empty operateLocation}">
			<c:if test="${operateLocation.url!=''&&operateLocation.url!=null}">
				<a class="actBanner" href="${operateLocation.url}">
					<img src="<%=mongoPic%>/${operateLocation.mongoFile}" alt=""/>
				</a>
			</c:if>
			<c:if test="${operateLocation.url==''||operateLocation.url==null}">
				<a class="actBanner" href="javascript:void (0)">
					<img src="<%=mongoPic%>/${operateLocation.mongoFile}" alt=""/>
				</a>
			</c:if>
		</c:if>
	</div>
</div>


<input type="hidden" value="${currentTime}" id="currentTime">
<input type="hidden" value="${detail}" id="detail">
<input type="hidden" value="${campaignSetStatus}" id="campaignSetStatus">
<%@ include file="/views/inc/footer.jsp"%>
<script>

	$(function() {
        var campaignSetStatus = $("#campaignSetStatus").val();
        if (campaignSetStatus == 1) {
            $(".tz_btn").removeClass('bgIphone').addClass("activityBtn");
            $(".tz_btn a").html('领取夏日福利');
            $(".tz_btn a").attr("href", basePath + '/to5MonthActivity.do?flag=wap');
        } else {
            $(".tz_btn").removeClass('activityBtn').addClass("bgIphone");
            $(".tz_btn a").html('继续投资');
            $(".tz_btn a").attr("href", basePath + '/loan/list.do');
        }
    })
</script>
</body>
</html>