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
    <title>双旦嘉年华，瓜分1000万现金</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/doubleDan/public.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/doubleDan/swiper-3.4.2.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/doubleDan/animate.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/doubleDan/egg_pair.css${verCode}"/>
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
    <div class="egg_pair_page">
        <%--<div class="egg_pair_t"></div>--%>
            <img class="egg_pair_t" src="<%=request.getContextPath()%>/resources/image/activity/doubleDan/egg_pair_t.png"  width="100%" alt=""/>
            <div class="egg_pair_c">
            <div class="egg_pair_count">
                <!--左右滚动部分-->
                <div class="notice clearfix">
                    <div id="noticeBox" class="notice_title">
                        <ul style="margin-top: 0rem;margin-left: 0rem">
                            <c:if test="${loginStatus==0 || todayTurnover<2000000 || individualTurnover==0 || todayWardTurnover==0 }">
                                <li>
                                    <p><marquee scrollamount="3.5" direction="left">若今日交易额超过200万，今日投资可额外获得年化1%返现</marquee></p>
                                </li>
                            </c:if>
                            <c:if test="${loginStatus==1 && todayTurnover>=2000000 && individualTurnover!=0 && todayWardTurnover!=0 }">
                                <li>
                                    <p><marquee scrollamount="3.5" direction="left">今日交易额：<fmt:formatNumber type="currency" value="${todayTurnover}" pattern="#,##0.00" maxFractionDigits="0" />元;&nbsp;&nbsp;|&nbsp;&nbsp;获得奖励：<fmt:formatNumber type="currency" value="${todayWardTurnover}" pattern="#,##0.00" maxFractionDigits="2" />元</marquee></p>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <p class="money"><fmt:formatNumber type="currency" value="${cumulativeTurnover}" pattern="#,##0.00" maxFractionDigits="0" /></p>
                <p>累计交易额 (<i style="font-size: .22rem">元</i>)</p>
                <div class="arrow_btn"></div>
                <!--马路部分-->
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide zero"><div class="go"></div></div>
                        <div class="swiper-slide first"><div class="road"></div><div class="radio">1</div></div>
                        <div class="swiper-slide second"><div class="road"></div><div class="radio">2</div></div>
                        <div class="swiper-slide third"><div class="road"></div><div class="radio">3</div></div>
                        <div class="swiper-slide last"><div class="road"></div><div class="matters"></div></div>
                    </div>
                </div>

            </div>


        </div>
        <div class="egg_pair_b">
            <!--加息券-->
            <div class="rate_coupon">
                <div class="usage_btn">
                    <img  src="<%=request.getContextPath()%>/resources/image/activity/doubleDan/employ_btn.png" alt="">
                </div>
                <div class="immediate_pic0"></div>
                <div class="immediate_pic1"></div>
                <div class="immediate_pic2"></div>
                <div class="immediate_pic3"></div>
            </div>
            <%--瓜分金额--%>
            <div class="carve_count">
                <div class="present_carve">
                    <p>¥ <span class="num">0</span></p>
                </div>
                <div class="about_carve">
                    <p>¥ <span class="num">0</span></p>
                </div>
            </div>
            <img src="<%=request.getContextPath()%>/resources/image/activity/doubleDan/Cartoon_car.png" class="Cartoon_car"/>
        </div>
        <div class="rewards_pic <c:if test='${loginStatus==1}'>loginFriendBtn</c:if> <c:if test='${loginStatus==0}'>noLoginFriendBtn</c:if> ">
            <img src="<%=request.getContextPath()%>/resources/image/activity/doubleDan/rewards.png" />
        </div>
        <div class="rule_btn">
            <a href="javascript:;"></a>
        </div>
    </div>

    <%--加息券弹窗--%>
    <div class="tic_pop_contaienr">
        <p class="ticTip">领取成功</p>
        <div class="ticketBox">
            <div class="ticketInfo">
                <p class="ticTitle">加息券</p>
                <div class="ticDetail">
                    <p class="rate"><em>10</em><i>%</i></p>
                    <p class="limit">仅限投资2万元使用</p>
                    <p>【 当日有效 】</p>
                </div>
            </div>
        </div>
        <div class="ticBtn">
            去投资
        </div>
        <div class="closeBtn"></div>
    </div>
</div>
<%--设置一个获取展示金额的隐藏项--%>
<div class="showMoney" style="display: none"></div>
<div class="overlay" style="display:none;"></div>
<!-- toast提示 -->
<div class="err"></div>
<!-- 登陆状态 -->
<input type="hidden" name="" value="${loginStatus}" id="loginStatus">
<%--userId--%>
<input type="hidden" name="" value="${userId}" id="userId">
<%--用户邀请码--%>
<input type="hidden" name="" value="${userInvitationCode}" id="userInvitationCode">
<%--服务器当前时间--%>
<input type="hidden" name="" value="${currentTime}" id="currentTime">
<%--活动开始时间--%>
<input type="hidden" name="" value="${campaignStartTime}" id="campaignStartTime">
<%--活动结束时间--%>
<input type="hidden" name="" value="${campaignEndTime}" id="campaignEndTime">
<%--活动状态--%>
<input type="hidden" name="" value="${campaignType}" id="campaignType">
<!-- 累计投资金额 -->
<input type="hidden" name="" value="${cumulativeTurnover}" id="totalMoney">
<!-- 今日交易额 -->
<input type="hidden" name="" value="${todayTurnover}" id="todayTurnover">
<!-- 获得奖励  活动期间累当日交易额超过200万且投资时 今日奖励金额 不包含新手交易额-->
<input type="hidden" name="" value="${todayWardTurnover}" id="todayWardTurnover">
<!-- 用户累计投资金额  活动期间个人累计投资金额 不包含新手项目-->
<input type="hidden" name="" value="${individualTurnover}" id="totoalUserMoney">
<%--flag--%>
<input type="hidden" name="" value="${flag}" id="flag">
<!-- 刷新页面 -->
<input type="hidden" id="refreshed" value="no">
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/doubleDan/fastclick.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/doubleDan/swiper-3.4.2.jquery.min.js${verCode}"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/doubleDan/act.js${verCode}"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script>
    $(function () {
//        $('#noticeBox').noticeScroll();
    });
    ~(function(){
        $.fn.extend({
            noticeScroll : function(){
                var $this = $("#noticeBox");
                var scrollTimer;
                var liLeft = 4.5;//每个li的高度
                var scrollSpace = 3000;//滚动间隙
                var scrollSpeed = 5000;//滚动速度
                scrollTimer = setInterval(function(){
                    noticeScrollUp($this);
                }, scrollSpace );
                function noticeScrollUp(obj){
                    var $noticeContext = obj.find("ul:first");
                    $noticeContext.animate({ "margin-left" : -(liLeft/2) +"rem" },scrollSpeed , function(){
                        $noticeContext.css({"margin-left":"-0rem"}).find("li:first").appendTo($noticeContext);
                    });
                }
            }
        });
    })();


</script>
<script>
    var isNoStart=false;
    var isEnd=false;
    var tipShow=false;//错误提示显示状态
    // app 端调用改变页面点击事件或样式
    function changeForApp(){
        // 未登录状态下点击邀请好友
        $(".rewards_pic.noLoginFriendBtn").off().on("click",function(){
            userLogin();
        });
        //未登陆状态领取加息券
        $(".egg_pair_b").off("click",'.noLoginMobileCoupon').on("click",'.noLoginMobileCoupon',function(e){
            userLogin();
        });
        //领取过的加息券点立即使用跳转到投资列表
        $(".egg_pair_b").off("click",'.loginMobileCoupon').on("click",'.loginMobileCoupon',function(){
            canInvest();
            if(isNoStart){
                carve.errTip($(".err"),'活动即将开始',2000);
                return;
            }else if(isEnd){
                carve.errTip($(".err"),'活动已结束',2000);
                return;
            }
            jumpInvest();
        });
        //领取加息券成功后点击去投资
        $(".tic_pop_contaienr").off("click",'.mobileTicBtn').on("click",'.mobileTicBtn',function(){
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
    // 跳转到投资详情
    function jumpInvestDetail(pid){
        anniversary.jumpInvestDetail(pid);
    }
    // 点击调用分享功能
    function shareMessage(title,des,shareUrl,iconUrl,platAry) {
        // 替换参数值 链接要完整
        //platAry 控制显示哪一种平台  WechatSession 微信 WechatTimeLine 朋友圈 QQ qq好友 Qzone qq空间 Sina 新浪
        var shareInfo = JSON.stringify({
            "title": title, "desc": des, "shareUrl": shareUrl,
            "shareIco": iconUrl,
            "platAry":platAry
        });

        anniversary.htmlShare(shareInfo);
    }
    //错误提示弹窗
    function errTip(obj,info,dur){
        obj.show().html(info);
        tipShow=true;
        setTimeout(function(){
            tipShow=false;
            obj.html("").hide();
        },dur)
    }
    //活动是否开始弹窗
    function canInvest(){
        var now_time=$("#currentTime").val();
        var start_time=$("#campaignStartTime").val();
        var end_time =$("#campaignEndTime").val();
        if(now_time>end_time){//未在活动时间范围
            isEnd=true;
        }else if(now_time<start_time){
            isNoStart=true;
        }else{
            isNoStart=false;
            isEnd=false;
        }
    }
</script>
</body>
</html>