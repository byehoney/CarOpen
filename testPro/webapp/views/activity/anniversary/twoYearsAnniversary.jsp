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
    <title>2周年庆典</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset_750.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/twoYearsAnniversary/swiper.min.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/mui.picker.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/mui-picker-plus.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/mui.poppicker.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/twoYearsAnniversary/twoYearsAnniversary.css${verCode}"/>
    <script>
        var basePath = "<%=request.getContextPath()%>";
    </script>
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/js/common/common.js" type="text/javascript"></script>
    <script type="text/javascript">
        var pro="";var city="";var dis="";
        var proId="";var cityId="";var disId="";
        var editable=true;//判断输入框是否能够编辑
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
<%--<div class="docWrapper">--%>
<div class="main docWrapper">
    <div class="banner">
        <img src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/bannner_01.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/bannner_02.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/bannner_03.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/bannner_04.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/bannner_05.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/bannner_06.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/bannner_07.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/bannner_08.png" alt="">
        <p class="activeDay">3.21-4.10</p>
    </div>
    <div class="game-content">
        <img src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/2p.png">
        <div class="game-goods-wrap">
            <div class="game-goods-list">
                <div class="game-goods">
                    <div class="game-goods-box" id="game1">
                        <ul class="game-goods-ul" style="">

                        </ul>
                    </div>
                </div>
                <div class="game-goods">
                    <div class="game-goods-box" id="game2">
                        <ul class="game-goods-ul" style="">

                        </ul>
                    </div>
                </div>
                <div class="game-goods">
                    <div class="game-goods-box" id="game3">
                        <ul class="game-goods-ul">

                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <p class="rollTip" style="display: none">恭喜您！成功抽中2个奖品!</p>
        <div id="shandeng" class="lantern_icon"></div>
        <div class="game-btn"></div>
        <a class="game-prize <c:if test="${loginStatus==1}">login-game-prize</c:if><c:if test="${loginStatus==0}">nologin-game-prize</c:if>" href="javascript:void(0);"></a>
    </div>
    <img class="rates_pic" src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/rates.png" alt="">
    <div class="items">
        <div class="supernatant">
            <div class="swiper_item swiper_no_item">
                <div class="clearfix">
                    <div class="percentage fl">
                        <div><span>6.5</span>% + <em>2.0%</em></div>
                        <p>年化收益率</p>
                    </div>
                    <div class="date fr">
                        <div><em>365</em>天</div>
                        <p>投资期限</p>
                    </div>
                </div>
                <div class="Involved-btn">
                    <a href="javascript:;">立即加入</a>
                </div>
            </div>
            <div class="mask">
                <div class="mask_cont">
                    <div class="cup"></div>
                    <p>今日已打烊，请等待明天0点开市！</p>
                    <p>每日交易时间：00:00-23:00</p>
                </div>

            </div>
        </div>
        <div class="swiper-container swiperOne" style="display: none">
            <div class="swiper-wrapper" style="height:auto">

            </div>
            <div class="swiper-pagination swiper_btn"></div>
        </div>

    </div>
    <div class="more"><a href="javascript:;">查看更多项目></a></div>
    <div class="article_bg">
        <img class="top_bg" src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/top_bg.png" alt="">
        <div class="twin_cont">
            <img class="highest_pic" src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/highest_pic.png" alt="">
            <div class="examine_btn">
                <c:if test="${loginStatus==1}">
                    <div class="total">我的累计投资额：<span> ¥<fmt:formatNumber type="currency" value="${totalInvestMoney}" pattern="#,##0.00" maxFractionDigits="0" /> </span></div>
                </c:if>
                <c:if test="${loginStatus==0}">
                    <div class="examine_award">查看我的奖品</div>
                </c:if>
            </div>
            <p class="prize_one">累计投资额达标可额外获得以下奖品，每人最多可获得1个奖品</p>
            <div class="prize_list">
                <ul class="clearfix">
                    <div class="isGet arrow_right grey"><i></i></div>
                    <div class="isGet arrow_bottom grey"><i></i></div>
                    <div class="isGet arrow_left grey"><i></i></div>
                    <div class="isGet arrowTwo_bottom grey"><i></i></div>
                    <li>
                        <div class="prize_bg">
                            <i class="getIcon"></i>
                            <div class="picBox">
                                <div class="jdCard"></div>
                                <%--<img src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/jdCard.png" alt="">--%>
                                <%--<div class="Track_matte"></div>--%>
                            </div>
                            <p>100元京东电子卡</p>
                            <p>累计投资额<span>≥5万</span></p>
                        </div>
                    </li>
                    <li>
                        <div class="prize_bg">
                            <i class="getIcon"></i>
                            <div class="picBox">
                                <div class="supo"></div>
                                <%--<img src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/supo.png" alt="">--%>
                                <%--<div class="Track_matte"></div>--%>
                            </div>
                            <p>苏泊尔电饭煲</p>
                            <p>累计投资额<span>≥10万</span></p>
                        </div>
                    </li>
                    <li>
                        <div class="prize_bg">
                            <i class="getIcon"></i>
                            <div class="picBox">
                                <div class="goldDog"></div>
                                <%--<img src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/goldDog.png" alt="">--%>
                                <%--<div class="Track_matte"></div>--%>
                            </div>
                            <p>周大福黄金吊坠</p>
                            <p>累计投资额≥<span>30万</span></p>
                        </div>
                    </li>
                    <li>
                        <div class="prize_bg">
                            <i class="getIcon"></i>
                            <div class="picBox">
                                <div class="xm2s"></div>
                                <%--<img src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/xm2s.png" alt="">--%>
                                <%--<div class="Track_matte"></div>--%>
                            </div>
                            <p>小米空气净化器</p>
                            <p>累计投资额≥<span>20万</span></p>
                        </div>
                    </li>

                </ul>
            </div>
            <div class="two_bg"></div>
            <div claSS="cash"><i class="getIcon"></i>累计投资额≥<span>50万</span></div>
            <!--奖品列表-->



            <div class="big_prize"></div>
            <div class="bottom_bg"></div>
        </div>
    </div>
    <div class="rule">
        <div class="site <c:if test="${loginStatus==0}">nologinSite</c:if><c:if test="${loginStatus==1}">loginSite</c:if>">填写收货地址</div>
        <div class="rule_cont">
            <h3>活动规则</h3>
            <ol>
                <li>活动时间：2018年3月21日-2018年4月10日</li>
                <li>抽奖活动仅限APP端参与，每日用户可免费抽奖1次</li>
                <li>实物奖品于活动结束后的10个工作日内发放（也可按市场价8折折现），期间会有客服联系确定收货地址，请留意接听电话
                </li>
                <li>投资新手项目不参与本次活动奖励</li>
                <li>本次活动最终解释权归中再融所有。如有疑问，请致电客服专线：4001-156-157</li>
            </ol>
        </div>

    </div>
    <img class="rule_bg" src="<%=request.getContextPath()%>/resources/image/activity/twoYearsAnniversary/rule_bg.png" alt="">

</div>
<%--我的奖品记录弹窗开始--%>
<div class="popup">
    <div class="popTitle">
        我的奖品
        <i class="close"></i>
    </div>
    <div class="popup_content">
        <table>
            <thead>
            <tr>
                <td>抽奖时间</td>
                <td>获得奖品</td>
                <td>奖品说明</td>
            </tr>
            </thead>
        </table>
    </div>
    <div class="popup_content scrollContent">
        <table class="tableData">
            <tbody>

            </tbody>
        </table>
        <div class="noData">一  暂时无奖品哦  一</div>
    </div>
</div>
<%--我的奖品记录弹窗结束--%>
<%--遮罩开始--%>
<div class="overlay" style="display:none;"></div>
<%--遮罩结束--%>
<%--错误提示框开始--%>
<div class="err"></div>
<%--错误提示框结束--%>
<%--修改收货地址开始--%>
<div class="site_cont" style="display:none;">
    <div class="close_btn"></div>
    <h3>收货信息</h3>
    <div class="address_bg">
        <div class="addTitle">
            收货地址
            <%--<span class="modifyAdd">修改地址</span>--%>
        </div>
        <p class="giftList"></p>
        <ul class="addInfo">
            <li>
                <input class="userName" type="text" placeholder="请输入收货人姓名" unselectable="on">
            </li>
            <li>
                <input class="userTel" type="number" pattern="[0-9]*" placeholder="请输入手机号码" oninput="if(value.length&gt;11)value=value.slice(0,11)" required="" unselectable="on">
            </li>
            <li>
                <input id="showCityPicker3" class="userAdd" type="text" placeholder="请选择省、市、区" onfocus="this.blur()" readonly="">
            </li>
            <li>
                <input class="addDetail" type="text" placeholder="详细地址（街道楼道门牌号）">
            </li>
        </ul>
    </div>
    <ul class="newAddBox clearfix twoModifyBox">
        <li class="backAct twoModify fl">修改地址</li>
        <li class="saveAdd twoClose fr">关闭</li>
    </ul>
    <div class="modifyBox twoAddBox">
        <div class="modifyBack twoSave">
            <a>保存收货人信息</a>
        </div>
    </div>
</div>
<%--</div>--%>
<%--修改收货地址结束--%>
<input type="hidden" id="flag" value="${flag}">
<input type="hidden" id="loginStatus" value="${loginStatus}">
<input type="hidden" id="userId" value="${userId}">
<input type="hidden" id="totalInvestMoney" value="${totalInvestMoney}">
<input type="hidden" id="isDrawGift" value="${isDrawGift}">
<input type="hidden" id="currentTime" value="${currentTime}">
<input type="hidden" id="campaignStartTime" value="${campaignStartTime}">
<input type="hidden" id="campaignEndTime" value="${campaignEndTime}">
<input type="hidden" id="campaignType" value="${campaignType}">


<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/newYear/fastclick.js"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script src="<%=request.getContextPath()%>/resources/js/common/swiper-3.4.2.jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/newYear/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/mui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/mui.picker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/mui.poppicker.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/ruffian/city_data2.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/twoYearsanniversary/twoYearsAnniversary.js${verCode}"></script>
<script>
    (function muiFun(mui){
        mui.init();
        mui.ready(function() {
            //          //级联示例
            var cityPicker3 = new mui.PopPicker({
                layer: 3
            });
            cityPicker3.setData(cityData3);
            var showCityPickerButton = document.getElementById('showCityPicker3');
            var cityResult3 = document.getElementById('cityResult3');
            showCityPickerButton.addEventListener('tap', function(event) {
                if(!editable){
                    return;
                }
                cityPicker3.show(function(items) {
                    console.log(items)
                    proId=items[0].value;
                    cityId=items[1].value;
                    disId=items[2]?items[2].value:"";
                    console.log(proId,cityId,disId);
                    pro=((items[0] || {}).text?(items[0] || {}).text:"");
                    city=((items[1] || {}).text?(items[1] || {}).text:"");
                    dis=((items[2] || {}).text?(items[2] || {}).text:"");
                    showCityPickerButton.value = pro+" "+city+" "+dis;
                    //返回 false 可以阻止选择框的关闭
                    //return false;
                });
            }, false);
        });
    })(mui)
</script>
<script>
    var isNoStartM=false;
    var isEndM=false;
    var tipShowM=false;
    // app 端调用改变页面点击事件或样式
    function changeForApp(){
        //   未登录app点击我的奖品
        $(".nologin-game-prize").off().on("click",function(){
            userLogin();
        });
        //点击未登录状态的抽奖按钮
        $(".game-content").off("click",'.game-btn.noLogin-app-game-btn').on("click",'.game-btn.noLogin-app-game-btn',function(){
            userLogin();
        });
        //点击项目卡片
        $(".swiperOne").off("click",'.swiper_item').on("click",'.swiper_item',function(){
            var pid=$(this).attr("pid");
            jumpInvestDetail(pid);
        });
        //未登录点击查看我的奖励
        $(".examine_btn .examine_award").off().on("click",function(){
            userLogin();
        });
        //点击查看更多
        $(".more,.big_prize").off().on("click",function(){
           jumpInvest();
        });
        //未登录点击查看收货地址
        $(".nologinSite").off().on("click",function(){
            canGo();
            if(isNoStartM){
                errTip($(".err"),'活动未开始，敬请期待',2000);
            }else if(isEndM){
                errTip($(".err"),'活动已结束',2000);
            }else{
                userLogin();
            }
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
    // 跳转到投资详情
    function jumpInvestDetail(pid){
        anniversary.jumpInvestDetail(pid);
    }
    //活动是否开始弹窗
    function canGo(){
        var now_time=$("#currentTime").val();
        var start_time=$("#campaignStartTime").val();
        var end_time =$("#campaignEndTime").val();
        if(now_time>end_time){//未在活动时间范围
            isEndM=true;
        }else if(now_time<start_time){
            isNoStartM=true;
        }else{
            isNoStartM=false;
            isEndM=false;
        }
    }
    //错误提示弹窗
    function errTip(obj,info,dur){
        if(!tipShowM){
            tipShowM=true;
            $(".overlay").show();
            $(obj).html(info).show();
            setTimeout(function(){
                $(".overlay").hide();
                $(obj).html("").hide();
                tipShowM=false;
            },dur)
        }
    }
</script>
</body>
</html>