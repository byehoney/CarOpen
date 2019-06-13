<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta content="telephone=no" name="format-detection">
<title>开户成功 - 中再融</title>
<%@ include file="/views/inc/inc.jsp"%>
<link type="text/css" rel="stylesheet" href="${basePath}/resources/css/login.css">
<link type="text/css" rel="stylesheet" href="${basePath}/resources/css/wap_login.css"/>
</head>
<body>
	<%@ include file="/views/inc/header.jsp"%>
	 <%-- <div id="content_height">
		<div class="registration_nav">
			<div class="left">
				<p class="num_list wd_list">1</p>
				<p>注册</p>
			</div>

			<div class="center">
				<p class="num_list wd_list">2</p>
				<p>开户</p>
			</div>

			<div class="right">
				<p class="num_list wd_list">3</p>
				<p>成功</p>
			</div>
			<div class="line linebg"></div>
			<div class="line linebg"></div>
		</div>

		<div class="success_page">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr style="display: none;">
					<td valign="center" align="right" width="25%"><span
						class="page_success_icon"><img
							src="${basePath}/resources/image/success_user_icon.png"></span></td>
					<td><span>您已获得100元红包</span></td>
				</tr>

				<tr>
					<td valign="center" align="right"><span
						class="page_success_icon"><img
							src="${basePath}/resources/image/new_user_icon.png"></span></td>
					<td><span>享受最高加息2%的投资特权</span></td>
				</tr>

				<tr>
					<td valign="center" align="right"><span
						class="page_success_icon"><img
							src="${basePath}/resources/image/height_money_icon.png"></span></td>
					<td><span>精选优质项目，收益8%-12%</span></td>
				</tr>
			</table>
		</div>


		<div class="open_btn_box">
			<div class="open_btn bg1">
				<a href="${basePath}/loan/list.do">去投资</a>
			</div>
		</div>
	</div>  --%>
	
	
	
	 <section class="moblie_validation content">
	    <div class="registration_nav"></div>	
		<div class="clearfix successfully_con"><i class="tick"></i></div>
		<p class="successfully">开户成功</p>
		<p class="return_con"><span id="time">3</span>s后返回我的账户</p>	
		<div class="investment clearfix">
			<a href="${basePath}/loan/list.do"><span>立即投资</span></a>
			<a href="${basePath}/myAccount/myAccountInfo.session"><span class="account_con">返回我的账户</span></a>
		</div>
	</section> 
	
	
	<%-- <%@ include file="/views/inc/footer.jsp"%> --%>
<script type="text/javascript">  
	$(function(){
		
	});
</script>
</body>
</html>

<script type="text/javascript">  
	delayURL();    
    function delayURL() { 
   
        var delay = document.getElementById("time").innerHTML;
 		var t = setTimeout("delayURL()", 1000);

			if (delay > 0) {
	            delay--;
	            document.getElementById("time").innerHTML = delay;
	        } else {
	     		clearTimeout(t); 
	            window.location.href = "${basePath}/myAccount/myAccountInfo.session";
	        } 
  
    } 
</script>
