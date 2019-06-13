<%@page import="com.yinker.wap.util.CommonUtil"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<%
String mongoPic = CommonUtil.MONGOFILEPATH;
%>
<%
String verCode = "?v=Version2016050819";
%>
<head>
<meta charset="UTF-8">
<title>中再融-新年送现金</title>
<meta name="keywords" content="中再融,中再融官网,互联网金融,互联网金融平台,p2p理财平台,p2p投资理财平台,p2p理财,网络投资,投资理财平台,网络理财,p2p网站,p2p网贷,中再融p2p理财,投资理财,中再融P2P平台,中再融怎么样,中再融可靠吗">
<meta name="description" content="中再融是一个创新型互联网金融平台，p2p网贷行业领先品牌，北京市网贷行业协会副会长单位，中再融新手18%，凭借自身的技术和P2P产品优势，为广大投资者提供高收益、低风险的互联网理财产品。通过互联网技术降低融资成本，使投资人获得稳健的收益。让您足不出户轻松跑赢CPI，成为掌握财富密码的银行家。">
<meta name="author" content="wuyongjun_app">
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<c:set var="user" value="${sessionScope.userObj }"></c:set>
<c:set var="dateexp" value="yyyy-MM-dd"></c:set>
<c:set var="dateslashexp" value="yyyy/MM/dd"></c:set>
<c:set var="timeexp" value="yyyy-MM-dd HH:mm:ss"></c:set>
<c:set var="datepointexp" value="yyyy.MM.dd"></c:set>
<c:set var="timehmsexp" value="HH:mm:ss"></c:set>
<c:set var="moneyexp" value="#,##0.00#"></c:set>
<c:set var="moneyexpInt" value="#,##0"></c:set>
<c:set var="aunualInterestRateExp" value="##0.0#"></c:set>
<meta name="author" content="m.zhongzairong.cn">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<script type="text/javascript">
	var environment = {basePath : '${basePath}'};
	var rootUrl = "<%=request.getContextPath()%>";
</script>
<script src="${basePath}/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>

<link href="<%=request.getContextPath()%>/resources/css/activity/zodiac.css<%=verCode%>" rel="stylesheet" type="text/css">
</head>
<body class="zodiac">
	<div class="banner"></div>
    <section>
        <header>
            <div class="h-box">
                <h3>
                    <i class="h-icon-l"></i>
                    <i class="h-icon-r"></i>
                    <span>福利<i class="round">1</i>：邀好友投资立赚1%奖励</span>
                </h3>
            </div>
        </header>
        <div class="cont">
            <ol class="reel">
                <li>邀请好友单笔投资  <span class="num-tip">≥1万元</span> </li>
                <li>且投资项目期限  <span class="num-tip"> ≥50天</span></li>
                <li>即可获得年化  <span class="num-tip">1% </span>&nbsp;现金奖励</li>
            </ol>
          
            <c:if test="${userId == 0 }">
            	<%-- 未登录 --%>
            	<a href="${basePath}/userInfo/nologin.do">
					 <p class="to-login-pre">
		                <i class="top-icon"></i>
		                <i class="bottom-icon"></i>
		                <span>登录查看我的奖励</span>
		            </p>
		  		</a>
            </c:if>
            <c:if test="${userId != 0 }">
            	<%-- 登录 --%>
			    <div class="reward-info">
	                <p class="fortuna">财神</p>
	                <p class="reward-amount">
	                    <span>您已获得<i id="getMoney" class="amount-num">0</i>元现金<i class="bullions"></i></span>
	                </p>
	            </div>
	            <div class="ctrl-box clearfix">
	                <p class="fl inviteFriends" data-clipboard-text="11231313">立即邀请好友</p>
	                <p id="myPre" class="fr view-rewards">查看我的奖励</p>
	           </div>
            </c:if>
        </div>
    </section>
    <section>
	        <header>
	            <div class="h-box"></div>
	            <h3>
	                <i class="h-icon-l"></i>
	                <i class="h-icon-r"></i>
	                <span>福利<i class="round">2</i>：邀好友投资赢18888元现金</span>
	            </h3>
	        </header>
        <div class="cont">
        	<c:if test="${userId == 0 }">
            	<%-- 未登录 --%>
            	<a href="${basePath}/userInfo/nologin.do">
					<p class="to-login-zodiac">
		                <i class="top-icon"></i>
		                <i class="bottom-icon"></i>
		                <span>登录查看我的生肖</span>
		            </p>
		  		</a>
            </c:if>
            <c:if test="${userId != 0 }">
            	<%-- 登录 --%>
			    <p class="logined-zodiac">
	                <i class="top-icon"></i>
	                <i class="bottom-icon"></i>
	                <span></span>
	            </p>
           </c:if>
        	
            
            <div class="zodiac-icon-box" isLogin="${code}" inviteCode="">
                <ul class="large clearfix">
                    <li class="fl">
                        <p class="large-icon"></p>
                        <p>生肖猴卡<span class="num-tip"></span></p>
                    </li>
                    <li class="fl">
                        <p class="large-icon"></p>
                        <p>生肖鸡卡<span class="num-tip"></span></p>
                    </li>
                    <li class="fl">
                        <p class="large-icon"></p>
                        <p>生肖龙卡<span class="num-tip"></span></p>
                    </li>
                </ul>
                <ul class="small clearfix">
                    <li class="fl">
                        <p class="small-icon"></p>
                        <p>生肖虎卡<span class="num-tip"></span></p>
                    </li>
                    <li class="fl">
                        <p class="small-icon"></p>
                        <p>生肖马卡<span class="num-tip"></span></p>
                    </li>
                    <li class="fl">
                        <p class="small-icon"></p>
                        <p>生肖狗卡<span class="num-tip"></span></p>
                    </li>
                    <li class="fl">
                        <p class="small-icon"></p>
                        <p>生肖兔卡<span class="num-tip"></span></p>
                    </li>
                    <li class="fl">
                        <p class="small-icon"></p>
                        <p>生肖猪卡<span class="num-tip"></span></p>
                    </li>
                    <li class="fl">
                        <p class="small-icon"></p>
                        <p>生肖羊卡<span class="num-tip"></span></p>
                    </li>
                    <li class="fl">
                        <p class="small-icon"></p>
                        <p>生肖蛇卡<span class="num-tip"></span></p>
                    </li>
                    <li class="fl">
                        <p class="small-icon"></p>
                        <p>生肖牛卡<span class="num-tip"></span></p>
                    </li>
                    <li class="fl">
                        <p class="small-icon"></p>
                        <p>生肖鼠卡<span class="num-tip"></span></p>
                    </li>
                </ul>
            </div>
            <c:if test="${userId != 0 }">
            	<%-- 登录 --%>
		    	<ul class="clearfix level">
	                <li class="fl rmb899">
	                    <p>您已获得<i id="hasAmounts" class="amount-num"></i>枚生肖卡，</p>
	                    <p>还差<i id="noHasAmounts" class="amount-num"></i>枚</p>
	                    <p>即可获得988元现金！</p>
	                </li>
	                <li class="fr rmb18888">
	                    <p>您已获得<i id="hasZodiac" class="amount-num"></i>种生肖卡，</p>
	                    <p>还差<i id="noHasZodiac" class="amount-num"></i>种</p>
	                    <p>即可获得18888元现金！</p>
	                </li>
	            </ul>
	            <div class="ctrl-box clearfix">
	                <p class="fl inviteFriends" data-clipboard-text="m.zhongzairong.cn">立即邀请好友</p>
	                <p id="myZodiac" class="fr view-rewards">查看我的奖励</p>
	            </div>
           </c:if>
        </div>
    </section>
    <c:if test="${userId == 0 }">
    <section>
        <header>
            <div class="h-box">
                <h3>
                    <i class="h-icon-l"></i>
                    <i class="h-icon-r"></i>
                    <span>轻松三步走，现金拿到手</span>
                </h3>
            </div>
        </header>
        <div class="cont">
            <ul class="step">
                <li class="">
                    <p></p>
                    <p><b>邀请好友<span class="red">注册</span></b></p>
                </li>
                <li class="">
                    <p></p>
                    <p><b>好友成功<span class="red">投资</span></b></p>
                </li>
                <li class="">
                    <p></p>
                    <p><b>获得现金<span class="red">奖励</span></b></p>
                </li>
            </ul>
        </div>
    </section>
    </c:if>
    <section>
        <header>
            <div class="h-box">
                <h3>
                    <i class="h-icon-l"></i>
                    <i class="h-icon-r"></i>
                    <span>活动规则</span>
                </h3>
            </div>
        </header>
        <div class="cont">
            <ul class="rule">
                <li>1、活动时间：2017年1月20日-2017年2月3日；</li>
                <li>
                    <p>2、福利1说明：</p>
                    <p class="text-in">（1）邀请好友单笔投资≥1万元，且项目期限≥50天，邀请人即可获得该笔投资金额年化1%的现金奖励 (奖励金额=好友该笔投资金额*1%/365*项目期限);</p>
                    <p class="text-in">（2）邀请人可重复获得现金奖励；</p>
                    <p class="text-in">（3）奖励金额数据和【查看我的奖励】列表将在每个项目募集完成后15分钟内进行更新；</p>
                </li>
                <li>
                    <p>3、福利2说明：</p>
                    <p class="text-in">（1）邀请好友单笔投资≥1万元，且项目期限≥50天，项目募集完成后15分钟内，您可随机获得猴、鸡、龙生肖卡1枚（每位好友仅能给您带来1枚生肖卡）；</p>
                    <p class="text-in">（2）当您的好友也邀请好友单笔投资≥1万元，且项目期限≥50天，项目募集完成后15分钟内，您可随机获得虎、马、狗、兔、猪、羊、蛇、鼠、牛生肖卡1枚（每位好友的好友仅能给您带来1枚生肖卡）；</p>
                    <p class="text-in">（3）集齐12枚生肖卡，您即可获得988元现金；</p>
                    <p class="text-in">（4）集齐12枚不同种类生肖卡，您即可获得18888元现金；</p>
                    <p class="text-in">（5）988元现金和18888元现金不可同时获得；</p>
                </li>
                <li>4、您邀请的好友需要在活动期间进行注册并且投资；</li>
                <li>5、所有现金奖励将在活动结束后5个工作日内，以现金红包形式发放至用户账户，点击红包即可兑现；</li>
                <li>6、本活动最终解释权归中再融所有。</li>
            </ul>
        </div>
    </section>
    <div class="mask-floor">
         <div class="user-rewards">
            <p><a id="closeReward" class="close-btn">关闭</a></p>
            <div class="main-info">
                <h4>我的奖励</h4>
                <p class="clearfix friends-num">
                    <span class="fl">邀请好友数：<i id="friendsAmount"></i> 人</span>
                    <span class="fr">获得返利金额：<i id="getAmountTotal"></i> 元</span>
                </p>
                <h4 class="top-bor">我的邀请记录</h4>
                <div id="rewardTab" class="table">
                	<ul class="tabTitle clearfix">
                		<li class="fl">手机号码</li>
                		<li class="fl">是否满足要求</li>
                		<li class="fl">我的奖励</li>
                	</ul>
                	<ul class="tabData" id="myAwordTab1">
                	</ul>
                </div>
            </div>
        </div>
        <div class="user-zodiac">
            <p><a id="closeZodiac" class="close-btn">关闭</a></p>
            <div class="main-info">
                <h4>我的奖励</h4>
                <ul class="clearfix friends-num no-get">
                    <li class="fl">
                        <p>邀请好友数：<i id="zodiacFriends"></i> 人</p>
                        <p><span id="988div"></span></p>
                    </li>
                    <li class="fr">
                        <p>奖励生肖卡：<i id="zodiacAmount"></i> 枚</p>
                        <p><span id = "18888div"></span></p>
                    </li>
                </ul>
                <h4 class="top-bor">我的获卡记录</h4>
                 <div id="zodiacTab" class="table">
                	<ul class="tabTitle clearfix">
                		<li class="fl">手机号码</li>
                		<li class="fl">是否满足要求</li>
                		<li class="fl">我的奖励</li>
                	</ul>
                	<ul class="tabData" id="myAwordTab2">
                	</ul>
                </div>
            </div>
        </div>
        <div class="alert-box">
            <p>复制成功，马上发送给好友吧！</p>
            <p class="sure">确定</p>
        </div>
          <div class="zs"><img src="<%=request.getContextPath()%>/resources/image/activity/zodiac/arrow.png" alt=""/></div>   
    </div>
  
<script src="<%=request.getContextPath()%>/resources/js/activity/zodiac.js<%=verCode%>"></script> 
<script src="<%=request.getContextPath()%>/resources/js/activity/clipboard.min.js<%=verCode%>"></script>       
</body>
</html>
