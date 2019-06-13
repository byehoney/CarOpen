<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="author" content="m.zhongzairong.cn">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <title>11.11 狂欢盛典</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/prize.css${verCode}"/>
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
<section class="main">
    <div class="banner">
        <img src="<%=request.getContextPath()%>/resources/image/activity/ruffian/banner.jpg" alt="">
        <p class="activeDay">2017-11-07 至 2017-11-21</p>
    </div>
    <div class="p_cont">
        <div class="tabList">
            <ul class="clearfix">
                <li><span class="active" data-link="myPrize">我的奖品</span></li>
                <li><span data-link="myCoin">我的金币</span></li>
                <li><span data-link="myInvite">我的邀请</span></li>
            </ul>

        </div>
        <div id="infoArea">
            <div class="myPrize infoArea">
                <div class="goldCoin">
                    <ul class="clearfix">
                        <li>
                            <em class="usable"></em>
                            <span>可用金币</span>
                        </li>
                        <li>
                            <em class="used"></em>
                            <span>已消耗金币</span>
                        </li>
                        <li>
                            <em class="income"></em>
                            <span>累计赚取金币</span>
                        </li>
                    </ul>
                </div>
                <div class="prizeArea">
                    <ul class="giftTab" border="0" width="100%">
                            <li class="goldBar">
                                <div class="leftGift">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/ruffian/gold.png" alt="" class="goldImg">
                                </div>
                                <div class="rightNum">×1</div>

                            </li>
                            <li class="tv">
                                <div class="leftGift">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/ruffian/watchTV.png" alt="" class="watchTV">
                                </div>
                                <div class="rightNum">×1</div>
                            </li>
                            <li class="sweeper">
                                <div class="leftGift">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/ruffian/robot.png" alt="" class="robot">
                                </div>
                                <div class="rightNum">×1</div>
                            </li>
                            <li class="microWave">
                                <div class="leftGift">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/ruffian/machine.png" alt="" class="machine">
                                </div>
                                <div class="rightNum">×1</div>
                            </li>
                            <li class="redBagBig">
                                <div class="leftGift">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/ruffian/redBagBig.png" alt="" class="redBag">
                                </div>
                                <div class="rightNum">×1</div>
                            </li>
                            <li class="redbagLittle">
                                <div class="leftGift ">
                                    <img src="<%=request.getContextPath()%>/resources/image/activity/ruffian/redBagLittle.png" alt="" class="redBag">
                                </div>
                                <div class="rightNum">×1</div>
                            </li>
                    </ul>

                </div>
                <div class="prizeList">
                    <div class="tab_head">
                        <table width="100%">
                            <thead>
                            <tr>
                                <td>时间</td>
                                <td>兑换奖品</td>
                                <td>消耗金币</td>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="tab_body">
                        <table width="100%">
                            <tbody>

                            </tbody>
                        </table>

                    </div>
                    <div class="noData" style="display: none;">暂无数据</div>
                </div>
            </div>
            <div class="myCoin infoArea hide">
                <div class="countData">
                    <ul class="clearfix">
                        <li>
                            <em class="invest"></em>
                            <span>投资赚取金币</span>
                        </li>
                        <li>
                            <em class="invite"></em>
                            <span>邀友赚取金币</span>
                        </li>
                    </ul>
                </div>
                <div class="coinList">
                    <div class="tab_head">
                        <table width="100%">
                            <thead>
                            <tr>
                                <td>时间</td>
                                <td>来源</td>
                                <td>赚取金币</td>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="tab_body">
                        <table width="100%">
                            <tbody>

                            </tbody>
                        </table>

                    </div>
                    <div class="noData" style="display: none;">暂无数据</div>
                </div>
            </div>
            <div class="myInvite infoArea hide">
                <div class="countData">
                    <ul class="clearfix">
                        <li>
                            <em class="regFriend"></em>
                            <span>我的注册好友</span>
                        </li>
                        <li>
                            <em class="invFriend"></em>
                            <span>我的投资好友</span>
                        </li>
                    </ul>
                </div>
                <div class="inviteList">
                    <div class="tab_head">
                        <table width="100%">
                            <thead>
                            <tr>
                                <td>我的好友</td>
                                <td class="tipBox">
                                    <span>是否投资</span>
                                    <i class="tips"></i>
                                    <em class="cueTips">新手项目除外</em>
                                </td>
                                <td class="btn_td"></td>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="tab_body">
                        <table width="100%">
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                    <div class="noData" style="display: none;">暂无数据</div>
                </div>
            </div>
        </div>
    </div>
    <!--遮罩层-->
    <div class="overlay" style="display:none;"></div>
    <!--提醒弹框-->
    <div class="remind">
        <p>请将输入框内的内容长按复制给好友吧！</p>
        <div class="copyContent">
            别怪我没提醒你，投资即可得20g金条。
            有6重壕奖，拿到手软！
            https://m.zhongzairong.cn/redpackets.do
        </div>
        <div class="btn">确认复制并关闭</div>

    </div>
</section>
<!-- toast提示 -->
<div class="err"></div>
<input type="hidden" value="${userId}" id="userId">
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/fastclick.js"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script src="<%=request.getContextPath()%>/resources/js/activity/ruffian/ruffianAward.js"></script>
<script>
//    var fDesTitleArr=[
//        '好友送你100元红包，点击领取',
//        '狂欢双11，6重壕礼送不停！',
//        '奉上100元红包证明我在关心你！',
//        '20g金条送给你，一起来狂欢啊！',
//        '我在中再融投资很久了，给你准备了超值的奖励！',
//        '您收到一份11.11狂欢礼包，快看看是什么！'
//    ];
//    var fDesArr=[
//        '新手专享15%年化收益！诚心推荐中再融（已签约存管），国资平台安全可信赖！',
//        '唯有壕礼暖人心，金条、电视、红包...新手15%的年化收益，请收下中再融这份心意吧！',
//        '我一直在安全可信赖的国资平台（已签约存管）中再融理财，特邀你一起来赚钱！新用户即送100元红包哦~',
//        '11.11投资即送金条、电视、扫地机...是真的有这样的好事呢',
//        '100元红包+15%年化收益+无限量壕礼，就差你了',
//        '厉害了！每日加息2%，新手还可享15%年化收益，戳我领走→'
//    ];
    var friendIndex="";//被邀请人所在tr的索引  用来修改样式
    var friendMobile="";//被邀请人的完整手机号  完成后台请求
//    $(".inviteList").off().on("click",'.earmTd',function(){
//        friendIndex=$(this).parents("tr").index();
//        friendMobile=$(this).attr("data-mobile");
//        alert(friendMobile)
//        $(".inviteList tbody tr").eq(friendIndex).find(".tip_btn").removeClass("earmTd").addClass("investTd").html("已提醒")
//    });
    // app 端调用改变页面点击事件或样式
    function changeForApp(){
        $(".inviteList").off().on("click",'.earmTdApp',function(){
            friendIndex=$(this).parents("tr").index();
            friendMobile=$(this).attr("data-mobile");
            var desIndex=parseInt(6*Math.random());
            var title='中再融超给力活动，免费领金条！！！';
            var des='别怪我没提醒你，投资即可得20g金条。有6重壕奖，拿到手软！';
            var shareUrl='https://m.zhongzairong.cn/ruffian/friend/mind.do?userId='+getadd('userId')+'&flag='+getadd('flag');
            var iconUrl='https://m.zhongzairong.cn/resources/image/activity/ruffian/wxShare.png';
            var platAry=['WechatSession','WechatTimeLine','QQ','Qzone','Sina'];
            shareMessage(title,des,shareUrl,iconUrl,platAry);
        });
    }
    function shareBackMessage(statue){
        // statue : 0 成功 1 失败
        if(statue==0){
            $.ajax({
                type:'POST',
                dataType:'json',
                url:basePath+'/ruffian/friendMindCount.do',
                data:{userId:getadd('userId'),mobile:friendMobile},
                success:function(data){

                }
            });
            $(".inviteList tbody tr").eq(friendIndex).find(".shareBtn").removeClass("earmTdApp").addClass("investTd").html("已分享");
        }
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
</html>
