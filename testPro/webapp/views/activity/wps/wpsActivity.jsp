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
    <title>WPS用户专享  京东卡免费拿</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/swiper.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/wps/wps.css${verCode}"/>
    <script>
        var basePath = "<%=request.getContextPath()%>";
    </script>
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
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
<div class="Wps_page">
    <div class="banner">
        <img src="<%=request.getContextPath()%>/resources/image/activity/wps/banner_01.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/wps/banner_02.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/wps/banner_03.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/wps/banner_04.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/wps/banner_05.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/wps/banner_06.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/wps/banner_07.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/wps/banner_08.png">
        <p class="activeDay">活动时间：<span class="act_date">5月19日-5月20日</span></p>
    </div>
    <div class="container">
        <div class="distance">
            <div class="chunk_bg">
                <div class="welfare">
                    <div class="welfare_one">福利一：投新手项目送好礼</div>
                    <div class="first_shot">
                        <p>首次投资<span>5000元</span></p>
                        <p>送<span>30元</span>京东卡一张（≈2个月WPS会员）</p>
                        <p class="mt">首次投资<span>1万元</span></p>
                        <p>送<span>60元</span>京东卡一张（≈6个月WPS会员）</p>
                    </div>
                </div>
                <div class="status">
                    <div class="items new_items" style="display: none">
                        <p class="recommend">推荐项目</p>
                        <div class="novice_project_left new_project">
                            <div class="clearfix page_title">
                                <i class="novice_ioc">新手项目</i>
                            </div>
                            <div class="novice_project clearfix">
                                <div class="fl percentage_left">
                                    <div class="percentage">
                                        12%
                                    </div>
                                    <p>年化收益率</p>
                                </div>
                                <div class="fl date">
                                    <div>
                                        <em>29</em>天
                                    </div>
                                    <p>项目期限</p>
                                </div>
                            </div>
                            <div class="Involved-btn new">
                                <a>立即加入</a>
                            </div>
                        </div>
                    </div>
                    <div class="no_project no_new_project" style="display: none">
                        <img class="img_distance" src="<%=request.getContextPath()%>/resources/image/activity/wps/no_project.png" alt="">
                        <p>暂无可投新手项目，请稍后再来！</p>
                    </div>
                    <div class="Close_Time" style="display: none">
                        <img class="img_distance" src="<%=request.getContextPath()%>/resources/image/activity/wps/closed_icon.png" alt="">
                        <p>今日已打烊，请等待明天0点开始！</p>
                        <p>每日交易时间：00:00-23:00</p>
                    </div>
                    <div class="activity" style="display:none;">
                        <div class="no_started no-start" style="display: none">活动未开始</div>
                        <div class="no_started finish" style="display: none">活动已结束</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="distance">
            <div class="welfare welfare_distance">
                <div class="welfare_one">福利二：不限量京东卡免费拿</div>
                <div class="deadline">投资期限≥80天，可得京东卡</div>
                <div class="first_shot">
                    <p>单笔投资<span>1万元</span>，送<span>80元</span>京东卡一张</p>
                    <p>单笔投资<span>2万元</span>，送<span>180元</span>京东卡一张</p>
                    <p>单笔投资<span>5万元</span>，送<span>500元</span>京东卡一张</p>
                </div>
            </div>
            <div class="status">
                <div class="items common_items" style="display: none">
                    <p class="recommend">推荐项目</p>
                    <div class="lump">
                        <div class="swiper-container swiperOne">
                            <div class="swiper-wrapper">

                            </div>
                        </div>
                    </div>
                    <div class="more">查看更多项目></div>
                </div>
                <div class="no_project no_common_project" style="display: none" >
                    <img class="img_distance" src="<%=request.getContextPath()%>/resources/image/activity/wps/no_project.png" alt="">
                    <p>暂无可投项目，请稍后再来！</p>
                </div>
                <div class="Close_Time" style="display: none">
                    <img class="img_distance" src="<%=request.getContextPath()%>/resources/image/activity/wps/closed_icon.png" alt="">
                    <p>今日已打烊，请等待明天0点开始！</p>
                    <p>每日交易时间：00:00-23:00</p>
                </div>
                <div class="activity" style="display: none">
                    <div class="no_started no-start" style="display: none">活动未开始</div>
                    <div class="no_started finish" style="display: none">活动已结束</div>
                </div>
            </div>
        </div>
        <div class="acquisition">已获得京东卡：<span>${JDCardAmount}元</span></div>
        <div class="distance">
            <div class="chunk_bg rule_bg">
                <div class="rule_icon">活动规则</div>
                <div class="rule_cont">
                    <ol>
                        <li>活动时间:<span class="act_year">2018</span>年<span class="act_date">5月19日-5月20日</span></li>
                        <li>京东卡为电子卡，活动结束后5个工作日内以短信形式发放</li>
                        <li>本活动最终解释权归中再融所有，如有疑问可拨打客服热线：4001-156-157</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <img class="bottom_pic" src="<%=request.getContextPath()%>/resources/image/activity/wps/bottom_pic.png" alt="">
</div>

<input type="hidden" id="flag" value="${flag}">
<input type="hidden" id="loginStatus" value="${loginStatus}">
<input type="hidden" id="nowTimestamp" value="${nowTimestamp}">
<input type="hidden" id="startTimestamp" value="${startTimestamp}">
<input type="hidden" id="endTimestamp" value="${endTimestamp}">
<input type="hidden" id="sourceStatus" value="${sourceStatus}">
<input type="hidden" id="JDCardAmount" value="${JDCardAmount}">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/newYear/fastclick.js"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script src="<%=request.getContextPath()%>/resources/js/common/swiper.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/wps/wps.js${verCode}"></script>
<script>
    // app 端调用改变页面点击事件或样式
    function changeForApp(){
        var flag = $("#flag").val();
        var loginStatus = $("#loginStatus").val();
        if(flag=='mobile'&&loginStatus==0){
            userLogin();
        }
        $(".status").off("click",'.Involved-btn').on("click",'.Involved-btn',function(){
            var pid = $(this).attr('pid');
            jumpInvestDetail(pid);
        });
        $(".status").off("click",'.more').on("click",'.more',function(){
            anniversary.jumpInvest();
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
    // 跳转到投资详情
    function jumpInvestDetail(pid){
        anniversary.jumpInvestDetail(pid);
    }
</script>
</body>
</html>