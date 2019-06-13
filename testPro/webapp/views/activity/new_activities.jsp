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
<title>新手专享</title>
<%@ include file="/views/inc/inc.jsp"%>
<script src="${basePath}/resources/js/activity/new_activities.js"></script>
<link rel="stylesheet" href="${basePath}/resources/css/activity/new_activities.css">
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
 	<div class="guessBeans">
		<div class="banner" style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;overflow:auto;-webkit-overflow-scrolling : touch;">
			<div class="banner_t"></div>
			<div class="banner_b">
				<div class="number">
					<input class="txt phnum" type="text" placeholder="输入手机号 领取999元红包" maxlength="11"/>
				</div>
				<div class="registered_btn">立即注册</div>
			</div>
			<div class="container">
				<div class="depository"></div>
				<div class="picture_one"></div>
				<div class="picture_two"></div>
			</div>
		</div>
		<div class="popup"  style="display:none;">          
            <div class="registered">
				<div class="popup_count">
					<!--手机号-->
					<div class="pop_check clearfix">
						<span class="Code">手机号</span>
						 <div class="Verification fr">
						   <input class="pop_num fr" type="text" maxlength="11" placeholder="请输入手机号"/>
						</div>					
					</div>
					<!--手机号 end-->
					<!--图片验证码-->
					<div class="pop_check pop_check_msg clearfix">				
					   <span class="Code">验证码</span>
					   <div class="Verification fr clearfix">
						   <input class="txt fl" id="input_code" type="text" maxlength="4" placeholder="请输入图形验证码"/>   
						   <img class="img_code fr tg_code" src="${basePath}/userInfo/getCode.do" alt="验证码" title="验证码"/> 
						</div>
					</div>
					<!--图片验证码 end-->
					<!--短信验证码-->
					<div class="pop_check pop_check_msg clearfix">				
					   <span class="Code">短信验证码</span>
					   <div class="Verification fr clearfix">
						   <input class="txt fl" id="msg_num" type="text" maxlength="6" placeholder="请输入短信验证码"/>
							<span class="pop_msg_count">立即发送</span>					
						</div>
					</div>
					<!--短信验证码 end-->
					 <div class="pop_agr clearfix">
						<i class="agree pop_agron"></i>
						<span>同意  <a href="${basePath}/views/agreement/serve_agreement.jsp">《服务协议》</a> <a href="${basePath}/views/agreement/secret_agreement.jsp">《隐私条款》</a></span>               
					</div>					
				</div>
				<div class="ex_popup go_reg">立即注册</div>
			</div>
        </div>
        <div class="overlay" id="overlay" style="display:none"></div>
        <div class="error_msg" style="display:none"></div>
	</div>
</body>
</html>