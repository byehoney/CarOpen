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
<title>邀好友送现金</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/wapInviteFri.js${verCode }"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/wapInviteFri.css${verCode }">
<script>
	var basePath = "<%=request.getContextPath()%>";
</script>

</head>
<body>
 	<div class="page">
	    	<div class="banner">
	    		<div class="banner_t"></div>
	    		<div class="banner_b"></div>
	    	</div>
			<div class="alipayBg act_inv">
				<h3><span>邀请好友注册且投资，邀请人可获得: </span></h3>
				<p class="inv_cash">好友首笔投资金额的<span><em>1</em>%  </span>现金奖励！</p>
				<p class="inv_prize">多邀多得，奖励金额上限10万元</p>
			</div>
			<div class="alipayBg act_example">
				<h3><span>举个例子：</span></h3>
				<p>小融邀请10位好友投资，每人首笔投资1万元，小融可以获得现金奖励：1000元！</p>
			</div>
			<c:if test="${!empty userObj}">	
				<div class="alipayBg act_myinv">
					<h3><span>我的邀请</span></h3>
					<table>
						<thead>
							<tr>
								<td class="invitationCNT">-</td>
								<td class="investCNT">-</td>
								<td class="redpackageSUM">-</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>已邀请好友</td>
								<td>已投资好友</td>
								<td>获得奖励金额</td>
							</tr>
						</tbody>
					</table>
				</div>
			</c:if>
			<c:if test="${empty userObj}">	
				<div class="tologin"><p>查看我的邀请记录</p></div>
				<div class="inviteBtn">邀请好友，拿现金</div>
			</c:if>
			<c:if test="${!empty userObj}">
				<div class="app_inviteBtn" style="display:none">立即邀请</div>
				<div class="inviteTip">
					<p>在好友注册时，提醒好友填写您的邀请码：${code }才能邀请成功哦</p>
				</div>
			</c:if>
			<div class="act_rules clearfix">
				<h6 class="fl rulesbtn">活动规则</h6>
				<ol class="fl">
					<li>活动时间：7月22日—8月31日；</li>
					<li>已邀请好友、已投资好友、获得奖励金额的数据每日24点进行更新；</li>
					<li>现金奖励将在好友投资成功后，一个工作日内以现金红包形式发放至邀请人账户；</li>
					<li>中再融对本活动享有最终解释权。</li>
				</ol>
			</div>
			<div class="overlay"></div>
			<input id="user" type="hidden" value="${userObj.userId}">
    	</div>
<script>
		var isUser=$('#user').val();
    	var title=['老铁，送你999元红包，快来领！','邀请你来国资系理财平台—中再融，一起赚收益！'];
    	var des=['我正在国资系平台中再融理财，收益是银行活期存款的34倍，财富增值更安心。邀请你也来~','新用户注册即可获得999元红包，还有15%新手专享收益，福利多多。'];
    	var shareUrl="http://m.zhongzairong.cn/inviteFri.do?userId="+isUser;
    	var iconUrl="https://www.zhongzairong.cn/images/activity/inviteFri/inviteShare.png";
    	var platAry=['WechatSession','WechatTimeLine','Sina','QQ','Qzone'];
    	var sj = GetRandomNum(0,1);
    	$('.app_inviteBtn').click(function(){
    		shareMessage(title[sj],des[sj],shareUrl,iconUrl,platAry);
    	})
    	 /* app 端调用改变页面点击事件或样式 */
        function changeForApp() {
    		$('.inviteBtn').html('立即邀请');
           $('.app_inviteBtn').show();
           $('.inviteTip').hide();
           $('.tologin,.inviteBtn').unbind("click").click(userLogin)
        }
    	function GetRandomNum(Min,Max){   
    		var Range = Max - Min;   
    		var Rand = Math.random();   
    		return(Min + Math.round(Rand * Range));
        }   
    	function shareMessage(title,des,shareUrl,iconUrl,platAry) {
            // 替换参数值 链接要完整
            //platAry 控制显示哪一种平台  WechatSession 微信 WechatTimeLine 朋友圈 QQ qq好友 Qzone qq空间 Sina 新浪
            var shareInfo = JSON.stringify({
                "title": title, "desc": des, "shareUrl": shareUrl,
                "shareIco": iconUrl,
                "platAry":platAry
            });
            anniversary.htmlShare(shareInfo);
        }
    	 // 用户登录状态
        function userLogin(){
            anniversary.userLogin();
        }
</script>
<script>
<!--PC百度统计代码-->
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?455a255e408c3cc82f67b07d05532d54";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();

<!--热力图-->
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
</body>
</html>