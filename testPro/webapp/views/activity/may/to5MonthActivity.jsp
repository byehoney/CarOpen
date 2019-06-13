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
    <title>夏日福利，好礼大派送</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/mui.picker.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/mui-picker-plus.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/mui.poppicker.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/mayActivity/mayActivity.css${verCode}"/>
    <script>
        var basePath = "<%=request.getContextPath()%>";
    </script>
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
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
<div class="main docWrapper">
    <div class="banner">
        <div class="cash clearfix">
            <span class="fl">APP投资返现</span><span class="fr">项目专享加息</span>
        </div>
        <p>活动时间：5月09日-5月23日</p>
        <img src="<%=request.getContextPath()%>/resources/image/activity/mayActivity/banner_01.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/mayActivity/banner_02.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/mayActivity/banner_03.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/mayActivity/banner_04.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/mayActivity/banner_05.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/mayActivity/banner_06.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/mayActivity/banner_07.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/mayActivity/banner_08.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/mayActivity/banner_09.png" alt="">
        <img src="<%=request.getContextPath()%>/resources/image/activity/mayActivity/banner_10.png" alt="">
    </div>
    <div class="distance">
        <div class="welfareBorder">
            <div class="welfare_cont welfare_one">
                <div class="clearfix">
                    <div class="welfare_details fl">
                        <h4>福利一</h4>
                        <p class="typeface"><span style="font-weight: normal">APP端 </span>投资非新手项目</p>
                        <p>单笔投资每满10000元返<span>18元</span></p>
                        <c:if test="${flag=='mobile'}">
                            <div class="invest_btn mobile_invest">立即投资</div>
                        </c:if>
                        <c:if test="${flag=='wap'}">
                            <div class="invest_btn wap_invest">下载APP</div>
                        </c:if>
                    </div>
                    <img class="Redpacket fr" src="<%=request.getContextPath()%>/resources/image/activity/mayActivity/Redpacket.png"/>
                </div>
                <div class="packet_title">举例：融融单笔投资60天项目33000元，可得现金红包54元</div>
            </div>
        </div>
        <div class="welfareBorder">
            <div class="welfare_cont  welfare_two">
                <div class="clearfix">
                    <div class="welfare_details fl">
                        <h4>福利二</h4>
                        <p>90-360天项目 加息<span>0.5%</span></p>
                        <div class="invest_btn">立即投资</div>
                    </div>
                    <img class="Redpacket fl" src="<%=request.getContextPath()%>/resources/image/activity/mayActivity/purse.png"/>
                </div>
            </div>
        </div>
        <img class="welfareThree_pic" src="<%=request.getContextPath()%>/resources/image/activity/mayActivity/welfareThree.png" alt="">
        <div class="rule_pic"></div>
        <div class="cumulative_amount">
            <p class="totalInvest">累计投资金额：<c:if test="${loginStatus==1}"><span class="sum">¥<fmt:formatNumber value="${totalInvestMoney}" pattern="#,##0.00#"/></span></c:if><c:if test="${loginStatus==0}"><em class="loginCheck">登录查看</em></c:if></p>
            <c:if test="${loginStatus==1}"><p class="getGift"></p></c:if>
        </div>
        <div class="clearfix">
            <div class="site fr <c:if test="${loginStatus==1}">loginSite</c:if><c:if test="${loginStatus==0}">noLoginSite</c:if>">填写收货人信息</div>
        </div>
        <ul class="prize_list clearfix">
            <li>
                <div class="prize_bg">
                    <div class="jdCard_one"></div>
                    <p>100元京东卡</p>
                    <p><span>3万</span>≤累计投额<<span>5万</span></p>
                </div>
            </li>
            <li>
                <div class="prize_bg">
                    <div class="jdCard_two"></div>
                    <p>200元京东卡 </p>
                    <p><span>5万</span>≤累计投额<<span>10万</span></p>
                </div>
            </li>
            <li>
                <div class="prize_bg">
                    <em>价值489元</em>
                    <div class="Philips"></div>
                    <p>飞利浦电动牙刷</p>
                    <p><span>10万</span>≤累计投额<<span>20万</span></p>
                </div>
            </li>
            <li>
                <div class="prize_bg">
                    <em>价值999元</em>
                    <div class="electric_cooker"></div>
                    <p>米家压力IH电饭煲</p>
                    <p><span>20万</span>≤累计投额<<span>50万</span></p>
                </div>
            </li>
            <li class="last">
                <div class="prize_bg">
                    <em>价值2999元</em>
                    <div class="camera"></div>
                    <p>小蚁微单相机套装 </p>
                    <p>累计投额≥<span>50万</span></p>
                </div>
            </li>
        </ul>
        <p class="get_prize">*注：实物奖励只能按所满足的最高条件领取一次</p>
    </div>
    <div class="bottom_pic"></div>
</div>
<%--错误提示框开始--%>
<div class="err"></div>
<%--错误提示框结束--%>
<%--遮罩开始--%>
<div class="overlay" style="display:none;"></div>
<%--遮罩结束--%>
<%--活动规则开始--%>
<div class="rule_pop_box">
    <div class="close_btn"></div>
    <h3 class="rule_title"></h3>
    <div class="rule_content">
        <ol>
            <li>活动时间：2018年5月09日-5月23日；</li>
            <li>实物奖励只能按满足最高条件领取一次，不可重复领取；</li>
            <li>现金奖励实时发放；实物奖励于活动结束后的15个工作日内发放（也可按市场价8折折现），期间会有客服联系确定收货人信息，请留意接听电话；</li>
            <li>投资新手项目不参与活动；</li>
            <li>本次活动最终解释权归中再融所有。如有疑问，请致电客服专线：4001-156-157。</li>
        </ol>
    </div>
</div>
<%--活动规则结束--%>
<%--修改收货地址开始--%>
<div class="site_cont" style="display:none;">
    <div class="close_btn"></div>
    <div class="addTitle"></div>
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
<input type="hidden" id="flag" value="${flag}">
<input type="hidden" id="loginStatus" value="${loginStatus}">
<input type="hidden" id="userId" value="${userId}">
<input type="hidden" id="totalInvestMoney" value="${totalInvestMoney}">
<input type="hidden" id="currentTime" value="${currentTime}">
<input type="hidden" id="campaignStartTime" value="${campaignStartTime}">
<input type="hidden" id="campaignEndTime" value="${campaignEndTime}">



<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/newYear/fastclick.js"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/mui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/mui.picker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/mui.poppicker.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/ruffian/city_data2.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/mayActivity/mayActivity.js${verCode}"></script>
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
        $(".noLoginSite,.loginCheck").off().on("click",function(){
            userLogin();
        });
        // 活动期间点击立即投资
        $(".invest_btn").off().on("click",function(){
            if(!$(this).hasClass('no_started')){
                jumpInvest();
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
</script>
</body>
</html>