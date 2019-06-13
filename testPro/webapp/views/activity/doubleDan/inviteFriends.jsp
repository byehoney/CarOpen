<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>双旦嘉年华，瓜分1000万现金</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/doubleDan/public.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/doubleDan/invite_page.css${verCode}"/>
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
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
<div class="main">
    <div class="invite_page">
        <div class="banner">
            <img src="<%=request.getContextPath()%>/resources/image/activity/doubleDan/invite_page_one.png" alt="">
            <img src="<%=request.getContextPath()%>/resources/image/activity/doubleDan/invite_page_two.png" alt="">
        </div>
        <div class="record_one">
            <div class="invite_count">
                <img class="plumage" src="<%=request.getContextPath()%>/resources/image/activity/doubleDan/plumage.png" alt="">
                <p>我的邀请记录</p>
                <div class="particulars">
                    <div class="clearfix particularsDiv">
                        <div class="invite_left fl clearfix">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/doubleDan/people.png" alt="">
                            <div>
                                <p>邀友人数</p>
                                <p class="inviteNum">0人</p>
                            </div>
                        </div>
                        <div class="invite_right fl clearfix">
                            <img src="<%=request.getContextPath()%>/resources/image/activity/doubleDan/diamond.png" alt="">
                            <div>
                                <p>邀友奖励</p>
                                <p class="inviteAward">0.00元</p>
                            </div>
                        </div>
                    </div>

                    <div class="friends_pic" style="display:none;">
                        <div></div>
                        <p>快去邀请好友赚现金~</p>
                    </div>
                    <!--邀请列表-->
                    <ul class="invite_list" style="display:n-one;">
                        <%--<li>--%>
                            <%--<i>1</i>--%>
                            <%--<div>--%>
                                <%--<p>137****4598</p>--%>
                                <%--<p>投资次数 :<span>2</span></p>--%>
                            <%--</div>--%>
                            <%--<div class="tipBtn" data-mobile="13716303290">--%>
                                <%--<img src="<%=request.getContextPath()%>/resources/image/activity/doubleDan/alarm_yellow.png" alt="">--%>
                                <%--<p>提醒</p>--%>
                            <%--</div>--%>

                        <%--</li>--%>
                        <%--<b></b>--%>
                        <%--<li>--%>
                            <%--<i>2</i>--%>
                            <%--<div>--%>
                                <%--<p>137****4598</p>--%>
                                <%--<p>投资次数 :<span>2</span></p>--%>
                            <%--</div>--%>
                            <%--<div class="tipBtn">--%>
                                <%--<img src="<%=request.getContextPath()%>/resources/image/activity/doubleDan/alarm_grey.png" alt="">--%>
                                <%--<p class="remind">已提醒</p>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<b></b>--%>
                        <%--<li>--%>
                            <%--<i>3</i>--%>
                            <%--<div>--%>
                                <%--<p>137****4599</p>--%>
                                <%--<p>投资次数 :<span>2</span></p>--%>
                            <%--</div>--%>
                            <%--<div class="tipBtn" data-mobile="13716303294">--%>
                                <%--<img src="<%=request.getContextPath()%>/resources/image/activity/doubleDan/alarm_yellow.png" alt="">--%>
                                <%--<p>提醒</p>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<b></b>--%>
                    </ul>
                </div>
            </div>
        </div>
        <div class="record_two">
            <div class="paging clearfix">
                <span class="fl left_arrow"></span><em><i class="curPage">1</i> / <i class="sumPage">1</i></em><span class="fr right_arrow"></span>
            </div>
        </div>
        <div class="record_three">
            <div class="invite_friends">邀友投资赚现金</div>
            <p>邀请好友注册且投资可获得好友每笔投资额的0.5%现金奖励</p>
        </div>
    </div>
</div>
<!--链接弹窗-->
<div class="invite_pup" style="display:none;">
    <div class="close_btn"></div>
    <h3>长按复制输入框内容发送给好友 !</h3>
    <div>
        <p class="popText">朋友，我为你准备了999元大红包！点击领取→https://m.zhongzairong.cn/redpackets.do78</p>
    </div>
</div>
<!-- toast提示 -->
<div class="err"></div>
<div class="overlay" style="display:none;"></div>
<%--服务器当前时间--%>
<input type="hidden" name="" value="${currentTime}" id="currentTime">
<%--活动开始时间--%>
<input type="hidden" name="" value="${campaignStartTime}" id="campaignStartTime">
<%--活动结束时间--%>
<input type="hidden" name="" value="${campaignEndTime}" id="campaignEndTime">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/doubleDan/fastclick.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/doubleDan/inviteList.js${verCode}"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script>
    var fDesTitleArr=[
        '1000万现金奖池正在被瓜分，还不赶紧来！',
        '老铁，摆好姿势了吗？10%加息券白送你！',
        '全民尖叫，瓜分1000万现金，先到先得哦~',
        '999元红包送给你，代表我满满的关怀！',
        '赠人玫瑰，手有余香！送你999元红包，快快领取>>'
    ];
    var fDesArr=[
        '中再融国资平台可信赖，新手专享15%年化收益和999元红包。',
        '15%收益+999元红包+10%加息券已准备好！你还在等什么？',
        '论理财靠谱，我只信赖国资平台中再融！新用户注册还可得999元红包→',
        '我正在参加瓜分1000万现金活动，邀你一起享受现金瓜分乐趣，机会不容错过哦！',
        '福利加码，10%加息券，1%返现红包，一起来赚钱'
    ];
    var isNoStart=false;
    var isEnd=false;
    var tipShow=false;//错误提示显示状态
    // app 端调用改变页面点击事件或样式
    function changeForApp(){
        //app中点击邀请好友
        $(".record_three").off('click','.mobile_invite_friends').on("click",'.mobile_invite_friends',function(){
            canInvest();
            if(isNoStart){
                errTip($(".err"),'活动即将开始',2000);
                return;
            }else if(isEnd){
                errTip($(".err"),'活动已结束',2000);
                return;
            }
            var desIndex=parseInt(5*Math.random());
            var title=fDesTitleArr[desIndex];
            var des=fDesArr[desIndex];
            var shareUrl='https://m.zhongzairong.cn/redpackets.do?yqm='+getadd('yqm');
            var iconUrl='https://m.zhongzairong.cn/resources/image/activity/doubleDan/wxShare.png';
            var platAry=['WechatSession','WechatTimeLine','QQ','Qzone','Sina'];
            shareMessage(title,des,shareUrl,iconUrl,platAry)
        });
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
    //错误提示弹窗
    function errTip(obj,info,dur){
        obj.show().html(info);
        tipShow=true;
        setTimeout(function(){
            tipShow=false;
            obj.html("").hide();
        },dur)
    }
    function getadd (flag){ //app获取app还是wap
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
    //活动是否开始弹窗
    function canInvest(){
        var now_time=$("#currentTime").val();
        var start_time=$("#campaignStartTime").val();
        var end_time =$("#campaignEndTime").val();
        if(now_time>end_time){//未在活动时间范围
            isEnd=true;
        }else if(now_time<start_time){
            isNoStart=true;
        }else{
            isNoStart=false;
            isEnd=false;
        }
    }
</script>
</body>
</html>