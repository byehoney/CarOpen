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
<title>体验理财送爱奇艺VIP</title>
<%@ include file="/views/inc/inc.jsp"%>
<script src="${basePath}/resources/js/activity/iqiyi.js"></script>
<link rel="stylesheet" href="${basePath}/resources/css/activity/iqiyi.css">
<script src="https://qiyukf.com/script/058b227c7dcc287d28e0900f681436c7.js" defer async></script>
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
 	 <div class="page">
		 <div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;overflow:auto;-webkit-overflow-scrolling : touch;">
			<div class="topbanner"></div>
			<div class="cont">
				<div class="rules">
					<div class="act_txt">
						<h3><span>活动规则</span></h3>
						<div class="clearfx"><span class="fl">1 .</span>
							<p class="fl"> 活动时间：2017年3月14日—2017年3月31日；</p>
						</div>
						<div class="clearfx"><span class="fl">2 .</span>
							<p class="fl">活动期间内注册并定存累计满1000元，即送VIP会员，最高可以获得12个月VIP会员；</p>
						</div>
						<div class="clearfx"><span class="fl">3 .</span>
							<p class="fl">活动结束后2个工作日内客服电话核实发送VIP激活码。</p>
						</div>
						<div class="clearfx"><span class="fl">4 .</span>
							<p class="fl">中再融对本次活动享有最终解释权；</p>
						</div>
						<i class="small_icon small_left"></i>
						<i class="small_icon small_right"></i>
					</div>
					<div class="phbox">
						<input class="phnum" type="text" placeholder="请输入手机号" maxlength="11">
					</div>
					<div class="ex_popup">领取激活码</div>
				</div>
				<div class="rules pre_cont">
					<div class="present">
						<div class="example_img"></div>
						<div class="pre_list">
							<table>
								<thead>
								<tr>
									<td>累计定存金额</td>
									<td>会员奖励</td>
								</tr>
								</thead>
								<tbody>
									<tr>
										<td>1000元</td>
										<td>1个月VIP会员</td>
									</tr>
									<tr>
										<td>5000元</td>
										<td>6个月VIP会员</td>
									</tr>
									<tr>
										<td>10000元</td>
										<td>12个月VIP会员</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="rules">
					<div class="present">
						<div class="financial_img"></div>
						<p>5000元存一个月利息对比</p>
						<div class="ranking"></div>
					</div>
				</div>
				<div class="foot_txt">
					<div>理财有风险 投资需谨慎</div>
					<p>中再融（北京）科技有限公司 &nbsp &nbsp京ICP备16002418号-1</p>
				</div>
			</div>
		 </div>
        <!-- 弹窗 -->
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
                <div class="pop_agr clearfx">
                    <i class="agree pop_agron"></i>
                <span>同意 <a href="${basePath}/views/agreement/serve_agreement.jsp">《服务协议》</a> <a href="${basePath}/views/agreement/secret_agreement.jsp">《隐私条款》</a>
                </span>
                </div>
                <div class="ex_popup go_reg">立即注册</div>
            </div>
        </div>
        <div id="overlay"></div>
        <div class="error_msg" style="display:none"></div>
    </div>

</body>
</html>