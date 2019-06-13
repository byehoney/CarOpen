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
    <title>新手专享15%</title>
    <%@ include file="/views/inc/inc.jsp"%>
    <link rel="stylesheet" href="${basePath}/resources/css/activity/redPacketsdone.css">
    <script src="${basePath}/resources/js/common/jweixin-1.0.0.js"></script>
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
    </script>
</head>
<body>
<div class="page">
    <div class="backbg01">
        <a href="javascript:;">
            <img src="${basePath}/resources/image/activity/redPacketsdone/logo.png" alt="中再融">
        </a>
    </div>
    <div class="backbg02"></div>
    <div class="backbg03">
        <a class="btn" href="http://a.app.qq.com/o/simple.jsp?pkgname=com.zzr">马上下载app<i>（11.8M）</i>
        </a>
        <a href="${basePath}/loan/detail/${loanId}.do" class="goindex">直接进入新手专享</a>
    </div>
    <div class="backbg04"></div>
</div>
</body>
<script>
    // 微信分享
    var shareUrl="https://m.zhongzairong.cn/register/toregisterpage.do";
    var arrtitle="点击领取999元红包！手慢无！";
    var arrdesc="好友喊你领红包";

    $.ajax({
        type : "POST",
        dataType:"JSON",
        url : environment.basePath + "/WxShare.do",
        async : false,
        cache : false,
        data : {'shareUrl':"https://m.zhongzairong.cn/redpacketsdone.do"},
        success : function(data) {
            wx.config({
                debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                appId: data.appId, // 必填，公众号的唯一标识
                timestamp: data.timestamp, // 必填，生成签名的时间戳
                nonceStr: data.nonceStr, // 必填，生成签名的随机串
                signature: data.signature,// 必填，签名，见附录1
                jsApiList: ['onMenuShareTimeline','onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
            });
        }
    });
    wx.ready(function(){
        //分享朋友圈
        wx.onMenuShareTimeline({
            title:  arrtitle,// 分享标题
            link: shareUrl, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: 'https://m.zhongzairong.cn/resources/image/common/wxShare.png', // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
        // 分享朋友
        wx.onMenuShareAppMessage({
            title:arrtitle, // 分享标题
            desc:arrdesc, // 分享描述
            link: shareUrl, // 分享链接
            imgUrl: 'https://m.zhongzairong.cn/resources/image/common/wxShare.png', // 分享图标
            type: '', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
    });

</script>
</html>