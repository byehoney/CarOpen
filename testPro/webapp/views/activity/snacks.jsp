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
<title>你吃零食我买单—中再融</title>
<%@ include file="/views/inc/inc.jsp"%>
<script src="${basePath}/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<link rel="shortcut icon" href="http://m.zhongzairong.cn/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
<link rel="icon" href="http://m.zhongzairong.cn/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
<link href="${basePath}/resources/css/activity/snacks_project_wap.css" type="text/css" rel="stylesheet">
<script src="${basePath}/resources/js/activity/snacks_wap.js" type="text/javascript"></script>
<script src="${basePath}/resources/js/jwin/jwinsnack.js" type="text/javascript"></script>
<script src="${basePath}/resources/js/jquery.zclip.js" type="text/javascript"></script>

<script>
var pathUrl = '${pageContext.request.contextPath}';
		;(function(win,doc){
			win.onload=win.onresize=function(){
				var w=doc.documentElement.clientWidth;
				if(w>640){
					w=640;
				}else if(w<320){
					w=320;
				}
				doc.documentElement.style.fontSize=100*w/320+'px'};
		})(window,document);
		
</script>
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
<div class="snacks_wap_content">
	<!--零食wap banner-->
	<div class="snacks_wap">
		<img class="wap_banner_t" src="${basePath}/resources/image/static/activity/snacts/snacks_wap_banner.jpg"  alt=""/>
		<img class="wap_banner_b" src="${basePath}/resources/image/static/activity/snacts/snacks_wap_banner_b.jpg"  alt=""/>
		<i class="">中再融</i>
	</div>
	<!--零食wap banner end-->
	<div class="background_ioc">			
		<div class="stripes_images"></div>
		<!--三大重奖内容-->
		<div class="major_award_content">
			<div class="major_award_list">
				<ul class="clearfix">
					<!--第二重奖内容部分-->					
					<li class="major_award_red">
						<div class="major_award_con">
							<div>第一重大奖</div>
							<p>100元注册红包</p>
						</div>
						<b class="shadow_red_ioc"></b>
						<i class="red_envelope"></i>							
					</li>
					<!--第二重奖内容部分 end-->						
					<!--第二重奖内容部分-->                    
					<li class="major_award_green">
						<div class="major_award_con">
							<div>第二重大奖</div>
							<p>100元零食礼包</p>
						</div>
						<b class="shadow_green_ioc"></b>
						<i class="gift_box"></i>
					</li>
					<!--第二重奖内容部分 end--> 
					<!--第三重奖内容部分-->                   
					<li class="major_award_blue">
						<div class="major_award_con">
							<div>第三重大奖</div>
							<p>趣味储钱罐</p>
						</div>
						<b class="shadow_blue_ioc"></b>
						<i class="piggy_bank"></i>
					</li>
				<!--第三重奖内容部分 end--> 
				</ul>						
			</div>
			<div class="rung_pictures"></div>
			<div class="yellow_block"></div>
		</div>
		<c:if test="${userId != 0 }">
		<!--我的信息内容部分 --> 			
		<h3>我的信息<input type="hidden" value='${code }' id="code"/></h3>
		<div class="information_content">
			<div class="information_list">
				<ul class="clearfix">
					<li>注册时间</li>
					<li>目标投资金额</li>
					<li>实际投资金额</li>
					<li>当前状态</li>
				</ul>
			</div>
			<div class="information_list amount clearfix">
				<ul class="clearfix" id="mySnacksAward">
<!-- 					<li>2016-5-27</li>
					<li>500</li>
					<li>1000</li>	 -->				
				</ul>
				<div id="mySnacksAwardButton">
<!-- 					<div class="receive">
				    <span>点击领取</span>
						<p>零食大礼包</p>
						<i></i>
					</div> -->
				</div>
				
			</div>
		</div>
		<!--我的信息内容部分 end--> 
		<!--邀请奖励内容部分 --> 			
		<h3>邀请奖励</h3>
		<div class="information_content  invitation_content">
			<div class="information_list">
				<ul class="clearfix">
					<li>邀请时间</li>
					<li>手机号码</li>
					<li class="activity"><span>是否满足</span><p>零食礼包活动</p></li>
					<li>当前状态</li>
				</ul>
			</div>
			<div class="information_list amount clearfix">
			       <div class="listbox">
					<ul class="clearfix" id="MyInvestAwardList">
	<!-- 					<li>2016-5-27</li>
						<li>12345678910</li>
						<li>是</li>																				
						<li>2016-5-27</li>
						<li>12345678910</li>
						<li>是</li>	 -->				
					</ul>
					</div>
				<div class="snack_bags" id="MyInvestAwardButton">
					<!-- <span>点击领取</span>
					<p>趣味存钱罐</p>
					<i></i> -->
				</div>					
			</div>				
		</div>
		<div class="decline_button"></div>
		<div class="investment qtz">去投资</div>
		</c:if>
		
		
		
		<c:if test="${userId == 0 }">
		  <!--未登录-->
		    <div class="investment information investmentrs">登录查看我的信息</div>
		   <!--未登录end-->
		</c:if>
		
		<div class="activity_rules">
			<h4>活动规则：</h4>
			<p>1.活动时间:2016年6月30日至2016年7月31日；</p>
			<p>2.参与活动资格：通过本页面注册的用户；</p>
			<p>3.活动期间内，投资满500元，即可领取零食大礼包一份，每个用户仅可领取一份大礼包;</p>
			<p>4.满足礼包资格的用户，再邀请两个好友投资500元，即可获取趣味存钱罐一个；</p>
			<p>5.礼包将于领取后的5个工作日内发放；</p>
			<p>6.相同手机号、身份证号视为同一用户，只发放一次奖励。活动过程中，如发现违规行为（恶意注册大量帐号，使用作弊程序等），中再融将取消该用户的奖励资格；</p>
			<p>7.因库存原因，礼包内零食可能会有变化，请以实物为准；</p>
			<p>8.本次活动最终解释权归中再融所有。</p>
		</div>
		<!--邀请奖励内容部分 end--> 
		<!--三大重奖内容 end-->
	</div>		
</div>

<!--城市内容 -->
	<div class="address" id="LoanActivitySnacks" >
		<p class="clearfix select">选择地址<i onclick='closeJWin("LoanActivitySnacks")'>×</i></p>
		<div class="default_address_con">
			<p class="default_address"><input name="address" type="radio" value="0" checked="checked" />默认地址</p>
			<input type="text" class="txt" value="${userAddress.provinceText}&nbsp;${userAddress.cityText}&nbsp;${userAddress.districtText}&nbsp;${userAddress.address}"/>
			<input type="hidden" class="txt" id="addressId" value="${userAddress.addressId}"/>
			<p class="default_address"><input name="address" type="radio" value="1" />其他地址</p>
			<div class="region">
				<ul class="clearfix">
					<li class="clearfix">
						<select id="province" name="province" >
							<option value="-1" selected="selected">请选择</option>
								<c:forEach items="${citys }" var="area">
									<option value="${area.regionId }" >${area.name }</option>
								</c:forEach>				
						    </select>
						<span>省</span>
					</li>
					<li class="clearfix">
						<select id="mycity" name="city">
							<option value="-1" selected>请选择</option>					
						</select>
						<span>市</span>
					</li>
					<li class="clearfix">
						<select id="district" name="district"  >
												<option value="-1" selected>请选择</option>
						</select>
						<span>区</span>
					</li>
				</ul>
			</div>
			<input type="text" class="txt" id="addressText" value="请输入详细地址"/>
			<p class="selected"><i>*</i>地址选定后不可修改哟</p>
			<p class="determine" id="confirmButton">确 定</p>
		</div>
	</div>	
<!--城市内容 end-->	
	
<!--底部-->
<div class="wp_footer">
   <p>中再融(北京)科技有限公司 版权所有</p>
   <p>京ICP备16002418号-1</p>
</div>
</body>
</html>