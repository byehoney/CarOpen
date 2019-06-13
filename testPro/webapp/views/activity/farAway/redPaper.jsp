<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="author" content="m.zhongzairong.cn">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <title>红包iPhone 8一起飞</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/farAway/redPaper.css${verCode}">
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
<img class="flyer" src="<%=request.getContextPath()%>/resources/image/activity/farAway/plane.png">
<section class="main">
    <div class="partOne">
            <img src="<%=request.getContextPath()%>/resources/image/activity/farAway/tittle-banner.png" alt="" class="banner">
        <div class="redBox">
            <c:if test="${userId == '' || userId == null }">
                <img src="<%=request.getContextPath()%>/resources/image/activity/farAway/red_default.png" alt="" class="redBag">
            </c:if>
            <c:if test="${redPackageMap.redPackageNumber==0 && userId != '' && userId != null }">
                <img src="<%=request.getContextPath()%>/resources/image/activity/farAway/red_default.png" alt="" class="redBag">
            </c:if>
            <c:if test="${redPackageMap.redPackageNumber!=0 && userId != '' && userId != null && unusedRedPackageNumber!=0}">
                <div class="actRedPack"></div>
                <img src="<%=request.getContextPath()%>/resources/image/activity/farAway/red_${unusedRedPackageNumber}.png" alt="" class="redBag">
            </c:if>
            <c:if test="${redPackageMap.redPackageNumber!=0 && userId != '' && userId != null && unusedRedPackageNumber==0}">
                <div class="actRedPack"></div>
                <img src="<%=request.getContextPath()%>/resources/image/activity/farAway/red_default.png" alt="" class="redBag">
            </c:if>
            <div class="tipWord">
                <c:if test="${userId == '' || userId == null }">
                    <p style="line-height: .62rem;text-decoration: underline" class="nlogin">查看我的红包</p>
                </c:if>
                <%--无可激活红包--%>
                <c:if test="${userId != '' && userId != null }">
                    <%--无领取机会--%>
                    <c:if test="${unusedRedPackageNumber == 0}">
                        <c:if test="${redPackageMap.redPackageNumber>=10 || redPackageMap.redPackageMoney>=5000 }">
                            <p>您今日领取的红包已全部激活，</p>
                            <p>目前累计激活<span class="blodSpan"><fmt:formatNumber type="currency" value="${useRedPackage}" pattern="#,##0.00" maxFractionDigits="0" />元</span>红包</p>
                        </c:if>
                        <c:if test="${redPackageMap.redPackageNumber<10 && redPackageMap.redPackageMoney<5000 }">
                            <p>您已累计激活<span class="blodSpan"><fmt:formatNumber type="currency" value="${useRedPackage}" pattern="#,##0.00" maxFractionDigits="0" />元</span>红包</p>
                            <p>现在"领红包"即可多领多赚哦</p>
                        </c:if>
                    </c:if>
                    <%--有领取机会--%>
                    <c:if test="${unusedRedPackageNumber !=0}">
                        <p>您已累计激活<span class="blodSpan"><fmt:formatNumber type="currency" value="${useRedPackage}" pattern="#,##0.00" maxFractionDigits="0" />元</span>红包</p>
                        <p>今日还有<span class="blodSpan"><fmt:formatNumber type="currency" value="${unusedRedPackage}" pattern="#,##0.00" maxFractionDigits="0" />元</span>红包未激活</p>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
    <div class="Calculator">
        <div class="CalculatorDiv">
            <div class="field">
                <span class="cursor blink"></span>
                <input class="number" type="text" placeholder="输入10的倍数，上限1000元" readonly="ture" unselectable="on" onfocus="this.blur()">
                <p><i></i>投资 200000元 激活红包</p>
            </div>
            <div class="calculate-cont">
                <div class="counter fl clearfix">
                    <ul class="listUl">
                        <li class="clearfix">
                            <span data-i="1"></span>
                            <span data-i="2"></span>
                            <span data-i="3"></span>
                            <span data-i="4"></span>
                            <span data-i="5"></span>
                            <span data-i="6"></span>
                        </li>
                        <li class="clearfix">
                            <span class="mt8" data-i="7"></span>
                            <span class="mt8" data-i="8"></span>
                            <span class="mt8" data-i="9"></span>
                            <span class="mt8" data-i="0"></span>
                            <span class="count-btn mt8" data-i="del"></span>
                            <span class="count-btn mt8" data-i="reset"></span>
                        </li>
                    </ul>
                </div>
                <c:if test="${userId == '' || userId == null }">
                    <div class="receive fl"></div>
                </c:if>
                <c:if test="${userId != '' && userId != null }">
                    <div class="getRedPackage fl"></div>
                </c:if>
            </div>
        </div>
        <c:if test="${not empty userAndRedPackageList}">
            <div class="notice clearfix">
                <i class="horn_ioc fl"></i>
                <div id = "noticeBox" class="notice_title">
                    <ul>
                        <c:forEach items="${userAndRedPackageList}" var="list">
                            <li>
                                <a class="moreleft fl" href="javascript:;" target="_blank">${list.strmobile}</a>
                                <span class="moreright fl" href="javascript:;" target="_blank">成功激活<fmt:formatNumber type="currency" value="${list.packageMoney}" pattern="#,#00"/>元红包</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </c:if>
    </div>
    <div class="partTwo">
        <div class="activeTitle"></div>
        <div class="activeGift">
            <div class="giftOne clearfix">
                    <img src="<%=request.getContextPath()%>/resources/image/activity/farAway/iphone8.png" alt="" class="fl phoneImg">
                <div class="fl modleDiv">
                    <p class="titleP"><em>iPhone 8</em><span>64G</span>¥5888</p>
                    <div class="phoneBg">
                        <p class="pt6">排名前100名</p>
                        <p>且累计投资≥50万</p>
                    </div>
                </div>
            </div>
            <div class="giftTwo clearfix">
                <img src="<%=request.getContextPath()%>/resources/image/activity/farAway/xiaomi.png" alt="" class="fl phoneImg">
                <div class="fl modleDivTwo">
                    <p class="titleP titleOther"><em>小米 6</em>¥2499</p>
                    <div class="phoneBg">
                        <p class="pt6">排名前130名</p>
                        <p>且累计投资≥30万</p>
                    </div>
                </div>
            </div>
            <div class="giftThree clearfix">
                <img src="<%=request.getContextPath()%>/resources/image/activity/farAway/huawei.png" alt="" class="fl phoneImg">
                <div class="fl modleDivThree">
                    <p class="titleP"><em>华为畅享 7</em>¥1499</p>
                    <div class="phoneBg">
                        <p class="pt6">排名前160名</p>
                        <p>且累计投资≥20万</p>
                    </div>
                </div>
            </div>
            <div class="giftFour">
                <img src="<%=request.getContextPath()%>/resources/image/activity/farAway/hongmi.png" alt="" class="fl phoneImg">
                <div class="fl modleDivOther">
                    <p class="titleP"><em>红米 4X</em>¥699</p>
                    <div class="phoneBg">
                        <p class="pt6">排名前200名</p>
                        <p>且累计投资≥10万</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class=partThree>
        <c:if test="${userId != '' && userId != null }">
            <p class="ranking">
                <c:if test="${ranking !=0}">
                    <span class="rankingSpan">您的排名是<em>第${ranking}名</em></span>
                    <span class="moreSpan">查看更多排名</span>
                </c:if>
                <c:if test="${ranking ==0}">
                    <span class="rankingSpan">您暂未获得奖品</span>
                    <span class="moreSpan">查看更多排名</span>
                </c:if>
            </p>
            <div class="giftCont">
                <p class="gift"></p>
                <p class="moreMoney"></p>
            </div>
        </c:if>
        <div class="bottomBox">
            <c:if test="${userId != '' && userId != null }">
                <button class="btn goInvest">
                    <c:if test="${ranking == 0 }">
                        去拿奖
                    </c:if>
                    <c:if test="${ranking != 0 }">
                        去投资
                    </c:if>
                </button>
            </c:if>
            <c:if test="${userId == '' || userId == null }">
                <button class="btn moreBtn checkRank">查看我的排名</button>
            </c:if>
            <div class="tips">
                <p>排行榜数据每半小时更新一次</p>
                <p>排行榜结果以活动结束的最终榜单为准</p>
            </div>
        </div>
    </div>
    <div class="activeDetial"></div>
    <!--遮罩层-->
    <div class="overlay" style="display:none;"></div>
    <!--活动详情弹出-->
    <div class="ruleBox" style="display:none;">
        <i class="close-btn"></i>
        <h3></h3>
        <div class="contentDiv">
            <%--<p>1. 活动时间：2017年9月29日—2017年10月17日</p>--%>
            <%--<p>2. 红包每日领取上限10次，当日红包累计领取的金额不超过5000元，领取当天有效</p>--%>
            <%--<p>3. 红包为实时发放，可到【我的账户-红包】查看</p>--%>
            <%--<p>4. 投资新手项目不参与本次活动奖励</p>--%>
            <%--<p>5. 实物奖品均可按市场价8折兑换成现金</p>--%>
            <%--<p>6. 最终累计投资额排名前200的用户，客服将在活动结束后5个工作日内联系您确认收货地址，并在10个工作日内为您寄出奖品</p>--%>
            <%--<p>7. 若出现满足多种实物获奖条件时，以获得价值最高的实物奖品为最终发放标准</p>--%>
            <%--<p>8. 活动期间累计金额相等时，优先达到该金额的用户排名在前</p>--%>
            <%--<p>9. 本次活动与苹果公司无关，活动最终解释权归中再融所有。如有疑问，请致电客服专线：4001-156-157</p>--%>
                <p><span class="numBox">1.</span><span class="wordBox">活动时间：2017年9月29日—2017年10月27日</span></p>
                <p><span class="numBox">2.</span><span class="wordBox">红包每日领取上限10次，当日红包累计领取的金额不超过5000元，领取当天有效</span></p>
                <p><span class="numBox">3.</span><span class="wordBox">红包为实时发放，可到【我的账户-红包】查看</span></p>
                <p><span class="numBox">4.</span><span class="wordBox">投资新手项目不参与本次活动奖励</span></p>
                <p><span class="numBox">5.</span><span class="wordBox">实物奖品（ iPhone 8 64G、小米 6 64G 、华为畅享 7 32G 、红米 4X 16G ）均可按市场价8折兑换成现金，市场价请参照活动页</span></p>
                <p><span class="numBox">6.</span><span class="wordBox">最终累计投资额排名前200的用户，客服将在活动结束后5个工作日内联系您确认收货地址，并在10个工作日内为您寄出奖品</span></p>
                <p><span class="numBox">7.</span><span class="wordBox">若出现满足多种实物获奖条件时，以获得价值最高的实物奖品为最终发放标准</span></p>
                <p><span class="numBox">8.</span><span class="wordBox">活动期间累计金额相等时，优先达到该金额的用户排名在前</span></p>
                <p><span class="numBox">9.</span><span class="wordBox">本次活动与苹果公司无关，活动最终解释权归中再融所有。如有疑问，请致电客服专线：4001-156-157</span></p>

        </div>

    </div>
    <!--红包弹出-->
    <div class="activation" style="display: none">
        <i class="close_red_btn"></i>
        <div class="monery"><span>100</span>元</div>
        <div class="success">
            <p class="successP">成功领取<span>XXX元</span>红包</p>
            <p>使用APP投资</p>
            <p class="extraP">可额外获得<span>XX元</span>现金奖励</p>
        </div>
        <div class="activatePackets"></div>

    </div>
    <!--今日没有机会弹出-->
    <div class="noChance" style="display: none;">
        <i class="close-btn btn_position"></i>
        <img src="<%=request.getContextPath()%>/resources/image/activity/farAway/noChance.png" alt="">
        <p>今日没有机会了，请明日再来！</p>
    </div>
    <%--输入错误金额是的toast--%>
    <div class="err01">请输入10的倍数，上限1000元</div>
    <div class="err02">每日领取红包累计金额不能超过5000元哦~</div>
    <div class="err03"></div>
</section>
<input type="hidden" value="${userId}" id="userId">
<input type="hidden" value="${unusedRedPackageNumber}" id="unusedRedPackageNumber">
<input type="hidden" value="${redPackageMap.redPackageNumber}" id="todayNum">
<input type="hidden" value="${redPackageMap.redPackageMoney}" id="todayMoney">
<input type="hidden" value="${ranking}" id="ranking">
<input type="hidden" value="${investorList}" id="list">
<input type="hidden" value="${userInvestAmount}" id="userInvestAmount">
<input type="hidden" id="refreshed" value="no">
<input type="hidden" id="currentTime" value="${currentTime}">
</body>
<script src="<%=request.getContextPath()%>/resources/js/activity/farAway/fastclick.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/farAway/redPaper.js" type="text/javascript"></script>
<script>
    var uId=$("#userId").val();
    var canGo=true;
    $(function () {
        var scrollSpace = 2500;//滚动间隙
        setInterval(function(){
            if($('#noticeBox ul li').size()>1){
                noticeScrollUp($('#noticeBox'));
            }
        }, scrollSpace );
    });
    // app 端调用改变页面点击事件或样式
    function changeForApp(){
        $('.tipWord .nlogin').unbind().on('click',function(){
            anniversary.userLogin();
        });//未登录点击查看我的红包
        $(".receive").unbind().click(function(){
            if(!uId){
                userLogin()
            }
        });
        $(".goInvest,.activatePackets,.actRedPack").unbind().click(function(){
            isCanInvest();
            if(canGo){
                jumpInvest();
            }
        });
        $(".checkRank").unbind().click(userLogin);
    }
    function noticeScrollUp(obj){
        var liHeight = .55;//每个li的高度
        var scrollSpeed = 500;//滚动速度
        var $noticeContext = obj.find("ul:first");
        $noticeContext.animate({ "margin-top" : -liHeight +"rem" },scrollSpeed , function(){
            $noticeContext.css({"margin-top":"0px"}).find("li:first").appendTo($noticeContext);
        });
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
    function isCanInvest(){
        var now_time=$("#currentTime").val();
        var start_time="2017-09-29 00:00:00";
        var end_time = "2017-10-27 23:59:59";
        var end_timed = Date.parse(new Date(end_time.replace(/-/g,"/")));      //活动结束时间
        var start_timed = Date.parse(new Date(start_time.replace(/-/g,"/")));  //活动开始时间
        end_timed = end_timed;
        start_timed=start_timed;
        if(now_time>end_timed){//未在活动时间范围
            $(".err03").show().html('活动已结束').css({top:'30%',position:'fixed'});
            setTimeout(function(){
                $(".err03").hide();
            },2000);
            canGo=false;
        }else if(now_time<start_timed){
            $(".err03").show().html('活动未开始').css({top:'30%',position:'fixed'});
            setTimeout(function(){
                $(".err03").hide();
            },2000);
            canGo=false;
        }else{
            canGo=true;
        }
    }
</script>
</html>