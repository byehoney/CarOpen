<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>中再融详情 - 中再融</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <%@ include file="/views/inc/inc.jsp"%>
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/items.css">
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/ykb.css">
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
<div id="content_height">
	<div class="xq_title">${result.data.ykbMap.loan.title}</div> 
	<div class="xq_list">
		<ul>
			<li style="width:33%">
				<p class="f13 c_red">${result.data.ykbMap.loan.aunualInterestRate}%</p>
				<p class='f12 c_h'>年化收益率</p>
			</li> 

			<li style="width:33%" class='border_li'>
				<p class="f13">
					<c:if test="${not empty result.data.ykbMap.qfqDays}">${result.data.ykbMap.qfqDays}天</c:if>
					<c:if test="${empty result.data.ykbMap.qfqDays}">
						<c:if test="${result.data.ykbMap.loan.termUnit==1 }">${result.data.ykbMap.loan.termCount }天</c:if>
						<c:if test="${result.data.ykbMap.loan.termUnit!=1 }">${result.data.ykbMap.loan.termCount }月</c:if>
					</c:if>
				</p>
				<p class='f12 c_h'>计划期限</p>
			</li>
 
			<li  style="width:33%" class='border_li'>
				<p class='f13'><fmt:formatNumber  pattern="#,##0.00#" type="currency" value="${result.data.ykbMap.loan.amount}"/></p>
				<p class='f12 c_h'>本期规模(元)</p>
			</li>
		</ul>
	</div>
	<div class="xq_content">
		<div class='xqc_title'>计划介绍</div>
		<p>
			<span class="xqct_title">还款方式</span>
			<span>一次性返还本金和收益</span>
		</p>
		<p>
			<span class="xqct_title">保障方式</span>
			<span>
				<c:if test="${fn:length(result.data.ykbMap.loan.securityMode)> 22}">${fn:substring(result.data.ykbMap.loan.securityMode, 0, 21)}...</c:if>
				<c:if test="${fn:length(result.data.ykbMap.loan.securityMode)<= 22}">${result.data.ykbMap.loan.securityMode}</c:if>
			</span>
		</p>
		<p>
			<span class="xqct_title">收益期间</span>
			<span><fmt:formatDate value="${result.data.ykbMap.loan.releaseTime }" pattern="yyyy年MM月dd日" />-<fmt:formatDate value="${result.data.ykbMap.loan.endTime }" pattern="yyyy年MM月dd日" /></span>
		</p>
		<p>
			<span class="xqct_title">加入条件</span>
				<c:choose>
					<c:when test="${not empty result.data.ykbMap.rookie && result.data.ykbMap.rookie == 1}">
						<span>限为投资新用户，每份2000元，每人限一份，不支持转让</span>
					</c:when>
					<c:otherwise>
						<span>1,000元投起，最高10万，不可转让</span>
					</c:otherwise>
				</c:choose>
		</p>
	</div>
	<div class="footer_title">计划数据</div>
	<p class="footer_people">加入总人次：<span>${result.data.ykbMap.investCount}</span></p>
	</div>
	<%@ include file="/views/inc/footer.jsp"%>
</body>
</html>