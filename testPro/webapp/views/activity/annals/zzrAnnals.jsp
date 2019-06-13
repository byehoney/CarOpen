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
    <title>中再融2017年运营报告</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/present/swiper.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/annals/zzrAnnals.css${verCode}"/>
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
<div class="swiper-container swiperOne">
    <div class="swiper-wrapper">
        <div class="swiper-slide one">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="cont">
                <h3><span>中再融</span></h3>
                <p>2017年运营报告</p>
                <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/operation.png">
            </div>
        </div>
        <div class="swiper-slide two">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="content">
                <div class="contentHeader">
                    <h3 class="title">致用户</h3>
                    <img class="shareIcon" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/share.png">
                </div>
                <div class="contentDetails">
                    <div class="swiper-container textSwiper">
                        <div class="swiper-wrapper" style="height: auto">
                            <div class="swiper-slide">
                                <p>新年伊始，总结再出发。 </p>
                                <p>过去一年，相继出台的政策法规形成了网贷行业全面监管制度体系。中再融成立于“监管元年”，一直以“合规”为立身之本。2017年，中再融合规建设工作紧跟政策监管要求、持续推进，甚至在官网同步披露合规进程等走在行业前列。</p>
                                <p>自上线以来，2017年不论交易额或用户数都是中再融飞跃的一年。夺得“2017金融助力实体经济卓越贡献奖“等多项业内重量级大奖。加大再生资源产业业务比例，平台全年为再生资源中小微企业提供1000多次金融服务，涵盖900家企业及企业主，覆盖行业内6个细分品类。坚持风控落地战略，全国共建成7省份、10城市规模的风险控制网，以各省会为中心实施多点审核、多层审核标准，同时确保风险可控增加多个第三方反欺诈服务，务必做到小额分散、科学管控。这一切，是基于不断完善风控体系、营造安全理财环境才得以实现。</p>
                                <p>不忘初心，牢记使命。展望2018，中再融将坚持“普惠金融”的理念与绿色金融的发展方向不断加强企业实力，继续在绿色金融的康庄大道上前行！</p>
                                <div class="end">——中再融</div>
                            </div>
                        </div>
                        <div class="swiper-scrollbar"></div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <img class="copyRight" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/footerBg.png">
                <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/angel.png">
            </div>
        </div>
        <%--合规实录--%>
        <div class="swiper-slide three">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="content">
                <div class="contentHeader">
                    <h3 class="title">合规实录</h3>
                    <img class="shareIcon" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/share.png">
                </div>
                <div class="contentDetails ">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide axisList">
                                <h4>2016.12</h4>
                                <p>获取电信业务经营许可等相关资质</p>
                            </div>
                            <div class="swiper-slide axisList">
                                <h4>2017.1</h4>
                                <p>加强与征信机构的业务合作</p>
                            </div>
                            <div  class="swiper-slide axisList">
                                <h4>2017.2</h4>
                                <p>完善网络安全和信息安全，配备完善的网络安全设施和管理制度</p>
                            </div>
                            <div class="swiper-slide axisList">
                                <h4>2017.4</h4>
                                <p>选择银行业金融机构作为资金存管机构</p>
                            </div>
                            <div class="swiper-slide axisList">
                                <h4>2017.6</h4>
                                <p>同一自然人借款余额上限不超20万元，同一法人/组织借款余额不超100万元</p>
                            </div>
                            <div class="swiper-slide axisList">
                                <h4>2017.11</h4>
                                <p>以醒目方式提示网络借贷风险，并经出借人确认</p>
                            </div>
                            <div class="swiper-slide axisList">
                                <h4>预计2018.4</h4>
                                <p>金融监管部门备案登记</p>
                            </div>
                        </div>
                        <div class="swiper-scrollbar"></div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <img class="copyRight" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/footerBg.png">
                <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/angel.png">
            </div>
        </div>
        <%--平台总数据概况--%>
        <div class="swiper-slide four">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="content">
                <div class="contentHeader">
                    <h3 class="title">平台总数据概况</h3>
                    <img class="shareIcon" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/share.png">
                </div>
                <div class="contentDetails">
                    <p class="nTitle">截至2017.12.31</p>
                    <ul class="dataBox clearfix">
                        <li>
                            <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/totalDeal.png" alt="">
                            <p class="num">573,245,650<em class="fs22">元</em></p>
                            <p class="text">累计交易额</p>
                        </li>
                        <li>
                            <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/totalUser.png">
                            <p class="num">153,496<em class="fs22">人</em></p>
                            <p class="text">累计用户数</p>
                        </li>
                        <li>
                            <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/totalReward.png">
                            <p class="num">8,038,268.97<em class="fs22">元</em></p>
                            <p class="text">累计发放收益</p>
                        </li>
                        <li>
                            <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/totalNum.png">
                            <p class="num">68,889<em class="fs22">笔</em></p>
                            <p class="text">累计成交笔数</p>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="footer">
                <img class="copyRight" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/footerBg.png">
                <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/angel.png">
            </div>
        </div>
        <%--交易额对比--%>
        <div class="swiper-slide five">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="content">
                <div class="contentHeader">
                    <h3 class="title">平台交易额同期对比</h3>
                    <img class="shareIcon" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/share.png">
                </div>
                <div class="contentDetails">
                    <div class="sameDateChart">
                        <div class="addRate"></div>
                        <div class="addArrow">
                            <div class="arrowOpc"></div>
                        </div>
                        <div class="rect2016 rect">
                            <span>186,116,950<em class="fs22">元</em></span>
                        </div>
                        <div class="rect2017 rect">
                            <span>387,128,700<em class="fs22">元</em></span>
                        </div>
                        <div class="yearBar"></div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <img class="copyRight" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/footerBg.png">
                <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/angel.png">
            </div>
        </div>
        <%--收益数据--%>
        <div class="swiper-slide six">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="content">
                <div class="contentHeader">
                    <h3 class="title">收益数据</h3>
                    <img class="shareIcon" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/share.png">
                </div>
                <div class="contentDetails">
                    <ul class="dealData clearfix">
                        <li class="aveRate fl">
                            <div></div>
                            <p class="num">10.28<em class="fs22">%</em></p>
                            <p class="text">平均年化收益率</p>
                        </li>
                        <li class="aveTime fl">
                            <div></div>
                            <p class="num">4.38<em class="fs22">个月</em></p>
                            <p class="text">平均出借期限</p>
                        </li>
                    </ul>
                    <p class="tip">*央行预计，2017年通货膨胀维持在6-8%区间，而2018年将进入5-7%的目标走廊。</p>
                </div>
            </div>
            <div class="footer">
                <img class="copyRight" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/footerBg.png">
                <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/angel.png">
            </div>
        </div>
        <%--产品类型占比--%>
        <div class="swiper-slide seven">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="content">
                <div class="contentHeader">
                    <h3 class="title">产品类型占比</h3>
                    <img class="shareIcon" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/share.png">
                </div>
                <div class="contentDetails">
                    <div class="circleBox">
                        <div class="pTypeData"></div>
                        <div class="ptypeCircle"></div>
                    </div>
                    <ul class="pTypeRect">
                        <li><em></em><span>企盈宝</span></li>
                        <li><em></em><span>再生财</span></li>
                        <li><em></em><span>车融宝</span></li>
                        <li><em></em><span>房贷宝</span></li>
                    </ul>
                </div>
            </div>
            <div class="footer">
                <img class="copyRight" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/footerBg.png">
                <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/angel.png">
            </div>
        </div>
        <%--投资用户分布--%>
        <div class="swiper-slide eight">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="content">
                <div class="contentHeader">
                    <h3 class="title">投资用户分布</h3>
                    <img class="shareIcon" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/share.png">
                </div>
                <div class="contentDetails">
                    <div class="sexBox clearfix">
                        <div class="female fl"></div>
                        <div class="male fl"></div>
                    </div>
                    <div class="ageChart">
                        <div class="before60">
                            <span>6.07<em class="fs22">%</em></span>
                        </div>
                        <div class="after60">
                            <span>9.03<em class="fs22">%</em></span>
                        </div>
                        <div class="after70">
                            <span>16.21<em class="fs22">%</em></span>
                        </div>
                        <div class="after80">
                            <span>37.49<em class="fs22">%</em></span>
                        </div>
                        <div class="after90">
                            <span>31.20<em class="fs22">%</em></span>
                        </div>
                    </div>
                    <div class="ageBar"></div>
                </div>
            </div>
            <div class="footer">
                <img class="copyRight" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/footerBg.png">
                <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/angel.png">
            </div>
        </div>
        <%--地域分布--%>
        <div class="swiper-slide nine">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="content">
                <div class="contentHeader">
                    <h3 class="title">投资额Top10地域分布</h3>
                    <img class="shareIcon" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/share.png">
                </div>
                <div class="contentDetails">
                    <div class="map">
                        <span class="beijing"></span>
                        <span class="jiangsu"></span>
                        <span class="shandong"></span>
                        <span class="zhejiang"></span>
                        <span class="hebei"></span>
                        <span class="hubei"></span>
                        <span class="anhui"></span>
                        <span class="liaoning"></span>
                        <span class="guangdong"></span>
                        <span class="hunan"></span>
                    </div>
                    <ul class="areaRate">
                        <li class="fl">1.北京：<em>11.96<em class="fs22">%</em></em></li>
                        <li class="fl">2.江苏：<em>9.04<em class="fs22">%</em></em></li>
                        <li class="fl">3.山东：<em>&nbsp;&nbsp;7.41<em class="fs22">%</em></em></li>
                        <li class="fl">4.浙江：<em>6.19<em class="fs22">%</em></em></li>
                        <li class="fl">5.河北：<em>&nbsp;&nbsp;6.12<em class="fs22">%</em></em></li>
                        <li class="fl">6.湖北：<em>5.42<em class="fs22">%</em></em></li>
                        <li class="fl">7.安徽：<em>&nbsp;&nbsp;5.15<em class="fs22">%</em></em></li>
                        <li class="fl">8.辽宁：<em>4.59<em class="fs22">%</em></em></li>
                        <li class="fl">9.广东：<em>&nbsp;&nbsp;4.52<em class="fs22">%</em></em></li>
                        <li class="fl">10.湖南：<em>4.35<em class="fs22">%</em></em></li>
                    </ul>
                </div>
            </div>
            <div class="footer">
                <img class="copyRight" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/footerBg.png">
                <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/angel.png">
            </div>
        </div>
        <%--用户星座分布--%>
        <div class="swiper-slide ten">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="content">
                <div class="contentHeader">
                    <h3 class="title">用户星座分布</h3>
                    <img class="shareIcon" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/share.png">
                </div>
                <div class="contentDetails">
                    <ul class="topThree clearfix">
                        <li class="fl"></li>
                        <li class="fl"></li>
                        <li class="fr"></li>
                    </ul>
                    <div class="textBox">
                        <p class="text">天蝎座天生拥有赚钱能力，敏锐直觉+高财商=还有这种操作！！</p>
                        <p class="text">天秤座气质里藏着财运，不用转发锦鲤也能完美避开风险</p>
                        <p class="text">射手座投资游戏的乐观赌徒，All in这种事，没在怕的。</p>
                    </div>
                    <div class="others">
                        <div class="swiper-container starSwiper">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/shuiping.png">
                                </div>
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/shuangyu.png">
                                </div>
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/chunv.png">
                                </div>
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/shizi.png">
                                </div>
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/shuangzi.png">
                                </div>
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/juxie.png">
                                </div>
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/jinniu.png">
                                </div>
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/baiyang.png">
                                </div>
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/mojie.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <img class="copyRight" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/footerBg.png">
                <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/angel.png">
            </div>
        </div>
        <%--福利数据--%>
        <div class="swiper-slide eleven">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="content">
                <div class="contentHeader">
                    <h3 class="title">福利数据</h3>
                    <img class="shareIcon" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/share.png">
                </div>
                <div class="contentDetails">
                    <ul class="giftReward clearfix">
                        <li class="rewardMoney fl">
                            <div></div>
                            <p class="num">1,000,000+<em class="fs22">元</em></p>
                            <p class="text">奖励金额</p>
                        </li>
                        <li class="gift fl">
                            <div></div>
                            <p class="num">500,000+<em class="fs22">元</em></p>
                            <p class="text">实物礼品价值</p>
                        </li>
                    </ul>
                    <p class="tip">*奖励金额含加息券、现金红包、返现券等奖励</p>
                    <ul class="actBox clearfix">
                        <li>
                            <div class="actImg first"></div>
                            <p class="actName">5.18</p>
                        </li>
                        <li>
                            <div class="actImg second"></div>
                            <p class="actName">周年庆</p>
                        </li>
                        <li>
                            <div class="actImg third"></div>
                            <p class="actName">双旦活动</p>
                        </li>
                        <li>
                            <div class="actImg fourth"></div>
                            <p class="actName">Iphone8一起飞</p>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="footer">
                <img class="copyRight" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/footerBg.png">
                <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/angel.png">
            </div>
        </div>
        <%--风控数据--%>
        <div class="swiper-slide twelve">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="content">
                <div class="contentHeader">
                    <h3 class="title">风控数据</h3>
                    <img class="shareIcon" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/share.png">
                </div>
                <div class="contentDetails">
                    <ul class="risk clearfix">
                        <li class="riskNormal fl">
                            <div></div>
                            <p class="num">100<em class="fs22">%</em></p>
                            <p class="text">按时还款比例</p>
                        </li>
                        <li class="riskBad fl">
                            <div></div>
                            <p class="num">0.0<em class="fs22">%</em></p>
                            <p class="text">项目逾期率</p>
                        </li>
                    </ul>
                    <div class="textBox">
                        <p class="text">2017年，中再融平台出借项目中100%按时还款，出借项目逾期率为0%</p>
                        <p class="text">远高于行业的风控水平，得益于专业风控团队在风险评估、风险预警、贷后管理等环节的深耕细作。</p>
                        <p class="text">平台采用云计算、知识图谱应用与机器学习等技术建立的动态风控系统，提升借款审核效率和准确率的同时，最大程度保障出借人资金安全，规避借款风险。</p>
                    </div>
                </div>
            </div>
            <div class="footer">
                <img class="copyRight" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/footerBg.png">
                <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/angel.png">
            </div>
        </div>
        <%--2017年大事记--%>
        <div class="swiper-slide thirteen">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="content">
                <div class="contentHeader">
                    <h3 class="title">2017年大事记</h3>
                    <img class="shareIcon" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/share.png">
                </div>
                <div class="contentDetails">
                    <div class="timeAxis">
                        <ul>
                            <li>
                                <h4>2017.02</h4>
                                <p>拥抱监管，中再融官网披露合规进程</p>
                            </li>
                            <li>
                                <h4>2017.02</h4>
                                <p>中再融风控团队扩展至7省份</p>
                            </li>
                            <li>
                                <h4>2017.03</h4>
                                <p>“全国互金理事会副理事长”授牌仪式</p>
                            </li>
                            <li>
                                <h4>2017.04</h4>
                                <p>与太平洋保险达成合作，安全再添屏障</p>
                            </li>
                            <li>
                                <h4>2017.10</h4>
                                <p>“长城计划”正式发布，安全运营迈上新阶段</p>
                            </li>
                            <li>
                                <h4>2017.12</h4>
                                <p>中再生协会牵头，发起成立“绿色金融服务中心”  </p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer">
                <img class="copyRight" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/footerBg.png">
                <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/angel.png">
            </div>
        </div>
        <%--荣誉资质--%>
        <div class="swiper-slide fourteen">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="content">
                <div class="contentHeader">
                    <h3 class="title">荣誉资质</h3>
                    <img class="shareIcon" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/share.png">
                </div>
                <div class="contentDetails">
                    <p class="tip">业界信赖，荣誉见证。</p>
                    <div class="presentBox">
                        <div class="swiper-container presentSwiper">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/present1.png">
                                    <div class="textBox">
                                        <h3>2017年度绿色金融奖</h3>
                                        <p>澎湃新闻举办的2018金融发展高峰论坛上，中再融荣登2017年度中国TOP金融榜，并获评年度绿色金融奖。</p>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/present2.png">
                                    <div class="textBox">
                                        <h3>年度卓越普惠金融服务机构</h3>
                                        <p>中再融专注服务再生资源中小企业，以普惠筑梦再生产业，在《经济观察报》主办的“2016-2017中国卓越金融奖”颁奖典礼中，获评“年度卓越普惠金融服务机构”。</p>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/present3.png">
                                    <div class="textBox">
                                        <h3>2017年度竞争力理财平台</h3>
                                        <p>中再融作为绿色金融的倡导者与实践者，在再生资源领域优质资产获取方面不断刷新成绩。和讯网主办的第十五届财经风云榜财富管理论坛中，获评“年度竞争力理财平台”。</p>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/present4.png">
                                    <div class="textBox">
                                        <h3>2017金融助力实体经济卓越贡献奖</h3>
                                        <p>《中国企业报》主办2017中国金融科技创新企业榜单发布，中再融因服务再生资源行业，快速切入市场，成为互联网金融服务实体经济的样本。荣获“2017金融助力实体经济卓越贡献奖”。 </p>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/present5.png">
                                    <div class="textBox">
                                        <h3>绿色金融最佳模式创新奖</h3>
                                        <p>互联网行业年度大型评选活动 “中国互联网速途风云榜”在业内具有广泛影响力。中再融凭借创新模式和特色产品，在千余家企业中脱颖而出，夺得年度“绿色金融最佳模式创新奖”。</p>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/present6.png">
                                    <div class="textBox">
                                        <h3>中再生协会副会长单位</h3>
                                        <p>中国再生资源回收利用协会第六届二次会员大会上，专注于再生领域的互联网金融平台中再融，正式当选中再生协会副会长单位，为深耕再生资源提供全面金融服务奠定坚实基础。</p>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/present7.png">
                                    <div class="textBox">
                                        <h3>绿色金融创新企业</h3>
                                        <p>中再融携手中再生协会成立“绿色金融服务中心”。第七届再生资源行业会员大会上，中再融获中再生协会授予“绿色金融创新企业”称号。</p>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="prev"></div>
                        <div class="next"></div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <img class="copyRight" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/footerBg.png">
                <img class="nextBtn" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/angel.png">
            </div>
        </div>
        <%--2017用户之最--%>
        <div class="swiper-slide fifteen">
            <div class="header">
                <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/logo.png">
            </div>
            <div class="content">
                <div class="contentHeader">
                    <h3 class="title">2017用户之最</h3>
                    <img class="shareIcon" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/share.png">
                </div>
                <div class="contentDetails">
                    <div class="mostTr clearfix">
                        <div class="mostList fl">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/most01.png" alt="">
                            <p class="mostTit">荷包最饱</p>
                            <p class="mostNum"><span>496</span><em>万</em></p>
                            <p class="mostDes">累计投资金额</p>
                        </div>
                        <div class="mostList fr">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/most02.png" alt="">
                            <p class="mostTit">单笔最壕</p>
                            <p class="mostNum"><span>90</span><em>万</em></p>
                            <p class="mostDes">单笔投资金额</p>
                        </div>
                    </div>
                    <div class="mostTr clearfix">
                        <div class="mostList fl">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/most03.png" alt="">
                            <p class="mostTit">人缘最好</p>
                            <p class="mostNum"><span>421</span><em>人</em></p>
                            <p class="mostDes">邀请好友总人数</p>
                        </div>
                        <div class="mostList fr">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/most04.png" alt="">
                            <p class="mostTit">投资最勤</p>
                            <p class="mostNum"><span>475</span><em>次</em></p>
                            <p class="mostDes">累计投资次数</p>
                        </div>
                    </div>
                    <div id="linkBtn" class="linkBtn">查看我的2017年账单</div>
                </div>
            </div>
            <div class="footer">
                <img class="copyRight" src="<%=request.getContextPath()%>/resources/image/activity/zzrAnnals/footerBg.png">
            </div>
        </div>
    </div>
</div>
<input id="flag" type="hidden" value="${flag}"/>
<div class="noWeixin" style="display:none;">请在微信浏览器中打开</div>
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/annals/fastclick.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/present/swiper.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/annals/zzrAnnals.js" type="text/javascript"></script>
<script type="text/javascript" src="https://f.moblink.mob.com/v2_0_1/moblink.js?appkey=2286828968fa0"></script>
<script>
    var flag=$('#flag').val();
    FastClick.attach(document.body);//绑定fastclick

    // app 端调用改变页面点击事件或样式
    function changeForApp() {
        // 添加代码
        $('.content .shareIcon').show();
        $('.content .shareIcon').click(function(){
            var title='中再融2017年运营报告';
            var des='本报告全面披露平台2017年合规、业务、风控等数据信息';
            var shareUrl='https://m.zhongzairong.cn/annals/zzrAnnals.do?flag=wx';
            var iconUrl='https://m.zhongzairong.cn/resources/image/activity/zzrAnnals/zzrAnnalsIcon.png';

            var platAry=['WechatSession','WechatTimeLine'];
            shareMessage(title,des,shareUrl,iconUrl,platAry);
        });
        $('#linkBtn').click(function () {
            if(!getUrlParams("userId")||!getUrlParams("token")){
                window.location.href=basePath + '/annals/toAnnalsLogin.do?flag=mobile&login=1'
            }else {
                window.location.href=basePath + '/annals/toAnnalsLogin.do?flag=mobile&login=1&userId='+getUrlParams("userId")+'&token='+getUrlParams("token")
            }

        })
    }
    function getUrlParams (flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
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

    function isWeiXin() {
        var ua = window.navigator.userAgent.toLowerCase();
        if (ua.match(/MicroMessenger/i) == 'micromessenger') {
            return true;
        } else {
            return false;
        }
    }
    if(flag=='mobile'){
        $('.swiperOne').show();
    }else {
        if(isWeiXin()){
            console.log(" 是来自微信内置浏览器");
            $('.swiperOne').show();
            MobLink([
                {
                    el: '#linkBtn',//被触发的元素id
                    path: 'zzr/',
                    params: {
                    }
                }
            ])
        }else{
            $('.noWeixin').show();
            console.log("不是来自微信内置浏览器")
        }
    }

</script>
</body>
</html>