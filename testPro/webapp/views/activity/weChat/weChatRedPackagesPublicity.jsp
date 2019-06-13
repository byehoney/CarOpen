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
    <title>关注中再融微信，领0.5%加息劵</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/weChat/follow_Wechat.css">
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
<div class="follow_Wechat">
    <div class="banner">
        <img src="<%=request.getContextPath()%>/resources/image/activity/weChat/coupon_banner_t.png" alt=""/>
        <img src="<%=request.getContextPath()%>/resources/image/activity/weChat/coupon_banner_b.png" alt=""/>
    </div>
    <img class="attention_icon" src="<%=request.getContextPath()%>/resources/image/activity/weChat/attention_icon.png" alt=""/>
    <div class="follow_Wechat_cont">
        <div class="hint_info">
            <div class="clearfix">
                <span class="fl">1.</span><p class="fl">打开微信客户端，在微信通讯录中，点击右上角添加朋友</p>
            </div>
            <img src="<%=request.getContextPath()%>/resources/image/activity/weChat/address_book_t.png" alt=""/>
            <img src="<%=request.getContextPath()%>/resources/image/activity/weChat/address_book_b.png" alt=""/>
        </div>
        <div class="hint_info">
            <div class="clearfix">
                <span class="fl">2.</span><p class="fl">输入“zhongzairong-cn”就能找到我们啦</p>
            </div>
            <img src="<%=request.getContextPath()%>/resources/image/activity/weChat/import_t.png" alt=""/>
            <img src="<%=request.getContextPath()%>/resources/image/activity/weChat/import_b.png" alt=""/>
        </div>
        <div class="hint_info">
            <div class="clearfix">
                <span class="fl">3.</span><p class="fl">关注成功后，进入中再融官方微信，点击活动链接，领取0.5%加息券</p>
            </div>
            <img src="<%=request.getContextPath()%>/resources/image/activity/weChat/dialog_box_t.png" alt=""/>
            <img src="<%=request.getContextPath()%>/resources/image/activity/weChat/dialog_box_b.png" alt=""/>
        </div>
        <div class="concern">
            <a href="javascript:;"></a>
        </div>
    </div>
</div>
<script>
    function followWeixin(){
        anniversary.followWeixin();
    }
    $('.concern').click(function(){
        followWeixin();
    });
</script>
</body>
</html>
