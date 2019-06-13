<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>我的账户 - 中再融</title>
<meta name="keywords" content="">
<meta name="description" content="">
<%@ include file="/views/inc/inc.jsp"%>
<link type="text/css" rel="stylesheet" href="${basePath}/resources/css/user.css">
<link href="${basePath}/resources/css/present/indexWap.css" rel="stylesheet" type="text/css">	
</head>
<body> 
<%@ include file="/views/inc/header.jsp"%>
<div id="content_height">
    <section class="base-box" style="padding: 40px 10px;">
        <div class="top-hello">
            <span class="user-name">Hi,
                <c:if test="${fn:length(user.nickName) > 10}">${fn:substring(user.nickName,0,10)}</c:if>
                <c:if test="${fn:length(user.nickName) <= 10}">${user.nickName}</c:if>
            </span>
            ${result.data.welcome}
        </div>
        <dl>
            <dt>可用余额：￥<span class="number"><fmt:formatNumber value="${result.data.cash}"  pattern="${moneyexpInt}"></fmt:formatNumber>.</span>${fn:substringAfter(result.data.yue, ".")}</dt>
            <dd>累计收益：￥ <fmt:formatNumber value="${result.data.leijishouyi}"  pattern="${moneyexp}" /></dd>
            <dd>待收收益：￥ <fmt:formatNumber value="${result.data.daishoushouyi}"  pattern="${moneyexp}" /></dd>
            <dd><span>待收本金：￥ <fmt:formatNumber value="${result.data.daishoubenjin}"  pattern="${moneyexp}" /></span><a href="${basePath}/recharge/index.session">充值</a></dd>
        </dl>
        <p class="tisd">为保证您的资金账户安全，wap页面暂不支持提现，请使用电脑登录操作。</p>
    </section>
    <!--我的体验金-->
	<div class="hb_num">
		<div class="ml20 exeMoney mr10 ohz" >
			<span class="hb_icon mr5"><img src="${basePath}/resources/image/activity/experienceMoney/experience_icon.png"></span>
			<p class="hb_content"><sapn class="f15 mr5">我的体验金</sapn></p>
			<span class="go_listbtn fr"></span>
			<span class="earnings fr">待收收益 <fmt:formatNumber value="${result.data.notEarnings}"  pattern="${moneyexp}" /> <em>元</em></span>
			<span class="num fr c_red"></span>
		</div>
	</div>
	<!--我的体验金 end-->
    <div class="hb_num">
        <div class="ml20 hasUrl mr10 ohz" url="${basePath}/myAccount/huiKuanCalendar.session">
            <span class="hb_icon mr5"><img src="${basePath}/resources/image/calendar_icon.png"></span>
            <p class="hb_content"><sapn class="f15 mr5">回款日历</sapn></p>
            <span class="go_listbtn fr"></span>
        </div>
    </div>
    <div class="hb_num">
        <div class="ml20 hasUrl mr10 ohz" url="${basePath}/myAccount/coupon.session">
            <span class="hb_icon mr5"><img src="${basePath}/resources/image/money_icon.png"></span>
            <p class="hb_content"><sapn class="f15 mr5">我的红包</sapn></p>
            <span class="go_listbtn fr"></span>
            <span class="num fr c_red">${result.data.noOpenCount}</span>
        </div>
    </div>
     <!--兑换红包-->
	<div class="hb_num">
		<div class="ml20 hasUrl mr10 ohz" url="${basePath}/experienceMoney/toConservationMoney.do">
			<span class="hb_icon zh_icon mr5"><img src="${basePath}/resources/image/activity/experienceMoney/exchange_icon.png"></span>
			<p class="hb_content"><sapn class="f15 mr5">兑换红包</sapn></p>
			<span class="go_listbtn fr"></span>
			<span class="num fr c_red"></span>
		</div>
	</div>
	<!--兑换红包 end-->
	<!--兑换红包-->
	<div class="hb_num">
		<div class="ml20 hasUrl mr10 ohz" url="${basePath}/invitation/toWAPInvitationActivity.do">
			<span class="hb_icon zh_icon mr5"><img src="${basePath}/resources/image/inviteIcon.png"></span>
			<p class="hb_content"><sapn class="f15 mr5">邀请有奖</sapn></p>
			<span class="go_listbtn fr"></span>
			<span class="num fr c_red"></span>
		</div>
	</div>
	<!--兑换红包 end-->
    
    <div class="" style="margin-top: 14px; display:none;"><a href="${basePath }/experienceGoldIndex.do"><img src="${basePath}/resources/image/app/apptyj/account_btn.jpg"/></a></div>
    <div class="user_btn ohz ml10 mr10 mt20">
        <span class="fl bg1">
        	
            <c:if test="${result.data.isNovice}"><a href="${basePath}/loan/list.do">去投资</a></c:if>
            <c:if test="${!result.data.isNovice}"><a href="${basePath}/loan/list.do">去投资</a></c:if>
            
        </span>
         <span class="fl bg1" style="margin-top:12px;">
         	<c:if test="${user.nickName != null}"><a href="${basePath}/userInfo/logout.do">退出登录</a></c:if>
            <c:if test="${user.nickName == null}"><a href="${basePath}/userInfo/nologin.do">登录</a></c:if>
         </span>
    </div>
    <!-- <div class="user_dilog"> -->
    <!--     <div class="dilog_content">下载中再融APP</div> -->
    <!--     <div class="user_closed fr" id="user_closed">X</div> -->
    <!-- </div> --> 
    <div class="mark_box"></div> 
    <!--底部导航-->
		<footer>
			<ul class="nav whiteBack clearfix">
				<li class="fl">
					<a href="${basePath}/index.do">
						<p class="iconBack indexIcon"></p>
						<p>主页</p>
					</a>
				</li>
				<li class="fl">
					<a href="${basePath}/loan/list.do">
						<p class="iconBack investIcon"></p>
						<p>投资</p>
					</a>
				</li>
				<li class="fl">
					<a href="${basePath}/myAccount/myAccountInfo.session" class="act">
						<p class="iconBack accountIcon"></p>
						<p>我的账户</p>
					</a>
				</li>
			</ul>
		</footer>
</div>
<%@ include file="/views/inc/footer.jsp"%>
<!--弹窗-->
	<div class="wap_account_Popup">
		<div class="alertmask"></div>
		<!--体验金红包弹窗-->
		<div class="alertid">
			<p>登录PC端</p>
			<p>可查看更多体验金详情</p>
		</div>
		<!--体验金红包弹窗 end-->
	</div>
	<!--弹窗 end-->

<script>
$(function(){
    $('.hb_num .hasUrl').click(function(){
      var url=$(this).attr('url');
      window.location=url;
    });
	$('.exeMoney').click(function(){
		$('.alertmask,.alertid').show();
		setTimeout(function(){$('.alertmask,.alertid').hide();},3000)
	});
    $('#user_closed').click(function(){
        $(this).parent().hide();
    });


});
</script>
</body>
</html>