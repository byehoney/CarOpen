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
<title>中再融，牵手迅雷联合送福利</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/present/swiper.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/xunlei.css">
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/common/jquery.md5.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/present/swiper.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/ruffian/jquery.nicescroll.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/xunlei.js"></script>
<script src="https://payment.xunlei.com/static/js/pv_min.js" type="text/javascript" ></script>
<script type="text/javascript">
window.habo_aid = "actid_292";//迅雷提供的habo_aid;
</script>

<script>
	var basePath = "<%=request.getContextPath()%>";
</script>
</head>
<body>
<section class="main docWrapper">
    <!--banner-->
    <div class="bannerImg">
        <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/banner_fir.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/banner_03.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/banner_04.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/banner_05.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/banner_06.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/banner_07.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/banner_08.png" alt="">
    </div>
    <!--content-->
    <div class="contents">
        <div class="register">
            <div class="regLoginModule">
                <div class="errormsg"></div>
                <div class="listDiv">
                    <span class="registerIcon iconOne"></span>
                    <span class="lines fl"></span>
                    <input id="mobile_num" type="text" class="inp" placeholder="请输入您的手机号码" maxlength="11">
                </div>
                <div class="listDiv">
                    <span class="registerIcon iconTwo"></span>
                    <span class="lines fl"></span>
                    <input id="img_code" type="text" class="inp shortWidth" placeholder="请输入图片中的字符" maxlength="4">
                    <div class="verification"><img id="img_code_pic" src="<%=request.getContextPath()%>/userInfo/getCode.do" alt="" ></div>
                </div>
                <div class="listDiv msgLi">
                    <span class="registerIcon iconThree"></span>
                    <span class="lines fl"></span>
                    <input id="msg_code" type="text" class="inp shortWidth" placeholder="请输入手机验证码" maxlength="6">
                    <div class="sendCode"><span class="pop_msg_count">发送验证码</span></div>
                </div>
                <div class="listDiv">
                    <span class="registerIcon iconFour"></span>
                    <span class="lines fl"></span>
                    <input id="password" type="password" class="inp" placeholder="请输入6-16位字符密码" maxlength="16" minlength="6">
                </div>
                <div class="agree">
                    <i class="radio pop_agron"></i><p>同意<a href="<%=request.getContextPath()%>/views/agreement/serve_agreement.jsp">《服务协议》</a>、<a href="<%=request.getContextPath()%>/views/agreement/secret_agreement.jsp">《隐私条款》</a></p>
                </div>
                <div id="go_reg" class="registerNow" href="javascript:;">立即注册</div>
                <div id="go_login" class="registerNow mt60" href="javascript:;">立即登录</div>
                <c:if test="${xlaccount!=null&&xlaccount!=''}">
                    <p class="bind">注册并绑定迅雷账号：${xlaccount }</p>
                </c:if>
                <div class="gone">已有账号<a href="javascript:void (0)">登录</a></div>
                <div class="gone marginTop hide"><a href="javascript:void (0)">去注册</a></div>
            </div>
        </div>
        <div class="explainModule">
            <div class="winter_jasmine"></div>
            <div class="rim_icon"></div>
            <div class="rim_count">
                <div class="rim_bg">
                    <ul>
                        <li>
                            <div class="red_bg">
                                <div class="red_rimBg">
                                    <p class="first_shot">首投金额满3000<em>（限≤30天新手标）</em></p>
                                    <div class="VIp_code">
                                        <div>
                                            <span>12</span>个月
                                        </div>
                                    </div>
                                    <p class="member">另送<em>30</em>元迅雷现金红包</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="red_bg">
                                <div class="red_rimBg">
                                    <p class="first_shot">首投金额满10000<em>（限≤30天新手标）</em></p>
                                    <div class="VIp_code">
                                        <div>
                                            <span>12</span>个月
                                        </div>
                                    </div>
                                    <p class="member">另送<em>100</em>元迅雷现金红包</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="red_bg">
                                <div class="red_rimBg">
                                    <p class="first_shot">复投金额满3000<em>（限≤30天标）</em></p>
                                    <div class="raise_code">
                                        <div>
                                            <span>3</span>%
                                        </div>
                                    </div>
                                    <p class="member">期待年回报率<em>6.5</em>%</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="red_bg">
                                <div class="red_rimBg">
                                    <p class="first_shot">复投金额满3000<em>（限80天＜标≤90天）</em></p>
                                    <div class="raise_code">
                                        <div>
                                            <span>1</span>%
                                        </div>
                                    </div>
                                    <p class="member">期待年回报率<em>9</em>%</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="rim_icon"></div>
            <div class="resource"></div>
            <div class="showImg">
                <div class="swiper-container swiper-container-horizontal">
                    <div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-734px, 0px, 0px);">
                        <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4" style="width: 367px;">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/show_5.png" alt="">
                        </div>
                        <div class="swiper-slide swiper-slide-prev" data-swiper-slide-index="0" style="width: 367px;">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/show_1.png" alt="">
                        </div>
                        <div class="swiper-slide swiper-slide-active" data-swiper-slide-index="1" style="width: 367px;">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/show_2.png" alt="">
                        </div>
                        <div class="swiper-slide swiper-slide-next" data-swiper-slide-index="2" style="width: 367px;">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/show_3.png" alt="">
                        </div>
                        <div class="swiper-slide" data-swiper-slide-index="3" style="width: 367px;">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/show_4.png" alt="">
                        </div>
                        <div class="swiper-slide" data-swiper-slide-index="4" style="width: 367px;">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/show_5.png" alt="">
                        </div>
                        <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="0" style="width: 367px;">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/show_1.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span></div>
            </div>
        </div>
    </div>
    <!--footer-->
    <div class="footer">
        <ul class="codeList">
            <li>
                <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/app.jpg" alt="" class="app">
                <p>APP下载</p>
            </li>
            <li>
                <img src="<%=request.getContextPath()%>/resources/image/activity/xunlei/weixin.jpg" alt="" class="weixin">
                <p>扫码关注微信</p>
            </li>
        </ul>
        <div class="copyright">
            <p class="phones"><span>客服电话</span><span>4001-156-157</span><span>服务时间9:00-20:00</span></p>
            <p class="numbers">京ICP备16002418号-1</p>
            <p class="company"><span>2016 www.zhongzairong.cn</span><span>中再融(北京)科技有限公司 版权所有</span></p>
        </div>
    </div>
</section>

<div class="rule_btn"></div>
<div class="overlay_two"></div>
<div class="activity_rules" style="display:none;">
    <div class="close_btn"></div>
    <div class="rule_lt_icon"></div>
    <div class="rule_rt_icon"></div>
    <div class="rule_lb_icon"></div>
    <div class="rule_rb_icon"></div>
    <!--活动规则-->
    <div class="rules_count">
        <ol class="activeRule">
            <li>注册即送999元现金红包，投资即可兑现；</li>
            <li>
                <p>新用户首投：</p>
                <p><span>①新用户首投金额满3000（限≤30天新手标），即可获得迅雷12个月白金会员及30元迅雷专属现金红包奖励；</span></p>
                <p><span>②新用户首投金额满10000（限≤30天新手标），即可获得迅雷12个月白金会员及100元迅雷专属现金红包奖励；</span></p>
            </li>
            <li>
                <p>首投奖励（会员及现金红包奖励），仅限新用户（即在本页面注册且未参与首次交易的用户）完成首次交易可得；每个用户只能获得1次会员及1次现金红包奖励；</p>
                <p><span>红包领取说明：投资成功后可前往迅雷金融超市页面点击我的卡券-我的红包领取；<a href="http://jinrong.xunlei.com/myaccount.html
" target="_blank">点击领取</a>，未到账或其他事宜请联系迅雷客服；<a href="http://xlkf.xunlei.com/cxfz/chatClient/chatbox.jsp?companyID=8950&configID=49&enterurl=jinrong.xunlei.com&policyId=38&live800_domain=jinrong.xunlei.com&live800_robot_ud_jinron
" target="_blank">在线客服</a>，现金红包
   在项目投资期限结束后可直接提现到支付宝或微信上</span></p>
            </li>
            <li>
                <p>复投加息：（复投中再融指定标且复投投额达标，均可使用迅雷专属加息券）</p>
                <p><span>①限≤30天标，享迅雷专属加息3%；</span></p>
                <p><span>②限80天＜标≤90天，享迅雷专属加息1%；</span></p></li>
            <li>
                <p>复投加息券将直接发放至迅雷账户，复投加息券特别说明：（3000≤复投投额≤10000，超出10000部分不予以加息）；项目到期后可直接提现至支付宝或微信上。</p>
            </li>
            <li>迅雷相关奖励不予平台奖励及收益产生关联，并不承担任何产品风险。</li>
            <li>迅雷并非网站所有者或运营方，且不对产品设计、管理与履约承担任何责任。</li>
        </ol>
    </div>
</div>
    <!--弹窗 start-->
    <div class="overlay" style="display: none"></div>
    <div class="warmTip" style="display: none">
        <h3>温馨提示</h3>
        <p>未检测到迅雷账号，请先回到迅雷平台登录迅雷账号后再注册，否则首投后将无法获得奖励</p>
        <a href="<%=request.getContextPath()%>/xunlei/toXunleiLogin.do" class="loginRightNow">立即登录迅雷账号</a>
    </div>
    <!--弹窗 end-->
    <input id="logstatus" type="hidden" value="${status }">
    <input id="xlaccount" type="hidden" value="${xlaccount }">
    <input id="loanId" type="hidden" value="${loanId }">
    <input id="xluserid" type="hidden" value="${xluserid }">
    <input id="referfrom" type="hidden" value="${referfrom }">
</body>
</html>