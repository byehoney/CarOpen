<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    request.setAttribute("verCode", "?r=Version2018061215");
%>
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
    <title>活动规则</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/worldCup/ranking.css${verCode}"/>
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
<section class="main">
    <div class="ruleAndAdress">
        <div class="ruleDiv">
            <div class="ruleContent">
                <ol class="ruleArea">
                    <li>活动时间2018年06月13日至2018年07月03日；</li>
                    <li>奖励发放
                        <p class="clearfix">
                            <i class=fl>①</i><span class="fl">奖品特斯拉汽车使用权1年、俄罗斯豪华8日游、世界杯定制礼包不可折现，其余奖品可8折折现；</span>
                        </p>
                    </li>
                    <div class="table_list table_list_new">
                        <table class="giftTab" cellpadding="0" cellspacing="0">
                            <thead>
                            <tr>
                                <th>奖品</th>
                                <th>市场价</th>
                                <th>折现价</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>极米H1S 家用投影仪</td>
                                <td>5654元</td>
                                <td>4523元</td>
                            </tr>
                            <tr>
                                <td>戴森吹风机HD01</td>
                                <td>2965元</td>
                                <td>2372元</td>
                            </tr>
                            <tr>
                                <td>华为荣耀防水影音平板</td>
                                <td>1999元</td>
                                <td>1599元</td>
                            </tr>
                            <tr>
                                <td>索尼WF-1000X 蓝牙耳机</td>
                                <td>1299元</td>
                                <td>1039元</td>
                            </tr>
                            <tr>
                                <td>美的冷风扇</td>
                                <td>499元</td>
                                <td>399元</td>
                            </tr>
                            <tr>
                                <td>美的养生壶 1.5L容量</td>
                                <td>139元</td>
                                <td>111元</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p>
                        ②实物奖品及折现奖励，活动结束后20个工作日内发放；
                    </p>
                    <p>
                        ③邀请好友的现金奖励好友投资成功后实时发放；
                    </p>
                    <p class="clearfix">
                        <i class="fl">④</i><span class="fl">活动结束后客服将对获得奖品用户进行电话确认，请保持手机畅通。5个自然日内未能联系上的用户视为自动放弃奖品；</span>
                    </p>
                    <li>投资返现红包及加息券收益属于平台福利，不计算为活动期间累计收益；</li>
                    <li>冲榜活动排名相同时，按投资收益先后计算排名顺序，先完成投资收益的用户排名靠前；</li>
                    <li>为保证活动公平公正平台内部员工不得参与冲榜拿奖品；</li>
                    <li>活动解释权归中再融所有，如有疑问可拨打客服热线4001-156-157。</li>
                </ol>
            </div>
        </div>
    </div>
</section>
</body>
</html>

