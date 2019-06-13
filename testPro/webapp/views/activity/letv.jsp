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
<title>体验理财送乐次元影视会员</title>
<%@ include file="/views/inc/inc.jsp"%>
<script src="${basePath}/resources/js/activity/letv.js"></script>
<link rel="stylesheet" href="${basePath}/resources/css/activity/letv.css">
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
<div class="LetvPage">
	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;overflow:auto;-webkit-overflow-scrolling : touch;">
		<div class="banner">
			<img src="${basePath}/resources/image/activity/letv/banner_t.png"/>
			<img src="${basePath}/resources/image/activity/letv/banner_b.png"/>
		</div>
		<div class="container">
			<div class="members clearfix">
				<div class="fl">
					<h3>送8个月乐视会员</h3>
					<p>2000元≤首次投资金额＜5000 送乐次元影视会员</p>
				</div>
				<div class="fl">
					<h3>送2年乐视会员</h3>
					<p class="vip">5000元≤首次投资金额送乐次元影视会员</p>
				</div>				
			</div>
			<input class="phnum sbox" type="text" placeholder="请输入手机号" maxlength="11">
			<div class="ex_popup sbox">立即注册</div>
			<div class="communal about_icon"></div>
			<ul class="details_list clearfix">
				<li class="borderB">
					<div class="small units_ioc"></div>
					<p>中再生协会唯一指定互联网金融平台，依托中华全国供销合作总社服务再生资源中</p>
				</li>
				<li class="borderB borderR">
					<div class="small eyes_ioc"></div>
					<p>政策合规完备，为投资用户提供安全、透明、便捷的互联网理财环境</p>
				</li>
				<li>
					<div class="small flowers_ioc"></div>
					<p>垂直服务于再生资源行业，助力再生资源行业转型升级，促进绿色金融和谐发展</p>
				</li>
				<li class="borderR">
					<div class="small shield_ioc"></div>
					<p>实力型担保机构提供投资保障，第三方资金托管提供国内顶级技术支持</p>
				</li>
			</ul>
			<div class="communal Letv_icon"></div>
			<div class="pic"></div>
			<div class="communal rules_icon"></div>
			<ol>
				<li> 活动时间：即日起至2018年7月1日；</li>
				<li> 注册即送999元中再融理财红包，投资后即可兑现；</li>
				<li><p>首次投资最高送2年乐次元影视会员。</p>
					<p>3-1. 首次投资达标：2000≤首次投资金额＜5000，即送8个月乐次元影视会员；</p>
					<p>3-2. 5000≤ 首次投资金额，即送2年乐次元影视会员；</p>
				</li>
				<li> 符合条件用户，会员卡会已短信的形式发送至你手机上， 请注意查收；</li>
				<li> <p>投资及赠送会员未到账的相关事宜，请拨打:</p> <p>4001-156-157；</p></li>
				<li> 本活动最终解释权归中再融所有。</li>
			</ol>
			<div class="communal change_icon"></div>
				<div class="ewm_img"></div>
				<div class="w838">
					<div class="way_tit  wap_tit">手机兑换方式：</div>
					<p class="change_way">扫描二维码，注册&nbsp;/&nbsp;登陆后进入用户中心兑换码页面，输入兑换码和验证码，点击“立即兑换”即可尊享会员服务。</p>
					<div class="way_tit">PC兑换方式：</div>
					<p class="change_way">注册&nbsp;/&nbsp;登陆乐视视频后（http://www.le.com），进入会员频道点击右上角【兑换码】，输入兑换码和验证码，点击“立即兑换”，即可尊享会员服务。</p>
				</div>
		</div>
	</div>


		<!--弹窗-->
        <div class="popup">
			<div class="couse_btn"></div>
			<!-- 输入手机号 -->
			<input class="btn_mobnumber" type="text" placeholder="手机号码" maxlength="11">
			<!--图片验证码 -->
			<div class="pop_check_txt pop_check clearfix">
				<input class="pop_num" id="input_code"  type="text" maxlength="4" placeholder="图形验证码">
				<img class="img_code" src="${basePath}/userInfo/getCode.do" alt="验证码" title="图形验证码">
			</div>
			<!-- 短信验证 -->
			<div class="pop_check_msg pop_check clearfix">
				<input class="pop_num" id="msg_num" type="text" maxlength="6" placeholder="短信验证码">
				<span class="pop_msg_count"></span>
			</div>
			
			<div class="pop_agr clearfix">
				<i class="agree pop_agron"></i>
			<span>同意 <a href="/views/agreement/serve_agreement.jsp">《服务协议》、</a><a href="/views/agreement/secret_agreement.jsp">《隐私条款》</a>
			</span>
			</div>
			<div class="go_reg" data-link="${basePath}/loan/detail/${loanId}.do">立即注册</div>
        </div>
		 <div class="errormsg"></div>
        <div id="overlay"></div>
	</div>

</body>
</html>