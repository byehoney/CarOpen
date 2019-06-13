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
<title>新手大作战</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/common/jquery.md5.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/big_war.js${verCode }"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/fastclick.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/big_war.css">
<script>
	var basePath = "<%=request.getContextPath()%>";
</script>
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
    
    <%--GA代码 --%>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75483023-2', 'auto');
  ga('send', 'pageview');
</script>
</head>
<body>
<input type="hidden" value="${loginStatus}" id="loginStatus">
<input type="hidden" value="${userCampaignStatus}" id="userCampaignStatus">
<input type="hidden" value="${userStatus}" id="userStatus">
<input type="hidden" value="${loanId}" id="loanId">
<div class="big_war">
	<div class="banner">
		<img src="<%=request.getContextPath()%>/resources/image/activity/big_war/banner_t.png" alt="">
		<img src="<%=request.getContextPath()%>/resources/image/activity/big_war/banner_c.png" alt="">
		<img src="<%=request.getContextPath()%>/resources/image/activity/big_war/banner_b.png" alt="">
	</div>
	<div class="status_cont">
		<div class="status_box big_distance">
			<c:if test="${loginStatus == 0 || userCampaignStatus==0 }">
			<!--长卡未通关1 start-->
			<div class="Show_state clearfix">
                <div class="olduser_tip"></div>
				<div class="rough_one">
					<div class="rough_red">
						<div class="checkpoint_one"></div>
					</div>
				</div>
				<div class="Show_left fl">
					<div class="Show_Top clearfix">
						<img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
						<img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
					</div>
					<div class="Show_souvenir  clearfix">
						<img class="dialog mt26 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
						<img class="fl laptop" src="<%=request.getContextPath()%>/resources/image/activity/big_war/laptop.png" alt="">
					</div>
				</div>
				<div class="Show_center fl">
					<h3>初次见面，以礼相待</h3>
					<p>注册成功，即送999元红包大礼</p>
					<div class="register_btn go_register">
						<a href="javascript:;">去注册</a>
					</div>
				</div>
			</div>
			<!--长卡未通关1 end-->

                <!--长卡未通关2 start-->
                <div class="Show_state step_two clearfix" style="display:none;">
                    <div class="olduser_tip"></div>
                    <div class="rough_one">
                        <div class="rough_red">
                            <div class="checkpoint_two"></div>
                        </div>
                        <div class="opabox clearfix">
                            <div class="opa"></div>
                            <p>未完成</p>
                        </div>
                    </div>
                    <div class="Show_left fl">
                        <div class="Show_Top clearfix">
                            <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                            <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                        </div>
                        <div class="Show_souvenir clearfix">
                            <img class="dialog mt8 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                            <img class="item_icon fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/item_icon.png" alt="">
                        </div>
                    </div>
                    <div class="Show_center fl">
                        <h3>专享加息，仅限首投</h3>
                        <p>首笔投资“新手项目”，专享15%年化收益</p>
                        <div class="register_btn go_new">
                            <a href="javascript:;">加入新手标</a>
                        </div>
                    </div>
                </div>
                <!--长卡未通关2 end-->
                <!--未完成3 start-->
                <div class="Show_state step_three clearfix" style=" display:none; ">
                    <div class="olduser_tip"></div>
                    <div class="rough_one">
                        <div class="rough_red">
                            <div class="checkpoint_three"></div>
                        </div>
                        <div class="opabox clearfix">
                            <div class="opa"></div>
                            <p>未完成</p>
                        </div>
                    </div>
                    <div class="Show_left fl">
                        <div class="Show_Top clearfix">
                            <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                            <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                        </div>
                        <div class="Show_souvenir clearfix">
                            <img class="dialog mt6 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                            <img class="phone_icon fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/phone.png" alt="">
                        </div>
                    </div>
                    <div class="Show_center Show_right fl">
                        <h3>初有所获，厚积薄发</h3>
                        <p>首次收到还款利息时，赠送20元红包</p>
                    </div>
                </div>
                <!--未完成3 end-->
                <!--长卡未通关4 start-->
                <div class="Show_state step_four clearfix" style="display:none;">
                    <div class="olduser_tip"></div>
                    <div class="rough_one">
                        <div class="rough_red">
                            <div class="checkpoint_four"></div>
                        </div>
                        <div class="opabox clearfix">
                            <div class="opa"></div>
                            <p>未完成</p>
                        </div>
                    </div>
                    <div class="Show_left fl">
                        <div class="Show_Top clearfix">
                            <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                            <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                        </div>
                        <div class="Show_souvenir clearfix">
                            <img class="dialog mt1 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                            <img class="raise_icon fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/raise_icon.png" alt="">
                        </div>

                    </div>
                    <div class="Show_center fl">
                        <h3>财富增值，券力出击</h3>
                        <p>投资非新手项目任意金额，送5%加息券</p>
                        <div class="register_btn go_list list_one">
                            <a href="javascript:;">立即加入</a>
                        </div>
                    </div>
                </div>
                <!--长卡未通关4 end-->


			</c:if>


            <c:if test="${loginStatus == 1}">
                <c:if test="${userCampaignStatus==1}">
                    <!--长卡未通关1 start-->
                    <div class="Show_state step_one clearfix" style=" display:none;">
                        <div class="rough_one">
                            <div class="rough_red">
                                <div class="checkpoint_one"></div>
                            </div>
                        </div>
                        <div class="Show_left fl">
                            <div class="Show_Top clearfix">
                                <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                                <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                            </div>
                            <div class="Show_souvenir  clearfix">
                                <img class="dialog mt26 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                                <img class="fl laptop" src="<%=request.getContextPath()%>/resources/image/activity/big_war/laptop.png" alt="">
                            </div>
                        </div>
                        <div class="Show_center fl">
                            <h3>初次见面，以礼相待</h3>
                            <p>注册成功，即送999元红包大礼</p>
                            <div class="register_btn go_register">
                                <a href="javascript:;">去注册</a>
                            </div>
                        </div>
                    </div>
                    <!--长卡未通关1 end-->

                    <!--长卡未通关蒙层1 start-->
                    <div class="Show_state step_one clearfix" style=" display:none;">
                        <div class="rough_one">
                            <div class="rough_red">
                                <div class="checkpoint_one"></div>
                            </div>
                            <div class="opabox clearfix">
                                <div class="opa"></div>
                                <p>未完成</p>
                            </div>
                        </div>
                        <div class="Show_left fl">
                            <div class="Show_Top clearfix">
                                <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                                <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                            </div>
                            <div class="Show_souvenir  clearfix">
                                <img class="dialog mt26 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                                <img class="fl laptop" src="<%=request.getContextPath()%>/resources/image/activity/big_war/laptop.png" alt="">
                            </div>
                        </div>
                        <div class="Show_center fl">
                            <h3>初次见面，以礼相待</h3>
                            <p>注册成功，即送999元红包大礼</p>
                            <div class="register_btn">
                                <a href="javascript:;">去注册</a>
                            </div>
                        </div>
                    </div>
                    <!--长卡未通关蒙层1 end-->
                    <!--长卡已通关1 start-->
                    <div class="Show_state step_one clearfix" style=" display:none;">
                        <div class="rough_one">
                            <div class="rough_green">
                                <div class="checkpoint_one"></div>
                            </div>
                            <div class="opabox clearfix">
                                <div class="opa"></div>
                                <p>已通关</p>
                            </div>
                        </div>
                        <div class="Show_left fl">
                            <div class="Show_Top clearfix">
                                <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                                <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                            </div>
                            <div class="Show_souvenir  clearfix">
                                <img class="dialog mt26 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                                <img class="fl laptop" src="<%=request.getContextPath()%>/resources/image/activity/big_war/laptop.png" alt="">
                            </div>
                        </div>
                        <div class="Show_center Show_right fl">
                            <h3>初次见面，以礼相待</h3>
                            <p>注册成功 999元红包已到账</p>
                        </div>
                    </div>
                    <!--长卡已通关1 end-->
                    <!--长卡默认关2 start-->
                    <div class="Show_state step_two clearfix" style="display:none;">
                        <div class="rough_one">
                            <div class="rough_red">
                                <div class="checkpoint_two"></div>
                            </div>
                        </div>
                        <div class="Show_left fl">
                            <div class="Show_Top clearfix">
                                <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                                <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                            </div>
                            <div class="Show_souvenir clearfix">
                                <img class="dialog mt8 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                                <img class="item_icon fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/item_icon.png" alt="">
                            </div>
                        </div>
                        <div class="Show_center fl">
                            <h3>专享加息，仅限首投</h3>
                            <p>首笔投资“新手项目”，专享15%年化收益</p>
                            <div class="register_btn go_new">
                                <a href="javascript:;">加入新手标</a>
                            </div>
                        </div>
                    </div>
                    <!--长卡默认关2 end-->

                    <!--长卡未通关2 start-->
                    <div class="Show_state step_two clearfix" style="display:none;">
                        <div class="rough_one">
                            <div class="rough_red">
                                <div class="checkpoint_two"></div>
                            </div>
                            <div class="opabox clearfix">
                                <div class="opa"></div>
                                <p>未完成</p>
                            </div>
                        </div>
                        <div class="Show_left fl">
                            <div class="Show_Top clearfix">
                                <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                                <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                            </div>
                            <div class="Show_souvenir clearfix">
                                <img class="dialog mt8 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                                <img class="item_icon fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/item_icon.png" alt="">
                            </div>
                        </div>
                        <div class="Show_center fl">
                            <h3>专享加息，仅限首投</h3>
                            <p>首笔投资“新手项目”，专享15%年化收益</p>
                            <div class="register_btn go_new">
                                <a href="javascript:;">加入新手标</a>
                            </div>
                        </div>
                    </div>
                    <!--长卡未通关2 end-->

                    <!--长卡已通关2 start-->
                    <div class="Show_state step_two clearfix" style="display:none;">
                        <div class="rough_one">
                            <div class="rough_green">
                                <div class="checkpoint_two"></div>
                            </div>
                            <div class="opabox clearfix">
                                <div class="opa"></div>
                                <p>已通关</p>
                            </div>
                        </div>
                        <div class="Show_left fl">
                            <div class="Show_Top clearfix">
                                <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                                <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                            </div>
                            <div class="Show_souvenir clearfix">
                                <img class="dialog mt8 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                                <img class="item_icon fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/item_icon.png" alt="">
                            </div>
                        </div>
                        <div class="Show_center Show_right fl">
                            <h3>专享加息，仅限首投</h3>
                            <p>投资成功  专享15%年化收益</p>
                        </div>
                    </div>
                    <!--长卡已通关2 end-->

                    <!--长卡默认3 start-->
                    <div class="Show_state step_three clearfix" style=" display:none; ">
                        <div class="rough_one">
                            <div class="rough_red">
                                <div class="checkpoint_three"></div>
                            </div>
                        </div>
                        <div class="Show_left fl">
                            <div class="Show_Top clearfix">
                                <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                                <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                            </div>
                            <div class="Show_souvenir clearfix">
                                <img class="dialog mt6 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                                <img class="phone_icon fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/phone.png" alt="">
                            </div>
                        </div>
                        <div class="Show_center fl">
                            <h3>初有所获，厚积薄发</h3>
                            <p>首次收到还款利息时，赠送20元红包</p>
                        </div>
                    </div>
                    <!--长卡默认3 end-->

                    <!--未完成3 start-->
                    <div class="Show_state step_three clearfix" style=" display:none; ">
                        <div class="rough_one">
                            <div class="rough_red">
                                <div class="checkpoint_three"></div>
                            </div>
                            <div class="opabox clearfix">
                                <div class="opa"></div>
                                <p>未完成</p>
                            </div>
                        </div>
                        <div class="Show_left fl">
                            <div class="Show_Top clearfix">
                                <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                                <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                            </div>
                            <div class="Show_souvenir clearfix">
                                <img class="dialog mt6 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                                <img class="phone_icon fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/phone.png" alt="">
                            </div>
                        </div>
                        <div class="Show_center fl">
                            <h3>初有所获，厚积薄发</h3>
                            <p>首次收到还款利息时，赠送20元红包</p>
                        </div>
                    </div>
                    <!--未完成3 end-->
                    <!--长卡已通关3 start-->
                    <div class="Show_state step_three clearfix" style="display:none;">
                        <div class="rough_one">
                            <div class="rough_green">
                                <div class="checkpoint_three"></div>
                            </div>
                            <div class="opabox clearfix">
                                <div class="opa"></div>
                                <p>已通关</p>
                            </div>
                        </div>
                        <div class="Show_left fl">
                            <div class="Show_Top clearfix">
                                <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                                <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                            </div>
                            <div class="Show_souvenir clearfix">
                                <img class="dialog mt6 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                                <img class="phone_icon fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/phone.png" alt="">
                            </div>
                        </div>
                        <div class="Show_center Show_right fl">
                            <h3>初有所获，厚积薄发</h3>
                            <div class="distance">
                                <span>0</span><span>0</span><span>0</span>天后将收到第1笔利息和20元红包
                            </div>
                        </div>
                    </div>
                    <!--长卡已通关3 end-->
                    <!--长卡默认4 start-->
                    <div class="Show_state step_four clearfix" style="display:none;">
                        <div class="rough_one">
                            <div class="rough_red">
                                <div class="checkpoint_four"></div>
                            </div>
                        </div>
                        <div class="Show_left fl">
                            <div class="Show_Top clearfix">
                                <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                                <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                            </div>
                            <div class="Show_souvenir clearfix">
                                <img class="dialog mt1 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                                <img class="raise_icon fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/raise_icon.png" alt="">
                            </div>

                        </div>
                        <div class="Show_center fl">
                            <h3>财富增值，券力出击</h3>
                            <p>投资非新手项目任意金额，送5%加息券</p>
                            <div class="register_btn go_list">
                                <a href="javascript:;">立即加入</a>
                            </div>
                        </div>
                    </div>
                    <!--长卡默认4 end-->
                    <!--长卡未通关4 start-->
                    <div class="Show_state step_four clearfix" style="display:none;">
                        <div class="rough_one">
                            <div class="rough_red">
                                <div class="checkpoint_four"></div>
                            </div>
                            <div class="opabox clearfix">
                                <div class="opa"></div>
                                <p>未完成</p>
                            </div>
                        </div>
                        <div class="Show_left fl">
                            <div class="Show_Top clearfix">
                                <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                                <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                            </div>
                            <div class="Show_souvenir clearfix">
                                <img class="dialog mt1 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                                <img class="raise_icon fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/raise_icon.png" alt="">
                            </div>

                        </div>
                        <div class="Show_center fl">
                            <h3>财富增值，券力出击</h3>
                            <p>投资非新手项目任意金额，送5%加息券</p>
                            <div class="register_btn go_list">
                                <a href="javascript:;">立即加入</a>
                            </div>
                        </div>
                    </div>
                    <!--长卡未通关4 end-->

                    <!--长卡已通关4 start-->
                    <div class="Show_state step_four clearfix" style="display:none;">
                        <div class="rough_one">
                            <div class="rough_green">
                                <div class="checkpoint_four"></div>
                            </div>
                            <div class="opabox clearfix">
                                <div class="opa"></div>
                                <p>已通关</p>
                            </div>
                        </div>
                        <div class="Show_left fl">
                            <div class="Show_Top clearfix">
                                <img class="fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/head_portrait.png" alt="">
                                <img class="fr" src="<%=request.getContextPath()%>/resources/image/activity/big_war/dialog_box.png" alt="">
                            </div>
                            <div class="Show_souvenir clearfix">
                                <img class="dialog mt1 fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/robot.png" alt="">
                                <img class="raise_icon fl" src="<%=request.getContextPath()%>/resources/image/activity/big_war/raise_icon.png" alt="">
                            </div>

                        </div>
                        <div class="Show_center Show_right fl">
                            <h3>财富增值，券力出击</h3>
                            <p>投资成功  5%加息券已到账</p>

                        </div>
                    </div>
                    <!--长卡已通关4 end-->

                </c:if>
            </c:if>

		</div>
		<div class="project_list">
			<ul  class="status_list clearfix">

				<c:if test="${loginStatus == 0 || userCampaignStatus==0}">
					<!--关卡2 strat-->
					<li>
						<!--暂未完成-->
						<div class="rough">
							<div class="rough_one rough_distance">
								<div class="rough_red">
									<div class="checkpoint_two"></div>
								</div>
								<h3>专享加息</h3>
								<h3>仅限首投</h3>
							</div>
							<div class="opabox clearfix">
								<div class="opa"></div>
								<p>暂未完成</p>
							</div>
						</div>
					</li>
					<!--关卡3 strat-->
					<li>
						<!--暂未完成-->
						<div class="rough">
							<div class="rough_one rough_distance">
								<div class="rough_red">
									<div class="checkpoint_three"></div>
								</div>
								<h3>初有所获</h3>
								<h3>厚积薄发</h3>
							</div>
							<div class="opabox clearfix">
								<div class="opa"></div>
								<p>暂未完成</p>
							</div>
						</div>
					</li>

					<!--关卡4 strat-->
					<li>
						<!--暂未完成-->
						<div class="rough">
							<div class="rough_one rough_distance">
								<div class="rough_red">
									<div class="checkpoint_four"></div>
								</div>
								<h3>财富增值</h3>
								<h3>券力出击</h3>
							</div>
							<div class="opabox clearfix">
								<div class="opa"></div>
								<p>暂未完成</p>
							</div>
						</div>
					</li>

				</c:if>



                <c:if test="${loginStatus == 1}">
                    <c:if test="${userCampaignStatus==1}">
                        <!--关卡1 strat-->
                        <li style="display:none;">
                            <div class="rough" style="display:none;">
                                <div class="rough_one rough_distance">
                                    <div class="rough_red">
                                        <div class="checkpoint_one"></div>
                                    </div>
                                    <h3>注册成功</h3>
                                    <h3>999元红包已到账</h3>
                                </div>
                                <div class="opabox clearfix">
                                    <div class="opa"></div>
                                    <p>暂未完成</p>
                                </div>
                            </div>
                            <!--注册成功-->
                            <div class="rough" style="display:none">
                                <div class="rough_one succeed">
                                    <div class="rough_green">
                                        <div class="checkpoint_one"></div>
                                    </div>
                                    <p>注册成功</p>
                                    <p>999元红包已到账</p>
                                </div>
                            </div>
                        </li>
                        <!--关卡1 end-->

                        <!--关卡2 strat-->
                        <li  style="display:none;">
                            <!--暂未完成-->
                            <div class="rough" style="display:none;">
                                <div class="rough_one rough_distance">
                                    <div class="rough_red">
                                        <div class="checkpoint_two"></div>
                                    </div>
                                    <h3>专享加息</h3>
                                    <h3>仅限首投</h3>
                                </div>
                                <div class="opabox clearfix">
                                    <div class="opa"></div>
                                    <p>暂未完成</p>
                                </div>
                            </div>
                            <!--注册成功-->
                            <div class="rough" style="display:none;">
                                <div class="rough_one succeed">
                                    <div class="rough_green">
                                        <div class="checkpoint_two"></div>
                                    </div>
                                    <p>投资成功</p>
                                    <p>专享15%年化收益</p>
                                </div>
                            </div>
                        </li>
                        <!--关卡2 end-->
                        <!--关卡3 strat-->
                        <li  style="display:none;">
                            <!--暂未完成-->
                            <div class="rough" style="display:none;">
                                <div class="rough_one rough_distance">
                                    <div class="rough_red">
                                        <div class="checkpoint_three"></div>
                                    </div>
                                    <h3>初有所获</h3>
                                    <h3>厚积薄发</h3>
                                </div>
                                <div class="opabox clearfix">
                                    <div class="opa"></div>
                                    <p>暂未完成</p>
                                </div>
                            </div>
                            <!--注册成功-->
                            <div class="rough" style="display:none;">
                                <div class="rough_one succeed">
                                    <div class="rough_green">
                                        <div class="checkpoint_three"></div>
                                    </div>
                                    <p>XX天后将收到第</p>
                                    <p>一笔利息和20元红包</p>
                                </div>
                            </div>
                        </li>
                        <!--关卡3 end-->
                        <!--关卡4 strat-->
                        <li  style="display:none;">
                            <!--暂未完成-->
                            <div class="rough" style="display:none;">
                                <div class="rough_one rough_distance">
                                    <div class="rough_red">
                                        <div class="checkpoint_four"></div>
                                    </div>
                                    <h3>财富增值</h3>
                                    <h3>券力出击</h3>
                                </div>
                                <div class="opabox clearfix">
                                    <div class="opa"></div>
                                    <p>暂未完成</p>
                                </div>
                            </div>
                            <!--注册成功-->
                            <div class="rough" style="display:none;">
                                <div class="rough_one succeed">
                                    <div class="rough_green">
                                        <div class="checkpoint_four"></div>
                                    </div>
                                    <p>投资成功</p>
                                    <p>5%加息券已到账</p>
                                </div>
                            </div>
                        </li>
                        <!--关卡4 end-->

                    </c:if>
                </c:if>
			</ul>
		</div>



		<!--查看项目-->
		<div class="register_btn go_list examine_btn" style="display:none">
			<a href="javascript:;">查看优选项目，持续赚取收益</a>
		</div>
		<div class="activity_rules clearfix">
			<div class="travel_cont rule_show fl" style="display:none">
				<img src="<%=request.getContextPath()%>/resources/image/activity/big_war/code.png" alt=""/>
				<p>关注"中再融"</p>
				<p>获得更多惊喜</p>
			</div>
            <div class="app_cont rule_show fl" style="display:none">
                <img src="<%=request.getContextPath()%>/resources/image/activity/big_war/app_logo.png" alt=""/>
                <div class="loading_app">
                    <a href="https://m.zhongzairong.cn/views/static/download.jsp">下载APP</a>
                </div>
            </div>
			<div class="fr rule">
				<h3>活动规则</h3>
				<ol>
					<li>
                        本活动仅限11月21日（含）后注册的用户参与；
					</li>
					<li>
                        新手项目仅限新用户首笔投资；
					</li>
					<li>
                        活动最终解释权归中再融所有。
					</li>
				</ol>
			</div>


		</div>
	</div>
</div>
<!--弹窗-->
<div class="overlay" style="display:none;"></div>
<div class="Show_pop showactive" style="display:none;">
    <h4>您是我们的老朋友啦！</h4>
    <div class="btn olduser_btn"><a href="javascript:;">查看优选项目，持续赚取收益</a></div>
    <span class="close"></span>
</div>

<div class="weixin-modal" style="display:none;">
    <img src="<%=request.getContextPath()%>/resources/image/activity/big_war/weixin.png" alt="">
</div>
<script>
    FastClick.attach(document.body);//绑定fastclick
</script>
</body>
</html>