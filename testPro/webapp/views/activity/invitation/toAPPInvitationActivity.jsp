<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    request.setAttribute("verCode", "?r=Version2018060610");
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
    <title>呼朋唤友，得120%收益</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/invitation/appInvitationActivity.css${verCode}"/>
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
<div class="invite_page">
    <div class="banner">
        <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_01.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_02.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_03.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_04.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_05.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_06.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_07.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_08.png">
        <p class="activeDay">${startTime}-${endTime}</p>
    </div>
    <div class="container">
        <c:if test="${not empty interestList}">
            <div class="notice clearfix">
                <i class="horn_ioc fl"></i>
                <div id="noticeBox" class="notice_title fl">
                    <ul>
                        <c:forEach items="${interestList}" var="list">
                            <li>
                                <span class="moreleft">${list.mobile}</span>
                                <span class="moreright">刚刚获得了${list.amount}元现金</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </c:if>
        <div class="distance">
            <div>
                <div class="chunk_bg">
                    <div class="earnings_pic"></div>
                    <div class="left_riband riband_one"></div>
                    <div class="right_riband right_riband_one"></div>
                    <div class="small_redPacket small_redPacket_one"></div>
                    <div class="chunk_bg_two award_cont">
                        <div class="award_one">
                            <p class="money"><i></i>奖励1：好友首投<span>100%</span>收益</p>
                            <p>邀请好友完成首笔投资<br>可获得好友首投收益的<span>100%</span>现金奖励</p>
                        </div>
                        <div class="award_one mt35">
                            <p class="money"><i></i>奖励2：好友复投<span>20%</span>收益</p>
                            <p>好友在首投15天内发生复投<br>可获得好友每笔复投收益的<span>20%</span>现金奖励</p>
                        </div>
                        <div class="illustrate">
                            <div class="illustrate_title">
                                <p class="example">举个栗子</p>
                                <p>融融邀请新朋友小明来投资，融融可赚得收益如下</p>
                            </div>
                            <div class="cost-list">
                                <table class="Payment_detailst">
                                    <thead>
                                    <tr>
                                        <th>小明投资行为</th>
                                        <th>小明赚取收益</th>
                                        <th>融融赚取收益</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>首投1万元<br>（新手标）</td>
                                        <td>98元</td>
                                        <td>98元*100%<br>=<span>98元</span></td>
                                    </tr>
                                    <tr>
                                        <td>复投9万元<br>（90天标）</td>
                                        <td>1997元</td>
                                        <td>1997元*20%<br>=<span>399元</span></td>
                                    </tr>
                                    <tr>
                                        <td>累计收益</td>
                                        <td>2095元</td>
                                        <td><span>497元</span></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="border_bg"></div>
                </div>
                <div class="bottom_bg"></div>
            </div>
            <div class="mt">
                <div class="chunk_bg">
                    <div class="earn_pic"></div>
                    <div class="left_riband riband_one"></div>
                    <div class="small_redPacket small_redPacket_two"></div>
                    <div class="chunk_bg_two friends_earnings">
                        <div class="revenue clearfix">
                            <div class="lucky_money fl">
                                <div><span>999</span>元</div>
                                <p>红包</p>
                            </div>
                            <div class="sign fl">+</div>
                            <div class="new_standard fl">
                                <div><span>12</span>%</div>
                                <p>新手标</p>
                            </div>
                        </div>
                    </div>
                    <div class="border_bg"></div>
                </div>
                <div class="bottom_bg"></div>
            </div>
            <div class="invitation">
                <div class="invitation_pic">
                    <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/invitation_pic.png" alt="">
                    <c:if test="${codeLogin==1}">
                        <span class="loginCheck">登录查看</span>
                    </c:if>
                </div>
                <c:if test="${codeLogin==1 || codeCampaign==-1 }">
                    <div class="precept_particulars checkList clearfix">
                        <span><em>0</em>元</span>
                        <p>已获得奖励</p>
                        <b>></b>
                    </div>
                    <div class="precept_particulars clearfix">
                        <div>
                            <span><em>0</em>人</span>
                            <p>已投资好友</p>
                        </div>
                        <div>
                            <span><em>0</em>人</span>
                            <p>未投资好友</p>
                        </div>
                    </div>
                </c:if>
                <c:if test="${(codeLogin==0&&codeCampaign== 1) ||(codeLogin==0&&codeCampaign== 0 )}">
                    <div class="precept_particulars checkList clearfix">
                        <span><em>${money}</em>元</span>
                        <p>已获得奖励</p>
                        <b>></b>
                    </div>
                    <div class="precept_particulars clearfix">
                        <div>
                            <span><em>${investTotal}</em>人</span>
                            <p>已投资好友</p>
                        </div>
                        <div>
                            <span><em>${notInvestTotal}</em>人</span>
                            <p>未投资好友</p>
                        </div>
                    </div>
                </c:if>
            </div>
            <div class="rule">活动规则></div>
        </div>
    </div>
    <p class="copyright">本次活动最终解释权归中再融所有<br>若发现采取非正当手段获取奖励，中再融有权取消其获奖资格。</p>
</div>

<c:if test="${codeLogin==1 && codeCampaign==0}">
    <div class="bottom noLoginBottom">立即邀请好友得奖励</div>
</c:if>
<c:if test="${codeLogin==0&&codeCampaign==0}">
    <div class="bottom  loginBottom">立即邀请好友得奖励</div>
</c:if>
<c:if test="${codeCampaign==1}">
    <div class="bottom grey endBottom">活动已结束</div>
</c:if>
<c:if test="${codeCampaign==-1}">
    <div class="bottom grey noStartBottom">活动未开始</div>
</c:if>
<%--登陆态  0登陆  1未登录--%>
<input type="hidden" id="codeLogin" value="${codeLogin}">
<%--活动状态 0 活动进行中   1 活动已结束  -1活动未开始  -2活动不存在--%>
<input type="hidden" id="codeCampaign" value="${codeCampaign}">
<%--活动期间投资人数--%>
<input type="hidden" id="investTotal" value="${investTotal}">
<%--活动期间未投资人数--%>
<input type="hidden" id="notInvestTotal" value="${notInvestTotal}">
<%--累计收益--%>
<input type="hidden" id="money" value="${money}">
<%--邀请码--%>
<input type="hidden" id="invitationCode" value="${invitationCode}">
<input type="hidden" id="userId" value="${userId}">
<input type="hidden" id="startTime" value="${startTime}">
<input type="hidden" id="endTime" value="${endTime}">
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/fastclick.js"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script src="<%=request.getContextPath()%>/resources/js/activity/invitation/appInvitationActivity.js${verCode}"></script>
<script>
    var fDesTitleArr=[
        '送您999元，快快领取',
        '有情有利，共赚收益',
        '好友送来你的专属福利',
    ];
    var fDesArr=[
        '中再融稳健运行2年，20万用户的选择，安心可信赖！',
        '论理财靠谱，中再融国资平台可信赖。新用户专享12%年化收益 →',
        '您的好友送来了专属邀请！999元+12%年化收益，点击开启>>',
    ];
    function changeForApp(){
        $(".invitation").off("click",'.noLoginGo').on("click",'.noLoginGo',function(){
            anniversary.userLogin();
        });
        $(".loginCheck,.bottom.noLoginBottom").on("click",function(){
            anniversary.userLogin();
        });
        $(".bottom.loginBottom").off().on("click",function(){
            var desIndex=parseInt(3*Math.random());
            var userId = $("#userId").val();
            var devUrl = 'http://m.duanhan.ren/invitation/toInvitationUser.do?userId='+userId;
            var prdUrl = 'https://m.zhongzairong.cn/invitation/toInvitationUser.do?userId='+userId;
            var devIcon = 'http://m.duanhan.ren/resources/image/activity/invitation/wxShare.png';
            var prdIcon = 'https://m.zhongzairong.cn/resources/image/activity/invitation/wxShare.png';
            var shareInfo = JSON.stringify({
                "title": fDesTitleArr[desIndex],
                "desc": fDesArr[desIndex],
                "shareUrl": prdUrl,
                "shareIco": prdIcon,
                "inviteCode":$("#invitationCode").val(),
                "platAry": ["WechatSession", "WechatTimeLine", "QQ"]
            });
            var shareInfo2 = JSON.stringify({
                "title": fDesTitleArr[desIndex],
                "desc": fDesArr[desIndex],
                "shareUrl": prdUrl,
                "shareIco": prdIcon,
                "inviteCode":$("#invitationCode").val(),
                "platAry": ["WechatSession", "WechatTimeLine", "QQ", "QRCode", "inviteCode"]
            });
            if(typeof anniversary.htmlShare != 'undefined' && anniversary.htmlShare instanceof Function) {
                anniversary.htmlShare(shareInfo);
            }

            if(typeof anniversary.htmlShareToPlats != 'undefined' && anniversary.htmlShareToPlats instanceof Function) {
                anniversary.htmlShareToPlats(shareInfo2);
            }
        })
    }
    //   app去登陆
    function userLogin(){
        anniversary.userLogin();
    }
    //app获取app还是wap
    function getadd(flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
</script>
</body>
</html>