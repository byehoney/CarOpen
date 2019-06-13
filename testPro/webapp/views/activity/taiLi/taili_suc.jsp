<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="author" content="m.zhongzairong.cn">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <title>月月有惊喜，壕礼送不停！</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/weChat/weChatTaili.css">
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
<div class="deskCalenda_page">
    <img src="<%=request.getContextPath()%>/resources/image/activity/weChatTaili/bg1.png" alt="">
    <img src="<%=request.getContextPath()%>/resources/image/activity/weChatTaili/bg2.png" alt="">
    <img src="<%=request.getContextPath()%>/resources/image/activity/weChatTaili/bg3.png" alt="">
    <img src="<%=request.getContextPath()%>/resources/image/activity/weChatTaili/bg4.png" alt="">
    <img src="<%=request.getContextPath()%>/resources/image/activity/weChatTaili/bg5.png" alt="">
    <img src="<%=request.getContextPath()%>/resources/image/activity/weChatTaili/bg6.png" alt="">
    <img src="<%=request.getContextPath()%>/resources/image/activity/weChatTaili/bg7.png" alt="">
    <img src="<%=request.getContextPath()%>/resources/image/activity/weChatTaili/bg8.png" alt="">
    <div class="deskCalenda_c">
        <%--4-领取成功--%>
        <div id="pack2" class="redpacket_two">
            <img src="<%=request.getContextPath()%>/resources/image/activity/weChatTaili/redpacket_two.png" alt="">
            <div class="redpacket_count money">
                <p><span>${result.data.amount }</span><sub>元</sub></p>
                <div><em>提示：</em>${result.data.month }月福利已领取，快去使用吧！</div>
            </div>
        </div>
    </div>
    <div class="deskCalenda_b">
        <img src="<%=request.getContextPath()%>/resources/image/activity/weChatTaili/bg_b.png" alt="">
        <div class="download_btn">
            <img id="openApp" src="<%=request.getContextPath()%>/resources/image/activity/weChatTaili/suc_btn.png" alt="">
        </div>
    </div>
</div>
<input id="code" type="hidden" value="${result.code }">
</body>
<script src="<%=request.getContextPath()%>/resources/js/activity/weChat/weChatTaili.js" type="text/javascript"></script>
<script type="text/javascript" src="https://f.moblink.mob.com/v2_0_1/moblink.js?appkey=2286828968fa0"></script>
<script>
    MobLink([
        {
        el: '#openApp',
        path: 'zzr/',
        params: {
        }
        }])
</script>
</html>