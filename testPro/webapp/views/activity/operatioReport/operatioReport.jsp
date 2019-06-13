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
    <title>中再融2018第一季度运营报告</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/present/swiper.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/operatioReport/report.css${verCode}"/>
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
<div class="swiper-container">
    <div class="swiper-wrapper">
        <!-- 首页 -->
        <div class="swiper-slide swiper-slide-one" style="display: n-one">
            <div class="logo"></div>
            <div class="title"></div>
            <div class="arrow"></div>
        </div>
        <!-- 数据总览 -->
        <div class="swiper-slide main swiper-slide-two" style="display: n-one">
            <div class="dot_one dot_bg"></div>
            <div class="dot_two dot_bg"></div>
            <div class="dot_three dot_bg"></div>
            <div class="content" style="font-size: .2rem;color:#95b5dd">
                <img class="content_title title_01" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/title_01.png">
                <img class="total_scan" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/total_scan.png">
            </div>
        </div>
        <!--成交规模-->
        <div class="swiper-slide main swiper-slide-three" style="display: n-one">
            <div class="dot_one dot_bg"></div>
            <div class="dot_two dot_bg"></div>
            <div class="dot_three dot_bg"></div>
            <div class="content">
                <div class="Q1_icon"></div>
                <img class="content_title title_02" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/title_02.png">
                <div class="scale_chart_box">
                    <div class="scale_chart_one">
                        <h3>季度成交总额</h3>
                        <div class="scale_chart clearfix">
                            <div class="rate">同比126.9%</div>
                            <div class="up_arrow">
                                <div class="arrowOpc"></div>
                            </div>
                            <div class="Q1_left rect fl">
                                <span>7,369万元</span>
                            </div>
                            <div class="Q1_right rect fr">
                                <span>16,720万元</span>
                            </div>
                        </div>
                        <div class="date clearfix">
                            <span class="fl">2017年Q1</span>
                            <span class="fr">2018年Q1</span>
                        </div>
                    </div>
                    <div class="divide"></div>
                    <div class="scale_chart_two">
                        <h3>已发放收益</h3>
                        <div class="scale_chart clearfix">
                            <div class="rate">同比297.19%</div>
                            <div class="up_arrow">
                                <div class="arrowOpc"></div>
                            </div>
                            <div class="Q1_left rect fl">
                                <span>87.96万元</span>
                            </div>
                            <div class="Q1_right rect fr">
                                <span>349.37万元</span>
                            </div>
                        </div>
                        <div class="date clearfix">
                            <span class="fl">2017年Q1</span>
                            <span class="fr">2018年Q1</span>
                        </div>
                    </div>
                    <div class="levalbox clearfix">
                        <span class="fl leval_left"><i></i>2017年第1季度</span>
                        <span class="fr leval_right"><i></i>2018年第1季度</span>
                    </div>
                </div>
            </div>
        </div>
        <!--投资项目期限分布-->
        <div class="swiper-slide main swiper-slide-four swiper-slide-active" style="display: n-one">
            <div class="dot_one dot_bg"></div>
            <div class="dot_two dot_bg"></div>
            <div class="dot_three dot_bg"></div>
            <div class="content">
                <div class="Q1_icon"></div>
                <img class="content_title title_03" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/title_03.png">
                <div class="circleBox">
                    <div class="distribute_top">
                        <div class="pTypeData"></div>
                        <div class="ptypeCircle"><p>项目投资期限</br>金额分布</p></div>
                    </div>
                    <div class="distribute_bottom">
                        <div class="pTypeData"></div>
                        <div class="ptypeCircle"><p>项目成交</br>笔数分布</p></div>
                    </div>
                </div>
                <div class="Project_level">
                    <p><span class="short_term"><i></i>短期项目：30-60天(包含新手项目）</span></p>
                    <p><span class="short_term"><i></i>中期项目：90-180天</span><span><i></i>长期项目：360天</span></p>
                </div>
            </div>
        </div>
        <!--投资项目期限分布-->
        <div class="swiper-slide main swiper-slide-four swiper-slide-active" style="display: n-one">
            <div class="dot_one dot_bg"></div>
            <div class="dot_two dot_bg"></div>
            <div class="dot_three dot_bg"></div>
            <div class="content">
                <div class="Q1_icon"></div>
                <img class="content_title title_04" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/title_04.png">
                <div class="circleBox">
                    <div class="sex_cont">
                        <div class="pTypeData"></div>
                        <div class="ptypeCircle"><p>性别分布</p></div>
                    </div>
                </div>
                <div class="age_cont">
                    <p>年龄分布</p>
                    <div class="age_scattergram distribution">
                        <img src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/sex_distribute_right.png" alt="">
                        <div></div>
                    </div>
                </div>
            </div>
        </div>
        <!--地区投资金额排名-->
        <div class="swiper-slide main swiper-slide-five swiper-slide-active" style="display: n-one">
            <div class="dot_one dot_bg"></div>
            <div class="dot_two dot_bg"></div>
            <div class="dot_three dot_bg"></div>
            <div class="content">
                <div class="Q1_icon"></div>
                <img class="content_title title_05" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/title_05.png">
                <div class="clearfix ranking_cont">
                    <div class="map_cont fl">
                        <img class="" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/map.png" alt="">
                        <div class="ah" title="14.31%">安徽</div>
                        <div class="bj" title="7.21%">北京</div>
                        <div class="sd" title="6.68%">山东</div>
                        <div class="js" title="6.59%">江苏</div>
                        <div class="heb" title="5.50%">河北</div>
                        <div class="zj" title="5.38%">浙江</div>
                        <div class="hub" title="5.27%">湖北</div>
                        <div class="gd" title="4.68%">广东</div>
                        <div class="ln" title="4.21%">辽宁</div>
                        <div class="sc" title="4.03%">四川</div>
                    </div>
                    <ul class="region_cont clearfix">
                        <li class="redColor"><i></i>安徽 14.31%</li>
                        <li class="violetColor"><i></i>北京 7.21%</li>
                        <li class="greenColor"><i></i>山东 6.68%</li>
                        <li><i></i>江苏 6.59%</li>
                        <li><i></i>河北 5.50%</li>
                        <li><i></i>浙江 5.38%</li>
                        <li><i></i>湖北 5.27%</li>
                        <li><i></i>广东 4.68%</li>
                        <li><i></i>辽宁 4.21%</li>
                        <li><i></i>四川 4.03%</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 投资人榜单 1 -->
        <div class="swiper-slide main swiper-slide-six-two swiper-slide-active" style="display: n-one">
            <div class="dot_one dot_bg"></div>
            <div class="dot_two dot_bg"></div>
            <div class="dot_three dot_bg"></div>
            <div class="content">
                <div class="Q1_icon"></div>
                <img class="content_title title_06_01" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/title_06_01.png">
                <h3>最牛投资人</h3>
                <div class="big_firstPrize">
                    <img src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/big_firstPrize.png" alt="">
                    <p>185.27万</p>
                    <span>辽宁  宋先生</span>
                </div>
                <ul class="user_list clearfix">
                    <li>
                        <img src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/big_accessit.png" alt="">
                        <p class="accessit">161.72万</p>
                        <span>陕西  洪女士</span>
                    </li>
                    <li>
                        <img src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/big_thirdPrize.png" alt="">
                        <p class="thirdPrize">121.10万</p>
                        <span>河北  周女士</span>
                    </li>
                    <li>
                        <img src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/big_fourth_Prize.png" alt="">
                        <p>104.14万</p>
                        <span>湖北  余女士</span>
                    </li>
                    <li>
                        <img src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/big_fifth_Prize.png" alt="">
                        <p>85.65万</p>
                        <span>安徽  凌先生</span>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 投资人榜单 2 -->
        <div class="swiper-slide main swiper-slide-six-two" style="display: n-one">
            <div class="dot_one dot_bg"></div>
            <div class="dot_two dot_bg"></div>
            <div class="dot_three dot_bg"></div>
            <div class="content">
                <div class="Q1_icon"></div>
                <img class="content_title title_06_02" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/title_06_02.png">
                <h3>最佳投资楷模</h3>
                <ul class="rank_box">
                    <li class="rank_title clearfix">
                        <span class="fl rank_l">排名</span>
                        <span class="fl rank_m">用户</span>
                        <span class="fl rank_r">投资次数</span>
                    </li>
                    <li class="top">
                        <span class="fl rank_l gold"></span>
                        <span class="fl rank_m silver">130****4090</span>
                        <span class="fl rank_r">81</span>
                    </li>
                    <li class="top">
                        <span class="fl rank_l silver"></span>
                        <span class="fl rank_m">159****9621</span>
                        <span class="fl rank_r">79</span>
                    </li>
                    <li class="top">
                        <span class="fl rank_l cu"></span>
                        <span class="fl rank_m">136****8299</span>
                        <span class="fl rank_r">73</span>
                    </li>
                    <li>
                        <span class="fl rank_l">4</span>
                        <span class="fl rank_m">136****8446</span>
                        <span class="fl rank_r">66</span>
                    </li>
                    <li>
                        <span class="fl rank_l">5</span>
                        <span class="fl rank_m">139****0484</span>
                        <span class="fl rank_r">64</span>
                    </li>
                    <li>
                        <span class="fl rank_l">6</span>
                        <span class="fl rank_m">136****8237</span>
                        <span class="fl rank_r">55</span>
                    </li>
                    <li>
                        <span class="fl rank_l">7</span>
                        <span class="fl rank_m">133****1436</span>
                        <span class="fl rank_r">54</span>
                    </li>
                    <li>
                        <span class="fl rank_l">8</span>
                        <span class="fl rank_m">130****8795</span>
                        <span class="fl rank_r">53</span>
                    </li>
                    <!-- <li>
                        <span class="fl rank_l">9</span>
                        <span class="fl rank_m">135****2479</span>
                        <span class="fl rank_r">51</span>
                    </li>
                    <li>
                        <span class="fl rank_l">10</span>
                        <span class="fl rank_m">186****7098</span>
                        <span class="fl rank_r">47</span>
                    </li> -->
                </ul>
            </div>
        </div>
        <!-- 活动概览 -->
        <div class="swiper-slide main swiper-slide-seven" style="display: n-one">
            <div class="dot_one dot_bg"></div>
            <div class="dot_two dot_bg"></div>
            <div class="dot_three dot_bg"></div>
            <div class="content">
                <div class="Q1_icon"></div>
                <img class="content_title title_07" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/title_07.png">
                <div class="act">
                    <img src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/act_01.png">
                    <p class="act_des">1月24日 浓情腊八</p>
                    <img src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/act_02.png">
                    <p class="act_des">2月7日 新年狂欢趴</p>
                    <img src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/act_03.png">
                    <p class="act_des">3月21日 2周年庆典</p>
                </div>
            </div>
        </div>
        <!-- 风控数据 -->
        <div class="swiper-slide main swiper-slide-eight" style="display: n-one">
            <div class="dot_one dot_bg"></div>
            <div class="dot_two dot_bg"></div>
            <div class="dot_three dot_bg"></div>
            <div class="content">
                <div class="Q1_icon"></div>
                <img class="content_title title_08" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/title_08.png">
                <div class="risk_data">
                    <img src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/risk_01.png" alt="">
                    <img src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/risk_02.png" alt="">
                    <img src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/risk_03.png" alt="">
                    <img src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/risk_04.png" alt="">
                </div>
                <p class="risk_text">2018年1季度，中再融平台出借项目100%按时还款，出借项目逾期率为0%。</p>
                <p class="risk_text">抢眼的风控表现，得益于专业风控团队在风险评估、风险预警、贷后管理等环节的深耕细作。 </p>
            </div>
        </div>
        <!--大事记-->
        <div class="swiper-slide main swiper-slide-nine" style="display: n-one">
            <div class="dot_one dot_bg"></div>
            <div class="dot_two dot_bg"></div>
            <div class="dot_three dot_bg"></div>
            <div class="content">
                <div class="Q1_icon"></div>
                <img class="content_title title_09" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/title_09.png">
                <div class="record_cont clearfix">
                    <div class="record_left fl">
                        <div class="rightLinellae"></div>
                        <p>3月23日<i></i></p>
                        <p>1月28日<i></i></p>
                        <p>1月25日<i></i></p>
                        <p>1月10日<i></i></p>
                    </div>
                    <ul class="record_right fr clearfix">
                        <li>
                            <p class="fl">中再融成立</br>2周年</p>
                            <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/twoYear.png" alt="">
                        </li>
                        <li>
                            <p class="fl">获评金博会</br>绿色金融创新先锋奖</p>
                            <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/attestation.png" alt="">
                        </li>
                        <li>
                            <p class="fl">中再融携绿色金融</br>亮相金博会</p>
                            <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/activity_pic.png" alt="">
                        </li>
                        <li>
                            <p class="fl">获评澎湃新闻</br>年度绿色金融奖</p>
                            <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/operatioReport/award.png" alt="">
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/present/swiper.min.js" type="text/javascript"></script>
<script>
    $(function(){
        var mySwiper = new Swiper('.swiper-container',{
            direction : 'vertical',
            threshold : 80,
            resistanceRatio:0
        })
    })
</script>
</body>
</html>