<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>邀友投资赚金条</title>
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
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
  <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
  <script src="<%=request.getContextPath()%>/resources/js/common/jweixin-1.0.0.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/lanPage.css${verCode}"/>
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

<body ontouchstart>
<div class="main" style="display: none">
  <div class="content">
    <div class="shareArrow"></div>
    <div class="plate">
      <p>
        有福同享，有钱同赚。邀请好友投资即可兑大奖，最高可兑20g金条！另您的好友还可享100元红包+15%年化收益项目哦~
      </p>
      <p>如此丰厚的福利，赶紧邀友一起赚钱狂欢吧！</p>
    </div>
  </div>
</div>
<p class="noWeixin">请使用微信扫一扫</p>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/fastclick.js"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
    function isWeiXin() {
        var ua = window.navigator.userAgent.toLowerCase();
        if (ua.match(/MicroMessenger/i) == 'micromessenger') {
            return true;
        } else {
            return false;
        }
    }
    if(isWeiXin()){
        console.log(" 是来自微信内置浏览器");
        $('.main').show();
    }else{
        $('.noWeixin').show();
        console.log("不是来自微信内置浏览器")
    }
    var yqm=getUrlParams('invitecode');
    // 微信分享
    var signUrl=location.href.split('#')[0];
    var shareUrl='https://m.zhongzairong.cn/redpackets.do?yqm='+yqm;
//    var shareUrl='http://1866909xg0.iask.in/redpackets.do?yqm='+yqm;
    var arrtitle=['好友送你100元红包，点击领取','狂欢双11，6重壕礼送不停！','奉上100元红包证明我在关心你！','20g金条送给你，一起来狂欢啊！','我在中再融投资很久了，给你准备了超值的奖励！','您收到一份11.11狂欢礼包，快看看是什么！'];
    var arrdesc=['新手专享15%年化收益！诚心推荐中再融（已签约存管），国资平台安全可信赖！','唯有壕礼暖人心，金条、电视、红包...新手15%的年化收益，请收下中再融这份心意吧！','我一直在安全可信赖的国资平台（已签约存管）中再融理财，特邀你一起来赚钱！新用户即送100元红包哦~','11.11投资即送金条、电视、扫地机...是真的有这样的好事呢','100元红包+15%年化收益+无限量壕礼，就差你了','厉害了！每日加息2%，新手还可享15%年化收益，戳我领走→'];
    function GetRandomNum(Min,Max){
        var Range = Max - Min;
        var Rand = Math.random();
        return(Min + Math.round(Rand * Range));
    }
    var sj = GetRandomNum(0,5);
    $.ajax({
        type : "POST",
        dataType:"JSON",
        url : basePath + "/WxShare.do",
        async : false,
        cache : false,
        data : {'shareUrl':signUrl},
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
            title:  arrtitle[sj],// 分享标题
            link: shareUrl, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: 'https://m.zhongzairong.cn/resources/image/activity/ruffian/wxShare.png', // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
        // 分享朋友
        wx.onMenuShareAppMessage({
            title:arrtitle[sj], // 分享标题
            desc:arrdesc[sj], // 分享描述
            link: shareUrl, // 分享链接
            imgUrl: 'https://m.zhongzairong.cn/resources/image/activity/ruffian/wxShare.png', // 分享图标
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

    function getUrlParams(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
</script>
</body>
</html>

