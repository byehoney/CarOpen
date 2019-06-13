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
    <title>红包iPhone 8一起飞</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/farAway/redPaper.css${verCode}">
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
    <div class="rankingList">
        <div class="rankingTitle">
            <ul class="ListTitle">
                <li>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </li>
            </ul>
        </div>
        <c:if test="${ not empty investorList }">
            <div class="ListContent" >
                <p class="curUser before hide"></p>
                <ul class="listContent">
                    <c:forEach items="${investorList}" var="user" varStatus="status">
                    <li <c:if test="${userId==user.userId}">class="cur"</c:if>>
                            <span>${ status.index + 1}</span>
                            <span>${user.mobile}</span>
                            <span>
                                <fmt:formatNumber type="currency" value="${user.investAmount}" pattern="#,#00"/>元
                            </span>
                            <span>
                                <%--<c:if test="${(user.investAmount ge 500000) && ((status.index + 1)  le 100)}">--%>
                                    <%--iPhone 8--%>
                                <%--</c:if>--%>
                                <%--<c:if test="${(user.investAmount ge 300000)  && ((status.index + 1)  le 130)&& ((status.index + 1)  gt 100)}">--%>
                                    <%--小米 6--%>
                                <%--</c:if>--%>
                                <%--<c:if test="${(user.investAmount ge 200000)  && ((status.index + 1)  le 160)&& ((status.index + 1)  gt 130)}">--%>
                                    <%--华为畅享 7--%>
                                <%--</c:if>--%>
                                <%--<c:if test="${(user.investAmount ge 100000) &&((status.index + 1)  le 200) && ((status.index + 1)  gt 160)}">--%>
                                    <%--红米 4X--%>
                                <%--</c:if>--%>
                                <c:choose>
                                    <c:when test="${(user.investAmount ge 500000) && ((status.index + 1)  le 100)}">
                                        iPhone 8
                                    </c:when>
                                    <c:when test="${(user.investAmount ge 300000) && ((status.index + 1)  le 130)}">
                                        小米 6
                                    </c:when>
                                    <c:when test="${(user.investAmount ge 200000) && ((status.index + 1)  le 160)}">
                                        华为畅享 7
                                    </c:when>
                                    <c:when test="${(user.investAmount ge 100000) && ((status.index + 1)  le 200)}">
                                        红米 4X
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </li>
                    </c:forEach>
                </ul>
                <p class="curUser after hide"></p>
            </div>
        </c:if>
        <c:if test="${  empty investorList }">
            <div class="noData">
                <img src="<%=request.getContextPath()%>/resources/image/activity/farAway/billBoard.png" alt="" class="billBoard">
                <div class="warmTip">
                    <p>都忙着抢红包了</p>
                    <p>但冲榜拿奖也重要呐</p>
                    <span class="goInvest">我要上榜</span>
                </div>
            </div>
        </c:if>
    </div>
</section>
<script type="text/javascript">
    $(function(){
        if($(".listContent li").size()){
            if($(".listContent .cur").size()){//如果当前用户上榜
                var curPos=$(".listContent .cur").offset().top;
                if(curPos>$(window).height()){
                    $(".ListContent .after").removeClass("hide").addClass("show").html($(".listContent .cur").html()).css({
                        position:'fixed',
                        bottom:0,
                        zIndex:99
                    });
                }
            }
        }
        $(window).scroll(function(){
            if($(".listContent li").size()){
                if($(".listContent .cur").size()){//如果当前用户上榜
                    if($(window).scrollTop()>=$(".listContent .cur").offset().top-$(".listContent .cur").height()){
                        $(".ListContent .before").removeClass("hide").addClass("show").html($(".listContent .cur").html()).css({
                            position:'fixed',
                            top:'1rem',
                            zIndex:99
                        })
                        $(".listContent").css({paddingTop:'1rem'});
                    }
                    if($(".ListContent .before").hasClass("show")){
                        if($(window).scrollTop()<$(".listContent .cur").offset().top-$(".listContent .cur").height()){
                            $(".ListContent .before").removeClass("show").addClass("hide");
                            $(".listContent").css({paddingTop:0});
                        }
                    }

                    if($(window).scrollTop()<$(".listContent .cur").offset().top-$(window).height()){
                        $(".ListContent .after").removeClass("hide").addClass("show");
                    }else{
                        $(".ListContent .after").removeClass("show").addClass("hide");
                    }
                }
            }
        });
        //无数据点击我要上榜
        $('.warmTip .goInvest').on("click",function(){
            toInvest();
        });
    });
</script>
<script>
    // app 端调用改变页面点击事件或样式
    function changeForApp(){
        $('.warmTip .goInvest').click(jumpInvest);
    }
    // 去投资
    function toInvest(){
        window.location.href = basePath+'/loan/list.do';
    }
    function jumpInvest(){
        anniversary.jumpInvest();
    }
    function fmoney(s, n) {
        n = n > 0 && n <= 20 ? n : 2;
        s = parseFloat((s + '').replace(/[^\d\.-]/g, '')) + '';
        var l = s.split('.') [0].split('').reverse(),
            r = s.split('.') [1];
        var t = '';
        for (var i = 0; i < l.length; i++)
        {t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? ',' : '');}
        if (!r) { r = '0'; }
        if (r.length < n) {for (var i = r.length; i < n; i++) {r += '0';}}else{ r=r.substr(0,n);}
        return t.split('').reverse().join('') + '.' + r;
    }
</script>
</body>
</html>