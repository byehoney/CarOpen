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
    <title>激情世界杯</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/worldCup/wapWorldCup.css${verCode}"/>
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
<div class="rotate_page">
    <div class="banner">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/banner_01.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/banner_02.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/banner_03.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/banner_04.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/banner_05.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/banner_06.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/banner_07.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/banner_08.png" alt="">
    </div>
    <div class="money_bg">
        <div class="logoin">
            <p class="prize_chance">每日登录可获得<span> 3 </span>次点球机会，<span>100%</span>中奖。</p>
            <p class="downApp">下载中再融APP即可参与</p>
        </div>
    </div>
    <div class="gameBox">
        <!--球门部分-->
        <div class="ball_net">
            <div class="gifts gift_01"></div>
            <div class="gifts gift_02"></div>
            <div class="gifts gift_03"></div>
            <div class="gifts gift_04"></div>
            <div class="gifts gift_05"></div>
            <div class="gifts gift_06"></div>
            <div class="gifts gift_07"></div>
            <div class="gifts gift_08"></div>
        </div>
    </div>
    <!--冲榜拿豪礼-->
    <div class="award_module">
        <div class="gift_pic">
            <div class="logoin">
                <p class="prize_chance">活动期间收益满足要求即可冲榜得豪礼</p>
                <p class="downApp">下载中再融APP即可参与</p>
            </div>
            <div class="share">
                <p>特斯拉使用权 1年</p>
                <p><span>第1名</span>且累计收益≥150000元</p>
            </div>
        </div>
        <div class="gift_list">
            <div class="gift_top clearfix">
                <div class="gift_top_pic fl">
                    <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/Russia.png" alt="">
                    <p>俄罗斯豪华8日游</p>
                    <p><span>第2-3名</span>且累计收益</br>≥40000元</p>
                </div>
                <div class="gift_top_pic gift_top_right fr">
                    <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/projector.png" alt="">
                    <p>极米H1S 家用投影仪</p>
                    <p><span>第4-6名</span>且累计收益</br>≥25000元</p>
                </div>
            </div>
            <div class="details">
                <div class="rank_list mt clearfix">
                    <img class="hair_dryer" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/hair_dryer.png" alt="">
                    <div>
                        <p>戴森吹风机HD01</p>
                        <p><span>第7-30名</span>且累计收益≥10000元</p>
                    </div>
                </div>
                <div class="rank_list mt clearfix">
                    <img class="hw_ipad" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/hw_ipad.png" alt="">
                    <div>
                        <p>华为荣耀防水影音平板</p>
                        <p><span>第31-50名</span>且累计收益≥5000元</p>
                    </div>
                </div>
                <div class="rank_list mt clearfix">
                    <img class="Sony_headset" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/Sony_headset.png" alt="">
                    <div>
                        <p>索尼WF-1000X 蓝牙耳机</p>
                        <p><span>第51-100名</span>且累计收益≥3000元</p>
                    </div>
                </div>
                <div class="rank_list mt clearfix">
                    <img class="thermantidote" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/thermantidote.png" alt="">
                    <div>
                        <p>美的冷风扇</p>
                        <p><span>第101-150名</span>且累计收益≥1500元</p>
                    </div>
                </div>
                <div class="rank_list mt clearfix">
                    <img class="pot" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/pot.png" alt="">
                    <div>
                        <p>美的养生壶 1.5L容量</p>
                        <p><span>第151-200名</span>且累计收益≥500元</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="gift_bg">
            <div class="rank_list clearfix">
                <img class="gift_bag" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/gift_bag.png" alt="">
                <div>
                    <p>世界杯定制礼包</p>
                    <p>累计投资额<span>≥10000元</span>（每人限1份）</p>
                </div>
            </div>
        </div>
    </div>
    <!--邀请好友的现金-->
    <div class="earnings_cont">
        <img class="base_person" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/base_person.png" alt="">
        <div class="earnings_title">邀友得现金</div>
        <div class="piece piece_bg">
            <div class="rank_cont clearfix">
                <div class="earnings_left fl">
                    活动期间，邀请好友<span>注册并投资中再融</span>，邀请人可获得被邀请人投资金额一定比例的
                    <span>现金红包</span>（请通过中再融APP进行邀请）。
                </div>
            </div>
            <div class="rank_cont clearfix">
                <div class="earnings_left fl">
                    <span>* 以90天5万为例</span>
                </div>
            </div>
            <img class="chart" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/wapWorldCup/chart.png" alt="">
        </div>
    </div>
    <div class="bottom_pic"></div>
</div>
<div class="overlay"></div>
<!--活动规则弹窗-->
<div class="rule_popup">
    <div class="close_btn"></div>
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
                    <p>
                        ②实物奖品及折现奖励结束后20个工作日内发放；
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
</div>
<div class="rule_pic"></div>
<div class="site_pic loadbtn"></div>
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script>
    $(function(){
        $('.rule_pic').click(function(){
            $('.rule_popup').show();
            $('.overlay').show();
        });
        $('.close_btn').click(function(){
            $('.rule_popup').hide();
            $('.overlay').hide();
        });
        $(".overlay,.rule_popup").on('touchmove',function(e){
            e.preventDefault();
        });

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

            if(browser.versions.ios){
                $(".loadbtn").click(function(){
                    window.location.href="https://itunes.apple.com/us/app/zhong-zai-rong/id1116889321?l=zh&ls=1&mt=8";
                })
            }
            if(browser.versions.android){
                $(".loadbtn").click(function(){
                    window.location.href="http://a.app.qq.com/o/simple.jsp?pkgname=com.zzr";
                })
            }

        });
    })
</script>
</body>
</html>

