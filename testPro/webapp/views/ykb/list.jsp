<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>我要投资 - 中再融</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <%@ include file="/views/inc/inc.jsp"%>
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/items.css">
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/ykb.css">
</head>
<body>
	<%@ include file="/views/inc/header.jsp"%>
	<div id="content_height">
	<%@ include file="/views/inc/xm_tab.jsp"%>
	<div class="ykb_js">
		<a href='https://www.zhongzairong.cn/openServicenew/view/page/ykb.html'>为何投资中再融？ </a>
	</div>
	<c:if test="${result.data.ykbMap.todaylist.size() == 0 && result.data.ykbMap.tomorrowlist.size() == 0}">
	<div class="ykb_con">
		<div class='no_xm'>
			<div>暂无项目，请浏览其它类型项目</div>
		</div>
	</div>
	</c:if>
	
	<c:if test="${empty result.data.ykbMap.todayUper || !result.data.ykbMap.todayUper}">
	<c:if test="${result.data.ykbMap.tomorrowlist.size() > 0}">
	<c:forEach items="${result.data.ykbMap.tomorrowlist}" var="ykb">
	<c:if test="${ykb.status eq 300}">
	<div class="ybk_list" url="${basePath}/invest/projectDetail.do?loanId=${ykb.loanid}">
		<div class="ykb_box">
			<div class="ykb_header">${ykb.titleFull}</div>
			<div class="ykb_content ohz mt15">
				<div class='ykb_sy fl'>
					<p>
					<fmt:formatNumber value="${ykb.aunualInterestRate}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber>
					<span class="f20">%</span></p>
					<p class="f12">年化收益率</p>
				</div>
				<div class="ykb_day fr">
					<p>${ykb.termCount}<span class="f20">天</span></p>
					<p class="f12">计划期限</p>
				</div>
			</div>
			<div class="ykb_footer mt15">本期规模<fmt:formatNumber value="${ykb.amount/10000}" pattern="${moneyexpInt}" />万元<br/>保证金由招商银行全程监管</div>
		</div>
		<a href="javascript:;" class="ykb_btn">立即抢购</a>
	</div>
	</c:if>
	<c:if test="${ykb.status eq 330}">
	<div class="ybk_list ybk_start" url="${basePath}/invest/projectDetail.do?loanId=${ykb.loanid}">
		<div class="ykb_box">
			<div class="ykb_header">${ykb.titleFull}</div>
			<div class="ykb_content ohz mt15">
				<div class='ykb_sy fl'>
					<p><fmt:formatNumber value="${ykb.aunualInterestRate}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber><span class="f20">%</span></p>
					<p class="f12">年化收益率</p>
				</div>
				<div class="ykb_day fr">
					<p>${ykb.termCount}<span class="f20">天</span></p>
					<p class="f12">计划期限</p>
				</div>
			</div>
			<div class="ykb_footer mt15">本期规模<fmt:formatNumber value="${ykb.amount/10000}" pattern="${moneyexpInt}" />万元<br/>保证金由招商银行全程监管</div>
		</div>	
		<div class="ykb_btn">
			<span class="btn_icon">&nbsp;</span><span><fmt:formatDate value="${ykb.onlineTime }" pattern="MM月dd日 HH:mm"/>开始</span>
		</div>
	</div>
	</c:if>
	<c:if test="${ykb.status eq 400 || ykb.status eq 500}">
	<div class="ybk_list ybk_end" url="${basePath}/invest/projectDetail.do?loanId=${ykb.loanid}">
		<div class="ykb_box">
			<div class="ykb_header">${ykb.titleFull}</div>
			<div class="ykb_content ohz mt15">
				<div class='ykb_sy fl'>
					<p><fmt:formatNumber value="${ykb.aunualInterestRate}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber><span class="f20">%</span></p>
					<p class="f12">年化收益率</p>
				</div>
				<div class="ykb_day fr">
					<p>${ykb.termCount}<span class="f20">天</span></p>
					<p class="f12">计划期限</p>
				</div>
			</div>
			<div class="ykb_footer mt15">本期规模<fmt:formatNumber value="${ykb.amount/10000}" pattern="${moneyexpInt}" />万元<br/>保证金由招商银行全程监管</div>
		</div>
		<div class="ykb_btn">已抢购完毕</div>
	</div>
	</c:if>
	</c:forEach>
	</c:if>

	<c:if test="${result.data.ykbMap.todaylist.size() > 0}">
	<c:forEach items="${result.data.ykbMap.todaylist}" var="ykb">
	<c:if test="${ykb.status eq 300}">
	<div class="ybk_list" url="${basePath}/invest/projectDetail.do?loanId=${ykb.loanid}">
		<div class="ykb_box">
			<div class="ykb_header">${ykb.titleFull}</div>
			<div class="ykb_content ohz mt15">
				<div class='ykb_sy fl'>
					<p>
					<fmt:formatNumber value="${ykb.aunualInterestRate}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber>
					<span class="f20">%</span></p>
					<p class="f12">年化收益率</p>
				</div>
				<div class="ykb_day fr">
					<p>${ykb.termCount}<span class="f20">天</span></p>
					<p class="f12">计划期限</p>
				</div>
			</div>
			<div class="ykb_footer mt15">本期规模<fmt:formatNumber value="${ykb.amount/10000}" pattern="${moneyexpInt}" />万元<br/>保证金由招商银行全程监管</div>
		</div>
		<a href="javascript:;" class="ykb_btn">立即抢购</a>
	</div>
	</c:if>
	<c:if test="${ykb.status eq 330}">
	<div class="ybk_list ybk_start" url="${basePath}/invest/projectDetail.do?loanId=${ykb.loanid}">
		<div class="ykb_box">
			<div class="ykb_header">${ykb.titleFull}</div>
			<div class="ykb_content ohz mt15">
				<div class='ykb_sy fl'>
					<p><fmt:formatNumber value="${ykb.aunualInterestRate}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber><span class="f20">%</span></p>
					<p class="f12">年化收益率</p>
				</div>
				<div class="ykb_day fr">
					<p>${ykb.termCount}<span class="f20">天</span></p>
					<p class="f12">计划期限</p>
				</div>
			</div>
			<div class="ykb_footer mt15">本期规模<fmt:formatNumber value="${ykb.amount/10000}" pattern="${moneyexpInt}" />万元<br/>保证金由招商银行全程监管</div>
		</div>	
		<div class="ykb_btn">
			<span class="btn_icon">&nbsp;</span><span><fmt:formatDate value="${ykb.onlineTime }" pattern="MM月dd日 HH:mm"/>开始</span>
		</div>
	</div>
	</c:if>
	<c:if test="${ykb.status eq 400 || ykb.status eq 500}">
	<div class="ybk_list ybk_end" url="${basePath}/invest/projectDetail.do?loanId=${ykb.loanid}">
		<div class="ykb_box">
			<div class="ykb_header">${ykb.titleFull}</div>
			<div class="ykb_content ohz mt15">
				<div class='ykb_sy fl'>
					<p><fmt:formatNumber value="${ykb.aunualInterestRate}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber><span class="f20">%</span></p>
					<p class="f12">年化收益率</p>
				</div>
				<div class="ykb_day fr">
					<p>${ykb.termCount}<span class="f20">天</span></p>
					<p class="f12">计划期限</p>
				</div>
			</div>
			<div class="ykb_footer mt15">本期规模<fmt:formatNumber value="${ykb.amount/10000}" pattern="${moneyexpInt}" />万元<br/>保证金由招商银行全程监管</div>
		</div>
		<div class="ykb_btn">已抢购完毕</div>
	</div>
	</c:if>
	</c:forEach>
	</c:if>
	</c:if>


	<c:if test="${not empty result.data.ykbMap.todayUper && result.data.ykbMap.todayUper}">

	<c:if test="${result.data.ykbMap.todaylist.size() > 0}">
	<c:forEach items="${result.data.ykbMap.todaylist}" var="ykb">
	<c:if test="${ykb.status eq 300}">
	<div class="ybk_list" url="${basePath}/invest/projectDetail.do?loanId=${ykb.loanid}">
		<div class="ykb_box">
			<div class="ykb_header">${ykb.titleFull}</div>
			<div class="ykb_content ohz mt15">
				<div class='ykb_sy fl'>
					<p>
					<fmt:formatNumber value="${ykb.aunualInterestRate}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber>
					<span class="f20">%</span></p>
					<p class="f12">年化收益率</p>
				</div>
				<div class="ykb_day fr">
					<p>${ykb.termCount}<span class="f20">天</span></p>
					<p class="f12">计划期限</p>
				</div>
			</div>
			<div class="ykb_footer mt15">本期规模<fmt:formatNumber value="${ykb.amount/10000}" pattern="${moneyexpInt}" />万元<br/>保证金由招商银行全程监管</div>
		</div>
		<a href="javascript:;" class="ykb_btn">立即抢购</a>
	</div>
	</c:if>
	<c:if test="${ykb.status eq 330}">
	<div class="ybk_list ybk_start" url="${basePath}/invest/projectDetail.do?loanId=${ykb.loanid}">
		<div class="ykb_box">
			<div class="ykb_header">${ykb.titleFull}</div>
			<div class="ykb_content ohz mt15">
				<div class='ykb_sy fl'>
					<p><fmt:formatNumber value="${ykb.aunualInterestRate}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber><span class="f20">%</span></p>
					<p class="f12">年化收益率</p>
				</div>
				<div class="ykb_day fr">
					<p>${ykb.termCount}<span class="f20">天</span></p>
					<p class="f12">计划期限</p>
				</div>
			</div>
			<div class="ykb_footer mt15">本期规模<fmt:formatNumber value="${ykb.amount/10000}" pattern="${moneyexpInt}" />万元<br/>保证金由招商银行全程监管</div>
		</div>	
		<div class="ykb_btn">
			<span class="btn_icon">&nbsp;</span><span><fmt:formatDate value="${ykb.onlineTime }" pattern="MM月dd日 HH:mm"/>开始</span>
		</div>
	</div>
	</c:if>
	<c:if test="${ykb.status eq 400 || ykb.status eq 500}">
	<div class="ybk_list ybk_end" url="${basePath}/invest/projectDetail.do?loanId=${ykb.loanid}">
		<div class="ykb_box">
			<div class="ykb_header">${ykb.titleFull}</div>
			<div class="ykb_content ohz mt15">
				<div class='ykb_sy fl'>
					<p><fmt:formatNumber value="${ykb.aunualInterestRate}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber><span class="f20">%</span></p>
					<p class="f12">年化收益率</p>
				</div>
				<div class="ykb_day fr">
					<p>${ykb.termCount}<span class="f20">天</span></p>
					<p class="f12">计划期限</p>
				</div>
			</div>
			<div class="ykb_footer mt15">本期规模<fmt:formatNumber value="${ykb.amount/10000}" pattern="${moneyexpInt}" />万元<br/>保证金由招商银行全程监管</div>
		</div>
		<div class="ykb_btn">已抢购完毕</div>
	</div>
	</c:if>
	</c:forEach>
	</c:if>
	
	<c:if test="${result.data.ykbMap.tomorrowlist.size() > 0}">
	<c:forEach items="${result.data.ykbMap.tomorrowlist}" var="ykb">
	<c:if test="${ykb.status eq 300}">
	<div class="ybk_list" url="${basePath}/invest/projectDetail.do?loanId=${ykb.loanid}">
		<div class="ykb_box">
			<div class="ykb_header">${ykb.titleFull}</div>
			<div class="ykb_content ohz mt15">
				<div class='ykb_sy fl'>
					<p>
					<fmt:formatNumber value="${ykb.aunualInterestRate}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber>
					<span class="f20">%</span></p>
					<p class="f12">年化收益率</p>
				</div>
				<div class="ykb_day fr">
					<p>${ykb.termCount}<span class="f20">天</span></p>
					<p class="f12">计划期限</p>
				</div>
			</div>
			<div class="ykb_footer mt15">本期规模<fmt:formatNumber value="${ykb.amount/10000}" pattern="${moneyexpInt}" />万元<br/>保证金由招商银行全程监管</div>
		</div>
		<a href="javascript:;" class="ykb_btn">立即抢购</a>
	</div>
	</c:if>
	<c:if test="${ykb.status eq 330}">
	<div class="ybk_list ybk_start" url="${basePath}/invest/projectDetail.do?loanId=${ykb.loanid}">
		<div class="ykb_box">
			<div class="ykb_header">${ykb.titleFull}</div>
			<div class="ykb_content ohz mt15">
				<div class='ykb_sy fl'>
					<p><fmt:formatNumber value="${ykb.aunualInterestRate}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber><span class="f20">%</span></p>
					<p class="f12">年化收益率</p>
				</div>
				<div class="ykb_day fr">
					<p>${ykb.termCount}<span class="f20">天</span></p>
					<p class="f12">计划期限</p>
				</div>
			</div>
			<div class="ykb_footer mt15">本期规模<fmt:formatNumber value="${ykb.amount/10000}" pattern="${moneyexpInt}" />万元<br/>保证金由招商银行全程监管</div>
		</div>	
		<div class="ykb_btn">
			<span class="btn_icon">&nbsp;</span><span><fmt:formatDate value="${ykb.onlineTime }" pattern="MM月dd日 HH:mm"/>开始</span>
		</div>
	</div>
	</c:if>
	<c:if test="${ykb.status eq 400 || ykb.status eq 500}">
	<div class="ybk_list ybk_end" url="${basePath}/invest/projectDetail.do?loanId=${ykb.loanid}">
		<div class="ykb_box">
			<div class="ykb_header">${ykb.titleFull}</div>
			<div class="ykb_content ohz mt15">
				<div class='ykb_sy fl'>
					<p><fmt:formatNumber value="${ykb.aunualInterestRate}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber><span class="f20">%</span></p>
					<p class="f12">年化收益率</p>
				</div>
				<div class="ykb_day fr">
					<p>${ykb.termCount}<span class="f20">天</span></p>
					<p class="f12">计划期限</p>
				</div>
			</div>
			<div class="ykb_footer mt15">本期规模<fmt:formatNumber value="${ykb.amount/10000}" pattern="${moneyexpInt}" />万元<br/>保证金由招商银行全程监管</div>
		</div>
		<div class="ykb_btn">已抢购完毕</div>
	</div>
	</c:if>
	</c:forEach>
	</c:if>
	</c:if>

	</div>
	<%@ include file="/views/inc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	$('.ybk_list').click(function(){
    	var url=$(this).attr('url');
    	window.location=url; 
    });
});
</script>
</body>
</html>