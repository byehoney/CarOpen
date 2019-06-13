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
    <title>11.11 狂欢盛典</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/public.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/wap_double_eleven.css${verCode}"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/popup.css${verCode}"/>
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script>
        var basePath = "<%=request.getContextPath()%>";
        var proId="";
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
<div class="wap_activity_bg">
    <div class="banner_t">
        <p>2017-11-07  至  2017-11-21</p>
    </div>
    <div class="banner_c"></div>
    <div class="banner_b"></div>
    <div class="gauge">
        <div class="seckill">2%加息秒杀天天有</div>
        <div class="day_seckill">
            <p>每日2场2%加息秒杀，双11当天更有5场2%加息秒杀</p>
        </div>
        <div class="communal play_ball">活动即将开始</div>
        <div class="status" style="display:n-one;">
            <div class="doubleElevenGoing">
                <div class="wire">
                    <div></div>
                </div>
                <div class="status-cont clearfix">
                    <div class="items fl">
                        <p>9:00</p>
                        <span><i></i></span>
                        <div class="actText">待开始</div>
                        <div class="icon"></div>
                    </div>
                    <div class="items  fl">
                        <p>11:00</p>
                        <span><i></i></span>
                        <div class="actText">待开始</div>
                        <div class="icon"></div>
                    </div>
                    <div class="items fl">
                        <p>13:00</p>
                        <span><i></i></span>
                        <div class="actText">待开始</div>
                        <div class="icon"></div>
                    </div>
                    <div class="items fl">
                        <p>15:00</p>
                        <span><i></i></span>
                        <div class="actText">待开始</div>
                        <div class="icon"></div>
                    </div>
                    <div class="items fl">
                        <p>17:00</p>
                        <span><i></i></span>
                        <div class="actText">待开始</div>
                        <div class="icon"></div>
                    </div>
                </div>
            </div>
            <div class="doubleElevenOut">
                <div class="wire">
                    <div></div>
                </div>
                <div class="status-cont finish_cont clearfix" style="display:n-one;">
                    <div class="items fl">
                        <p>11:00</p>
                        <span><i></i></span>
                        <div class="actText">待开始</div>
                        <div class="icon"></div>
                    </div>
                    <div class="items fl">
                        <p>13:00</p>
                        <span><i></i></span>
                        <div class="actText">待开始</div>
                        <div class="icon"></div>
                    </div>
                </div>
            </div>

            <div style="display: none" class="communal state_right going">
                <div class="yellow_icon"></div>
                <div class="proportion large_distance clearfix">
                    <div class="figure fl clearfix">
                        <div class="clearfix fr">
                            <span><em class="rate"></em>%<i>+</i></span>
                            <b><em>2</em>%</b>
                        </div>
                    </div>
                    <div class="raise_btn fr clearfix">
                        <span>立即抢</span>
                        <em>2% 加息</em>
                    </div>
                </div>
                <div class="progressbar" data="100">
                    <div class="progressbar_active"></div>
                </div>
            </div>

            <div style="display: none" class="communal state_right end finish-right">
                <div class="yellow_icon"></div>
                <div class="proportion little_distance clearfix">
                    <div class="figure fl clearfix">
                        <div class="clearfix fr">
                            <b>+<em>2</em>%</b>
                        </div>
                    </div>
                    <div class="raise_btn fr clearfix">
                        <span>已结束</span>
                        <em>2% 加息</em>
                    </div>
                </div>
                <div class="progressbar" data="100">
                    <div class="progressbar_active"></div>
                </div>
            </div>

            <div style="display: none" class="communal state_right wait finish-right next_start">
                <div class="yellow_icon"></div>
                <div class="proportion maximum_distance clearfix">
                    <div class="figure fl clearfix">
                        <div class="clearfix fr">
                            <b>+<em>2</em>%</b>
                        </div>
                    </div>
                    <div class="raise_btn fr clearfix">
                        <span id="advNotice">下一场00:00:00后开始</span>
                        <em>2% 加息</em>
                    </div>
                </div>
                <div class="progressbar" data="100">
                    <div class="progressbar_active"></div>
                </div>
            </div>
        </div>
        <%--<div class="status" style="disply:n-one;">--%>
            <%--&lt;%&ndash;<div class="wire">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div></div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="status-cont finish_cont clearfix" style="display:n-one;">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="items finish fl">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<p>17:00</p>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<span><i></i></span>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div style="display:none">已结束</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="finished_btn"></div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="items fl">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<p>15:00</p>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<span><i></i></span>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div>待开始</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--<div class="communal state_right finish-right">--%>
                <%--<div class="yellow_icon"></div>--%>
                <%--<div class="proportion clearfix">--%>
                    <%--<div class="figure fl clearfix">--%>
                        <%--<div class="clearfix fr">--%>
                            <%--<b>+<em>2</em>%</b>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="raise_btn fl clearfix">--%>
                        <%--<span>已结束</span>--%>
                        <%--<em>2% 加息</em>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="progressbar" data="100">--%>
                    <%--<div class="progressbar_active"></div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="status" style="display:n-one;">--%>
            <%--&lt;%&ndash;<div class="wire">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div></div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="status-cont finish_cont  clearfix">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="items begin fl">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<p>11:00</p>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<span><i></i></span>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div style="display:none">已结束</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="initiate_btn"></div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="items fl">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<p>15:00</p>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<span><i></i></span>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div>待开始</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

            <%--<div class="communal state_right finish-right next_start">--%>
                <%--<div class="yellow_icon"></div>--%>
                <%--<div class="proportion clearfix">--%>
                    <%--<div class="figure fl clearfix">--%>
                        <%--<div class="clearfix fr">--%>
                            <%--<b>+<em>2</em>%</b>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="raise_btn fl clearfix">--%>
                        <%--<span>下一场  14:00:09 后开始</span>--%>
                        <%--<em>2% 加息</em>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="progressbar" data="100">--%>
                    <%--<div class="progressbar_active"></div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>

        <!--2%加息-->





        <div class="redeem">赚金币兑大奖</div>
        <div class="day_seckill">
            <p>通过自己投资和邀请好友投资均可赚取金币</p>
            <p>赚取的金币可以兑换以下大奖哦~</p>
        </div>
        <c:if test="${userStatus==1}">
            <div class="species gold_sum login_gold"><i></i>我的金币：<em><fmt:formatNumber type="currency" value="${myGold}" pattern="#,##0.00" maxFractionDigits="0" /></em></div>
        </c:if>
        <c:if test="${userStatus==0}">
            <div class="species gold_sum noLogin_gold"><i></i>我的金币</div>
        </c:if>
        <div class="notice clearfix">
            <div id="noticeBox" class="notice_title">
                <ul>

                </ul>
            </div>
        </div>

        <ul class="prize_list clearfix  <c:if test='${userStatus==1}'>loginList</c:if> <c:if test="${userStatus==0}">noLoginList</c:if> ">
            <li>
                <div class="big_goldbar"></div>
                <p><i></i>5000</p>
                <div class="list_btn exchange clearfix">
                    <em>20g 金条</em>
                    <span>立即兑换</span>
                </div>
            </li>
            <li>
                <div class="big_xm_TV"></div>
                <p><i></i>3000</p>
                <div class="list_btn exchange  clearfix">
                    <em>55寸 小米电视</em>
                    <span>立即兑换</span>
                </div>
            </li>
            <li>
                <div class="big_sweeper"></div>
                <p><i></i>1000</p>
                <div class="list_btn exchange clearfix">
                    <em>科沃斯扫地机</em>
                    <span>立即兑换</span>
                </div>
            </li>
            <li>
                <div class="big_microwave"></div>
                <p><i></i>500</p>
                <div class="list_btn exchange clearfix">
                    <em>格兰仕微波炉</em>
                    <span>立即兑换</span>
                </div>
            </li>
            <li>
                <div class="big_redpacket"></div>
                <p><i></i>200</p>
                <div class="list_btn exchange clearfix">
                    <em>138 元红包</em>
                    <span>立即兑换</span>
                </div>
            </li>
            <li>
                <div class="little_redpacket"></div>
                <p><i></i>50</p>
                <div class="list_btn exchange clearfix">
                    <em>28 元红包</em>
                    <span>立即兑换</span>
                </div>
            </li>
        </ul>
        <div class="coins">如何赚金币</div>
        <div class="gain clearfix">
            <div class="Method_one">
                <h3>方式一</h3>
                <p>单笔投资每满100元即可赚取1枚金币（另全场加息1.1%已开启）</p>
                <c:if test="${userStatus==0}">
                    <div class="invest_btn noLogin_invest_btn">投资赚金币</div>
                </c:if>
                <c:if test="${userStatus==1}">
                    <div class="invest_btn login_invest_btn">投资赚金币</div>
                </c:if>
            </div>
            <div class="Method_two">
                <h3>方式二</h3>
                <p>邀请好友注册且投资每满200元，邀请人即可赚取1枚金币</p>
                <c:if test="${userStatus==0}">
                    <div class="share_btn noLogin_share_btn">分享赚金币</div>
                </c:if>
                <c:if test="${userStatus==1}">
                    <c:if test="${flag=='wap'}">
                        <div class="share_btn wap_login_share_btn">分享赚金币</div>
                    </c:if>
                    <c:if test="${flag=='mobile'}">
                        <div class="share_btn app_login_share_btn">分享赚金币</div>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</div>

<div class="navigation">
    <div class="navigation_cont">
        <c:if test="${userStatus==0}">
            <div class="award_btn noLogin_award_btn"></div>
        </c:if>
        <c:if test="${userStatus==1}">
            <div class="award_btn login_award_btn"></div>
        </c:if>
        <div class=" regulation_btn"></div>
    </div>
</div>
<!-- 兑换成功已经保存过地址或者是虚拟奖品 -->
<div class="giftBox giftAddedBox">
    <div class="giftSuccessBox">
        <div class="gift  redPackLittle"></div>
    </div>
    <div class="giftInfo">
        <p>您已成功兑换</p>
        <p class="giftName">【55寸小米电视】</p>
        <a class="giftCloseBtn">朕知道了</a>
        <a class="jumpLink">查看收货地址</a>
    </div>
</div>
<!-- 兑换成功未保存过地址 -->
<div class="giftBox gitNoAddedBox">
    <div class="giftSuccessBox">
        <div class="gift  tv"></div>
    </div>
    <div class="giftInfo">
        <p>您已成功兑换</p>
        <p class="giftName">【55寸小米电视】</p>
    </div>
    <div class="addBtn clearfix">
        <a class="cancel fl">朕知道了</a>
        <a class="jumpAdd fr">去添加地址</a>
    </div>
</div>
<!-- 兑换奖品确认弹窗 -->
<div class="giftBox sureExchangeBox">
    <div class="giftSuccessBox">
        <div class="gift  tv"></div>
    </div>
    <div class="giftInfo">
        <p>您即将消耗 50 枚金币兑换</p>
        <p class="giftName">【55寸小米电视】</p>
    </div>
    <div class="addBtn clearfix">
        <a class="cancel fl">取消</a>
        <a class="jumpAdd fr">确认</a>
    </div>
</div>
<div class="ruleMainBox">
    <i class="ruleCloseBtn"></i>
    <div class="ruleMain">
        <h3>活动规则</h3>
        <div class="ruleBox" style="display: block;">
            <p>
                <span class="numBox">1.</span>
                <span class="wordBox">活动时间：2017年11月07日—2017年11月21日</span>
            </p>
            <p>
                <span class="numBox">2.</span>
                <span class="wordBox">每个奖品可用相应数量的金币兑换，兑换完成后自动扣除</span>
            </p>
            <p>
                <span class="numBox">3.</span>
                <span class="wordBox">兑换的红包为实时发放，有效期30天，可到【账户-红包】查看</span>
            </p>
            <p>
                <span class="numBox">4.</span>
                <span class="wordBox">
              实物奖品将于活动结束后的10个工作日内寄出，同时5个工作日内会联系您确认收货地址，请保持手机通畅
            </span>
            </p>
            <p>
                <span class="numBox">5.</span>
                <span class="wordBox">实物奖品均可按市场价8折兑换成现金，实物价格以最终市场价为标准</span>
            </p>
            <div class="ruleGiftBox">
                <ul class="giftTitle">
                    <li class="goodsName angelTl">奖品名称</li>
                    <li class="angelTr">市场参考价格</li>
                </ul>
                <ul class="giftContent">
                    <li class="goodsName">格兰仕微波炉<span> D2-50</span></li>
                    <li>388 元</li>
                    <li class="goodsName">科沃斯扫地机<span> 魔镜S</span></li>
                    <li>899 元</li>
                    <li class="goodsName">小米电视<span> 55寸</span></li>
                    <li>3000 元</li>
                    <li class="goodsName angelBl">金条<span> 20g</span></li>
                    <li class="angelBr">6000 元</li>
                </ul>
            </div>
            <p>
                <span class="numBox">6.</span>
                <span class="wordBox">11月21日24点后未使用金币兑换奖品均视为放弃</span>
            </p>
            <p>
                <span class="numBox">7.</span>
                <span class="wordBox">投资新手标项目不参与本次活动奖励</span>
            </p>
            <p>
                <span class="numBox">8.</span>
                <span class="wordBox">本次活动最终解释权归中再融所有。如有疑问，请致电客服专线：4001-156-157</span>
            </p>
        </div>
    </div>
</div>
<div class="remind">
    <p>请将输入框内的内容长按复制给好友吧！</p>
    <div class="copyContent">
        好友送你100元红包，点击领取→https://m.zhongzairong.cn/redpackets.do?yqm=${userInvitationCode}
    </div>
    <div class="btn">确认复制并关闭</div>

</div>
<div class="overlay" style="display:none;"></div>
<!-- toast提示 -->
<div class="err"></div>
<input type="hidden" value="${userStatus}" id="userStatus">
<input type="hidden" value="${userId}" id="userId">
<input type="hidden" value="${userInvitationCode}" id="userInvitationCode">
<input type="hidden" value="${myGold}" id="myGold">
<input type="hidden" value="${currentTime}" id="currentTime">
<input type="hidden" value="${campaignSetStatus}" id="campaignSetStatus ">
<input type="hidden" value="${flag}" id="flag">
<%--项目id--%>
<input type="hidden" value="${proId}" id="proId">
<input type="hidden" id="refreshed" value="no">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/fastclick.js"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script src="<%=request.getContextPath()%>/resources/js/activity/ruffian/jquery.nicescroll.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/ruffian/ruffian.js"></script>
<script>
    ~(function(){
        $.fn.extend({
            noticeScroll : function(){
                var $this = $("#noticeBox");
                var scrollTimer;
                var liHeight = .46;//每个li的高度
                var scrollSpace = 3000;//滚动间隙
                var scrollSpeed = 500;//滚动速度
                $this.hover(function(){
                    clearInterval(scrollTimer);
                },function(){
                    scrollTimer = setInterval(function(){
                        noticeScrollUp($this);
                    }, scrollSpace );
                }).trigger("mouseout");

                function noticeScrollUp(obj){
                    var $noticeContext = obj.find("ul:first");
                    $noticeContext.animate({ "margin-top" : -liHeight +"rem" },scrollSpeed , function(){
                        $noticeContext.css({"margin-top":"0rem"}).find("li:first").appendTo($noticeContext);
                    });
                }
            }
        });
    })();
</script>
<script>
    var isNoStart=false;
    var isEnd=false;
    var tipShow=false;//错误提示显示状态
    var fDesTitleArr=[
        '好友送你100元红包，点击领取',
        '狂欢双11，6重壕礼送不停！',
        '奉上100元红包证明我在关心你！',
        '20g金条送给你，一起来狂欢啊！',
        '我在中再融投资很久了，给你准备了超值的奖励！',
        '您收到一份11.11狂欢礼包，快看看是什么！'
    ];
    var fDesArr=[
        '新手专享15%年化收益！诚心推荐中再融（已签约存管），国资平台安全可信赖！',
        '唯有壕礼暖人心，金条、电视、红包...新手15%的年化收益，请收下中再融这份心意吧！',
        '我一直在安全可信赖的国资平台（已签约存管）中再融理财，特邀你一起来赚钱！新用户即送100元红包哦~',
        '11.11投资即送金条、电视、扫地机...是真的有这样的好事呢',
        '100元红包+15%年化收益+无限量壕礼，就差你了',
        '厉害了！每日加息2%，新手还可享15%年化收益，戳我领走→'
    ];
    // app 端调用改变页面点击事件或样式
    function changeForApp(){
        //app未登录点击 我的奖品,我的金币, 立即兑换 , 分享赚金币
//        $(".noLogin_award_btn,.noLogin_gold,.noLoginList .exchange,.noLogin_share_btn").unbind().click(userLogin);
        //未登录状态下点击投资赚金币
//        $(".noLogin_invest_btn").unbind().click(jumpInvest);
        //点击【立即抢】/【已结束】/【下一场xxxxxx后开始】(项目id待确认)
        $(".communal.going ,.communal.end, .communal.wait ").unbind().click(function(){
            jumpInvestDetail(proId)
        });
        $(".app_login_share_btn").unbind().click(function(){
            var desIndex=parseInt(6*Math.random());
            var title=fDesTitleArr[desIndex];
            var des=fDesArr[desIndex];
            var shareUrl='https://m.zhongzairong.cn/redpackets.do?yqm='+$("#userInvitationCode").val();
            var iconUrl='https://m.zhongzairong.cn/resources/image/activity/ruffian/wxShare.png';
            var platAry=['WechatSession','WechatTimeLine','QQ','Qzone','Sina'];
            shareMessage(title,des,shareUrl,iconUrl,platAry)
        });


        //未登陆点击我的奖品
        $(".noLogin_award_btn").off().on("click",function(){
            userLogin();
        });
        //点击我的金币
        $(".noLogin_gold").off().on("click",function(){
            canInvest();
            if(isNoStart){
                if(!tipShow){
                    errTip($(".err"),'活动即将开始',2000)
                }
                return;
            }else{
                userLogin();
            }
        });
        //点击立即兑换
        $(".noLoginList .exchange").off().on("click",function(){
            canInvest();
            if(isNoStart){
                if(!tipShow){
                    errTip($(".err"),'活动即将开始',2000)
                }
                return;
            }else if(isEnd){
                if(!tipShow){
                    errTip($(".err"),'活动已结束',2000)
                }
                return;
            }else{
                userLogin();
            }
        });
        //点击投资赚金币
        $(".noLogin_invest_btn,.login_invest_btn").off().on("click",function(){
            canInvest();
            if(isNoStart){
                if(!tipShow){
                    errTip($(".err"),'活动即将开始',2000)
                }
                return;
            }else if(isEnd){
                if(!tipShow){
                    errTip($(".err"),'活动已结束',2000)
                }
                return;
            }else{
                jumpInvest();
            }
        });

        //点击分享赚金币
        $(".noLogin_share_btn").off().on("click",function(){
            canInvest();
            if(isNoStart){
                if(!tipShow){
                    errTip($(".err"),'活动即将开始',2000)
                }
                return;
            }else{
                userLogin()
            }
        })

    }
    //   app去登陆
    function userLogin(){
        anniversary.userLogin();
    }
    //app去投资
    function jumpInvest(){
        anniversary.jumpInvest();
    }
    // 跳转到投资详情
    function jumpInvestDetail(pid){
        anniversary.jumpInvestDetail(pid);
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
    //活动是否开始弹窗
    function canInvest(){
        var now_time=$("#currentTime").val();
        var start_time="2017-11-07 00:00:00";
        var end_time = "2017-11-21 23:59:59";
        var end_timed = Date.parse(new Date(end_time.replace(/-/g,"/")));      //活动结束时间
        var start_timed = Date.parse(new Date(start_time.replace(/-/g,"/")));  //活动开始时间
        end_timed = end_timed;
        start_timed=start_timed;
        if(now_time>end_timed){//未在活动时间范围
            isEnd=true;
        }else if(now_time<start_timed){
            isNoStart=true;
        }else{
            isNoStart=false;
            isEnd=false;
        }
    }
</script>
</body>
</html>