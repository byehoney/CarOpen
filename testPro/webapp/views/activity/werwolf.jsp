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
<title>狼人杀活动</title>
<%@ include file="/views/inc/inc.jsp"%>
<script src="${basePath}/resources/js/activity/werwolf.js"></script>
<link rel="stylesheet" href="${basePath}/resources/css/activity/werwolf.css">
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
        <div class="top_banner"></div>
        <div class="example">
            <div class="example_img">
            </div>
            <div class="example_lis">
                <ul>
                    <li class="lisbg fl lis1">
                        <p>注册并定存</p>
                        <p>新手专享理财</p>
                        <p>1000元</p>
                    </li>
                    <li class="lisbg fl lis2">
                        <p>添加客服QQ：</p>
                        <p>2448891038</p>
                        <p>提供ID领取钻石</p>
                    </li>
                    <li class="lisbg fl lis3">
                        <p>一个月后</p>
                        <p>返还本钱+利息</p>
                        <p>1012元</p>
                    </li>
                </ul>
                <div class="phbox">
                    <input class="phnum" type="text" placeholder="请输入手机号" maxlength="11">
                </div>
                <div class="ex_popup" id="ex_popup"></div>
                <div class="act_txt">
                    <h3>活动内容：</h3>
                    <div class="clearfx"><span class="fl">1 .</span>
                        <p class="fl">通过本页面注册成功的3天内，投资新手项目满1000元，即获得发放10000钻石资格；</p>
                    </div>
                    <div class="clearfx"><span class="fl">2 .</span>
                        <p class="fl">满足资格后添加客服QQ提供帐号ID，核实信息；</p>
                    </div>
                    <div class="clearfx"><span class="fl">3 .</span>
                        <p class="fl">核实成功后2个工作日内发放10000钻石奖励。</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="reason">
            <div class="reason_tit">
                <h2><i class="ic_l"></i>为什么要理财<i class="ic_r"></i></h2>
            </div>
            <div class="reason_per clearfx">
                <div class="per_exam fr">
                    <p>1000元存一个月</p>
                </div>
                <div class="zzr_per clearfx"><i class="fl"></i><p class="fl">中再融利息12.5元</p></div>
                <div class="yeb_per clearfx"><i class="fl"></i><p class="fl">余额宝利息2.75元</p></div>
                <div class="bank_per clearfx"><p class="fl">银行存款利息0.29元</p><i class="fr"></i></div>
            </div>
        </div>
        <div class="return">
            <div class="ex_popup return_top"></div>
            <p class="foot_txt">京ICP备16002418号-1 &nbsp 中再融（北京）科技有限公司</p>
        </div>
        <!-- 弹窗 -->
        <div class="popup">
            <div class="pop_tborder"></div>
            <div class="pop_bd">
                <!-- 输入手机号 -->
                    <input class="btn_mobnumber" type="text" placeholder="请输入手机号" maxlength="11">
				<!--图片验证码 -->
                <div class="pop_check_txt pop_check">
                <input id="input_code" class="pop_num" type="text" maxlength="4" placeholder="请输入图形验证码">
                <img class="img-code tg_code" src="${basePath}/userInfo/getCode.do" alt="验证码" title="验证码">
                </div>
                <!-- 短信验证 -->
                <div class="pop_check_msg pop_check">
                    <input class="pop_num" id="msg_num" type="text" maxlength="6" placeholder="请输入手机验证码" >
                    <span class="pop_msg_count">发送验证码</span>
                </div>
        
                <div class="pop_agr clearfx">
                <i class="agree pop_agron"></i>
                <span>同意 <a href="${basePath}/views/agreement/serve_agreement.jsp">《服务协议》</a> <a href="${basePath}/views/agreement/secret_agreement.jsp">《隐私条款》</a>
                </span>
                </div>
                <div class="go_reg" id="reg_btn"></div>

            </div>
            <div class="pop_fborder"></div>
        </div>
        <div id="overlay"></div>
        <div class="error_msg" style="display:none"></div>
    </div>

</body>
</html>