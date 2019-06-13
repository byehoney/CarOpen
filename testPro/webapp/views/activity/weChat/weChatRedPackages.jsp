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
    <title>领取0.5%加息劵</title>
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
    <div class="banner_cont">
        <img src="<%=request.getContextPath()%>/resources/image/activity/weChat/draw_t.png" alt=""/>
        <img src="<%=request.getContextPath()%>/resources/image/activity/weChat/draw_b.png" alt=""/>
    </div>
    <div class="follow_Wechat_cont verify">
        <div class="number_cont step1">
            <h3>输入手机号领取加息券</h3>
            <input id="mobile_num" class="txt" type="text" placeholder="请输入手机号码" maxlength="11">
            <div class="errormsg errorStep1"></div>
            <div class="next_step Firststep">下一步</div>
        </div>
        <div class="number_cont step2" style="display:none">
            <ul>
                <li class="clearfix">
                    <input id="img_code" class="verificationCode" type="text" placeholder="请输入图形验证码" maxlength="4">
                    <img id="img_code_pic" src="<%=request.getContextPath()%>/userInfo/getCode.do" alt="图片验证码">
                </li>
                <li class="clearfix">
                    <input id="msg_code" class="verificationCode" type="text" placeholder="请输入短信验证码" maxlength="6">
                    <span class="pop_msg_count">发送短信</span>
                </li>
            </ul>
            <div class="errormsg errorStep2"></div>
            <div class="next_step draw_btn">领取加息券</div>
        </div>
        <p>提示：每个用户只能领取1次，不可重复领取。</p>
        <div class="logo">
            <img src="<%=request.getContextPath()%>/resources/image/activity/weChat/logo.png" alt=""/>
        </div>
        <p>中再生协会唯一指定互联网金融平台</p>
    </div>

</div>
<!--弹窗-->
<div class="overlay" style="display:none;"></div>
<!--打开app立即使用-->
<div class="employ_pop has" style="display:none;">
    <div class="pop-up_cont">
        <p>您已领取过了哦!</p>
        <p>关注微信平台</p>
        <p>更多福利等你来~</p>
        <div id="open" class="open_app">
            <a href="javacript:;"></a>
        </div>
    </div>
</div>
<div class="employ_pop hasNot" style="display:none;">
    <div class="rate_coupon"></div>
    <div id="openApp" class="open_app">
        <a href="javacript:;"></a>
    </div>
</div>
</body>
<script src="<%=request.getContextPath()%>/resources/js/activity/weChat/weChat.js" type="text/javascript"></script>
<script type="text/javascript" src="https://f.moblink.mob.com/v2_0_1/moblink.js?appkey=2286828968fa0"></script>
<script>
    MobLink([
        {
        el: '#openApp',
        path: 'zzr/',
        params: {
        }
        },
        {
        el: '#open',
        path: 'zzr/',
        params: {
        }
    }])
</script>
</html>