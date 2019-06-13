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
<title>中再融—狂欢周年庆：正青春，共前行！百万现金，人人 有份！</title>
<%@ include file="/views/inc/inc.jsp"%>
<script src="${basePath}/resources/js/activity/anniversary.js${verCode }"></script>
<link rel="stylesheet" href="${basePath}/resources/css/activity/anniversary.css${verCode }">
<!--PC百度统计代码-->
<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?455a255e408c3cc82f67b07d05532d54";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
	
	var hideweChat = function (){
		$("#inv_code,.alertmask").hide();
		}
	var hideQRcode = function(){
		$('.wxewm').attr({src: "https://m.zhongzairong.cn/resources/image/activity/anniversary/qrcode.png" });
		$('#QRtxt').html('点击左图立即转发给好友');
	}
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
    var basePath_ = "<%=request.getContextPath()%>";
</script>
</head>
<body>
 	<div class="anniversary">
		<!--banner-->
		<div class="banner">
			<div class="banner_t"></div>
			<div class="banner_b"></div>			
		</div>
		<!--banner end-->
		
		<div class="stars">
			<!--狂欢周年庆灯-->
			<div class="lantern">
				<div class="lantern_icon lantern_active lantern_switch"></div>
			</div>
			<!--狂欢周年庆灯 end-->
			<div class="diamond">
				<div class="small investment_one"></div>
			</div>
			<div class="page_global">
				<div class="page page_cont">					
					<!--投资活动-->
					<div class="investment_list investment_content">
						<div class="title">
						<input type="hidden" id="uId" value="${userId }">
							<!-- <c:if test="${userId != '' }"><strong id="turnOver">¥<em></em></strong></c:if>  -->
							<div class="small cash"></div>
							<p>按活动期间的整体交易额计算，中再融将</p>
							<p>提供5‰的金额作为奖励基金</p>
							<p>参与投资且累计投资金额≥1000元的所有用户</p>
							<p>平分该奖励！</p>
							<p>奖励基金上限为100万元</p>
							<c:if test="${userId != '' }">
								<p class="fund">
								<span>当前奖励基金：</span>
								<em id="bonusAmount"></em>
								</p>
								<p class="fund">
									<span>当前平分金额：</span>
									<em id="splitAmount"></em>							
								</p>
								
							</c:if> 
						<c:if test="${userId == '' }"><c:if test="${nowDate < 1493049600000 }"><a class="immediate" href="javascript:;" onclick="var _host = basePath_ , encodeUrl = encodeURIComponent(window.location.href);
						window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;">立即投资</a></c:if></c:if>
						 <c:if test="${userId == '' }"><c:if test="${nowDate > 1493049600000 }"><a class="immediate" href="javascript:;" onclick="alert('活动已结束！')">立即投资</a></c:if></c:if>
                        <c:if test="${userId != '' }"><c:if test="${nowDate < 1493049600000 }"><a class="immediate" href="<%=request.getContextPath()%>/loan/list.do">立即投资</a></c:if></c:if>
                        <c:if test="${userId != '' }"><c:if test="${nowDate > 1493049600000 }"><a class="immediate" href="javascript:;" onclick="alert('活动已结束！')">立即投资</a></c:if></c:if>
						</div>
					</div>
					<!--投资活动 end-->
					<div class="investment_bg">
						<div class="small investment_two"></div>
					</div>
					<!--抽奖送现金活动-->
					<div class="investment_list prize_pic">
						
						<div class="rules">						
							<div class="rules_left">
								<b class="small directory"></b>
								<span class="small prompt_title "></span>
								<div class="details_list">
									<ul class="details_left clearfix">
										<li>
											<p>累计投资每满</p>
											<span>
												<strong>5000</strong>元
											</span>
										</li>
										<li>
											<p>投资天数</p>
											<span>
												<strong>≥50</strong>天
											</span>											
										</li>
										<li>
											<p>获得</p>
											<span>
												<strong>1</strong>次抽奖
											</span>
										</li>
									</ul>
								</div>							
							</div>
								
							
							<div class="clearfix envelope_details">							
								<div class="envelope_left">
									<p>多投多得，不限抽奖次数</p>
									<div class="pic_list">
										<img src="<%=request.getContextPath()%>/resources/image/activity/anniversary/envelope_1.png" alt=""/><img src="<%=request.getContextPath()%>/resources/image/activity/anniversary/envelope_2.png" alt=""/><img src="<%=request.getContextPath()%>/resources/image/activity/anniversary/envelope_3.png" alt=""/><img src="<%=request.getContextPath()%>/resources/image/activity/anniversary/envelope_4.png" alt=""/><img src="<%=request.getContextPath()%>/resources/image/activity/anniversary/envelope_5.png" alt=""/><img src="<%=request.getContextPath()%>/resources/image/activity/anniversary/envelope_6.png" alt=""/>
									</div>									
									<div class="small chest"></div>
										<c:if test="${userId == '' }"><p>登录后可查看抽奖次数</p></c:if>
										<c:if test="${userId != '' }"><p>当前可用抽奖次数为：<font id="tickcount">${tickCount}</font>次</p></c:if>								
								</div>
																 							
							</div>
							<div class="draw">
								<a href="javascript:;" class="small draw_icon  draw_big draw_little"></a>
								<a href="javascript:" class="small draw_icon smoke_big smoke_little"></a>
							</div>
							<div class="line">
								<span></span>
								<b></b>
								<span></span>
							</div>
																				
							<div class="rules_left">
								<b class="small directory rates_icon"></b>
								<span class="small prompt_title prompt_icon"></span>
								<div class="details_list">
									<ul class="details_left clearfix">
										<li>
											<p>单笔投资满</p>
											<span>
												<strong>5000</strong>元
											</span>
										</li>
										<li>
											<p>投资天数</p>
											<span>
												<strong>≥50</strong>天
											</span>											
										</li>
										<li>
											<p>获得现金</p>
											<span>
												<strong>1</strong>%年化
											</span>
										</li>
									</ul>
								</div>							
							</div>
							<div class="small radio">
								<p class="example">举个例子</p>
								<div>
									<p>小融活动期间，单笔投资了5万元90天项目，单笔投资10万元180天项目，那么小融可以获得现金奖励是：</p>
									<p style="font-weight: bold;">5万元*90天/365*1%=123.29元</p>
									<p style="font-weight: bold;">10万元*180天/365*1%=493.15元</p>
								</div>
							</div>							
						
						</div>					
					</div>
					<!--抽奖送现金活动 end-->					
				</div>
				<div class="lottery_bg"></div>
				<div class="small figure"></div>
			</div>						
				<div class="page_global">				
				<!--现金奖励-->
				<div class="investment_list reward">
					<c:if test="${userId != '' }">				
					<div class="reward_cont" id="inves_on">
						<div class="award_title">
							<span class="small investment_three"></span>
							<span class="small award"></span>
						</div>						
						<div class="small scan_icon"></div>						
						<p>活动期间，邀请好友注册且投资首页“新手项目”，邀请</p>
						<p>人即可获得好友该笔投资金额的1%现金奖励！</p>
						<div class="weixin_cont clearfix">
							<img class="fl weixin wxewm" src="http://m.zhongzairong.cn/anniversary/getQRCode.do?userId=${userId}">
							<div class="fl scan">
								<div id="QRtxt">长按二维码识别立即转发给好友</div>
								<div class="number_title">
									<input type="text" id="invitcode" value="${invitationCode }"/>
									<em>长按数字复制</em>									
								</div>
								
								<p>当好友注册时，在邀请码一栏中填写</p>
								<p>您的邀请码，完成注册即可。</p>
							</div>
						</div>					
					</div>
					</c:if> 	

					<!--添加的未登录状态-->
					<c:if test="${userId == '' }">
					<c:if test="${nowDate < 1493049600000 }">
						<div class="reward_cont logged">
							<div class="award_title">
								<span class="small investment_three"></span>
								<span class="small award"></span>
							</div>	
							<p>活动期间，邀请好友注册且投资首页“新手项目”，邀请人即</p>
							<p>可获得好友该笔投资金额的1%现金奖励！</p>
							<div class="invite" onclick="var _host = basePath_ , encodeUrl = encodeURIComponent(window.location.href);
						window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;">立即邀请好友</div>			
						</div>
					</c:if> 
					</c:if>
					<c:if test="${userId == '' }">
					<c:if test="${nowDate > 1493049600000 }">
						<div class="reward_cont logged">
							<div class="award_title">
								<span class="small investment_three"></span>
								<span class="small award"></span>
							</div>	
							<p>活动期间，邀请好友注册且投资首页“新手项目”，邀请人即</p>
							<p>可获得好友该笔投资金额的1%现金奖励！</p>
							<div class="invite" onclick="alert('活动已结束！')">立即邀请好友</div>			
						</div>
					</c:if> 
					</c:if>  
				</div>
				<!--现金奖励 end-->
				<div class="bg">
					<span class="small investment_four"></span>
					<span class="small letter_icon"></span>
				</div>
				<!--感恩送红包-->
				<div class="investment_list letter">
					<div class="letter_cont">
						<div class="scroll_bar">
							<div class="letter_txt" id="letter_txt">
								<div class="letterWrap">				
									<h2>“正青春，共前行”</h2>
									<h2>——致融粉们的一封感谢信</h2>
									<h3>亲爱的融粉们：</h3>
									<p>大家好，非常感谢这一年的陪伴与支持！</p>
									<p>一直以来自律与迎合监管都是中再融必要使命和重要工作之一，无论是为肃清行业“戾气”还是修为自身而言中再融都在不断优化风控的严肃性和可操作性，同时为投资人提供线上良好投资环境与投资服务而不懈努力。</p>
		                            <p>这一年来我们得到大量的用户关注，在大环境不十分乐观的情况下，一个新平台上线6个月就完成了总交易额突破一亿的成绩，这离不开所有用户的支持与渐渐庞大的团队的努力，当然，我们还年轻，未来还有十亿、百亿、千亿在等待着我们共同去实现。</p>
		                            <p>“不积跬步，无以至千里”，中再融始终坚持“稳”字当头，一砖一瓦地建立起自己的安全高墙。安全与便捷是中再融的核心经营思路，希望中再融能够成为让用户、员工、社会都感到无比“幸福”的百年企业。绿色金融的路还很远，中再融作为网络借贷信息中介机构将始终致力于为中国的再生资源行业发展提供完善的金融解决方案，持续地服务再生资源中小企业，同时为广大投资用户提供低风险的金融产品与服务。</p>
		                            <p>感恩你我相伴，中再融必怀感恩之心为中国互联网金融行业添砖加瓦，同时继续深化自身产品结构，打造全面完善的商业模式与互联网金融闭环。我们的宗旨只有一个：</p>
		                            <p>坚持以用户为中心一百年！</p>
		                            <p>路漫漫，其修远兮，吾将上下而求索。</p>
		                            <p>但我们坚信，We can！</p>
		                            <p>正青春，共前行！！！</p>
	                            </div>	
                            </div>	
							<div class="small scroll_right"></div>
						</div>
						<ul class="envelope_list clearfix">
							<li>
								<img src="<%=request.getContextPath()%>/resources/image/activity/anniversary/two.png" width="50" height="70" alt="">
								<p>X1</p>							
							</li>
							<li>
								<img src="<%=request.getContextPath()%>/resources/image/activity/anniversary/four.png" width="50" height="70" alt="">
								<p>X3</p>	
							</li>
							<li>
								<img src="<%=request.getContextPath()%>/resources/image/activity/anniversary/five.png" width="50" height="70" alt="">
								<p>X2</p>	
							</li>
							<li>
								<img src="<%=request.getContextPath()%>/resources/image/activity/anniversary/seven.png" width="50" height="70" alt="">
								<p>X1</p>	
							</li>
						</ul>
							<c:if test="${userId == '' }"><c:if test="${nowDate < 1493049600000 }"><div class="gift" onclick="var _host = basePath_ , encodeUrl = encodeURIComponent(window.location.href);
						window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;">分享领取365元投资大礼包</div></c:if></c:if> 
						<c:if test="${userId == '' }"><c:if test="${nowDate > 1493049600000 }"><div class="gift" onclick="alert('活动已结束！')">分享领取365元投资大礼包</div></c:if></c:if>  
							<c:if test="${spree eq 0 }"><div class="gift gift365">分享领取365元投资大礼包</div></c:if>
							<c:if test="${spree eq 1 }"><div class="gift gift365 gift_gray">已领取365元投资大礼包</div></c:if>
					</div>
				</div>
				<!--感恩送红包 end-->
				<div class="Leave_icon">
					<!-- <div class="small letter_icon letter_distance"></div> -->
					<span class="small investment_five"></span>
					
				</div>
				<!--参与关注微信公众号-->
				<div class="attention_cont attention_distance">					
					<div class="message clearfix">
						<div class="WeChat_public fl">
								<img class="WeChat_pic" src="<%=request.getContextPath()%>/resources/image/activity/anniversary/weixin.png" alt="微信"/>				
							<p>长按识别关注微信公众号</p>
							<div>关注中再融微信公众号，回复<strong>“周年狂欢”</strong>，即有机会获得中再融一周年纪念大礼包！</div>
						</div>
						<div class="WeChat_public fr">
							<a href="http://weibo.com/5835599795/EB1RnoF8y?ref=home&type=comment#_rnd1490198971038">
								<img class="weibo" src="<%=request.getContextPath()%>/resources/image/activity/anniversary/weibo.png" alt="微博"/>
							</a>						
							<a class="clickwb" href="http://weibo.com/5835599795/EB1RnoF8y?ref=home&type=comment#_rnd1490198971038">点击参与微博活动</a>
							<div>关注中再融新浪微博，并转发指定博文，爱奇艺会员卡免费派送中！</div>
						</div>
					</div>
				</div>
				<!--参与关注微信公众号 end-->
				<div class="attention">
					<div class="small follow_me"></div>
				</div>
				<!--周年庆活动规则-->
				<div class="attention_cont  regulation">
					<h2>
						<div class="small activity_icon"></div>
					</h2>
					<ul>
						<li>1、活动时间：2017年3月23日00:00-4月24日23:59；</li>
						<li>2、“众心成城平分百万现金”的现金奖励将在活动结束后7个工作日内，以现金红包形式发放至用户账户中；</li>
						<li>3、“抽奖送现金”环节，用户抽奖后现金红包将即时发放至用户账户，活动结束后所有抽奖机会立即作废；</li>
						<li>4、“加息无上限”与“呼朋唤友，送1%现金”所得奖励将在用户投资后1个工作日内，以现金红包形式发放至用户账户中；</li>
						<li>5、“感恩送红包，人人有份”环节中的365元投资大礼包将在用户分享成功后，即时发放至用户账户中，仅能获得一次；</li>
						<li>6、“留言享精美好礼”中的实物奖品将在活动结束后7个工作日内联系中奖用户安排发放； </li>
						<li>7、中再融对本活动有最终解释权。</li>
					</ul>					
				</div>
				<!--添加的-->				
				<div class="activities">
					<div class="small letter_icon letter_distance reward_pic"></div>
				</div>
				
				
				<!--周年庆活动规则 end-->
				<!--活动奖励-->
				<div class="attention_cont Activities_reward">
					<div class="small foot_left"></div>
					<div class="small foot_right"></div> 
					<div class="activities_reward" id="act_reward">
						<div class="activities_reward_bg">
							<div class="record">
								<span class="fl">我的邀请记录</span>
								<span class="active fr">我的现金奖励</span>
							</div>
							<c:if test="${userId != '' }">
						<table class="invest_list">
							<tbody>						
								<tr id="cashmoney">
									<td>我的好友</td>
									<td>投资金额（元）</td> 
									<td>现金奖励（元）</td> 									
								</tr>				
							</tbody>
						</table>
						<table  style="display:none;margin-top:34px;">
							<tbody>						
								<tr id="invitations">
									<td>投资日期</td>
									<td>投资金额（元）</td> 
									<td>投资期限（天）</td> 
									<td>现金奖励（元）</td>
								</tr>				
							</tbody>
						</table>
						</c:if>
							<!--添加的登陆查看活动奖励状态-->
							<div class="Log_view" datauser="${userId}">
								<c:if test="${userId == '' }"><a href="javascript:;" onclick="var _host = basePath_ , encodeUrl = encodeURIComponent(window.location.href);
						window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;">登录查看我的活动奖励</a></c:if>
							</div>
							</div>
					</div>
				</div>
				<!--活动奖励 end-->
			</div>
		</div>
	</div>
	<!--弹窗-->
	<div class="wap_account_Popup">
		<div class="alertmask"></div>
		<div class="alertid">
			<div class="obtain_list" id="obtain_ten">
				<div style="background-color: #ffba01;padding-bottom:.15rem">
					<ul class="clearfix">
						
					</ul>
					<div class="money">恭喜您共计 <span id="sum_money">130</span> 元现金红包</div>
				</div>
				<div class="gift determine deno">确定</div>
			</div>
			<div class="obtain_list obtain_one">
			<div id="red_one">
				<ul>
					<li>
						<img src="<%=request.getContextPath()%>/resources/image/activity/anniversary/large1.png"/>
						<div>恭喜您</div>
						<p>获得1元红包</p>
					</li>
				</ul>
				<div class="determine_btn clearfix">
					<a class="gift  determine_left fl" href="<%=request.getContextPath()%>/myAccount/coupon.session">立即使用</a>
					<span class="gift  determine_right fr deno">确定</span>
				</div>	
			</div>
			<div id="red_day">
				<ul>
					<li>
						<img src="<%=request.getContextPath()%>/resources/image/activity/anniversary/large1.png"/>
						<div>恭喜您</div>
						<p>获得20元红包</p>
					</li>
				</ul>
				<div class="determine_btn clearfix">
					<a class="gift  determine_left fl" href="<%=request.getContextPath()%>/myAccount/coupon.session">立即使用</a>
					<span class="gift  determine_right fr deno">确定</span>
				</div>	
			</div>
	<!--弹窗 end-->
		<!--添加的微信扫码转发好友-->
		<div class="Sweep_WeChat">
			<div class="chance investment_chance">去投资获取抽奖机会吧</div>
			<div class="chance Lottery_chance">您当前的抽奖机会不够10次</div>
			<div class="small send"></div>
			<div id="inv_code">
				<div class="reward_cont reward_bg">
					<div class="small scan_icon"></div>
					<div class="weixin_cont clearfix">
						<img class="fl weixin" src="http://m.zhongzairong.cn/anniversary/getQRCode.do??userId=${userId}">
						<div class="fl scan">
							<div>长按二维码识别立即转发给好友</div>
							<div class="number_title">
									<input type="text" value="${invitationCode }"/>
									<em>长按数字复制</em>									
								</div>
							<p>当好友注册时，在邀请码一栏中填写</p>
							<p>您的邀请码，完成注册即可。</p>
						</div>
					</div>			
				</div>
				<div class="gift determine determine_small deno">确定</div>
			</div>
		</div>
		<!--添加的微信扫码转发好友 end-->
		</div>
		</div>
	</div>
	<!--悬浮导航-->
		<div class="Suspended_navigation">
		<c:if test="${userId == '' }"><div class="small navigation_icon" id="ceoRed"></div></c:if>
		<c:if test="${redCollar eq 0 }"><div class="small navigation_icon" id="ceoRed"></div></c:if>
		<c:if test="${redCollar eq 1 }"><div class="small navigation_icon receive_icon" id="ceoRed"></div></c:if>
		</div>
		<input type="hidden" value="${nowDate }" id="nowDate">
	<!--悬浮导航 end-->
</body>
</html>