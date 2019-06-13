<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>投资项目 - 中再融</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <%@ include file="/views/inc/inc.jsp"%>
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/items.css">
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
<div id="content_height">
    <%@ include file="/views/inc/xm_tab.jsp"%>
    <div class="itmes_list"> 
        <c:if test="${result.data.creditRightsList.size() > 0}">  	
        <c:forEach items="${result.data.creditRightsList}" var="loan">
        <div class="it_list
            <c:if test="${loan.status == 600}">items_back</c:if>
            " url="${basePath}/creditRights/detail/${loan.debtid}.do">
            <div class="it_header ">
	            <p class="fl f14 list_title_style">${loan.titleFull}</p>
                <!-- <p class="fr f12 items_safe list_content_style">
	            	<span><img src='${basePath}/resources/image/safe_items.png'></span>${loan.securityMode}
	            </p> -->
            </div>
            <div class="itmes_content">
                <ul>
                    <li style="width:40%"><span class="f25 fl">
                        <fmt:formatNumber value="${loan.toBeCollectedInterest}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber>
                    </span><span class="f20 fl" style="margin-top:5px;">%</span>
                    </li>
                    <li style="width:30%;line-height:35px;">
                        ${loan.haveCount}天
                    </li>
                    <li style="width:30%;line-height:35px;">
                        <c:if test="${loan.transAmount >= 10000}"><fmt:formatNumber value="${loan.transAmount/10000}"  pattern="${moneyexp}"/>万</c:if>
                        <c:if test="${loan.transAmount < 10000}"><fmt:formatNumber value="${loan.transAmount}"  pattern="${moneyexp}"/>元</c:if>
                    </li>
                </ul>
            </div>
            <div class="jd_t ohz">
                <c:if test="${loan.status == 310}">
                    <div class="jdt_box fl">
                        <div style="width:${loan.prjLoad}%">&nbsp;</div>
                    </div>
                    <div class='itmes_num fl f12 c_blue'>
                        已抢购${loan.prjLoad}%
                    </div>
                    <div class="fr f12 items_mj">募集中...</div>                       
                </c:if>
                <c:if test="${loan.status eq 600}">
                <div class="jd_t ohz">
                    <div class="fr f12 items_mj">已抢光</div>
                </div>
                </c:if>
            </div>
        </div>
        </c:forEach>
        </c:if> 
        <c:if test="${result.data.creditRightsList.size() == 0}">
        <div class="ykb_con">
        <div class='no_data'>
            <div>暂无项目，请浏览其它类型项目</div>
        </div>
        </div>  
        </c:if>
    </div>
    <div id="more_list">
        <div id="more">查看更多项目</div>
    </div>
   </div>
    <%@ include file="/views/inc/footer.jsp"%>
<script type="text/javascript">
$(function(){
    var page = 2;
    $('#more_list').click(function(){
        page++;
        $.ajax({
            type: 'POST',
            url: environment.basePath + "/creditRights/getCreditRightsListByPage.do",
            data: {"page":page},
            beforeSend: function(){
                $('#more').hide();
                $('#more_list').addClass('more_jz');
            },
            success: function(json) {
                if(json.code < 0){
                    $("#more").html("没有更多了");
                }else{
                    var creditRightsList = json.data.creditRightsList;
                    if(creditRightsList.length == 0){
                        $("#more").html("没有更多了");
                    }else{
                        for (var i = 0; i < creditRightsList.length; i++) {
                            var creditRights = creditRightsList[i];
                            var htmlStr = '';
                            if(creditRights.status == 600){
                                htmlStr += '<div class="it_list items_back" url="${basePath}/creditRights/detail/'+creditRights.debtid+'.do">';
                            }else{
                                htmlStr += '<div class="it_list" url="${basePath}/creditRights/detail/'+creditRights.debtid+'.do">';
                            }
                            htmlStr += '<div class="it_header ">';
                            htmlStr += '<p class="fl f14 list_title_style">'+creditRights.titleFull+'</p>';
                            htmlStr += '<p class="fr f12 items_safe list_content_style">';
                            htmlStr += '<span><img src="${basePath}/resources/image/safe_items.png"></span>';
                            htmlStr += creditRights.securityMode+'</p></div>';
                            htmlStr += '<div class="itmes_content"><ul>';
                            htmlStr += '<li style="width:40%"><span class="f25 fl">'+creditRights.toBeCollectedInterest;
                            htmlStr += '</span><span class="f20 fl" style="margin-top:5px;">%</span></li>';
                            htmlStr += '<li style="width:30%;line-height:35px;">'+creditRights.haveCount+'天</li>';
                            htmlStr += '<li style="width:30%;line-height:35px;">';
                            if(creditRights.transAmount >= 10000){
                                htmlStr += (creditRights.transAmount/10000).toFixed(2)+'万</li></ul></div>';
                            }else{
                                htmlStr += creditRights.transAmount.toFixed(2) + '元</li></ul></div>';
                            }
                            htmlStr += '<div class="jd_t ohz">';
                            if(creditRights.status == 310){
                                htmlStr += '<div class="jdt_box fl"><div style="width:'+creditRights.prjLoad+'%">&nbsp;</div></div>';
                                htmlStr += '<div class="itmes_num fl f12 c_blue">已抢购'+creditRights.prjLoad+'%</div>';
                                htmlStr += '<div class="fr f12 items_mj">募集中...</div>';
                            }else if(creditRights.status == 600){
                                htmlStr += '<div class="jd_t ohz"><div class="fr f12 items_mj">已抢光</div></div>';
                            }
                            htmlStr += '</div></div>';
                            $('.itmes_list').append(htmlStr);
                        }
                    };
                }
            },
            complete:function(){
                $('#more').show();
                $('#more_list').removeClass('more_jz');
                $('.itmes_list .it_list').click(function(){
                    var url=$(this).attr('url');
                    window.location=url; 
                });
            }
        });
    });
    
    $('.itmes_list .it_list').click(function(){
        var url=$(this).attr('url');
        window.location=url; 
    });
});
</script>
</body>
</html>