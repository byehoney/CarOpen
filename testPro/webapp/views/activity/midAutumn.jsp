<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<%
double version = Math.random(); 
%>
<head>
<meta charset="UTF-8">
<title>情满中秋,豪礼巨献</title> 
<%@ include file="/views/inc/inc.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${basePath}/resources/css/activity/midAutumn.css?v=20160912">
<script type="text/javascript">
	var environment = {basePath : '${basePath}'};
</script>
</head>
<body class="mid-autumn">
	<%@ include file="/views/inc/header.jsp"%>
	<div class="banner"></div>
    <div class="main">
        <section>
            <div class="back-top clearfix">
                <i class="top-l fl"></i>
                <i class="top-r fr"></i>
            </div>
            <div class="back-bot clearfix">
                <i class="bot-l fl"></i>
                <i class="bot-r fr"></i>
            </div>
            <header>
                <h3>
                    <span class="text-icon-l"></span>
                    <span>第&nbsp;一&nbsp;重</span>
                    <span class="text-icon-r"></span>
                </h3>
                <p>投资满额送豪礼</p>
            </header>
            <ul>
                <li>
                    <img src="${basePath}/resources/image/activity/mid_autumn/jd.png" alt="" title=""/>
                    <p>20000元≤累计投资金额＜50000元</p>
                    <p>送<span>100元京东卡</span></p>
                </li>
                <li>
                    <img src="${basePath}/resources/image/activity/mid_autumn/crabs.png" alt="" title=""/>
                    <p>50000元≤累计投资金额＜100000元</p>
                    <p>送<span>大闸蟹礼盒</span></p>
                </li>
                <li>
                    <img src="${basePath}/resources/image/activity/mid_autumn/crabs_jd.png" alt="" title=""/>
                    <p>累计投资金额≥100000元</p>
                    <p>送<span>300元京东卡+大闸蟹礼盒</span></p>
                </li>
            </ul>
        </section>
        <p class="tip">图片仅供参考以实物为准</p>
        <section class="two-sec">
            <div class="back-top clearfix">
                <i class="top-l fl"></i>
                <i class="top-r fr"></i>
            </div>
            <div class="back-bot clearfix">
                <i class="bot-l fl"></i>
                <i class="bot-r fr"></i>
            </div>
            <header>
                <h3>
                    <span class="text-icon-l"></span>
                    <span>第&nbsp;二&nbsp;重</span>
                    <span class="text-icon-r"></span>
                </h3>
                <p>APP投资送现金</p>
            </header>
            <p class="rule">活动期间，每天在APP上进行的首笔投资，按照投资项目期限及金额获得年化0.5%的现金红包。</p>
            <div class="clearfix example">
                <p class="fl">举个例子:</p>
                <p class="fr">小明在9月16日用手机APP投资了一笔20000元，投资期限是60天，那么，小明可以获得的现金奖励是：20000元*0.5%*60/365=16.44元。</p>
            </div>
        </section>
        <section class="thr-sec">
            <header>
                <h3>
                    <span class="text-icon-l"></span>
                    <span>温馨提示</span>
                    <span class="text-icon-r"></span>
                </h3>
            </header>
            <ul>
                <li>活动时间：9月13日-9月18日，所有用户均可参与；</li>
                <li>现金奖励将在活动结束后3个工作日内以红包形式发放，点击红包即可兑现；</li>
                <li>实物奖励将在活动结束后5个工作日内进行联系、邮寄（您可提前在"我的账户-个人资料"页面中添加收货人信息） ；</li>
                <li>大闸蟹礼盒内共8只蟹，4只公蟹4.0-4.5两/只，4只母蟹3.0-3.5两/只；</li>
                <li>新手项目不参与本活动；</li>
                <li>本活动最终解释权归中再融所有。</li>
                
            </ul>
        </section>
    </div>
    <footer>
        <p>©2016&nbsp;zhongzairong.cn&nbsp;&nbsp;中再融(北京)科技有限公司&nbsp;版权所有&nbsp;&nbsp;京ICP备16002418号-1</p>
        <p>平台提醒：市场有风险,投资需谨慎</p>
    </footer>
</body>
<!--热力图-->
<script type="text/javascript">
    window._pt_lt = new Date().getTime();
    window._pt_sp_2 = [];
    _pt_sp_2.push('setAccount,392d7037');
    var _protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    (function() {
        var atag = document.createElement('script'); atag.type = 'text/javascript'; atag.async = true;
        atag.src = _protocol + 'js.ptengine.cn/pta.js';
        var stag = document.createElement('script'); stag.type = 'text/javascript'; stag.async = true;
        stag.src = _protocol + 'js.ptengine.cn/pts.js';
        var s = document.getElementsByTagName('script')[0]; 
        s.parentNode.insertBefore(atag, s); s.parentNode.insertBefore(stag, s);
    })();
</script>
</html>
