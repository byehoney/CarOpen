<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    request.setAttribute("verCode", "?r=Version2018060610");
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
    <title>激情世界杯</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/mui.picker.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/mui-picker-plus.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/mui.poppicker.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/worldCup/worldCup.css${verCode}"/>
    <script>
        var basePath = "<%=request.getContextPath()%>";
    </script>
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
    <script>
        function clearNoNum(obj){
            obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
            obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的
            obj.value = obj.value.replace(/\^./g,"");
            obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
            obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');//只能输入两个小数
            if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额
                obj.value= parseFloat(obj.value);
            }else if(obj.value.indexOf(".")==0 && obj.value.substr(1,1) !=""){
                obj.value= parseFloat(obj.value.substr(1,1));
            }
        }
    </script>
</head>
<body>
<div class="Wps_page">
    <div class="banner">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/banner_01.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/banner_02.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/banner_03.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/banner_04.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/banner_05.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/banner_06.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/banner_07.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/banner_08.png" alt="">
    </div>
    <div class="gameBox">
        <!--球门部分-->
        <div class="ball_net">
            <div class="gifts gift_01" data-lIndex="3"></div>
            <div class="gifts gift_02" data-lIndex="2"></div>
            <div class="gifts gift_03" data-lIndex="1"></div>
            <div class="gifts gift_04" data-lIndex="0"></div>
            <div class="gifts gift_05" data-lIndex="7"></div>
            <div class="gifts gift_06" data-lIndex="6"></div>
            <div class="gifts gift_07" data-lIndex="5"></div>
            <div class="gifts gift_08" data-lIndex="4"></div>
        </div>
        <div class="ballBox">
            <c:if test="${code==-1}">
                <p class="status_one default tip">您今日还有<span> 3 </span>次机会</p>
            </c:if>
            <c:if test="${code==0&&map.count!=0}">
                <p class="status_one login tip">您今日还有<span> ${map.count} </span>次机会</p>
            </c:if>
            <c:if test="${code==0&&map.count==0}">
                <p class="status_one no_chance tip">机会已用完请明日再来</p>
            </c:if>
            <c:if test="${code==-3}">
                <p class="activity_noStart tip">-活动未开始-</p>
            </c:if>
            <c:if test="${code==-4}">
                <p class="activity_end tip">-活动已结束-</p>
            </c:if>
        </div>
        <c:if test="${code==-1}">
            <div class="corm"></div>
            <div class="ball noLogin"></div>
            <div class="clickMe_btn">点我</div>
            <div class="noRecord"></div>
        </c:if>
        <c:if test="${code==0&&map.count!=0}">
            <div class="corm"></div>
            <div class="ball login"></div>
            <c:if test="${map.count==3}">
                <div class="clickMe_btn">点我</div>
            </c:if>
            <div class="record">我的获奖记录</div>
        </c:if>
        <c:if test="${code==0&&map.count==0}">
            <div class="corm"></div>
            <div class="ball"></div>
            <div class="record">我的获奖记录</div>
        </c:if>
    </div>

    <!--冲榜拿豪礼-->
    <c:if test="${code!=-4}">
        <div class="award_module">
            <div class="gift_pic">
                <img  src="<%=request.getContextPath()%>/resources/image/activity/worldCup/gift_pic.png" alt="">
                <div class="share">
                    <p>特斯拉使用权 1年</p>
                    <p><span>第1名</span>且累计收益≥150000元</p>
                </div>
            </div>
            <div class="gift_list">
                <div class="gift_top clearfix">
                    <div class="gift_top_pic fl">
                        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/Russia.png" alt="">
                        <p>俄罗斯豪华8日游</p>
                        <p><span>第2-3名</span>且累计收益</br>≥40000元</p>
                    </div>
                    <div class="gift_top_pic gift_top_right fr">
                        <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/projector.png" alt="">
                        <p>极米H1S 家用投影仪</p>
                        <p><span>第4-6名</span>且累计收益</br>≥25000元</p>
                    </div>
                </div>
                <div class="details">
                    <div class="rank_list mt clearfix">
                        <img class="hair_dryer" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/hair_dryer.png" alt="">
                        <div>
                            <p>戴森吹风机HD01</p>
                            <p><span>第7-30名</span>且累计收益≥10000元</p>
                        </div>
                    </div>
                    <div class="rank_list mt clearfix">
                        <img class="hw_ipad" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/hw_ipad.png" alt="">
                        <div>
                            <p>华为荣耀防水影音平板</p>
                            <p><span>第31-50名</span>且累计收益≥5000元</p>
                        </div>
                    </div>
                    <div class="rank_list mt clearfix">
                        <img class="Sony_headset" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/Sony_headset.png" alt="">
                        <div>
                            <p>索尼WF-1000X 蓝牙耳机</p>
                            <p><span>第51-100名</span>且累计收益≥3000元</p>
                        </div>
                    </div>
                    <div class="rank_list mt clearfix">
                        <img class="thermantidote" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/thermantidote.png" alt="">
                        <div>
                            <p>美的冷风扇</p>
                            <p><span>第101-150名</span>且累计收益≥1500元</p>
                        </div>
                    </div>
                    <div class="rank_list mt clearfix">
                        <img class="pot" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/pot.png" alt="">
                        <div>
                            <p>美的养生壶 1.5L容量</p>
                            <p><span>第151-200名</span>且累计收益≥500元</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="gift_bg">
                <div class="rank_list clearfix">
                    <img class="gift_bag" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/gift_bag.png" alt="">
                    <div class="w74">
                        <p>世界杯定制礼包</p>
                        <p>累计投资额≥<span>10000</span>元（每人限1份）</p>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${code==-1}">
        <div class="invest_btn nologin_rank">登录冲榜拿豪礼</div>
    </c:if>
    <!--上榜排名-->
    <%--活动进行中且用户上榜--%>
    <c:if test="${code==0&&map.num>0}">
        <div class="earnings_cont">
            <img class="base_person" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/base_person.png" alt="">
            <div class="earnings_title">累计收益:<span>${map.money}</span>元</div>
            <div class="piece piece_bg">
                <div class="rank_cont clearfix">
                    <div class="earnings_left fl">
                        <i></i>您的当前排名
                        <span class="ml">第${map.num}名</span>
                    </div>
                    <div class="earnings_right check_rank fr">查看排行榜</div>
                </div>
                <div class="rank_cont clearfix">
                    <div class="earnings_left fl">
                        <i></i>保持当前排名可获得
                    </div>
                    <div class="earnings_right count_get fr">计算收益</div>
                </div>
                <div class="prize">
                    <c:choose>
                        <c:when test="${map.num==1}">
                            特斯拉使用权一年
                        </c:when>
                        <c:when test="${map.num==2||map.num==3}">
                            俄罗斯豪华8日游
                        </c:when>
                        <c:when test="${map.num>3&&map.num<=6}">
                            极米H1S 家用投影仪
                        </c:when>
                        <c:when test="${map.num>6&&map.num<=30}">
                            戴森吹风机HD01
                        </c:when>
                        <c:when test="${map.num>30&&map.num<=50}">
                            华为荣耀防水影音平板
                        </c:when>
                        <c:when test="${map.num>50&&map.num<=100}">
                            索尼WF-1000X 蓝牙耳机
                        </c:when>
                        <c:when test="${map.num>100&&map.num<=150}">
                            美的冷风扇
                        </c:when>
                        <c:when test="${map.num>150&&map.num<=200}">
                            美的养生壶 1.5L容量
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="invest_btn now_invest">立即投资</div>
            </div>
        </div>
    </c:if>
    <%--如果已有人上榜且用户未上榜--%>
    <c:if test="${code==0&&map.num==0}">
        <!--暂未上榜-->
        <div class="earnings_cont">
            <img class="base_person" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/base_person.png" alt="">
            <div class="earnings_title">累计收益:<span>${map.money}</span>元</div>
            <div class="piece piece_bg">
                <div class="rank_cont clearfix">
                    <div class="earnings_left fl">
                        <i></i>您当前排名第200+名
                    </div>
                    <div class="earnings_right check_rank fr">查看排行榜</div>
                </div>
                <div class="rank_cont clearfix">
                    <div class="earnings_left fl">
                        <i></i>距上榜还需获得<span>${map.differMoney+10}元</span>收益
                    </div>
                    <div class="earnings_right count_get fr">计算收益</div>
                </div>
                <div class="invest_btn now_invest">立即投资</div>
            </div>
        </div>
    </c:if>
    <%--没有一个人上榜--%>
    <c:if test="${code==0&&map.num==-1}">
        <!--暂未上榜-->
        <div class="earnings_cont">
            <img class="base_person" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/base_person.png" alt="">
            <div class="earnings_title">累计收益:<span>${map.money}</span>元</div>
            <div class="piece piece_bg">
                <div class="rank_cont clearfix">
                    <div class="earnings_left fl">
                        <i></i>暂无人上榜
                    </div>
                    <div class="earnings_right grey fr">查看排行榜</div>
                </div>
                <div class="rank_cont clearfix">
                    <div class="earnings_left fl">
                        <i></i>距上榜还需获得<span>${map.differMoney+10}元</span>收益
                    </div>
                    <div class="earnings_right count_get fr">计算收益</div>
                </div>
                <div class="invest_btn now_invest">立即投资</div>
            </div>
        </div>
    </c:if>
    <%--活动已结束且未获得任何奖品--%>
    <c:if test="${code==-4&&map.num==0&&map.totalInvestMoney<10000}">
        <!--未获得奖品-->
        <div class="earnings_cont">
            <img class="base_person" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/base_person.png" alt="">
            <div class="earnings_title">累计收益:<span>${map.money}</span>元</div>
            <div class="piece piece_bg">
                <div class="rank_cont clearfix">
                    <div class="earnings_left fl">
                        <i></i>您的当前排名
                        <span class="ml">第200+名</span>
                    </div>
                    <div class="earnings_right check_rank fr">查看排行榜</div>
                </div>
                <p class="no_acquisition">未获得冲榜奖品</p>
            </div>
        </div>
    </c:if>
    <%--活动已结束 未上榜 获得定制大礼包--%>
    <c:if test="${code==-4&&map.num==0&&map.totalInvestMoney>=10000}">
        <!--未获得奖品-->
        <div class="earnings_cont">
            <img class="base_person" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/base_person.png" alt="">
            <div class="earnings_title">累计收益:<span>${map.money}</span>元</div>
            <div class="piece piece_bg">
                <div class="rank_cont clearfix">
                    <div class="earnings_left fl">
                        <i></i>您的当前排名
                        <span class="ml">第200+名</span>
                    </div>
                    <div class="earnings_right check_rank fr">查看排行榜</div>
                </div>
                <p class="no_acquisition">获得世界杯定制大礼包</p>
                <div class="invest_btn addSite">添加收货地址</div>
            </div>
        </div>
    </c:if>
    <%--活动已结束 用户上榜--%>
    <c:if test="${code==-4&&map.num>0}">
        <!--收货地址-->
        <div class="earnings_cont">
            <img class="base_person" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/base_person.png" alt="">
            <div class="earnings_title">累计收益:<span>${map.money}</span>元</div>
            <div class="piece piece_bg">
                <div class="rank_cont clearfix">
                    <div class="earnings_left fl">
                        <i></i>您的当前排名
                        <span class="ml">第${map.num}名</span>
                    </div>
                    <div class="earnings_right check_rank fr">查看排行榜</div>
                </div>
                <p>
                    <c:choose>
                        <c:when test="${map.num==1}">
                            获得特斯拉使用权一年
                        </c:when>
                        <c:when test="${map.num==2||map.num==3}">
                            获得俄罗斯豪华8日游
                        </c:when>
                        <c:when test="${map.num>3&&map.num<=6}">
                            获得极米H1S 家用投影仪
                        </c:when>
                        <c:when test="${map.num>6&&map.num<=30}">
                            获得戴森吹风机HD01
                        </c:when>
                        <c:when test="${map.num>30&&map.num<=50}">
                            获得华为荣耀防水影音平板
                        </c:when>
                        <c:when test="${map.num>50&&map.num<=100}">
                            获得索尼WF-1000X 蓝牙耳机
                        </c:when>
                        <c:when test="${map.num>100&&map.num<=150}">
                            获得美的冷风扇
                        </c:when>
                        <c:when test="${map.num>150&&map.num<=200}">
                            获得美的养生壶 1.5L容量
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </p>
                <div class="invest_btn addSite">添加收货地址</div>
            </div>
        </div>
    </c:if>
    <!--邀请好友的现金-->
    <div class="earnings_cont">
        <img class="base_person" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/base_person.png" alt="">
        <div class="earnings_title typeface">邀友得现金</div>
        <div class="piece piece_bg">
            <div class="rank_cont clearfix">
                <div class="earnings_left fl">
                    活动期间，邀请好友<span>注册并投资中再融</span>，邀请人可获得被邀请人投资金额一定比例的
                    <span>现金红包</span>。
                </div>
            </div>
            <div class="rank_cont clearfix">
                <div class="earnings_left fl">
                    <span>* 以90天5万为例</span>
                </div>
                <c:if test="${code==0}">
                    <div class="earnings_right my_invite_record  Invite_right fr">我的邀请记录</div>
                </c:if>
            </div>
            <img class="chart" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/chart.png" alt="">
            <c:if test="${code==-1}">
                <div class="invest_btn noLogin_invite">登录邀请得现金</div>
            </c:if>
            <c:if test="${code==0}">
                <div class="invest_btn now_invite_friend">立即邀请</div>
            </c:if>
            <c:if test="${code==-4}">
                <div class="invest_btn my_invite_record">我的邀请记录</div>
            </c:if>
            <p>计算公式=投资金额*1.5%(或3%)*项目期限/365</p>
        </div>
    </div>
    <div class="bottom_pic"></div>
</div>
<div class="rule_pic">
    <a href="<%=request.getContextPath()%>/worldCup/toActivityRule.do"></a>
</div>
<c:if test="${code==0||code==-4}">
    <div class="site_pic"></div>
</c:if>
<%--错误提示框开始--%>
<div class="err"></div>
<%--错误提示框结束--%>
<%--遮罩开始--%>
<div class="overlay" style="display:none;"></div>
<%--遮罩结束--%>
<%--修改收货地址开始--%>
<div class="site_cont" style="display:none;">
    <div class="close_btn"></div>
    <div class="addTitle">收货地址</div>
    <ul class="addInfo">
        <li>
            <input class="userName" type="text" placeholder="请输入收货人姓名" unselectable="on">
        </li>
        <li>
            <input class="userTel" type="number" pattern="[0-9]*" placeholder="请输入手机号码" oninput="if(value.length>11)value=value.slice(0,11)" required="" unselectable="on">
        </li>
        <li>
            <input id="showCityPicker3" class="userAdd" type="text" placeholder="请选择省、市、区" onfocus="this.blur()" readonly="">
        </li>
        <li>
            <input class="addDetail" type="text" placeholder="详细地址（街道楼道门牌号）">
        </li>
    </ul>
    <ul class="newAddBox clearfix twoModifyBox" style="display: block">
        <li class="backAct twoModify fl">修改地址</li>
        <li class="saveAdd twoClose fr">关闭</li>
    </ul>
    <div class="modifyBox twoAddBox">
        <div class="modifyBack twoSave">
            <a>保存收货人信息</a>
        </div>
    </div>
</div>
<%--修改收货地址结束--%>
<!--获得红包弹窗-->
<div class= "pop_box">
    <div class="close_btn"></div>
    <p>恭喜您获得</p>
    <div class="red_packet">
        <span class="type">现金红包</span>
        <div class="num">100元</div>
    </div>
    <div class="employ_btn">去使用</div>
    <div class="repetition_btn">再来一次</div>
</div>
<!--计算收益弹窗-->
<div class="earnings_cont calculator">
    <img class="base_person" src="<%=request.getContextPath()%>/resources/image/activity/worldCup/base_person.png" alt="">
    <div class="earnings_title"><span>投额计算器</span></div>
    <div class="piece piece_bg">
        <div class="count">
            <p>
                <span>获得收益</span>
                <input class="count_input" type="number" name="" id="getMoney" onkeyup="clearNoNum(this)" />
            </p>
            <p>
                <span>项目期限</span>
                <input class="count_input" maxlength="3" type="number" name="" id="range" onKeyUp="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else if(parseInt(this.value)>360){this.value=360}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else if(parseInt(this.value)>360){this.value=360}else{this.value=this.value.replace(/\D/g,'')}" >
            </p>
            <p class="money">需投金额
                <span class="clearfix"><em class="needMoney">0</em><em>元</em></span>
            </p>
        </div>
        <div class="invest clearfix">
            <span class="cancel_btn fl">取  消</span><span class="go_invest fr">去投资</span>
        </div>
        <p class="no_ranklist">需出借金额=应获收益/投资期限*365/收益利率</p>
    </div>
</div>
<!--暂未获得奖品弹窗-->
<div class="prize_pop no_prize" style="display: none">
    <h3>我的奖品</h3>
    <div class="common_prize_bg">
        <div class="close_off"></div>
        <div class="welfare_big"></div>
        <p>- 暂未获得奖品 -</p>
        <div class="go_raffle">去抽奖</div>
    </div>
</div>
<!--奖品弹窗-->
<div class="prize_pop has_prize" style="display: none">
    <h3>我的奖品</h3>
    <div class="common_prize_bg">
        <div class="close_off"></div>
        <div class="prize_info">
            <div>
                <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/welfare_small.png" alt=""><span><em>8%</em>   加息券</span>
            </div>
            <div>
                <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/welfare_small.png" alt=""><span><em>100元</em>   现金红包</span>
            </div>
            <div>
                <img src="<%=request.getContextPath()%>/resources/image/activity/worldCup/welfare_small.png" alt=""><span><em>100元</em>   现金红包</span>
            </div>
        </div>
    </div>
</div>
<%--code -1 未登录  -2活动未定义 -3 活动未开始 -4 活动已结束 0 活动进行中  --%>
<input type="hidden" id="code" value="${code}" />
<input type="hidden" id="count" value="${map.count}" />
<%--num -1 榜上无人  0 未上榜  --%>
<input type="hidden" id="num" value="${map.num}" />
<%--累计收益--%>
<input type="hidden" id="money" value="${map.money}" />
<%--相差金额--%>
<input type="hidden" id="differMoney" value="${map.differMoney}" />
<%--总投资金额--%>
<input type="hidden" id="totalInvestMoney" value="${map.totalInvestMoney}" />
<input type="hidden" id="userId" value="${userId}" />
<input type="hidden" id="userCode" value="${userCode}" />
<input type="hidden" id="userPhone" value="${userPhone}" />


<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/fastclick.js"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/mui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/mui.picker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/mui.poppicker.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/ruffian/city_data2.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/worldCup/worldCup.js${verCode}"></script>
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
                    proId=items[0].value;
                    cityId=items[1].value;
                    disId=items[2]?items[2].value:"";
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
    var flag=getadd('flag');
    var token=getadd('token');
    var userId = $("#userId").val();
//    var mobile=$("#userPhone").val();
//    var yqm=$("#userCode").val();
    var url='';
    // app 端调用改变页面点击事件或样式
    function changeForApp(){
        $(".ball.noLogin,.nologin_rank,.noLogin_invite").off().on("click",function(){
            userLogin();
        });
        $(".pop_box .employ_btn,.now_invest,.calculator .go_invest").off().on("click",function(){
            jumpInvest();
        });

        $(".now_invite_friend").off().on("click",function(){
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
    //app获取app还是wap
    function getadd(flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
</script>
</body>
</html>