
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    request.setAttribute("verCode", "?r=Version2018061215");
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
    <title>奖励记录</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/invitation/jquery-weui.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/invitation/weui-mini.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/invitation/invitationList.css${verCode}"/>
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
<div class="wrap">
    <ul class="title">
        <li>奖励发放时间</li>
        <li>奖励来源</li>
        <li>奖励金额</li>
    </ul>
    <ul class="list">

    </ul>
    <div class="weui-loadmore" style="margin-bottom: 1rem;color:#999;font-size: .24rem">
        <i class="weui-loading"></i>
        <span class="weui-loadmore__tips">正在加载</span>
    </div>
    <div class="end">--加载完毕--</div>
</div>
<c:if test="${codeCampaign == 0}">
    <div class="btn going">邀请更多好友</div>
</c:if>
<c:if test="${codeCampaign == 1}">
    <div class="btn grey">活动已结束</div>
</c:if>
<c:if test="${codeCampaign == -1}">
    <div class="btn grey">活动未开始</div>
</c:if>
<div class="noData" style="display:none;">
    <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/noData.png" alt="">
    <p>暂未获得奖励</p>
</div>
<div class="overlay"></div>
<div class="FTF_POP">
    <h3 class="FTF_HEAD"></h3>
    <p class="get_tip">999元红包+12%新手标</p>
    <div class="qrCode">
        <img src="<%=request.getContextPath()%>/resources/image/activity/invitation/FTF_CODE.png" alt="">
    </div>
    <p class="scan_tip">扫描二维码即刻领取</p>
    <div class="POP_CLOSE"></div>
</div>
<div class="CODE_POP">
    <h3 class="code_title">恭喜您，复制成功！<br/><span class="code_tip">好友在注册时填写您的邀请码</span></h3>
    <div class="POP_CLOSE"></div>
</div>
<input type="hidden" value="${invitationCode}" id="invitationCode" />
<input type="hidden" value="${userId}" id="userId" />
<input type="hidden" id="codeCampaign" value="${codeCampaign}">
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/fastclick.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/invitation/jquery-weui.js"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/invitation/invitationList.js${verCode}"></script>
<script>
    var fDesTitleArr=[
        '送您999元，快快领取',
        '有情有利，共赚收益',
        '好友送来你的专属福利',
    ];
    var fDesArr=[
        '中再融稳健运行2年，20万用户的选择，安心可信赖！',
        '论理财靠谱，中再融国资平台可信赖。新用户专享12%年化收益 →',
        '您的好友送来了专属邀请！999元+12%年化收益，点击开启>>',
    ];
    function changeForApp(){
        $(".btn.going").off().on("click",function(){
            var desIndex=parseInt(3*Math.random());
            var userId = getadd('userId');
            var devUrl = 'http://m.duanhan.ren/invitation/toInvitationUser.do?userId='+userId;
            var prdUrl = 'https://m.zhongzairong.cn/invitation/toInvitationUser.do?userId='+userId;
            var devIcon = 'http://m.duanhan.ren/resources/image/activity/invitation/wxShare.png';
            var prdIc
            on = 'https://m.zhongzairong.cn/resources/image/activity/invitation/wxShare.png';
            var shareInfo = JSON.stringify({
                "title": fDesTitleArr[desIndex],
                "desc": fDesArr[desIndex],
                "shareUrl": prdUrl,
                "shareIco": prdIcon,
                "inviteCode":$("#invitationCode").val(),
                "platAry": ["WechatSession", "WechatTimeLine", "QQ"]
            });
            var shareInfo2 = JSON.stringify({
                "title": fDesTitleArr[desIndex],
                "desc": fDesArr[desIndex],
                "shareUrl": prdUrl,
                "shareIco": prdIcon,
                "inviteCode":$("#invitationCode").val(),
                "platAry": ["WechatSession", "WechatTimeLine", "QQ", "QRCode", "inviteCode"]
            });
            if(typeof anniversary.htmlShare != 'undefined' && anniversary.htmlShare instanceof Function) {
                anniversary.htmlShare(shareInfo);
            }

            if(typeof anniversary.htmlShareToPlats != 'undefined' && anniversary.htmlShareToPlats instanceof Function) {
                anniversary.htmlShareToPlats(shareInfo2);
            }
        })
    }
    //app获取app还是wap
    function getadd(flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
</script>
</body>
</html>


