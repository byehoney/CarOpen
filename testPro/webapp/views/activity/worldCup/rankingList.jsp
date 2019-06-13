<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    request.setAttribute("verCode", "?r=Version2018020822");
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
    <title>排行榜</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/worldCup/ranking.css${verCode}"/>
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
<ul class="list_head clearfix">
    <li class="fl">排名</li>
    <li class="fl">用户</li>
    <li class="fl">累计收益</li>
    <li class="fl">获得奖品</li>
</ul>
<div class="small_box"></div>
<div class="table_list distance" style="overflow: auto">
    <div class="prize_was">

        <table class="giftTab table_cont" cellpadding="0" cellspacing="0">
            <tbody>

            </tbody>
        </table>
    </div>
</div>
<div class="backTop"></div>
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function(){
        $(".distance").height($(window).height());
        var userId=getadd('userId');
        var flag=getadd('flag');
        var token=getadd('token');
        $.ajax({
           type:'POST',
            dataType:'JSON',
            data:{userId:userId,flag:flag,token:token},
            url:basePath+'/worldCup/rankingList.do',
            success:function(res){
                if(res.code==0){
                   var rankStr='';
                   var gift='';
                   $(res.data.list).each(function(i,n){
                       if(i+1==1){
                           gift='特斯拉使用权1年';
                       }else if(i+1==2||i+1==3){
                           gift='俄罗斯豪华8日游';
                       }else if(i+1>3&&i+1<=6){
                           gift='极米家用投影仪';
                       }else if(i+1>6&&i+1<=30){
                           gift='戴森吹风机HD01';
                       }else if(i+1>30&&i+1<=50){
                           gift='华为防水影音平板';
                       }else if(i+1>50&&i+1<=100){
                           gift='索尼蓝牙耳机';
                       }else if(i+1>100&&i+1<=150){
                           gift='美的冷风扇';
                       }else if(i+1>150&&i+1<=200){
                           gift='美的养生壶';
                       }
                       if(n&&n.investorUserId==userId){
                           rankStr+='<tr class="cur"><td>'+(i+1)+'</td><td>'+n.mobile+'</td><td>'+n.money+'元</td><td>'+gift+'</td></tr>';
                       }else if(n){
                           rankStr+='<tr><td>'+(i+1)+'</td><td>'+n.mobile+'</td><td>'+n.money+'元</td><td>'+gift+'</td></tr>';
                       }else{
                           rankStr+='<tr><td>'+(i+1)+'</td><td>虚位以待</td><td>-</td><td>'+gift+'</td></tr>';
                       }
                   });
                   $(".giftTab.table_cont tbody").html(rankStr);
                    var timer=null;
                    timer=setInterval(function(){
                        if($(".giftTab.table_cont tr").length==200){
                            clearInterval(timer);
                            if($(".cur").length){
                                var curTop = $(".cur").offset().top;
                                var WH = $(window).height();
                                if(curTop>WH){
                                    $('.table_list.distance').animate({scrollTop:(curTop-WH/2)},500);
                                }
                            }else{
                                var h = $('.prize_was').height();
                                $('.table_list.distance').animate({scrollTop:h},500);
                            }
                        }
                    },100)
                }
            }
        });
        // 返回顶部
        $(".backTop").on("click",function(){
            $('.table_list.distance').scrollTop(0);
        });
        function getadd(flag){
            var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if(r!=null)return  unescape(r[2]); return null;
        }
    })
</script>
</body>
</html>
