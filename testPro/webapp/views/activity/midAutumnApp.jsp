<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<%
double version = Math.random(); 
%>
<head>
<meta charset="UTF-8">
<title>情满中秋,豪礼巨献</title> 
<%@ include file="/views/inc/inc.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${basePath}/resources/css/activity/midAutumn.css?v=20160912">
<script type="text/javascript">
	var environment = {basePath : '${basePath}'};
</script>
</head>
<body class="mid-autumn">
	<div class="banner"></div>
    <div class="main">
        <section>
            <div class="back-top clearfix">
                <i class="top-l fl"></i>
                <i class="top-r fr"></i>
            </div>
            <div class="back-bot clearfix">
                <i class="bot-l fl"></i>
                <i class="bot-r fr"></i>
            </div>
            <header>
                <h3>
                    <span class="text-icon-l"></span>
                    <span>第&nbsp;一&nbsp;重</span>
                    <span class="text-icon-r"></span>
                </h3>
                <p>投资满额送豪礼</p>
            </header>
            <ul>
                <li>
                    <img src="${basePath}/resources/image/activity/mid_autumn/jd.png" alt="" title=""/>
                    <p>20000元≤累计投资金额＜50000元</p>
                    <p>送<span>100元京东卡</span></p>
                </li>
                <li>
                    <img src="${basePath}/resources/image/activity/mid_autumn/crabs.png" alt="" title=""/>
                    <p>50000元≤累计投资金额＜100000元</p>
                    <p>送<span>大闸蟹礼盒</span></p>
                </li>
                <li>
                    <img src="${basePath}/resources/image/activity/mid_autumn/crabs_jd.png" alt="" title=""/>
                    <p>累计投资金额≥100000元</p>
                    <p>送<span>300元京东卡+大闸蟹礼盒</span></p>
                </li>
            </ul>
        </section>
        <p class="tip">图片仅供参考以实物为准</p>
        <section class="two-sec">
            <div class="back-top clearfix">
                <i class="top-l fl"></i>
                <i class="top-r fr"></i>
            </div>
            <div class="back-bot clearfix">
                <i class="bot-l fl"></i>
                <i class="bot-r fr"></i>
            </div>
            <header>
                <h3>
                    <span class="text-icon-l"></span>
                    <span>第&nbsp;二&nbsp;重</span>
                    <span class="text-icon-r"></span>
                </h3>
                <p>APP投资送现金</p>
            </header>
            <p class="rule">活动期间，每天在APP上进行的首笔投资，按照投资项目期限及金额获得年化0.5%的现金红包。</p>
            <div class="clearfix example">
                <p class="fl">举个例子:</p>
                <p class="fr">小明在9月16日用手机APP投资了一笔20000元，投资期限是60天，那么，小明可以获得的现金奖励是：20000元*0.5%*60/365=16.44元。</p>
            </div>
        </section>
        <section class="thr-sec">
            <header>
                <h3>
                    <span class="text-icon-l"></span>
                    <span>温馨提示</span>
                    <span class="text-icon-r"></span>
                </h3>
            </header>
            <ul>
                <li>活动时间：9月13日-9月18日，所有用户均可参与；</li>
                <li>现金奖励将在活动结束后3个工作日内以红包形式发放，点击红包即可兑现；</li>
                <li>实物奖励将在活动结束后5个工作日内进行联系、邮寄（您可提前在"我的账户-个人资料"页面中添加收货人信息） ；</li>
                <li>大闸蟹礼盒内共8只蟹，4只公蟹4.0-4.5两/只，4只母蟹3.0-3.5两/只；</li>
                <li>新手项目不参与本活动；</li>
                <li>本活动最终解释权归中再融所有。</li>
                
            </ul>
        </section>
    </div>
</body>
<!--Google统计代码-->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75483023-1', 'auto');
  ga('send', 'pageview');
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

<!--摩比万思DSP统计代码-->
<script src="//dsp.svc.mobivans.com/track/js/44c38924-d3dd-49a7-b94a-a622a415f8d6"></script>
<!--CNZZ监控代码-->
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan style='display:none;' id='cnzz_stat_icon_1259823916'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/z_stat.php%3Fid%3D1259823916' type='text/javascript'%3E%3C/script%3E"));</script>
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
</html>
