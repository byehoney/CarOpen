<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="author" content="m.zhongzairong.cn">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>金博会</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/annals/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/gold_expo.css">
</head>
<body>
<div class="gold_expo_page">
    <div class="banner">
        <img src="${basePath}/resources/image/activity/gold_expo/banner_01.png" alt="">
        <img src="${basePath}/resources/image/activity/gold_expo/banner_02.png" alt="">
        <img src="${basePath}/resources/image/activity/gold_expo/banner_03.png" alt="">
        <img src="${basePath}/resources/image/activity/gold_expo/banner_04.png" alt="">
        <img src="${basePath}/resources/image/activity/gold_expo/banner_05.png" alt="">
        <img src="${basePath}/resources/image/activity/gold_expo/banner_06.png" alt="">
        <img src="${basePath}/resources/image/activity/gold_expo/banner_07.png" alt="">
        <img src="${basePath}/resources/image/activity/gold_expo/banner_08.png" alt="">
    </div>
    <div class="clearfix financialH">
        <div class="fl financial">
            <div>绿色金融</div>
        </div>
        <div class="fl hint_title">
            <p>习近平总书记在十九大报告中强调，“建设生态文明是中华民族永续发展的千年大计”。中再融助推再生资源实体产业，践行绿色金融，为本届金博会增添一抹亮色。</p>
        </div>
    </div>
    <div class="swiper-container swiperOne">
        <div class="sliderBorder"></div>
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <div class="slide_box">
                    <img src="${basePath}/resources/image/activity/gold_expo/pic_01.png" class="main-img" alt="">
                    <div class="opabox clearfix">
                        <p>中再融展位人气爆棚，绿色金融引关注
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="slide_box">
                    <img src="${basePath}/resources/image/activity/gold_expo/pic_02.png" class="main-img" alt="">
                    <div class="opabox clearfix">
                        <p>北京电视台采访中再融合伙人&副总裁侯君</p>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="slide_box">
                    <img src="${basePath}/resources/image/activity/gold_expo/pic_03.png" class="main-img">
                    <div class="opabox clearfix">
                        <p>金博会现场领导参观视察中再融展位</p>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="slide_box">
                    <img src="${basePath}/resources/image/activity/gold_expo/pic_04.png" class="main-img">
                    <div class="opabox clearfix">
                        <p>践行绿色金融，为再生资源打CALL</p>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="slide_box">
                    <img src="${basePath}/resources/image/activity/gold_expo/pic_05.png" class="main-img">
                    <div class="opabox clearfix">
                        <p>用户现场了解绿色金融服务中心</p>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="slide_box">
                    <img src="${basePath}/resources/image/activity/gold_expo/pic_06.png" class="main-img">
                    <div class="opabox clearfix">
                        <p>践行绿色金融，中再融获得业界认可</p>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="slide_box">
                    <img src="${basePath}/resources/image/activity/gold_expo/pic_07.png" class="main-img">
                    <div class="opabox clearfix">
                        <p>中再融合伙人&副总裁侯君接受媒体采访</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="blue_bg blue_bg_distance">
        <div class="delivery_pic"></div>
        <ul class="clearfix pic_list">
            <li>
                <img src="${basePath}/resources/image/activity/gold_expo/jbh_list_01.png" alt="">
                <p>“绿巨人”互动游戏现场火爆</p>
            </li>
            <li>
                <img src="${basePath}/resources/image/activity/gold_expo/jbh_list_02.png" alt="">
                <p>工作人员为用户介绍中再融平台</p>
            </li>
            <li class="distance">
                <img src="${basePath}/resources/image/activity/gold_expo/jbh_list_03.png" alt="">
                <p>写下对绿色金融的未来期许</p>
            </li>
            <li>
                <img src="${basePath}/resources/image/activity/gold_expo/jbh_list_04.png" alt="">
                <p>用户在中再融展台了解绿色金融</p>
            </li>
            <li>
                <img src="${basePath}/resources/image/activity/gold_expo/jbh_list_05.png" alt="">
                <p>投资用户为绿色金融打CALL</p>
            </li>
            <li>
                <img src="${basePath}/resources/image/activity/gold_expo/jbh_list_06.png" alt="">
                <p>参展团队留影金博会</p>
            </li>
        </ul>
    </div>
    <div class="popBox">
        <div class="swiper-container swiperTwo">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="${basePath}/resources/image/activity/gold_expo/jbh_list_01.png" class="main-img" alt="">
                    <div class="opabox clearfix">
                        <p>“绿巨人”互动游戏现场火爆</p>
                    </div>
                </div>
                <div class="swiper-slide" >
                    <img src="${basePath}/resources/image/activity/gold_expo/jbh_list_02.png" class="main-img">
                    <div class="opabox clearfix">
                        <p>工作人员为用户介绍中再融平台</p>
                    </div>
                </div>
                <div class="swiper-slide" >
                    <img src="${basePath}/resources/image/activity/gold_expo/jbh_list_03.png" class="main-img">
                    <div class="opabox clearfix">
                        <p>写下对绿色金融的未来期许</p>
                    </div>
                </div>
                <div class="swiper-slide" >
                    <img src="${basePath}/resources/image/activity/gold_expo/jbh_list_04.png" class="main-img">
                    <div class="opabox clearfix">
                        <p>用户在中再融展台了解绿色金融</p>
                    </div>
                </div>
                <div class="swiper-slide" >
                    <img src="${basePath}/resources/image/activity/gold_expo/jbh_list_05.png" class="main-img">
                    <div class="opabox clearfix">
                        <p>投资用户为绿色金融打CALL</p>
                    </div>
                </div>
                <div class="swiper-slide" >
                    <img src="${basePath}/resources/image/activity/gold_expo/jbh_list_06.png" class="main-img">
                    <div class="opabox clearfix">
                        <p>参展团队留影金博会</p>
                    </div>
                </div>
            </div>
            <!-- 如果需要分页器 -->
            <div class="swiper-pagination swiper-pagination_cont"></div>
        </div>
    </div>
    <div class="together_bg">金融大咖百花齐放·相聚金博会</div>
    <div class="crowd_content">
        <div class="crowd_pic_list">
            <img class="crowd_pic_top mb20 fl" src="${basePath}/resources/image/activity/gold_expo/together_01.png" title="工商银行工银瑞信" alt="">
            <div class="mb20 crowd_pic_center clearfix">
                <img class="meeting_pic fl" src="${basePath}/resources/image/activity/gold_expo/together_02.png" title="北京银行" alt="">
                <div class="fr">
                    <img src="${basePath}/resources/image/activity/gold_expo/together_03.png" title="邮政储蓄银行" alt="">
                    <img src="${basePath}/resources/image/activity/gold_expo/together_04.png" title="中国农业银行" alt="">
                </div>
            </div>
            <div class="mb20 crowd_pic_right clearfix">
                <div class="fl">
                    <img class="" src="${basePath}/resources/image/activity/gold_expo/together_05.png" title="北京银行" alt="">
                    <img src="${basePath}/resources/image/activity/gold_expo/together_06.png" title="中国银行" alt="">
                </div>
                <img class="Canvas_bag fr" src="${basePath}/resources/image/activity/gold_expo/together_07.png" title="中国农业银行" alt="">
            </div>
        </div>
    </div>
    <div class="blue_bg">
        <div class="report_bg">
            <div class="border_line">
                <div class="report_silder">
                    <h3><span>媒体报道</span><i></i></h3>
                </div>
            </div>
        </div>
        <div class="introduce">
            <img src="${basePath}/resources/image/activity/gold_expo/caifan_bg.png" width="291" height="188" alt="">
        </div>
        <ul class="report_list">
            <li>
                <div class="clearfix"><span class="fl">【经济日报】</span><a class="fl" href="https://share.jingjiribao.cn/detail/newsDetailShare.html?docid=111262&amp;user_id=a8ef94b70429489b9fcb067912a261fe&amp;source=wechat_friend&amp;from=timeline&amp;isappinstalled=0" target="_blank">绿色金融创新实践：再生资源迎来大发展时期</a></div>
            </li>
            <li>
                <div class="clearfix"><span class="website fl">【搜狐网】</span><a class="fl" href="http://www.sohu.com/a/219175423_601367" target="_blank">金博会零距离, 中再融侯君2018要做什么</a></div>
            </li>
            <li>
                <div class="clearfix"><span class="website fl">【和讯网】</span><a class="fl" href="http://iof.hexun.com/2018-01-25/192314507.html" target="_blank">中再融“绿”动金博会 传导金融脱虚向实</a></div>
            </li>
            <li>
                <div class="clearfix"><span class="website fl">【中华网】</span><a class="fl" href="http://tech.china.com/article/20180124/20180124101762.html" target="_blank">金博会开幕，中再融与绿色金融服务中心齐亮相</a></div>
            </li>
            <li>
                <div class="clearfix"><span class="fl">【国际在线】</span><a class="fl" href="http://city.cri.cn/20180118/4afcfd0c-6f5c-fff5-4508-b689642246e6.html" target="_blank">守护青山绿水，中再融携绿色金融亮相金博会</a></div>
            </li>
        </ul>
    </div>
</div>
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${basePath}/resources/js/activity/doubleDan/swiper-3.4.2.jquery.min.js"></script>
<script src="${basePath}/resources/js/activity/gold_expo.js"></script>
</body>
</html>