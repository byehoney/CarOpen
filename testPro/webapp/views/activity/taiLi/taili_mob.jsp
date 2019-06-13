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
        <%--3-输入手机框页--%>
        <div id="pack1" class="redpacket">
            <img src="<%=request.getContextPath()%>/resources/image/activity/weChatTaili/redpacket_one.png" alt="">
            <div class="redpacket_count">
                <p><span>${result.data.month }</span><sub>月</sub></p>
                <div><em>提示：</em> 本红包仅限当月领取，每个用户只可领取一次。</div>
            </div>
        </div>
    </div>
    <div class="deskCalenda_b">
        <img src="<%=request.getContextPath()%>/resources/image/activity/weChatTaili/bg_b.png" alt="">
        <div class="download_btn">
            <img id="popupBtn" src="<%=request.getContextPath()%>/resources/image/activity/weChatTaili/first_btn.png" alt="">
        </div>
    </div>
</div>
<div class="overlay"></div>
<div class="errormsg"></div>
<div class="redpacket_pup">
    <div class="close_btn"></div>
    <div class="deskCalenda_pupCount">
        <h3>验证手机号，领取红包</h3>
        <div id="pop01" class="redpacketDiv w430">
            <div class="code clearfix">
                <input id="mobile_num" class="txt fl" type="text" placeholder="请输入您的手机号码" maxlength="11">
            </div>
        </div>
        <div id="pop02" class="redpacketDiv" style="display:none">
            <div class="code clearfix">
                <input id="img_code" class="picture_code fl" type="text" placeholder="图片校验码" maxlength="4">
                <img id="img_code_pic" src="<%=request.getContextPath()%>/userInfo/getCode.do" alt="图片验证码">
            </div>
            <div class="code clearfix">
                <input id="msg_code" class="picture_code fl" type="text" placeholder="短信校验码" maxlength="6">
                <span id="pop_msg_count" class="send fr">发送短信验证码</span>
            </div>
        </div>
        <div id="nextStep" class="next_step"><a href="javascript:;">下一步</a></div>
        <div id="receive" class="next_step" style="display:none;"><a href="javascript:;">领取红包</a></div>
    </div>
</div>
<input id="code" type="hidden" value="${result.code }">
<input id="month" type="hidden" value="${result.data.month }">
<c:if test="${result.code == 0}">
    <input id="openId" type="hidden" value="${result.data.openId }">
    <input id="nickName" type="hidden" value="${result.data.nickName }">
    <input id="headImgUrl" type="hidden" value="${result.data.headImgUrl }">
</c:if>
</body>
<script src="<%=request.getContextPath()%>/resources/js/activity/weChat/weChatTaili.js" type="text/javascript"></script>
</html>