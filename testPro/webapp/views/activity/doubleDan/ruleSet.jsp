<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="author" content="m.zhongzairong.cn">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <title>双旦嘉年华，瓜分1000万现金</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/doubleDan/public.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/doubleDan/shareRule.css${verCode}"/>
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script>
        var basePath = "<%=request.getContextPath()%>";
    </script>
    <!--PC百度统计代码-->
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?455a255e408c3cc82f67b07d05532d54";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
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
        <%--GA代码 --%>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-75483023-2', 'auto');
        ga('send', 'pageview');
    </script>
</head>
<body>
<div class="main">
    <div class="ruleHeader"></div>
    <h2 class="title">活动规则</h2>
    <div class="ruleBox" style="display: block;">
        <p>
            <span class="numBox">1.</span>
            <span class="wordBox">活动时间：2017年12月20日—2018年1月3日</span>
        </p>
        <p>
            <span class="numBox">2.</span>
            <span class="wordBox">活动累计交易额达到一定金额，每个用户可根据自己的累计投资额按达标比例瓜分现金，现金于活动结束后次日到账</span>
        </p>
        <div class="ruleGiftBox">
            <ul class="giftTitle">
                <li class="goodsTitle">累计投资金额</li>
                <li class="goodsName">2000万元</li>
                <li class="goodsName">3000万元</li>
                <li class="goodsName">5000万元</li>
            </ul>
            <ul class="giftContent">
                <li class="goodsTitle">瓜分比例</li>
                <li class="goodsName">个人累计投资金额*0.38%</li>
                <li class="goodsName">个人累计投资金额*0.58%</li>
                <li class="goodsName">个人累计投资金额*1%</li>
            </ul>
        </div>
        <p>
            <span class="numBox">3.</span>
            <span class="wordBox">当日交易额达到200万元，额外奖励当日每笔投资额1%年化收益的现金，现金于次日到账</span>
        </p>
        <p>
            <span class="numBox">4.</span>
            <span class="wordBox">
            10%加息券每日每人限领1张，加息天数为5天，限投2万元整（若投资高于2万元仍按2万元计算收益），加息券当日有效
          </span>
        </p>
        <p>
            <span class="numBox">5.</span>
            <span class="wordBox">邀请好友注册且投资，邀请人可获得好友每笔投资额的0.5%现金奖励</span>
        </p>
        <p>
            <span class="numBox">6.</span>
            <span class="wordBox">每日使用10%加息券后均有惊喜奖励</span>
        </p>
        <p>
            <span class="numBox">7.</span>
            <span class="wordBox">现金奖励已红包的形式发放至【我的奖励】，有效期为30天</span>
        </p>
        <p>
            <span class="numBox">8.</span>
            <span class="wordBox">活动奖励到账会已短信的形式提醒，请注意查看</span>
        </p>
        <p>
            <span class="numBox">9.</span>
            <span class="wordBox">投资新手标项目不参与本次活动奖励</span>
        </p>
        <p>
            <span class="numBox">10.</span>
            <span class="wordBox">本次活动最终解释权归中再融所有。如有疑问，请致电客服专线：4001-156-157</span>
        </p>
        <h2 class="example">举个例子：</h2>
        <p>融融在本次活动中投资了360天项目5万元</p>
        <p>
            <span class="numBox">1.</span>
            <span class="wordBox">若投资当日交易额达到200万元，融融当日可获得的奖励为493元（计算公式：50000*1% /365*360=493元）</span>
        </p>
        <p>
            <span class="numBox">2.</span>
            <span class="wordBox">若本次活动累计交易额达到3000万元，融融在活动结束后可获得的瓜分奖励为290元（计算公式：50000*0.58%=290元）</span>
        </p>
        <p class="wordLast">
            <span class="wordBox">那么，融融投资5万元共获得的奖励为783元（计算公式：瓜分奖励290元+当日达标奖励493元=783元）</span>
        </p>
    </div>
</div>
</body>
</html>