<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    request.setAttribute("verCode", "?r=Version2018020815");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="author" content="m.zhongzairong.cn">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <title>我的邀请</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/worldCup/invitationList.css${verCode}"/>
    <script>
        var basePath = "<%=request.getContextPath()%>";
        var sharePath = 'http://192.168.6.235:8020';
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
<div class="main docWrapper">
    <div class="invite_num_box">
        <div class="invite_left_p"></div>
        <div class="invite_right_p"></div>
        <div class="num_content">
            <ul class="clearfix">
                <li class="fl">
                    <div class="num_text">
                        <p class="num invite_num">0</p>
                        <p class="text">已邀请好友</p>
                    </div>
                </li>
                <li class="fl">
                    <div class="num_text ">
                        <p class="num invest_num">0</p>
                        <p class="text">已投资好友</p>
                    </div>
                </li>
                <li class="fl">
                    <div>
                        <p class="num get">0元</p>
                        <p class="text">已获得奖励</p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="invest_list_box">
        <ul class="list_head clearfix">
            <li class="fl">好友手机号</li>
            <li class="fl">投资金额</li>
            <li class="fl">奖励金额</li>
        </ul>
        <ul class="list_body" style="display: none">
            <li>
                <p>130****3123</p>
                <p>510000元</p>
                <p>10元</p>
            </li>
            <li>
                <p>130****3123</p>
                <p>510000元</p>
                <p class="tip">短信提醒</p>
            </li>
            <li>
                <p>130****3123</p>
                <p>510000元</p>
                <p class="tiped">已提醒</p>
            </li>
        </ul>
        <div class="no_data" style="display: none">您还没有邀请好友，快去邀请拿现金吧！</div>
        <div class="invite_more" style="display: none">邀请更多好友</div>
    </div>
</div>
<%--错误提示框开始--%>
<div class="err"></div>
<%--遮罩--%>
<div class="overlay" style="display:none;"></div>
<input type="hidden" id="code" value="${code}">
<input type="hidden" id="userCode" value="" />
<input type="hidden" id="userPhone" value="" />
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/fastclick.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/worldCup/invitationList.js${verCode}"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script>
    var flag=getadd('flag');
    var token=getadd('token');
    var userId =getadd('userId');
    var url='';
    // app 端调用改变页面点击事件或样式
    function changeForApp(){
        $(".invite_more").on("click",function(){
//            var mobile=$("#userPhone").val();
//            var yqm=$("#userCode").val();
            $.ajax({
                type:'POST',
                dataType:'json',
                url:basePath+'/worldCup/createCode.do',
                data:{flag:flag,token:token,userId:userId},
                success:function(res){
                    if(res.code==0){
                        url='data:image/png;base64,'+res.data.img;
                        var imageMsg = JSON.stringify({
                            "imageType": "3", "imageStr": url,"platAry": ["WechatSession", "WechatTimeLine", "QQ", "Qzone"]
                        });
                        anniversary.shareImage(imageMsg)
                    }
                }
            });
//            var title='送你999元大红包，快来拿走';
//            var des='我已参加中再融激情世界杯活动，每日免费点球可赢百元现金，好东西就要分享给你！';
//            var shareUrl='http://m.duanhan.ren/worldCup/toRegisterPage.do?yqm='+yqm+'&mobile='+mobile;
//            var iconUrl='http://m.duanhan.ren/resources/image/activity/worldCup/wxShare.jpg';
//            var platAry=['WechatSession','WechatTimeLine','QQ','Qzone'];
//            shareMessage(title,des,shareUrl,iconUrl,platAry)
        });
    }
    //   app去登陆
    function userLogin(){
        anniversary.userLogin();
    }
    //app去投资
    function jumpInvest(){
        anniversary.jumpInvest();
    }
    // 点击调用分享功能
    function shareMessage(title,des,shareUrl,iconUrl,platAry) {
        // 替换参数值 链接要完整
        //platAry 控制显示哪一种平台  WechatSession 微信 WechatTimeLine 朋友圈 QQ qq好友 Qzone qq空间 Sina 新浪
        var shareInfo = JSON.stringify({
            "title": title, "desc": des, "shareUrl": shareUrl,
            "shareIco": iconUrl,
            "platAry":platAry
        });

        anniversary.htmlShare(shareInfo);
    }
    //app获取app还是wap
    function getadd(flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
</script>
</body>
</html>
