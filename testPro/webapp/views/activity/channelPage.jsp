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
<title>中再融-狂欢周年庆</title>
<%@ include file="/views/inc/inc.jsp"%>
<script src="${basePath}/resources/js/activity/channelPage.js"></script>
<link rel="stylesheet" href="${basePath}/resources/css/activity/channelPage.css">
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
 	 <!--微信分享-->
	<div class="channel_page">
		<div class="channel_page_bg channel_page_cont">
			<!--banner-->
			<div class="banner">
				<div class="banner_t"></div>
				<div class="banner_b"></div>
			</div>
			<!--banner-->
			<div class="small_icon Giftbag_pic"></div>
			<div class="small_icon rates_pic"></div>
			<div class="small_icon special_pic"></div>
			<div class="cell_phone">
				<input type="text" class="phnum" placeholder="请输入您的手机号" maxlength="11"/>
			</div>
			<div class="registered" id="ex_popup">注册领红包</div>
			<div class="small_icon anniversary_pic"></div>
			<div class="small_icon date_pic"></div>
			<div class="small_icon cash_pic"></div>
			<ul class="anniversary_list clearfix">
				<li>
					<span class="small_icon draw_icon fl"></span>
					<div class="fl">抽奖送现金加息无上限</div>
				</li>
				<li>
					<span class="small_icon award_icon fl"></span>
					<div class="fl">呼朋唤友送1%现金奖励</div>
				</li>
				<li>
					<span class="small_icon loving_icon fl"></span>
					<div class="fl">感恩送红包人人有份</div>
				</li>
				<li>
					<span class="small_icon gift_icon fl"></span>
					<div class="fl">留言享精美好礼</div>
				</li>
			</ul>		
			<a class="registered act_cy">参与活动</a>
		</div>
		<!-- 选择理由 -->
		<div class="con_reason">
			<h2>为什么选择中再融</h2>
			<ul>
				<li class="rea_item1 clearfix">
					<div class="pic"></div>
					<div class="txt">
						<h3>可靠的国资背景</h3>
						<p>中国再生资源回收利用协会战略入股。</p>
					</div>
				</li>
				<li class="rea_item2 clearfix">
					<div class="pic"></div>
					<div class="txt">
						<h3>资金托管更安全</h3>
						<p>资金全程由第三方平台汇付天下托管，资金更安全。</p>
					</div>
				</li>
				<li class="rea_item3 clearfix">
					<div class="pic"></div>
					<div class="txt">
						<h3>丰富的理财福利</h3>
						<p>注册即可领取红包，新用户专享15%预期年化收益。</p>
					</div>
				</li>
				<li class="rea_item4 clearfix">
					<div class="pic"></div>
					<div class="txt">
						<h3>投资理财灵活快捷</h3>
						<p>App随时理财，50元起投，T+1快速提现。</p>
					</div>
				</li>
			</ul>				
		</div>
		<div class="channel_page_bg risk_warning">		
			<div class="registered return_top">注册领红包</div>
			<p class="pk_tip1">理财有风险，投资需谨慎</p>
			<p>中再融（北京）科技有限公司 京ICP备 16002418号-1</p>
		</div>
		
		
		<!-- 弹窗 -->
		<div class="overlay"></div>
        <div class="popup"> 
            <div class="pop_bd">
                <!-- 输入手机号 -->
                <input class="btn_mobnumber" type="text" placeholder="请输入手机号" maxlength="11">
                <!-- 短信验证 -->               
                <!--图片验证码 -->
                <div class="pop_check_txt pop_check clearfix">
                    <input id="input_code" class="pop_num" type="text" maxlength="4" placeholder="请输入图形验证码">
                    <img class="img-code tg_code" src="${basePath}/userInfo/getCode.do" alt="验证码" title="验证码">
                </div>
				<div class="pop_check_msg pop_check">
                    <input class="pop_num" id="msg_num" type="text" maxlength="6" placeholder="请输入手机验证码">
                    <span class="pop_msg_count">发送验证码</span>
                </div>               
                <div class="ex_popup go_reg">立即注册领取红包</div>
				
				<div class="pop_agr">
                    <i class="agree pop_agron"></i>
					<span>同意 <a href="${basePath}/views/agreement/serve_agreement.jsp">《服务协议》</a> <a href="${basePath}/views/agreement/secret_agreement.jsp">《隐私条款》</a>
					</span>
                </div>
            </div>
        </div>    
       
		
		<div class="error_msg" style="display:none;"></div>
		<!--注册成功-->
		<div class="successfully_cont" style="display:none;">
			<div class="successfully_icon"></div>
			<div class="Copywriting">注册成功</div>
			<div class="envelope">您的一百元红包已到账</div>
			<a href="javascript:;"><span class="timecount">5</span>S后将跳转至周年庆典活动页</a>
		</div>
		
	</div>
</body>
</html>