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
<title>注册送钻石</title>
<%@ include file="/views/inc/inc.jsp"%>
<script src="${basePath}/resources/js/activity/newwerwolf.js${verCode }"></script>
<link rel="stylesheet" href="${basePath}/resources/css/activity/newwerwolf.css${verCode }">
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
        <div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;overflow:auto;-webkit-overflow-scrolling : touch;max-width:640px;margin: 0 auto;">
            <div class="topbanner"></div>
            <div class="cont">
                <div class="act_txt">
                    <h3>活动规则：</h3>
                    <div class="clearfx"><span class="fl">1.</span>
                        <p class="fl">成功注册并首投任意项目，最高可得10000钻石；</p>
                    </div>
                    <div class="clearfx"><span class="fl">2.</span>
                        <p class="fl">每个狼人杀ID只能领取一次钻石奖励；</p>
                    </div>
                    <div class="clearfx"><span class="fl">3.</span>
                        <p class="fl">投资成功后3个工作日内发放钻石奖励；</p>
                    </div>
                    <div class="clearfx"><span class="fl">4.</span>
                        <p class="fl">不可为他人代充钻石奖励，一经发现，中再融有权取消发放奖励；</p>
                    </div>
                    <div class="clearfx"><span class="fl">5.</span>
                        <p class="fl">活动结束时间以页面提示为准；</p>
                    </div>
                    <div class="clearfx"><span class="fl">6.</span>
                        <p class="fl">本次活动最终解释权归中再融所有；</p>
                    </div>
                </div>
                <div class="phbox">
                    <input class="phnum" type="text" placeholder="请输入手机号" maxlength="11">
                </div>
                <a class="ex_popup"></a>
                <div class="example">
                    <div class="example_img"></div>
                    <div class="example_lis">
                        <ul>
                            <li class="lisbg fl lis1">
                                <p>注册账号</p>
                                <p>填写狼人杀ID</p>
                            </li>
                            <li class="lisbg fl lis2">
                                <p>投资6000元</p>
                                <p>获得6000钻石</p>
                            </li>
                            <li class="lisbg fl lis3">
                                <p>30天到期</p>
                                <p>返还6073元</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="present">
                <div class="example_img"></div>
                <div class="pre_list">
                    <table>
                        <thead>
                        <tr>
                            <td><p>定存金额</p><p class="sm">（首次投资）</p></td>
                            <td>钻石奖励</td>
                            <td>30天到期返还</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>10000元</td>
                            <td>10000钻石</td>
                            <td>10123元</td>
                        </tr>
                        <tr>
                            <td>8000元</td>
                            <td>8000钻石</td>
                            <td>8098元</td>
                        </tr>
                        <tr>
                            <td>6000元</td>
                            <td>6000钻石</td>
                            <td>6073元</td>
                        </tr>
                        <tr>
                            <td>4000元</td>
                            <td>4000钻石</td>
                            <td>4050元</td>
                        </tr>
                        <tr>
                            <td>2000元</td>
                            <td>2000钻石</td>
                            <td>2025元</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="reason">
                    <div class="reason_tit">
                        <h2><i class="ic_l"></i>为什么要选择中再融理财<i class="ic_r"></i></h2>
                    </div>
                    <div class="reason_per clearfx">
                        <div class="per_exam fr">
                            <p>10000元存一个月</p>
                        </div>
                        <div class="zzr_per clearfx"><i class="fl"></i><p class="fl">中再融利息123元</p></div>
                        <div class="yeb_per clearfx"><i class="fl"></i><p class="fl">余额宝利息34元</p></div>
                        <div class="bank_per clearfx"><p class="fl">银行存款利息2.4元</p><i class="fl"></i></div>
                    </div>
                </div>
            </div>
            <div class="foot_txt">
                <p>京ICP备16002418号-1 &nbsp 中再融（北京）科技有限公司</p>
            </div>
        </div>

        <!-- 弹窗 -->
        <div class="popup">
            <div class="pop_tborder"></div>
            <div class="pop_bd">
                <!-- 输入手机号 -->
                <input  id="mobnum" class="btn_mobnumber" type="text" placeholder="请输入手机号" maxlength="11">
 				<!--图片验证码 -->
                <div class="pop_check_txt pop_check">
                    <input id="input_code" class="pop_num" type="text" maxlength="4" placeholder="请输入图形验证码">
                    <img class="img-code tg_code" src="${basePath}/userInfo/getCode.do" alt="验证码" title="验证码">
                </div>
                <!-- 短信验证 -->
                <div class="pop_check_msg pop_check">
                    <input id="msg_num" class="pop_num" type="text" maxlength="6" placeholder="请输入手机验证码">
                    <span id="msgcount" class="pop_msg_count">发送验证码</span>
                </div>
               
                <div class="pop_agr clearfx">
                    <i class="agree pop_agron"></i>
                <span>同意 <a href="${basePath}/views/agreement/serve_agreement.jsp">《服务协议》</a> <a href="${basePath}/views/agreement/secret_agreement.jsp">《隐私条款》</a>
                </span>
                </div>
                <div class="go_reg"></div>

            </div>
            <div class="pop_fborder"></div>
        </div>
        <div id="overlay"></div>
        <div class="error_msg" style="display:none"></div>
    </div>
    <script src="https://qiyukf.com/script/058b227c7dcc287d28e0900f681436c7.js" defer async></script>
</body>
</html>