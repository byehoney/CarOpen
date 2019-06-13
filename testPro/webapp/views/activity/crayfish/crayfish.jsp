<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<%
String verCode = "?v=Version20160928";
%>
<head>
<meta charset="UTF-8">
<title>中再融-国资互联网金融平台</title> 
<%@ include file="/views/inc/inc.jsp"%>
<link href="<%=request.getContextPath()%>/resources/css/present/swiper.min.css<%=verCode%>" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/resources/css/activity/crayfish.css<%=verCode%>" rel="stylesheet" type="text/css">
</head>
<body>
<div class="swiper-container">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <div class="firstBox">
                <div class="backBox-top"></div>
                <div class="backBox-middle"></div>
                <div class="backBox-bottom"></div>
                <div class="input-box">
                	<c:if test="${mobile == null}">
                		<p class="inp-box">
	                        <input id="phone" type="text" maxlength="11" placeholder="请输入手机号"/>
	                    </p>
	                    <p id="toReg" class="text-box">理财免费领麻小</p>
                	</c:if>
                    <c:if test="${mobile != null}">
                		<p class="inp-box logined">${mobile}</p>
                		<a href="${basePath}/loan/list.do"><p class="text-box">理财免费领麻小</p></a>
                	</c:if>
                </div>
                <div id="mask" class="mask-floor swiper-no-swiping">
                    <div class="msg-box">
                        <p id="msgMobile" class="text-box logined"></p>
                        <p class="clearfix msg-line">
                            <input name="msg" class="fl" maxlength="6" placeholder="请输入验证码"/>
                            <span id="sendMsg" class="fr send-btn">重新发送</span>
                        </p>
                        <p class="agree-box">
                            <label><input type="checkbox" id="checkbox_a2" class="chk_1" checked=""><label for="checkbox_a2"></label><span>我已阅读并同意</span></label><a href="/views/agreement/serve_agreement.jsp">《服务协议》</a><a href="/views/agreement/secret_agreement.jsp">《隐私条款》</a>
                        </p>
                        <p id="sendRegReq" class="text-box">理财免费领麻小</p>
                        <i class="close"></i>
                        <p class="reg-tip" id="regTipCont"></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="secendBox">
                <ul>
                    <li class="clearfix">
                        <span class="text-title">活动地区：</span><em>仅限北京六环内地区</em>
                    </li>
                    <li class="clearfix">
                        <span class="text-title">活动时间：</span><em>2016年10月10日-10月23日</em>
                    </li>
                    <li class="clearfix">
                        <span class="text-title">活动规则：</span><em>理财指数满30000，送300元麻小E卡；</em>
                    </li>
                    <li class="clearfix">
                        <span class="text-title"></span><em>满50000，送500元麻小E卡；</em>
                    </li>
                    <li class="clearfix">
                        <span class="text-title"></span><em>满90000，送1000元麻小E卡；</em>
                    </li>
                    <li class="clearfix">
                        <span class="text-title"></span><em>每个帐号最多可领取1000元。</em>
                    </li>
                    <li class="clearfix">
                        <span class="text-title">理财指数：</span><em>（定存金额）乘（定存月数）</em>
                    </li>
                    <li class="clearfix">
                        <span class="text-title"></span><em class="calculate">项目天数不足整月时，按整月计算（28天=1</em>
                    </li>
                    <li class="clearfix">
                        <span class="text-title"></span><em class="calculate">个月，80天=3个月，以此类推）。</em>
                    </li>
                </ul>
                <div class="example_cont"></div>
             
                <p>本次活动最终解释权归@中再融所有</p>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="thirdBox">
                <h4>关于中再融</h4>
                <p>中再融为用户提供更高利息的存款方式，年利息在7%-12%之间，轻松跑赢每年3%的货币贬值。产品期限灵活，1-12个月均可选择，并且支持T+1快速提现。</p>
                <ul class="clearfix">
                    <li class="fl"><i class="backer"></i></li>
                    <li class="fl"><i class="rate"></i></li>
                    <li class="fl"><i class="duration"></i></li>
                    <li class="fl"><i class="withdrawal"></i></li>
                </ul>
                <c:if test="${mobile == null}">
                	<div id="toFirst" class="text-box">立即投资领麻小</div>
                </c:if>
                <c:if test="${mobile != null}">
                		<a href="${basePath}/loan/list.do"><div class="text-box">立即投资领麻小</div></a>
                </c:if>
                
            </div>
        </div>
    	
    </div>
    <div id="upIcon" class="up-icon back-cf"></div>
    <div class="wrongTip"></div>
</div>
<%@ include file="/views/inc/statistics.jsp"%>
</body>
<script src="<%=request.getContextPath()%>/resources/js/present/swiper.min.js<%=verCode%>"></script>       
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/cray.js<%=verCode%>"></script>      
</html>
