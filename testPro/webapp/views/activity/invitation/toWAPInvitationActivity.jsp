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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/invitation/wapInvitationActivity.css${verCode}"/>
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
    <c:if test="${codeCampaign==0}">
        <div >
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
                        <img class="invitation_pic" src="<%=request.getContextPath()%>/resources/image/activity/invitation/invitation_pic_wap.png" alt="">
                        <div class="examine_code">
                            <img src="<%=request.getContextPath()%>/invitation/createScan.do?flag=wap" alt="">
                            <c:if test="${codeLogin==1}">
                                <div class="wechat">
                                    <div class="logoin">
                                        <a href="javascript:;">登录查看</a><br>邀请二维码
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <p>扫描二维码跟好友一起赚钱</p>
                    </div>
                    <div class="rule">活动规则></div>
                </div>
            </div>
        </div>
        <p class="copyright">本次活动最终解释权归中再融所有<br>若发现采取非正当手段获取奖励，中再融有权取消其获奖资格。</p>
    </c:if>
    <c:if test="${codeCampaign!=0}">
        <div>
            <div class="banner">
                <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_two_01.png">
                <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_two_02.png">
                <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_two_03.png">
                <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_two_04.png">
                <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_two_05.png">
                <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_two_06.png">
                <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_two_07.png">
                <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/banner_two_08.png">
            </div>
            <div class="container">
                <div class="invitation">
                    <img class="exclusive" src="<%=request.getContextPath()%>/resources/image/activity/invitation/exclusive.png" alt="">
                    <div class="chunk_bg_two friends_earnings exclusive_cont">
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
                    <img class="invitation_pic" src="<%=request.getContextPath()%>/resources/image/activity/invitation/invitation_pic_wap.png" alt="">
                    <div class="examine_code">
                        <img src="<%=request.getContextPath()%>/invitation/createScan.do?flag=wap" alt="">
                        <c:if test="${codeLogin==1}">
                            <div class="wechat">
                                <div class="logoin">
                                    <a href="javascript:;">登录查看</a><br>邀请二维码
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <p>扫描二维码跟好友一起赚钱</p>
                </div>
            </div>

        </div>
    </c:if>
</div>
<div class="bottom  goingBottom">下载APP邀请好友发现更多惊喜</div>
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
<script>
    var browser={
        versions:function(){
            var u = navigator.userAgent, app = navigator.appVersion;
            return {
                trident: u.indexOf('Trident') > -1, //IE内核
                presto: u.indexOf('Presto') > -1, //opera内核
                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1,//火狐内核
                mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                android: u.indexOf('Android') > -1 || u.indexOf('Adr') > -1, //android终端
                iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器
                iPad: u.indexOf('iPad') > -1, //是否iPad
                webApp: u.indexOf('Safari') == -1, //是否web应该程序，没有头部与底部
                weixin: u.indexOf('MicroMessenger') > -1, //是否微信 （2015-01-22新增）
                qq: u.match(/\sQQ/i) == " qq" //是否QQ
            };
        }(),
        language:(navigator.browserLanguage || navigator.language).toLowerCase()
    };
    $(function(){
        var startTime = $("#startTime").val().replace('年','.').replace('月','.').replace('日','');
        var endTime =$("#endTime").val().replace('年','.').replace('月','.').replace('日','');
        var startY = startTime.split('.')[0];
        var startM = parseInt(startTime.split('.')[1]);
        var startD = parseInt(startTime.split('.')[2]);
        var endY = endTime.split('.')[0];
        var endM = parseInt(endTime.split('.')[1]);
        var endD = parseInt(endTime.split('.')[2]);
        $(".activeDay").html(startY+'.'+startM+'.'+startD+'-'+endY+'.'+endM+'.'+endD);
        $(".wechat .logoin").on("click",function(){
            var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
            window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
        });
        $(".rule").on("click",function(){
            window.location.href=basePath+'/invitation/toInvitationRule.do';
        });

        if(browser.versions.weixin){
            $(".bottom").click(function(){
                alert("请在浏览器打开")
            })
        }
        if(browser.versions.ios){
            $(".bottom").click(function(){
                window.location.href="https://itunes.apple.com/us/app/zhong-zai-rong/id1116889321?l=zh&ls=1&mt=8";
            })
        }


        if(browser.versions.android){
            $(".bottom").click(function(){
                window.location.href="http://a.app.qq.com/o/simple.jsp?pkgname=com.zzr";
            })
        }
    })
</script>
</body>
</html>
