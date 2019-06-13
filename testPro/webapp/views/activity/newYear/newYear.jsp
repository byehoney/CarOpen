<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    request.setAttribute("verCode", "?r=Version2018020815");
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
    <title>新 年 狂 欢 趴</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/newYear/newYear.css${verCode}"/>
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
    <div class="banner">
        <img src="<%=request.getContextPath()%>/resources/image/activity/newYear/banner1.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/newYear/banner2.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/newYear/banner3.png" alt="">
        <div class="actTitle title1"><span class="tOrder">好礼一</span><span class="tContent">萌宠喂养得现金</span></div>
    </div>
    <div class="catHouse">
        <img class="houseBg" src="<%=request.getContextPath()%>/resources/image/activity/newYear/catHouse.png" alt="">
        <img style="display: none" class="cat" src="<%=request.getContextPath()%>/resources/image/activity/newYear/noFeedCat.gif" alt="">
        <div class="dialog dialog1"><p>主人<br/>融融好饿</p></div>
        <div class="dialog dialog2"><p>谢谢主人<br/>融融吃得好饱</p></div>
    </div>
    <div style="display: none" class="feedCat noFeed <c:if test="${loginStatus==0}">noLoginFeed</c:if><c:if test="${loginStatus==1}">loginFeed</c:if>">喂融融得红包</div>
    <div style="display: none" class="feedCat haveFeed">今日红包已领取</div>
    <div class="actTitle"><span class="tOrder">好礼二</span><span class="tContent">加息返现拿回家</span></div>
    <div class="actTip">
        <p>全场加息1%</p>
        <p>单笔投资<e style="font-weight: bold;color:#f4d747">每满1万元</e>还可得现金红包</p>
    </div>
    <c:if test="${not empty carouselWard}">
        <div class="notice">
            <div id = "noticeBox" class="notice_title">
                <ul>
                    <c:forEach items="${carouselWard}" var="list">
                        <li>${list.mobile} 获得了<fmt:formatNumber type="currency" value="${list.packageMoney}" pattern="##00"/>元返现</li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </c:if>
    <div class="data">
        <img class="houseTop" src="<%=request.getContextPath()%>/resources/image/activity/newYear/houseTop.png" alt="">
        <div class="dataBox">
            <div class="table">
                <ul class="firstUl">
                    <li>投资期限</li>
                    <li class="middle">活动利率</li>
                    <li>
                        <p>单笔投资每<br/>满1万元返现</p>
                    </li>
                </ul>
                <ul>
                    <li>≤ 30天</li>
                    <li class="middle">6.5%+<e>1%</e></li>
                    <li>18元</li>
                </ul>
                <ul>
                    <li>31天~60天</li>
                    <li class="middle">7%+<e>1%</e></li>
                    <li>28元</li>
                </ul>
                <ul>
                    <li>61天~90天</li>
                    <li class="middle">9%+<e>1%</e></li>
                    <li>48元</li>
                </ul>
                <ul>
                    <li>91天~180天</li>
                    <li class="middle">10%+<e>1%</e></li>
                    <li>78元</li>
                </ul>
                <ul class="lastUl">
                    <li>> 180天</li>
                    <li class="middle">11%+<e>1%</e></li>
                    <li>128元</li>
                </ul>
            </div>
            <h3 class="example">举个栗子</h3>
            <p class="exaTitle">投资1万元，可赚得收益</p>
            <img class="chart" src="<%=request.getContextPath()%>/resources/image/activity/newYear/chart.png${verCode}" alt="">
            <div class="investBtn">立即投资享好礼</div>
        </div>
    </div>
    <div class="rewardBox">
        <div class="rewardTitle">我的现金奖励</div>
        <span class="<c:if test="${loginStatus==0}">noLoginCheckRewardDetail</c:if><c:if test="${loginStatus==1}">loginCheckRewardDetail</c:if>">查看明细</span>
    </div>
    <div class="actFooter">
        <h2 class="getMoney">${totalAward}</h2>
        <h2>累计奖励(元)</h2>
        <p><span>*活动期间每天都有现金红包免费领，投资还送现金红包，一定要来哦！</span></p>
    </div>
</div>
<div class="actDetail">
    <div class="actRuleBtn"></div>
    <div class="backTopBtn"></div>
</div>
<%--活动规则--%>
<div class="actRules pops" style="display: none">
    <i class="close-btn"></i>
    <div class="ruleBox popBox">
        <div class="angel angelTL"></div>
        <div class="angel angelTR"></div>
        <div class="angel angelBL"></div>
        <div class="angel angelBR"></div>
        <h3>活动规则</h3>
        <div class="contentDiv">
            <p><span class="numBox">1.</span><span class="wordBox">活动时间：2018年2月7日-2018年3月4日；</span></p>
            <p><span class="numBox">2.</span><span class="wordBox">每日给猫喂食可免费获得1个随机现金红包，每日可喂食1次；</span></p>
            <p><span class="numBox">3.</span><span class="wordBox">单笔投资每满1万元可获得返现，返现金额跟随项目期限变化（项目期限越长，相应奖励越高），返现详情请查看活动页面；</span></p>
            <p><span class="numBox">4.</span><span class="wordBox">红包为实时发放，可前往【我的账户】-【<c:if test="${flag=='wap'}">我的红包</c:if><c:if test="${flag=='mobile'}">我的奖励</c:if>】查看；</span></p>
            <p><span class="numBox">5.</span><span class="wordBox">新手项目不参与本次活动；</span></p>
            <p><span class="numBox">6.</span><span class="wordBox">本次活动最终解释权归中再融所有，如有疑问请致电客服专线：4001-156-157。</span></p>
        </div>
    </div>
</div>
<div class="rewardDetails pops" style="display: none">
    <div class="popBox">
        <div class="angel angelTL"></div>
        <div class="angel angelTR"></div>
        <div class="angel angelBL"></div>
        <div class="angel angelBR"></div>
        <h3>现金奖励明细</h3>
        <p class="totalMoney"><span>累计奖励：</span><e>${totalAward}</e> 元</p>
        <div class="rewardDataBox">
            <ul class="dataHeader" style="display:none;">
                <li class="left">奖励时间</li>
                <li class="mid">奖励来源</li>
                <li class="right">奖励金额(元)</li>
            </ul>
            <div class="dataContent" style="display:none;">

            </div>
            <div class="noData" style="display: none">
                您还没有获得现金奖励，<span class="goInvest">去投资</span> 得现金红包
            </div>
            <div class="closePopBtn">我知道了！</div>
        </div>
    </div>
</div>
<div class="overlay" style="display:n-one;"></div>
<!-- toast提示 -->
<div class="err end">
    <div class="errInner"></div>
</div>
<div class="err noStart">
    <div class="errInner"></div>
</div>
<div class="err next">
    <div class="errInner"></div>
</div>
<div class="err fail">
    <div class="errInner"></div>
</div>
<!--喂融融红包-->
<div class="rewardPop">
    <div class="rewardCon">
        <img src="<%=request.getContextPath()%>/resources/image/activity/newYear/txtDayPrize.png" alt="">
        <p>只要每天来都送的哦～ </p>
        <div class="cashCard">
            <div class="amount fl"><em>¥</em><span>0.43</span></div>
            <div class="cardName fl">
                <i>现</i>
                <i>金</i>
                <i>红</i>
                <i>包</i>
            </div>
        </div>
        <div class="iknowBtn">我知道了 !</div>
        <i class="arrowLt"></i>
        <i class="arrowLb"></i>
        <i class="arrowRt"></i>
        <i class="arrowRb"></i>
    </div>
    <div class="redPacketCat"></div>
</div>
<%--投资门槛弹窗--%>
<div class="limitPop">
    <div class="rewardCon">
        <p>悄悄告诉你</p>
        <p>投资<e>每满1万元</e>可获得<br/>不同返现额哦~</p>
        <div class="limitBtn">我知道了 !</div>
        <i class="arrowLt"></i>
        <i class="arrowLb"></i>
        <i class="arrowRt"></i>
        <i class="arrowRb"></i>
    </div>
    <div class="redPacketCat"></div>
</div>
<input type="hidden" id="flag" value="${flag}">
<input type="hidden" id="loginStatus" value="${loginStatus}">
<input type="hidden" id="userId" value="${userId}">
<input type="hidden" id="currentTime" value="${currentTime}">
<input type="hidden" id="campaignStartTime" value="${campaignStartTime}">
<input type="hidden" id="campaignEndTime" value="${campaignEndTime}">
<input type="hidden" id="campaignType" value="${campaignType}">
<input type="hidden" id="totalAward" value="${totalAward}">
<input type="hidden" id="popupFlag" value="${popupFlag}">


<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/newYear/fastclick.js"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script src="<%=request.getContextPath()%>/resources/js/activity/newYear/jquery.nicescroll.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/newYear/newYear.js${verCode}"></script>
<script>
    var isNoStartM=false;
    var isEndM=false;
    // app 端调用改变页面点击事件或样式
    function changeForApp(){
        $(".noLoginFeed,.noLoginCheckRewardDetail").off().on("click",function(){//未登录喂猫
            userLogin();
        });
        $(".investBtn,.goInvest").off().on("click",function(){//未登录点击投资享好礼
            jumpInvest();
        })
    }
    //   app去登陆
    function userLogin(){
        anniversary.userLogin();
    }
    //app去投资
    function jumpInvest(){
        anniversary.jumpInvest();
    }
    //活动是否开始弹窗
    function canGo(){
        var now_time=$("#currentTime").val();
        var start_time=$("#campaignStartTime").val();
        var end_time =$("#campaignEndTime").val();
        if(now_time>end_time){//未在活动时间范围
            isEndM=true;
        }else if(now_time<start_time){
            isNoStartM=true;
        }else{
            isNoStartM=false;
            isEndM=false;
        }
    }
    //错误提示弹窗
    function errTip(obj,dur){
        $(".overlay").show();
        $(obj).show();
        setTimeout(function(){
            $(".overlay").hide();
            $(obj).hide();
        },dur)
    }
</script>
</body>
</html>