<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    request.setAttribute("verCode", "?r=Version201802660815");
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
    <title>绿色优质资产是怎样炼成的</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/swiper.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/sczt/sczt.css${verCode}"/>
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
<div class="special_App">
    <div class="banner">
        <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/banner_01.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/banner_02.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/banner_03.png">
        <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/banner_04.png">
    </div>
    <div class="scene_bg">
        <div class="container">
            <div class="organization">
                <p>中再融定位再生资源领域绿色资产，安全运营两年多，为投资用户带来1500多万的收益，真正实现“点绿成金”。</p>
            </div>
            <div class="handle_pic">
                <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/handle.png" alt="">
            </div>
            <ul class="picList clearfix">
                <li>
                    <div class="strategy"></div>
                    <p>国家战略</p>
                </li>
                <li>
                    <div class="exclusive"></div>
                    <p>独家壁垒</p>
                </li>
                <li>
                    <div class="bazaar"></div>
                    <p>千亿市场</p>
                </li>
                <li>
                    <div class="limit"></div>
                    <p>小额分散</p>
                </li>
                <li>
                    <div class="reliable"></div>
                    <p>安全可靠</p>
                </li>
            </ul>
        </div>
    </div>
    <div class="pt">
        <div class="container">
            <div class="delivery_pic">
                <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/behavior.png" alt="">
            </div>
            <div class="showImg">
                <div class="swiper-container one">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/act_list_01.png" alt="">
                            <p>2016年5月走进武汉格林美循环经济产业园</p>
                        </div>
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/act_list_02.png" alt="">
                            <p>2016年9月考察农大科技园的中农绿能“产业沼气平台”</p>
                        </div>
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/act_list_03.png" alt="">
                            <p>2016年9月走进广东东莞废纸企业</p>
                        </div>
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/act_list_04.png" alt="">
                            <p>2016年10月探访甘肃再生资源产业园</p>
                        </div>
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/act_list_05.png" alt="">
                            <p>2017年5月参加上海环博展，发起环保企业融资调查</p>
                        </div>
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/act_list_06.png" alt="">
                            <p>2017年10月中再融考察团走进山东</p>
                        </div>
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/act_list_07.png" alt="">
                            <p>2017年11月考察北京顺义再生资源回收市场</p>
                        </div>
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/act_list_08.png" alt="">
                            <p>2018年4月参观北方循环经济示范园</p>
                        </div>
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/act_list_09.png" alt="">

                            <p>2018年6月中再融考察团走进四川</p>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination swiper-pagination_one"></div>
            </div>
        </div>
    </div>
    <div class="scene_bg pt">
        <div class="container">
            <div class="delivery_pic">
                <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/safeguard.png" alt="">
            </div>
            <p class="safeguard">强有力资源位、专业风控团队、智能风控体系是平台优质资产诞生的基本步骤。</p>
            <div class="showImg">
                <div class="swiper-container two">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/pic_01.png" alt="">
                            <p>强有力资源位</p>
                        </div>
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/pic_02.png" alt="">
                            <p>专业风控团队</p>
                        </div>
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/pic_03.png" alt="">
                            <p>智能风控体系</p>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination swiper-pagination_two"></div>
            </div>
        </div>
    </div>
    <div class="pt">
        <div class="container">
            <div class="delivery_pic">
                <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/case.png" alt="">
            </div>
            <div class="showImg showImg_two">
                <div class="swiper-container three">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/case_01.png" alt="">
                            <div  class="swiper-slide-box">
                                <h5>废旧衣物回收</h5>
                                <p>2017年8月,易霖环保通过中再融借款50万，用于北京地区回收箱的投放与回收人员招聘。</p>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/case_02.png" alt="">
                            <div  class="swiper-slide-box">
                                <h5>废纸回收</h5>
                                <p>2017年10月,杭州富杰通过中再融借款100万，扩大废纸回收量，以应对废纸价格不断上涨的利好行情。</p>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/sczt/case_03.png" alt="">
                            <div  class="swiper-slide-box">
                                <h5>西北再生资源循环经济园区</h5>
                                <p>2017年11月，甘肃振辉通过中再融借款100万，搭建建筑垃圾处理线，方便快捷地实现建筑垃圾的破碎处理。</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination swiper-pagination_two swiper-pagination_three"></div>
            </div>
            <div class="more">
                <a href="/greenFinance.do?flag=${flag}">
                    点击了解更多绿色金融
                </a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/newYear/fastclick.js"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script src="<%=request.getContextPath()%>/resources/js/common/swiper-3.4.2.jquery.min.js"></script>
<script>
    $(function () {

        var swiperOne = new Swiper('.swiper-container.one', {
            autoplay:2000,
            loop: true,
            pagination : '.swiper-pagination_one',
            paginationType : 'fraction',
            paginationFractionRender: function (swiper, currentClassName, totalClassName) {
                return '<span class="' + currentClassName + '"></span>/<span class="' + totalClassName + '"></span>';
            }

        });
        var mySwiperTwo = new Swiper('.swiper-container.two',{
            loop: true,
            pagination : '.swiper-pagination_two',
            paginationType : 'bullets',
        });

        var mySwiperThree = new Swiper('.swiper-container.three',{
            autoplay:2000,
            loop: true,
            pagination : '.swiper-pagination_three',
            paginationType : 'bullets'
        })
    })
</script>
</body>
</html>