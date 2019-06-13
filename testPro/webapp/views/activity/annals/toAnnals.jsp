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
    <title>融布斯 2017 年度人物全记录</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/annals/annals.css${verCode}"/>
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
<div class="docWrapper">
    <div class="annalPage">
        <div class="annalHeader">
            <img class="topImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/headerTit.png">
        </div>
        <div class="annalCont">
            <img class="singPic" src="<%=request.getContextPath()%>/resources/image/activity/annals/singPic0.png">
            <c:if test="${loginStatus!=1}">
                <img class="footTips" src="<%=request.getContextPath()%>/resources/image/activity/annals/regPrize.png" alt="">
            </c:if>
        </div>
        <div class="annalFooter">
            <c:if test="${loginStatus!=1}">
                <div class="register_btn">
                    <a href="javascript:;">登录/注册</a>
                </div>
                <div class="circusee_btn">
                    <a href="javascript:;">去围观</a>
                </div>
            </c:if>
            <c:if test="${loginStatus == 1}">
                <div class="check_btn">查看我的2017年度账单</div>
            </c:if>
        </div>
    </div>
    <div class="overlay"></div>
    <div class="errormsg"></div>
    <div class="redpacketPup">
        <div id="phoneSec" class="redpacketDiv">
            <div class="code clearfix">
                <input id="mobile_num" class="txt fl" type="text" placeholder="请输入您的手机号码" maxlength="11">
            </div>
            <div class="next_step">
                <a href="javascript:;">下一步</a>
            </div>
        </div>
        <div id="msgSec" class="redpacketDiv" style="display: none;">
            <div class="code clearfix">
                <input id="img_code" class="picture_code fl" type="text" placeholder="请输入图片校验码" maxlength="4">
                <img id="img_code_pic" src="<%=request.getContextPath()%>/userInfo/getCode.do" >
            </div>
            <div class="code clearfix">
                <input id="msg_code" class="picture_code fl" type="text" placeholder="请输入短信验证码" maxlength="6">
                <span id="pop_msg_count" class="send fr">发送验证码</span>
            </div>
            <div class="go_step">
                <a href="javascript:;">下一步</a>
            </div>
        </div>
    </div>
    <div class="noWeixin">请在微信浏览器中打开</div>
</div>
<input id="loginStatus" type="hidden" value="${loginStatus }">
<input id="flag" type="hidden" value="${flag }">
<input id="userId" type="hidden" value="${userId }">
<input id="openid" type="hidden" value="${openid }">
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/annals/fastclick.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/annals/annalsLogin.js" type="text/javascript"></script>

<script>
    FastClick.attach(document.body);//绑定fastclick
    var flag=$('#flag').val();
    function isWeiXin() {
        var ua = window.navigator.userAgent.toLowerCase();
        if (ua.match(/MicroMessenger/i) == 'micromessenger') {
            return true;
        } else {
            return false;
        }
    }
    if(flag=='wx'){
        if(isWeiXin()){
            console.log(" 是来自微信内置浏览器");
            $('.annalPage').show();
        }else{
            $('.noWeixin').show();
            console.log("不是来自微信内置浏览器")
        }
    }else {
        $('.annalPage').show();
    }

    var loginStatus=$('#loginStatus').val();
    if(loginStatus==1){
        $('.annalCont').css('height','68%');
        $('.annalFooter').css('height','10%');
        $('.singPic').css('height','90%');
    }
    function changeForApp() {
        $('.register_btn').unbind('click').click(userLogin);
    }
    // 用户登录状态
    function userLogin(){
        anniversary.userLogin();
    }
</script>
</body>
</html>