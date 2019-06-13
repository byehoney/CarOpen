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
<title>双旦活动</title>
<%@ include file="/views/inc/inc.jsp"%>
<link rel="stylesheet" href="${basePath}/resources/css/activity/christmaswap.css">
<script src="${basePath}/resources/js/activity/christmaswap.js"></script>
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
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
 	    <div class="page">
		    <div class="top_banner">
		    	<div class="top_banner01"></div>
		    	<div class="top_banner02"></div>
		    	<div class="top_banner03">
		    		<div class="act_date">2016年12月20日—2017年01月03日</div>
		    	</div>
		    </div>
    	<div class="act_con02">
    			<div class="w596">
	    			<ul class="act_con02_lis clearfx">
	    				<li class="lis_item01">双旦加息</li>
	    				<li class="lis_item02">投资送好礼</li>
	    				<li class="lis_item03">邀请拿现金</li>
	    			</ul>

	    			<div class="white_table">
	    				<div class="white_table_tit table_tit01"></div>
	    				<div class="white_table01">
		    				
		    				<div class="act_con02_card">
		    					<h3 class="act_con02_title">新手专享，加息10%</h3>
		    					<div class="act_con02_per clearfix">
		    						<div class="strong_per">
		    							<span class="bold_per">17%</span>
		    							<span class="per_txt">年化收益率</span>
		    						</div>
		    						<div class="nor_date">
		    							<span class="date_per">30天</span>
		    							<span class="per_txt">项目期限</span>
		    						</div>
		    					</div>
		    					<div class="act_con02_money">
		    						50元起投!
		    					</div>
		    					<a href="${basePath}/loan/detail/${loanId}.do" class="act_con02_link">
		    						点击抢购
		    					</a>
		    				</div>
		    				<i class="btn_icon01"></i>
		    				<i class="btn_icon02"></i>
		    				<i class="btn_icon03"></i>
		    				<i class="btn_icon04"></i>	
	    				</div>
	    			</div>					
    			</div>
				<a href="http://www.wdzj.com/zhuanti/wap2016christmas/" target="_blank" class="go_main"></a>	
    	</div>
    	<div class="act_con03">
    		<div class="greenline"></div>
    		<div class="w596">
    		<!-- 投资送好礼 -->
    			<div class="white_table">
    				<div class="white_table_tit table_tit02"></div>
	    			<div class="white_table02">
	    				<div class="act_con03_bd clearfx">
	    					<div class="ecard fl">
	    						<h3>活动期间：</h3>
	    						<div class="ecard_img"></div>
	    					</div>
	    					<div class="ecard_letter fl">	
	    						<div class="ecard_let ecard_let01">
	    							<p class="ecard_ert">累计投资金额满&nbsp<em>2万元</em></p>
	    							<p class="ecard_limdate">（限项目期限＞60天）</p>
	    						</div>
	    						<div class="ecard_let_j"></div>
	    						<div class="ecard_let ecard_let02">
	    							<p class="ecard_ert">即可获得<em>200元</em></p>
	    							<p class="ecard_limdate">京东E卡一张</p>
	    						</div>
	    						<div class="ecard_let_j"></div>
	    						<a href="${basePath}/loan/list.do">去投资</a>
	    					</div>
	    				</div>
	    				<i class="btn_icon01"></i>
		    			<i class="btn_icon02"></i>
		    			<i class="btn_icon03"></i>
		    			<i class="btn_icon04"></i>	
	    			</div>  
    			</div>
    		<!-- 邀请拿现金 -->
				<div class="white_table03">
					<div class="white_table_tit table_tit03"></div>		
	    				<div class="white_table03_bd">
	    					<p class="imp_msg">活动期间，每成功邀请一位好友即可获得<br><em></em>&nbsp现金，多邀多得，不设上限！</p>
	    					<p class="invs_msg">（成功邀请的定义：被邀请好友使用您的邀请码进行注册且首笔投资金额满5000元）</p>
	    					<div class="invs_card">
	    						<div class="example_txt"></div>
	    						<p>小融在活动期间共邀请了6位好友，好友们都使用小融的邀请码注册且首笔投资均是5000元。那么，小融可以获得300元现金！</p>
	    						<div class="peple_img"></div>
	    					</div>
	    					<a href="https://www.zhongzairong.cn/invitation.shtml">去邀请</a>
	    					<i class="btn_icon01"></i>
			    			<i class="btn_icon02"></i>
			    			<i class="btn_icon03"></i>
			    			<i class="btn_icon04"></i>
	    			  	</div>
    				</div>  

    			</div>
    	</div>

		<div class="act_endrole">
		<div class="redline"></div>
				<h3>· 活动规则 ·</h3>
				<div class="clearfx"><i></i><p>活动时间：2016年12月20日-2017年1月3日；</p></div>
				<div class="clearfx"><i></i><p>“双旦加息，诚意满满”仅限未在平台投资过的用户和新注册用户参与，每人限投一次；</p></div>
				<div class="clearfx"><i></i><p>京东E卡每人限得一张，将在活动结束后5个工作日内联系中奖用户并以短信电子码方式发送；</p></div>
				<div class="clearfx"><i></i><p>“邀请拿现金”奖励，将在活动结束后5个工作日内以现金红包形式发放至中再融账户，点击红包即可兑现；</p></div>
				<div class="clearfx"><i></i><p>理财产品由中再融提供，网贷之家不对用户的理财行为承担任何法律责任。活动解释权归中再融所有， 如有疑问，请咨询客服热线：4001-156-157。</p></div>
			<div class="end_rose"></div>
		</div>
    </div>
</body>
</html>