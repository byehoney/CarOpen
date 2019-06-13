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
    <link rel="stylesheet" href="${basePath}/resources/css/activity/edu/public.css" type="text/css"/>
    <link rel="stylesheet" href="${basePath}/resources/css/activity/edu/examination.css?v=32654356787654" type="text/css">
    <title>网贷科举，金榜题名，领红包啦！</title>
    <%@ include file="/views/inc/inc.jsp"%>
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
    <script>
        var sear = window.location.search;
        if(sear!=''){
            window.location.href="/investeducation.do"
        }
    </script>
</head>
<body>
<div class="load"></div>
<section class="main" style="display: none;">
    <img src="${basePath}/resources/image/activity/edu/titleBanner.png" alt="" class="titleBanner">
    <img src="${basePath}/resources/image/activity/edu/person.png" alt="" class="person">
    <img src="${basePath}/resources/image/activity/edu/sign.png" alt="" class="sign">
    <img src="${basePath}/resources/image/activity/edu/logo.png" alt="" class="logo">
    <%--预加载--%>
    <img src="${basePath}/resources/image/activity/edu/longBtnSelect.png" alt="" style="display: none;">
    <img src="${basePath}/resources/image/activity/edu/shortBtnSelect.png" alt="" style="display: none;">
    <img src="${basePath}/resources/image/activity/edu/longBtn.png" alt="" style="display: none;">
    <img src="${basePath}/resources/image/activity/edu/next.png" alt="" style="display: none;">
    <img src="${basePath}/resources/image/activity/edu/shortBtn.png" alt="" style="display: none;">
</section>
<section class="mainContent" style="display: none">
    <!--中奖-->
    <div class="registerBox" style="display: none">
        <div class="winner">
            <p>恭喜您，答对<span>7</span>道题目</p>
        </div>
        <div class="buttonBox">
            <div class="err01"></div>
            <input type="text" placeholder=" 输入手机号" class="phoneInp" maxlength="11">
            <a href="javascript:void (0)" class="btnMoney">立即领取68元</a>
        </div>

    </div>
    <!--落榜-->
    <div class="againBox" style="display: none">
        <div class="down">
            <p class="Dtitle">恭喜您，答对<span>7</span>道题目</p>
            <div class="downDiv">很遗憾落榜啦</div>
            <p class="marginTop">答对6题以上，可以领取68元红包</p>
            <img src="${basePath}/resources/image/activity/edu/erWeiMa.png" alt="" class="erWeiMa erWeiMaTop">
            <div class="btns clearfix">
                <a href="javascript:void (0)" class="redBtn aginBtn">再来一次</a>
                <a href="javascript:void (0)" class="yellowBtn inviteFri">邀请好友来开考</a>
            </div>
        </div>
    </div>
    <!--获得红包-->
    <div class="redPacket" style="display: none">
        <img src="${basePath}/resources/image/activity/edu/redPacket.png" alt="" class="redPacketImg">
        <p>68元红包已经放入您的账户，请注意查收</p>
        <img src="${basePath}/resources/image/activity/edu/erWeiMa.png" alt="" class="erWeiMa">
        <div class="btns clearfix btnsTop">
            <a href="javascript:void (0)" class="redBtn inviteFri hasCode">邀请好友领取68元</a>
            <a href="javascript:void (0)" class="yellowBtn toIndex">立即投资</a>
        </div>
    </div>
    <!--已领取红包-->
    <div class="receiveRedPacket" style="display: none">
        <div class="receive">
            <p>68元红包已经放入您的账户，不可以贪心哦。</p>
            <p>邀请好友一块来领取吧！</p>
        </div>
        <img src="${basePath}/resources/image/activity/edu/erWeiMa.png" alt="" class="erWeiMa">
        <div class="btns clearfix">
            <a href="javascript:void (0)" class="redBtn inviteFri hasCode">邀请好友领取68元</a>
            <a href="javascript:void (0)" class="yellowBtn toIndex">立即投资</a>
        </div>
    </div>
    <!--问题1-->
    <div class="questionOne question1" data-i='1' style="display: none;">
        <div class="questionAreaBox">
            <i class="topLeft"></i><i class="topRight"></i><i class="bottomLeft"></i><i class="bottomRight"></i>
            <div class="questionArea">
                <p>1、小融在某论坛推荐的三家网贷平台中，发现收益差别比较大，您会认为以下哪个收益区间是合理范围内的？</p>
            </div>
        </div>
        <!--选题区域-->
        <div class="questionSelect questionSelect1" style="display: block">
            <button class="longBtn">2％－4%</button>
            <button class="longBtn">8%－12%</button>
            <button class="longBtn">15％－25%</button>
            <button class="longBtn">25％－30%</button>
        </div>
        <!--答错-->
        <div class="analysisBox analysisBox1" data-i='1' style="display: none">
            <!--正确答案-->
            <div class="rightKey">
                <p><span>答案：</span><span>8%—12%</span></p>
            </div>
            <div class="analysis">
                <p class="clearfix"><span class="titleSpan">解析：</span><span class="contentSpan">《网络借贷信息中介机构业务活动管理暂行办法》中明确规定，禁止平台虚构、夸大融资项目的真实性、收益前景。</span></p>
            </div>

        </div>
        <button class="nextBtn">下一题</button>
    </div>
    <!--问题2-->
    <div class="questionTwo question2" data-i='2' style="display: none">
        <div class="questionAreaBox">
            <i class="topLeft"></i><i class="topRight"></i><i class="bottomLeft"></i><i class="bottomRight"></i>
            <div class="questionArea">
                <p>2、在选择网贷平台进行投资时，以下哪项不是平台的考量指标？</p>
            </div>
        </div>
        <!--选题区域-->
        <div class="questionSelect questionSelect2" style="display: block">
            <button class="longBtn">银行存管</button>
            <button class="longBtn">股东背景</button>
            <button class="longBtn">高于20%的收益率</button>
            <button class="longBtn">项目真实可靠</button>
        </div>
        <!--答错-->
        <div class="analysisBox analysisBox2" data-i='2' style="display: none">
            <!--正确答案-->
            <div class="rightKey">
                <p><span>答案：</span><span>高于20%的收益率</span></p>
            </div>
            <div class="analysis">
                <p class="clearfix"><span class="titleSpan">解析：</span><span class="contentSpan">在选择网贷平台投资时，首先关注安全性，警惕超出行业合理收益的平台。</span></p>
            </div>

        </div>
        <button class="nextBtn">下一题</button>

    </div>
    <!--问题3-->
    <div class="questionThree question3" data-i='3' style="display: none">
        <div class="questionAreaBox">
            <i class="topLeft"></i><i class="topRight"></i><i class="bottomLeft"></i><i class="bottomRight"></i>
            <div class="questionArea">
                <p>3、标的期限90天，年化利率7%（按天计息），投资1万元，在标的到期后可以收到多少元利息收益？（送分题哦）</p>
            </div>
        </div>
        <!--选题区域-->
        <div class="questionSelect questionSelect3" style="display: block">
            <button class="longBtn">721元</button>
            <button class="longBtn">175元</button>
            <button class="longBtn">700元</button>
            <button class="longBtn">172.6元</button>
        </div>
        <!--答错-->
        <div class="analysisBox analysisBox3" data-i='3' style="display: none">
            <!--正确答案-->
            <div class="rightKey">
                <p><span>答案：</span><span>172.6元</span></p>
            </div>
            <div class="analysis">
                <p class="clearfix"><span class="titleSpan">解析：</span><span class="contentSpan">按天计息的项目，利息收益的计算方式是投资金额*年化利率*项目期限/365
                    10000*7%*90/365=172.6</span></p>
            </div>

        </div>
        <button class="nextBtn">下一题</button>

    </div>
    <!--问题4-->
    <div class="questionFour question4" data-i='4' style="display: none">
        <div class="questionAreaBox">
            <i class="topLeft"></i><i class="topRight"></i><i class="bottomLeft"></i><i class="bottomRight"></i>
            <div class="questionArea specDel">
                <h3>4、下面对于还款方式的描述，错误的是：</h3>
                <p class="clearfix"><span class="typeSpan">A :</span><span class="listSpan">“等额本息”——借款人每月以相等金额偿还贷款本息。</span></p>
                <p class="clearfix"><span class="typeSpan">B :</span><span class="listSpan">“按月付息，到期还本”——借款人按月偿还利息，最后一期偿还全部本金。</span></p>
                <p class="clearfix"><span class="typeSpan">C :</span><span class="listSpan">“一次性还本付息”——借款人在指定日期一次性偿还本金和利息。</span></p>
                <p class="clearfix"><span class="typeSpan">D :</span><span class="listSpan">“按天计息，先息后本”——借款人以月为单位计算利息，先还利息，再还本金。</span></p>
            </div>
        </div>
        <!--选题区域-->
        <div class="questionSelect questionSelect4 questionWidth clearfix" style="display: block">
            <div class="clearfix SpecFou">
                <button class="shortBtn fl">A</button><button class="shortBtn fr">B</button>
                <button class="shortBtn fl">C</button><button class="shortBtn fr">D</button>
            </div>
        </div>
        <!--答错-->
        <div class="analysisBox analysisBox4" data-i='4' style="display: none">
            <!--正确答案-->
            <div class="rightKey">
                <p><span>答案：</span><span>D</span></p>
            </div>
            <div class="analysis">
                <p class="clearfix"><span class="titleSpan">解析：</span><span class="contentSpan">“按天计息，先息后本”，是指以天为单位计算利息，借款人先还利息，再还本金的还款方式。</span></p>
            </div>

        </div>
        <button class="nextBtn">下一题</button>
    </div>
    <!--问题5-->
    <div class="questionFive question5" data-i='5' style="display: none">
        <div class="questionAreaBox">
            <i class="topLeft"></i><i class="topRight"></i><i class="bottomLeft"></i><i class="bottomRight"></i>
            <div class="questionArea">
                <p>5、小融想注册一家网贷平台，从哪些宣传推广途径获取信息比较可靠？(多选)</p>
            </div>
        </div>
        <!--选题区域-->
        <div class="questionSelect questionSelect5" style="display: block">
            <button class="longBtn">线下门店</button>
            <button class="longBtn">微信推广</button>
            <button class="longBtn">互联网</button>
            <button class="longBtn">超市门口</button>
        </div>
        <!--答错-->
        <div class="analysisBox analysisBox5" data-i='5' style="display: none">
            <!--正确答案-->
            <div class="rightKey">
                <p><span>答案：</span><span>微信推广、互联网</span></p>
            </div>
            <div class="analysis">
                <p class="clearfix"><span class="titleSpan">解析：</span><span class="contentSpan">监管规定，网贷平台不得自行或委托、授权第三方在互联网、固定电话、移动电话等电子渠道以外的物理场所进行宣传或推介项目</span></p>
            </div>

        </div>
        <button class="nextBtn">下一题</button>
    </div>
    <!--问题6-->
    <div class="questionSix question6" data-i='6' style="display: none">
        <div class="questionAreaBox">
            <i class="topLeft"></i><i class="topRight"></i><i class="bottomLeft"></i><i class="bottomRight"></i>
            <div class="questionArea">
                <p>6、在考察平台时，以下哪些信息是平台官网必须披露的？(多选)</p>
            </div>
        </div>
        <!--选题区域-->
        <div class="questionSelect questionSelect6" style="display: block">
            <button class="longBtn">“投资有风险，理财需谨慎”等风险提示</button>
            <button class="longBtn">网络借贷信息中介机构组织信息</button>
            <button class="longBtn">借款人基本信息</button>
            <button class="longBtn">投资人基本信息</button>
        </div>
        <!--答错-->
        <div class="analysisBox analysisBox6" data-i='6' style="display: none">
            <!--正确答案-->
            <div class="rightKey ">
                <p class="clearfix tAlign"><span class="titleSpan">答案：</span><span class="contentSpan">“投资有风险，理财需谨慎”等风险提示、网络借贷信息中介机构组织信息、借款人基本信息</span></p>
            </div>
            <div class="analysis">
                <p class="clearfix"><span class="titleSpan">解析：</span><span class="contentSpan">2017年8月23日，监管层下发《网络借贷信息中介机构业务活动信息披露指引》，要求网贷平台通过其官方网站及其他互联网渠道向社会公众公示机构基本信息、运营信息、项目信息、重大风险信息等。</span></p>
            </div>

        </div>
        <button class="nextBtn">下一题</button>
    </div>
    <!--问题7-->
    <div class="questionSeven question7" data-i='7' style="display: none">
        <div class="questionAreaBox">
            <i class="topLeft"></i><i class="topRight"></i><i class="bottomLeft"></i><i class="bottomRight"></i>
            <div class="questionArea">
                <p>7、小融选择了一家已上线银行存管的平台准备投资，不会出现以下哪些情况？(多选)</p>
            </div>
        </div>
        <!--选题区域-->
        <div class="questionSelect questionSelect7" style="display: block">
            <button class="longBtn">银行盘点账目，一周内不能正常提现</button>
            <button class="longBtn">交易时需输入存管银行交易密码</button>
            <button class="longBtn">在第三方支付机构页面查询出借明细</button>
            <button class="longBtn">通过存管账户可查询交易明细</button>
        </div>
        <!--答错-->
        <div class="analysisBox analysisBox7" data-i='7' style="display: none">
            <!--正确答案-->
            <div class="rightKey">
                <p class="clearfix tAlign"><span class="titleSpan">答案：</span><span class="contentSpan">银行盘点账目，一周内不能正常提现、在第三方支付机构页面查询出借明细</span></p>
            </div>
            <div class="analysis">
                <p class="clearfix"><span class="titleSpan">解析：</span><span class="contentSpan">监管规定，网贷平台需要选择商业银行作为资金存管机构，存管银行为出借人、借款人和担保人等在网络借贷资金存管专用账户下分别开立子账户。</span></p>
            </div>

        </div>
        <button class="nextBtn">下一题</button>
    </div>
    <!--遮罩层-->
    <div class="overlay" style="display:none;"></div>
    <!--弹窗-->
    <div class="verify">
        <div class="closebtn"></div>
        <ul>
            <li>
                <i class="insideIcon"></i>
                <input id="mobile_num" class="txt" type="text" placeholder="请输入手机号码" maxlength="11">
            </li>
            <li>
                <i class="refreshIcon"></i>
                <input id="img_code" class="verificationCode" type="text" placeholder="请输入图形验证码" maxlength="4">
                <img id="img_code_pic" id="img_code_pic" src="/userInfo/getCode.do" alt="图片验证码">
            </li>
            <li>
                <i class="phoneCode"></i>
                <input id="msg_code" class="verificationCode" type="text" placeholder="请输入短信验证码" maxlength="6">
                <span class="pop_msg_count">发送验证码</span>
            </li>
        </ul>
        <div class="draw">
            <div class="draw_btn">
                <a id="go_reg" href="javascript:void (0);">立即领取</a>
            </div>
        </div>
    </div>
    <!--错误信息-->
    <div class="errormsg"></div>
    <!--获得红包分享弹框-->
    <div class="share" style="display: none">
        <p>点击右上角“...”或者“ <img src="${basePath}/resources/image/activity/edu/share.png" alt=""> ”</p>
        <p>立即分享给好友</p>
    </div>
</section>
<audio id="bgm" loop="loop" style="display: none;">
    <source src="${basePath}/resources/js/activity/edu/bgm.mp3" type="audio/mp3" />
</audio>
<div class="musicCtrl on"></div>
</body>
<script src="${basePath}/resources/js/activity/edu/jweixin-1.0.0.js"></script>
<script src="${basePath}/resources/js/activity/edu/edu.js?v=20171025"></script>
</html>
