<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>零食礼包大派送</title> 
<%@ include file="/views/inc/inc.jsp"%>
 <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/present/present.css">
</head>
<body>
	<%@ include file="/views/inc/header.jsp"%>
	<section class="contBox textCenter">
		<img class="bannerT" src="${basePath}/resources/image/static/present/pub2b_t.png"/>
		<img class="bannerM" src="${basePath}/resources/image/static/present/pub2b_m.png"/>
		<img class="bannerB" src="${basePath}/resources/image/static/present/parasol_ioc.png"/>
		<a class="logo pubBack" href="http://m.zhongzairong.cn/">中再融</a>
		<p class="clear textRadian mobileP">
			<span class="left mobileIcon pubBack"></span>
			<input id="phone" class="left phoneInput" type="text" placeholder="输入手机号" maxlength="11"/>
		</p>	
		<div class="tip">
			<p id="mobileWrong" class="wrong clear">
				<i class="pubBack wrongIcon left"></i>
				<span class="wrongText left"></span>
			</p>
		</div>
		<p class="textRadian textAllW textCenter textH gift" >点击领取大礼包！</p>
		<div class="googlewm" style="color:#ac5d2c; display:none;">入市有风险，投资需谨慎</div>
		<p class="getImg">
			<span class="pubBack getImgBack"></span>
		</p>
	</section>
	<section class="textBox">
		<ul class="processBox clear">
			<li class="textRadian proLi left">
				<i class="pubBack arrow"></i>
				<table>
					<tr>
						<td><!-- 注册获得<span class="redWord">100元</span>红包 -->
							<p>注册获得</p>
							<p><span class="redWord">100元</span>红包</p>
						</td>
					</tr>
				</table>
			</li>
			<li class="textRadian proLi left">
				<i class="pubBack arrow"></i>
				<table>
					<tr>
						<td><!-- 投资≥500元获得<span class="redWord">100元零食大礼包</span> -->
							<p>投资≥500元</p>
							<p>获得<span class="redWord">100元</span></p>
							<p><span class="redWord">零食大礼包</span></p>
						</td>
					</tr>
				</table>
				
			</li>
			<li class="textRadian proLi left">
				<i class="pubBack arrow"></i>
				<table>
					<tr>
						<td><!-- 邀请好友获取<span class="redWord">存钱罐</span> -->
							<p>邀请好友</p>
							<p>获取<span class="redWord">存钱罐</span></p>
						</td>
					</tr>
				</table>
				
			</li>
			<li class="textRadian proLi left proLastLi">
				<table>
					<tr>
						<td><!-- 等待本金以及收益 -->
							<p>等待本金</p>
							<p>以及收益</p>
						</td>
					</tr>
				</table>
			</li>
		</ul>
		<ul class="ruleBox">
			<li>活动规则：</li>
			<li>1.活动时间:2016年6月30日至2016年7月31日；</li>
			<li>2.参与活动资格：通过本页面注册的用户；</li>
			<li>3.活动期间内，投资满500元，即可领取零食大礼包一份，每个用户仅可领取一份大礼包;</li>
			<li>4.满足礼包资格的用户，再邀请两个好友投资500元，即可获取趣味存钱罐一个；</li>
			<li>5.礼包将于领取后的5个工作日内发放；</li>
			<li>6.相同手机号、身份证号视为同一用户，只发放一次奖励。活动过程中，如发现违规行为（恶意注册大量帐号，使用作弊程序等），中再融将取消该用户的奖励资格；</li>
			<li>7.因库存原因，礼包内零食可能会有变化，请以实物为准；</li>
			<li>8.本次活动最终解释权归中再融所有。</li>
		</ul>
	</section>
	<footer>
	   	<div class="nav">
	   		<a href="http://m.zhongzairong.cn/">首页</a><span style="display:none;">/</span><a style="display:none;" href="${basePath}/download.do">下载客户端</a><span>/</span><a href="http://www.zhongzairong.cn/index.shtml">电脑版</a><span>/</span><a href="tel:4001-156-157">联系客服</a>
	   </div>
	   <p>中再融(北京)科技有限公司 版权所有</p>
	   <p>京ICP备16002418号-1</p>

	</footer>
	<%@ include file="/views/inc/footer.jsp"%>
	<script type="text/javascript"
		src="${basePath}/resources/js/common/jquery.md5.js"></script>
	<script type="text/javascript" 
		src="${basePath}/resources/js/present/rem.js"></script>
	<script type="text/javascript" 
		src="${basePath}/resources/js/present/present.js"></script>
</body>
</html>
