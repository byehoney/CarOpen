<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <title>好友喊你一起抢金条</title>
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
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/letter.css${verCode}"/>
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
<div class="main">
  <div class="content">
    <div class="letterBox">
      <h3>来自好友的一封信</h3>
      <p class="hello">亲爱的朋友：</p>
      <div class="letterContent">
        <p>有好事从来都是第一个想起你的！我正在参加中再融“双11狂欢盛典”活动，投资即可兑换 20g金条、55寸电视、扫地机...</p>
        <p>活动太给力，快接受我的邀请一起来赚钱吧！</p>
        <p>你的好友<span class="fTel">135****3456</span></p>
      </div>
    </div>
    <div class="acpBtn">
      <a href="javascript:;">接受邀请</a>
    </div>
  </div>
</div>
<input type="hidden" value="${result.data.mobile}" id="mobile">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/fastclick.js"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script>
  $(function(){
      var mobile=$("#mobile").val();
      var mobileStr=mobile.substring(0,3)+'****'+mobile.substring(7,11);
      $(".fTel").html(mobileStr);

      //接受邀请
      $(".acpBtn").on("click",function(){
          window.location.href=basePath+'/ruffian/toRuffian.do?flag=wap';
      });

      //app获取app还是wap
      function getadd(flag){
          var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
          var r = window.location.search.substr(1).match(reg);
          if(r!=null)return  unescape(r[2]); return null;
      }
  })
</script>
</body>
</html>
