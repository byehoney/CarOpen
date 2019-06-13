
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
    <title>活动规则</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <style type="text/css">
        html,body{
            width: 100%;
            height: 100%;
            background-color: #ffefd2;
        }
        .activity_rule{
            padding:.24rem .35rem 0;
        }
        .activity_rule ol {
            padding-left: .22rem;
            text-align: justify;
        }
        .activity_rule li{
            list-style-type: decimal;
            font-size: .28rem;
            color:#8c3d32;
            line-height: .42rem;
            margin-bottom: .12rem;
        }
    </style>
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
<div class="activity_rule">
    <ol>
        <li>活动时间：<span class="activeDay">${startTime}-${endTime}</span>；</li>
        <li>活动期间，邀请好友首次投资，可获得受邀好友首投金额的收益*100%的现金奖励；</li>
        <li>受邀好友在首次投资后15天内，发生的每笔复投，邀请人均可获得每笔复投金额收益*20%的现金奖励；</li>
        <li>邀请每位好友的投资奖励上限为500元，超出部分不计算奖励；</li>
        <li>之前邀请的好友未发生首投，在活动期间进行首投和复投，邀请人也可获得活动奖励；</li>
        <li>邀请人获得的好友投资收益奖励仅包含投资项目基础收益，其他投资奖励不计算在内；</li>
        <li>邀请奖励以现金红包的形式实时发放，可在“我的账户-我的红包”进行兑换。</li>
    </ol>
</div>
<input type="hidden" id="startTime" value="${startTime}">
<input type="hidden" id="endTime" value="${endTime}">
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script>
    $(function(){
        var startTime = $("#startTime").val().replace('年','.').replace('月','.').replace('日','');
        var endTime =$("#endTime").val().replace('年','.').replace('月','.').replace('日','');
        var startY = startTime.split('.')[0];
        var startM = parseInt(startTime.split('.')[1]);
        var startD = parseInt(startTime.split('.')[2]);
        var endY = endTime.split('.')[0];
        var endM = parseInt(endTime.split('.')[1]);
        var endD = parseInt(endTime.split('.')[2]);
        $(".activeDay").html(startY+'年'+startM+'月'+startD+'日-'+endY+'年'+endM+'月'+endD+'日');
    })
</script>
</body>
</html>

