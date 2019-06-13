<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
    request.setAttribute("verCode", "?r=Version2017030824");
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
    <title>融布斯 2017 年度人物全记录</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/annals/swiper-3.4.2.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/annals/annalsData.css${verCode}"/>
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
<div class="schedule_count clearfix">
    <span class="loading">0%</span>
    <div class="progress_bar">
        <div class="progress_bar_icon"></div>
        <div class="progress_bar_right"></div>
    </div>
</div>
<div class="main">
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <%--围观入口--%>
            <div class="swiper-slide one" style="display: none ">
                <div class="dataBox">
                    <img class="shineBg" src="<%=request.getContextPath()%>/resources/image/activity/annals/goldBg.png">
                    <div class="annalHeader">
                        <img class="topImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/trImg.png">
                    </div>
                    <div class="annalLookCont">
                        <img class="lookPic" src="<%=request.getContextPath()%>/resources/image/activity/annals/lookPic.png" alt="">
                        <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/annals/arrow.png">
                    </div>
                </div>
            </div>
            <%--平台第一投--%>
            <div class="swiper-slide two">
                <div class="dataBox">
                    <img class="shineBg" src="<%=request.getContextPath()%>/resources/image/activity/annals/goldBg.png">
                    <div class="annalHeader">
                        <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/annals/logo.png">
                        <img class="topImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/trImg.png">
                        <div class="title investTitle" style="display: none">
                            <p class="titleMain maxText">今年第一投</p>
                            <p class="titleDate maxText">2017<i class="minText">年</i>01<i class="minText">月</i>10<i class="minText">日</i></p>
                            <p class="titleMoney minText">投资金额：【 <e class="mdText italic">1000</e>元 】</p>
                        </div>
                        <div class="title noInvestTitle" style="display: none">
                            <p class="titleDate maxText">2017<i class="minText">年</i>01<i class="minText">月</i>01<i class="minText">日</i></p>
                            <p class="titleMain minText">融粉完成2017年平台第<e class="maxText">1</e>投</p>
                            <p class="titleMoney minText">投资：【 <e class="mdText">5,000.00</e>元 】</p>
                        </div>
                    </div>
                    <div class="annalCont">
                        <img class="singPic" src="<%=request.getContextPath()%>/resources/image/activity/annals/singPic1.png">
                        <img class="conLeft" src="<%=request.getContextPath()%>/resources/image/activity/annals/conLeft.png">
                        <img class="conRight" src="<%=request.getContextPath()%>/resources/image/activity/annals/text1.png">
                    </div>
                    <div class="annalFooter">
                        <img class="footTips" src="<%=request.getContextPath()%>/resources/image/activity/annals/footTips.png">
                        <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/annals/arrow.png">
                    </div>
                    <div class="noInvestTip">
                        <img src="<%=request.getContextPath()%>/resources/image/activity/annals/noInvestTip.png" alt="">
                    </div>
                </div>
            </div>
                <%--全年最大投资额--%>
            <div class="swiper-slide three">
                <div class="dataBox">
                    <img class="shineBg" src="<%=request.getContextPath()%>/resources/image/activity/annals/goldBg.png">
                    <div class="annalHeader">
                        <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/annals/logo.png">
                        <img class="topImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/trImg.png">
                        <div class="title investTitle" style="display: none">
                            <p class="titleMain maxText">全年最大投资额</p>
                            <p class="titleDate maxText">2017<i class="minText">年</i>01<i class="minText">月</i>10<i class="minText">日</i></p>
                            <p class="titleMoney minText">投资金额：【 <e class="mdText italic">1000</e>元 】</p>
                        </div>
                        <div class="title noInvestTitle" style="display: none">
                            <p class="titleDate maxText">2017<i class="minText">年</i>02<i class="minText">月</i>15<i class="minText">日</i></p>
                            <p class="titleMain maxText">全年投资最大额诞生</p>
                            <p class="titleMoney minText">融粉单笔投资：【 <e class="mdText">901,600.00</e>元 】</p>
                        </div>
                    </div>
                    <div class="annalCont">
                        <img class="singPic" src="<%=request.getContextPath()%>/resources/image/activity/annals/singPic2.png">
                        <img class="conLeft" src="<%=request.getContextPath()%>/resources/image/activity/annals/conLeft.png">
                        <img class="conRight conRight1" src="<%=request.getContextPath()%>/resources/image/activity/annals/text2.png">
                    </div>
                    <div class="annalFooter">
                        <img class="footTips" src="<%=request.getContextPath()%>/resources/image/activity/annals/footTips.png">
                        <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/annals/arrow.png">
                    </div>
                </div>
            </div>
                <%--投资最活跃的一天--%>
            <div class="swiper-slide four">
                <div class="dataBox">
                    <img class="shineBg" src="<%=request.getContextPath()%>/resources/image/activity/annals/goldBg.png">
                    <div class="annalHeader">
                        <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/annals/logo.png">
                        <img class="topImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/trImg.png">
                        <div class="title investTitle" style="display: none">
                            <p class="titleMain maxText">投资最晚的一天</p>
                            <p class="titleDate maxText">2017<i class="minText">年</i>01<i class="minText">月</i>10<i class="minText">日</i></p>
                            <p class="titleMoney minText">在【 <e class="mdText italic">23: 00</e> 】</p>
                        </div>
                        <div class="title noInvestTitle" style="display: none">
                            <p class="titleDate maxText">2017<i class="minText">年</i>04<i class="minText">月</i>27<i class="minText">日</i></p>
                            <p class="titleMoney minText">在【 <e class="mdText italic">23: 45</e> 】</p>
                            <p class="titleMain minText">今年晚间活跃度<e class="maxText">最高</e>的时刻</p>
                            <p class="titleMain minText">当晚，无数融粉在平台刷夜</p>
                        </div>
                    </div>
                    <div class="annalCont">
                        <img class="singPic" src="<%=request.getContextPath()%>/resources/image/activity/annals/singPic3.png">
                        <img class="conLeft" src="<%=request.getContextPath()%>/resources/image/activity/annals/conLeft.png">
                        <img class="conRight conRight2" src="<%=request.getContextPath()%>/resources/image/activity/annals/text3.png">
                    </div>
                    <div class="annalFooter">
                        <img class="footTips" src="<%=request.getContextPath()%>/resources/image/activity/annals/footTips.png">
                        <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/annals/arrow.png">
                    </div>
                </div>
            </div>
                <%--长 中 短 图表--%>
            <div class="swiper-slide five">
                <div class="dataBox">
                    <img class="shineBg" src="<%=request.getContextPath()%>/resources/image/activity/annals/goldBg.png">
                    <div class="annalHeader">
                        <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/annals/logo.png">
                        <img class="topImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/trImg.png">
                        <div class="title investTitle" style="display: none">
                            <p class="titleMain minText">偏爱【 <e class="maxText">91-180</e> 天 】中期项目</p>
                            <p class="titleMain minText">全年在 91-180 天项目共投资</p>
                            <p class="titleMain minText">【 <e class="maxText">5000</e>元 】</p>
                        </div>
                        <div class="title noInvestTitle" style="display: none">
                            <p class="titleMain minText">融粉们偏爱【 <e class="maxText">90</e> 天(含)内 】短期项目</p>
                        </div>
                    </div>
                    <div class="annalCont">
                        <div class="singPic" id="chartBox"></div>
                        <img class="conLeft" src="<%=request.getContextPath()%>/resources/image/activity/annals/conLeft.png">
                        <img class="conRight conRight3" src="<%=request.getContextPath()%>/resources/image/activity/annals/text4.png">
                    </div>
                    <div class="annalFooter">
                        <img class="footTips" src="<%=request.getContextPath()%>/resources/image/activity/annals/footTips.png">
                        <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/annals/arrow.png">
                    </div>
                </div>
            </div>
                <%--通过平台获得奖励  （未投资也可能获得奖励，不获得奖励情况：未开户  未登录）--%>
            <div class="swiper-slide six">
                <div class="dataBox">
                    <img class="shineBg" src="<%=request.getContextPath()%>/resources/image/activity/annals/goldBg.png">
                    <div class="annalHeader">
                        <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/annals/logo.png">
                        <img class="topImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/trImg.png">
                        <%--已登录未投资，已登录已投资--%>
                        <div class="title personal" style="display: none">
                            <p class="titleMain minText">全年平台共计发放奖励金额</p>
                            <p class="titleMain minText">【 <e class="maxText">1.39</e>亿元 】</p>
                            <p class="titleMain minText">我通过参与平台活动获得奖励</p>
                            <p class="titleMain minText">【 <e class="maxText">300000</e>元奖励 】</p>
                        </div>
                        <%--已登录未开户，未登录--%>
                        <div class="title plat" style="display: none">
                            <p class="titleMain minText">全年平台活动共计发放奖励金额</p>
                            <p class="titleMain minText">【 <e class="maxText">1.39</e>亿元 】</p>
                            <p class="titleMain minText">其中，参与平台活动最多的融粉共获</p>
                            <p class="titleMain minText">【 <e class="maxText">20,853.94</e>元奖励 】</p>
                        </div>
                    </div>
                    <div class="annalCont">
                        <img class="singPic" src="<%=request.getContextPath()%>/resources/image/activity/annals/singPic4.png">
                        <img class="conLeft" src="<%=request.getContextPath()%>/resources/image/activity/annals/conLeft.png">
                        <img class="conRight conRight4" src="<%=request.getContextPath()%>/resources/image/activity/annals/text5.png">
                    </div>
                    <div class="annalFooter">
                        <img class="footTips" src="<%=request.getContextPath()%>/resources/image/activity/annals/footTips.png">
                        <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/annals/arrow.png">
                    </div>
                </div>
            </div>
                <%--星座判定--%>
            <div class="swiper-slide seven">
                <div class="dataBox">
                    <img class="shineBg" src="<%=request.getContextPath()%>/resources/image/activity/annals/goldBg.png">
                    <div class="annalHeader">
                        <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/annals/logo.png">
                        <img class="topImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/trImg.png">
                        <%--已登录已投资 已登录未投资--%>
                        <div class="title personal" style="display: none">
                            <p class="titleMain minText leftText">【<e class="maxText">天蝎座</e>】</p>
                            <p class="titleMain minText leftText starM">天生拥有赚钱能力</p>
                            <p class="titleMain minText leftText">敏锐直觉捕捉最佳投资机会，获利和财务盈余是常态</p>
                        </div>
                        <%--未登录  已登录未开户--%>
                        <div class="title plat" style="display: none">
                            <p class="titleMain minText leftText">【<e class="maxText">天蝎座</e>】平台第一大星座</p>
                            <p class="titleMain minText leftText starM">天生拥有赚钱能力</p>
                            <p class="titleMain minText leftText">敏锐直觉捕捉最佳投资机会，获利和财务盈余是常态</p>
                        </div>
                    </div>
                    <div class="annalCont">
                        <img class="starPic" src="<%=request.getContextPath()%>/resources/image/activity/annals/star11.png">
                        <img class="conLeft" src="<%=request.getContextPath()%>/resources/image/activity/annals/conLeft.png">
                        <img class="conRight conRight5" src="<%=request.getContextPath()%>/resources/image/activity/annals/text6.png">
                    </div>
                    <div class="annalFooter">
                        <img class="footTips" src="<%=request.getContextPath()%>/resources/image/activity/annals/footTips.png">
                        <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/annals/arrow.png">
                    </div>
                </div>
            </div>
                <%--全年总投资 总收益--%>
            <div class="swiper-slide eight">
                <div class="dataBox">
                    <img class="shineBg" src="<%=request.getContextPath()%>/resources/image/activity/annals/goldBg.png">
                    <div class="annalHeader">
                        <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/annals/logo.png">
                        <img class="topImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/trImg.png">
                        <%--已登录有投资--%>
                        <div class="title personal" style="display: none">
                            <p class="titleMain minText leftText">全年共投资项目【 <e class="maxText">20</e>笔 】</p>
                            <p class="titleMain minText leftText">总投资 <e class="maxText">3231</e> 元</p>
                            <p class="titleMain minText leftText">所投最高年化收益 <e class="maxText">12</e>%</p>
                            <p class="titleMain minText leftText">全年总收益【 <e class="maxText">300000</e> 】元</p>
                        </div>
                        <%--未投资||未开户--%>
                        <div class="title personalNoInvest" style="display: none">
                            <p class="titleMain minText leftText">全年共投资项目【 <e class="maxText">0</e>笔 】</p>
                            <p class="titleMain minText leftText">总投资 <e class="maxText">0</e> 元</p>
                            <p class="titleMain minText leftText">全年总收益【 <e class="maxText">0</e> 】元</p>
                        </div>
                        <%--未登录--%>
                        <div class="title plat" style="display: none">
                            <p class="titleMain minText leftText">全年平台累计交易额【 <e class="maxText">3.87</e>亿元 】</p>
                            <p class="titleMain minText leftText">最高年化收益率 <e class="maxText">15%</e></p>
                            <p class="titleMain minText leftText">共为用户赚取收益</p>
                            <p class="titleMain minText leftText">【 <e class="maxText">6,752,193.75</e> 】元 </p>
                        </div>
                    </div>
                    <div class="annalCont">
                        <img style="height:80%" class="singPic" src="<%=request.getContextPath()%>/resources/image/activity/annals/singPic5.png">
                        <img class="conLeft" src="<%=request.getContextPath()%>/resources/image/activity/annals/conLeft.png">
                        <img class="conRight conRight6" src="<%=request.getContextPath()%>/resources/image/activity/annals/text7.png">
                    </div>
                    <div class="annalFooter">
                        <img class="footTips" src="<%=request.getContextPath()%>/resources/image/activity/annals/footTips.png">
                        <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/annals/arrow.png">
                    </div>
                </div>
            </div>
                <%--年度排行结果--%>
            <div class="swiper-slide nine">
                <div class="dataBox">
                    <img class="shineBg" src="<%=request.getContextPath()%>/resources/image/activity/annals/goldBg.png">
                    <div class="annalHeader">
                        <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/annals/logo.png">
                        <img class="topImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/trImg.png">
                        <%--已登录--%>
                        <div class="title personal" style="display: none">
                            <p class="titleMain minText">经系统评定</p>
                            <p class="titleMain minText">您荣获融布斯2017年度人物</p>
                            <p class="titleMain minText">【 <e class="maxText rank">富豪榜Top 100</e> 】</p>
                        </div>
                        <%--未登录--%>
                        <div class="title plat" style="display: none">
                            <p class="titleMain maxText">感谢观看，特评定</p>
                            <p class="titleMain minText">您为融布斯2017年度人物</p>
                            <p class="titleMain minText">【 <e class="maxText">新晋富豪榜候选人</e> 】</p>
                        </div>
                    </div>
                    <div class="annalCont">
                        <img class="singPic rankPic" src="<%=request.getContextPath()%>/resources/image/activity/annals/singPic6.png">
                        <img class="conLeft" src="<%=request.getContextPath()%>/resources/image/activity/annals/conLeft.png">
                        <img class="conRight conRight7" src="<%=request.getContextPath()%>/resources/image/activity/annals/conLeft.png">
                    </div>
                    <div class="annalFooter">
                        <div class="getCoverBtn">
                            生成融布斯年度人物封面
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="flag" value="${loginStatus}">
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/annals/fastclick.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/annals/swiper-3.4.2.jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/annals/echart.min.js"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script src="<%=request.getContextPath()%>/resources/js/activity/annals/annalsData.js${verCode}"></script>
</body>
</html>
