<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<%
double version = Math.random(); 
%>
<head>
    <meta charset="UTF-8">
    <title>优选项目 - 中再融</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <%@ include file="/views/inc/inc.jsp"%>
    <link href="<%=request.getContextPath()%>/resources/css/present/indexWap.css?v=<%=version%>" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
	<div class="main">
	
		<!--项目列表-->
		<ul class="itemList">
		
		
		<!--新手项目-->
		 	<c:if test="${result.data.indexData.isNewPeople}">
				<c:forEach items="${result.data.indexData.rookieLoan}" var="rookieLoan" varStatus="status">
		 		<li class="whiteBack" >
		 		<a href="${basePath}/loan/rookie.do?loanId=${rookieLoan.loanid}&flag=1">
					<h4 class="clearfix">
						<span class="fl itemTitle">${rookieLoan.titleFull}</span>
						<span class="fr noviceProject"><i class="bottomIcon"></i><small class="txt">新手项目</small></span>
						
					</h4>
					<div class="itemMain">
						<div class="clearfix itemCont">
							<div class="fl">
								<p class="annualizedRate clearfix">
								<c:if test="${rookieLoan.platAddInterest<=0}">
				                   <span class="fl"><fmt:formatNumber value="${rookieLoan.aunualInterestRate }" type="number" pattern="${aunualInterestRateExp}"></fmt:formatNumber>%</span>
				                   
			                   	</c:if>
			                   	<c:if test="${rookieLoan.platAddInterest>0}">
				                   <span class="fl"><fmt:formatNumber value="${rookieLoan.borrowerInterest }" type="number" pattern="${aunualInterestRateExp}"></fmt:formatNumber>%</span>
				                   <span class="fl"><small>+</small><fmt:formatNumber value="${rookieLoan.platAddInterest }" type="number" pattern="${aunualInterestRateExp}"></fmt:formatNumber>%</span>
			                   	</c:if>
								</p>
								<p class="grayWord">年化收益率</p>
							</div>
							<div class="fl">
								<p><big>${rookieLoan.amount/10000}</big>万</p>
								<p class="grayWord">募集总额</p>
							</div>
							<div class="fl">
								<p><big>${rookieLoan.qfqDays}</big>天</p>
								<p class="grayWord">投资期限</p>
							</div>
							 <c:choose>
					                    <c:when test="${rookieLoan.biddingAmount eq rookieLoan.amount}">
					                        <c:choose>
					                            <c:when test="${rookieLoan.status eq 400}">
					                                <div class="fr full">
														<table>
															<tr>
																<td>
																	<p>已售罄</p>
																</td>
															</tr>
														</table>
													</div>
					                            </c:when>
					                            <c:when test="${rookieLoan.status eq 500}">
								                     <div class="fr backSection">							
														<table>
															<tr>
																<td>
																	<p>还款中</p>
																</td>
															</tr>
														</table>
													</div>
					                            </c:when>
					                            <c:when test="${rookieLoan.status eq 600}">
					                                <div class="fr backFinished">
														<table>
															<tr>
																<td>
																	<p>已完成</p>
																</td>
															</tr>
														</table>
													</div>
					                            </c:when>
					                        </c:choose>
					                    </c:when>
					                    <c:otherwise>
					                        <c:choose>
					                        <c:when test="${rookieLoan.status == 300}">
					                            <div class="fr ing">		
													<table>
														<tr>
															<td>
																<p>立即</p>
																<p>加入</p>
															</td>
														</tr>
													</table>
												</div>                     
					                        </c:when>
					                        <c:when test="${rookieLoan.status == 330}">
					                        <div class="fr will">
												<table>
													<tr>
														<td>
															<p>即将</p>
															<p>上线</p>
														</td>
													</tr>
												</table>
											</div>           
					                        </c:when>
					                        <c:when test="${rookieLoan.status == 340}">
					                        <div class="fr will">
												<table>
													<tr>
														<td>
															<p>项目</p>
															<p>预告</p>
														</td>
													</tr>
												</table>
												
											</div>
					                        </c:when>
					                        </c:choose>
					                    </c:otherwise>
					                </c:choose>
							
						</div>
						<div class="progress clearfix">
									<c:choose>
					                    <c:when test="${rookieLoan.biddingAmount eq rookieLoan.amount}">
					                    	<c:choose>
					                            <c:when test="${rookieLoan.status eq 400}">
					                                <div class="fl progressBar">
														<p class="percent" style="width:100%"></p>
													</div>
													<div class="fr perText orangeWord">已完成100%</div>
					                            </c:when>
					                            <c:when test="${rookieLoan.status eq 500}">
								                    <div class="fl progressBar">
														<p class="percent" style="width:100%"></p>
													</div>
													<div class="fr perText orangeWord">已完成100%</div>
					                            </c:when>
					                            <c:when test="${lrookieLoan.status eq 600}">
					                                <div class="fl progressBar">
														<p class="percent"></p>
													</div>
													<div class="fr perText orangeWord">已完成100%</div>
					                            </c:when>
					                        </c:choose>								    
					                    </c:when>
					                    <c:otherwise>
					                        <c:choose>
					                        <c:when test="${rookieLoan.status == 300}">
					                            <div class="fl progressBar">
													<p class="percent" style="width:${rookieLoan.prjLoad}%"></p>
												</div>
												<div class="fr perText orangeWord">已完成${rookieLoan.prjLoad}%</div>                   
					                        </c:when>
					                        <c:when test="${rookieLoan.status == 330}">
											    <div class="fr countdown clearfix">
													<i class="fl">距上线时间还有</i>
													<input type="hidden" value="${lrookieLoan.prjLoad}" id="prjLoad${status.index}"/>
													<input type="hidden" value="${rookieLoan.prjOnlineTime}" class="prjOnlineTime" id="prjOnlineTime${status.index}" prop="${status.index}">
													<span class="orangeWord fl" id="time_back${status.index}"></span>
												</div>          
					                        </c:when>
					                        <c:when test="${rookieLoan.status == 340}">
						                        <div class="fr willText clearfix">
													<span class="orangeWord fl"><fmt:formatDate pattern="yyyy-MM-dd" value="${rookieLoan.eprojectTime}"></fmt:formatDate></span>
													<i class="fl orangeWord">|</i>
													<span class="orangeWord fl"><fmt:formatDate pattern="HH:mm:ss" value="${rookieLoan.eprojectTime}"></fmt:formatDate></span>
													<span class="fl willSamll">上线</span>
												</div>
					                        </c:when>
					                        </c:choose>
					                    </c:otherwise>
					                </c:choose>
								</div>
					</div>
					</a>
				</li>
				</c:forEach>
		 	</c:if>
			
			 	<c:forEach items="${result.data.loanList}" var="loan" varStatus="status">
			 		 <c:if test="${loan.isRookie!= 1}"> 
			 			<!--直投项目-->
						 <li class="whiteBack">
							<c:if test="${loan.loanProductId != 7 }">
								<a href="${basePath}/loan/detail/${loan.loanid}.do">
				            </c:if>
				            <c:if test="${loan.loanProductId == 7 }">
				            	<a href="${basePath}/invest/projectDetail.do?loanId=${loan.loanid}">
				            </c:if>
						 	
							<h4 class="clearfix">
								<c:if test="${loan.loanProductId != 7 }">
					                <span class="fl itemTitle">${loan.titleFull}</span>
				            	</c:if>
				            	<c:if test="${loan.loanProductId == 7 }">
					                <p class="fl f14 list_title_style" style="display:none"><span class="project_ykb">中再宝</span>${loan.titleFull}</p>
				            	</c:if>
								
							</h4>
							<div class="itemMain">
								<div class="clearfix itemCont">
									<div class="fl">
										<p class="annualizedRate clearfix">
											<span class="fl"><fmt:formatNumber value="${loan.borrowerInterest}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber>%</span>
										<c:if test="${loan.platAddInterest > 0}">
											<small class="fl">+</small>
											<span class="fl"><fmt:formatNumber value="${loan.platAddInterest}"  pattern="${aunualInterestRateExp}"></fmt:formatNumber>%</span>	
										    
                    					</c:if>
										</p>
										<p class="grayWord">年化收益率</p>
									</div>
									<div class="fl">
										<p><big>${loan.amount/10000}</big>万</p>
										<p class="grayWord">募集总额</p>
									</div>
									<div class="fl">
										<p>
											<big>
											<c:if test="${loan.qfqDays > 0}">${loan.qfqDays}</c:if>
					                        <c:if test="${loan.qfqDays <= 0}">${loan.termCount}</c:if>
					                        </big>
					                        <c:if test="${loan.qfqDays == 5}">月</c:if>
					                        <c:if test="${loan.qfqDays != 5}">天</c:if>
					                       
										</p>
										<p class="grayWord">投资期限</p>
									</div>
									 <c:choose>
					                    <c:when test="${loan.biddingAmount eq loan.amount}">
					                        <c:choose>
					                            <c:when test="${loan.status eq 400}">
					                                <div class="fr full">
														<table>
															<tr>
																<td>
																	<p>已售罄</p>
																</td>
															</tr>
														</table>
													</div>
					                            </c:when>
					                            <c:when test="${loan.status eq 500}">
								                     <div class="fr backSection">							
														<table>
															<tr>
																<td>
																	<p>还款中</p>
																</td>
															</tr>
														</table>
													</div>
					                            </c:when>
					                            <c:when test="${loan.status eq 600}">
					                                <div class="fr backFinished">
														<table>
															<tr>
																<td>
																	<p>已完成</p>
																</td>
															</tr>
														</table>
													</div>
					                            </c:when>
					                        </c:choose>
					                    </c:when>
					                    <c:otherwise>
					                        <c:choose>
					                        <c:when test="${loan.status == 300}">
					                            <div class="fr ing">		
													<table>
														<tr>
															<td>
																<p>立即</p>
																<p>加入</p>
															</td>
														</tr>
													</table>
												</div>                     
					                        </c:when>
					                        <c:when test="${loan.status == 330}">
					                        <div class="fr will">
												<table>
													<tr>
														<td>
															<p>即将</p>
															<p>上线</p>
														</td>
													</tr>
												</table>
											</div>           
					                        </c:when>
					                        <c:when test="${loan.status == 340}">
					                        <div class="fr will">
												<table>
													<tr>
														<td>
															<p>项目</p>
															<p>预告</p>
														</td>
													</tr>
												</table>
												
											</div>
					                        </c:when>
					                        </c:choose>
					                    </c:otherwise>
					                </c:choose>
								</div>
								
								<div class="progress clearfix">
									<c:choose>
					                    <c:when test="${loan.biddingAmount eq loan.amount}">
					                    	<c:choose>
					                            <c:when test="${loan.status eq 400}">
					                                <div class="fl progressBar">
														<p class="percent" style="width:100%"></p>
													</div>
													<div class="fr perText orangeWord">已完成100%</div>
					                            </c:when>
					                            <c:when test="${loan.status eq 500}">
								                    <div class="fl progressBar">
														<p class="percent" style="width:100%"></p>
													</div>
													<div class="fr perText orangeWord">已完成100%</div>
					                            </c:when>
					                            <c:when test="${loan.status eq 600}">
					                                <div class="fl progressBar">
														<p class="percent"></p>
													</div>
													<div class="fr perText orangeWord">已完成100%</div>
					                            </c:when>
					                        </c:choose>								    
					                    </c:when>
					                    <c:otherwise>
					                        <c:choose>
					                        <c:when test="${loan.status == 300}">
					                            <div class="fl progressBar">
													<p class="percent" style="width:${loan.prjLoad}%"></p>
												</div>
												<div class="fr perText orangeWord">已完成${loan.prjLoad}%</div>                   
					                        </c:when>
					                        <c:when test="${loan.status == 330}">
											    <div class="fr countdown clearfix">
													<i class="fl">距上线时间还有</i>
													<input type="hidden" value="${loan.prjLoad}" id="prjLoad${status.index}"/>
													<input type="hidden" value="${loan.prjOnlineTime}" class="prjOnlineTime" id="prjOnlineTime${status.index}" prop="${status.index}">
													<span class="orangeWord fl" id="time_back${status.index}"></span>
												</div>          
					                        </c:when>
					                        <c:when test="${loan.status == 340}">
						                        <div class="fr willText clearfix">
													<span class="orangeWord fl"><fmt:formatDate pattern="yyyy-MM-dd" value="${loan.eprojectTime}"></fmt:formatDate></span>
													<i class="fl orangeWord">|</i>
													<span class="orangeWord fl"><fmt:formatDate pattern="HH:mm:ss" value="${loan.eprojectTime}"></fmt:formatDate></span>
													<span class="fl willSamll">上线</span>
												</div>
					                        </c:when>
					                        </c:choose>
					                    </c:otherwise>
					                </c:choose>
								</div>
							</div>
							</a>
						</li>
					 </c:if>
				</c:forEach>
				
			 <c:if test="${result.data.loanList.size() == 0}">
		            <div style="font-size: 0.14rem;">暂无项目，请浏览其它类型项目</div>
		     </c:if>
		</ul>
			 
		<div id="more_list" class="moreItem">
	    	<div id="more">查看更多项目</div>
	    </div>
	      
		<!--底部导航-->
		<footer>
			<ul class="nav whiteBack clearfix">
				<li class="fl">
					<a href="${basePath}/index.do" >
						<p class="iconBack indexIcon"></p>
						<p>主页</p>
					</a>
				</li>
				<li class="fl">
					<a href="${basePath}/loan/list.do" class="act">
						<p class="iconBack investIcon"></p>
						<p>投资</p>
					</a>
				</li>
				<li class="fl">
					<a href="${basePath}/myAccount/myAccountInfo.session">
						<p class="iconBack accountIcon"></p>
						<p>我的账户</p>
					</a>
				</li>
			</ul>
		</footer>
		
	</div>
<script type="text/javascript">
$(function(){
    var page = 2;
    var currentTime = '${result.data.currentTime}';
   	
    $('.prjOnlineTime').each(function(index){
        var prop = $(this).attr("prop");
        var id = '#prjOnlineTime' + prop;
        var prjOnlineTime = $(id).val();
        var timeBack =  'time_back' + prop;
        
        var id2 = '#prjLoad' + prop;
        var prjLoad =  $(id2).val();
       // time(currentTime,prjOnlineTime,timeBack);
       	
        countDown(currentTime,prjOnlineTime,timeBack,prjLoad);
    });
    
    $('#more_list').click(function(){
        page++;
        $.ajax({
            type: 'POST',
            url: environment.basePath + "/loan/getLoanListByPage.do",
            data: {"page":page},
            beforeSend: function(){
                $('#more').hide();
                $('#more_list').addClass('more_jz');
            },
            success: function(json) {
            	//console.log(json);
                if(json.code < 0){
                    $("#more").html("没有更多数据了");
                }else{
                    var loanList = json.data.loanList;
                    if(loanList.length == 0){
                        $("#more").html("没有更多数据了");
                    }else{
                        for (var i = 0; i < loanList.length; i++) {
                            var loan = loanList[i];
                            var htmlStr = '';

                                htmlStr += '<li class="whiteBack"><a href="${basePath}/loan/detail/'+loan.loanid+'.do"><h4 class="clearfix">';
                                var titleFull = loan.titleFull;

                                htmlStr += '<span class="fl itemTitle">'+titleFull+'</span></h4>';
                                
                                htmlStr += '<div class="itemMain"><div class="clearfix itemCont">';
                                htmlStr += '<div class="fl"><p class="annualizedRate clearfix"><span class="fl">'+loan.borrowerInterest.toFixed(1)+'%</span>';
                                if(loan.platAddInterest > 0){
                                    htmlStr += '<span class="fl"><small>+</small>'+loan.platAddInterest.toFixed(1)+'%</span>';
                                }
                                htmlStr += '</p><p class="grayWord">年化收益率</p></div>';

    							htmlStr += '<div class="fl"><p><big>'+(loan.amount/10000).toFixed(2)+'</big>万</p><p class="grayWord">募集总额</p></div><div class="fl"><p><big>';		


                                if(loan.qfqDays > 0){
                                    htmlStr += loan.qfqDays;
                                }else{
                                    htmlStr += loan.termCount;
                                }
                                if(loan.qfqDays == 5){
                                    htmlStr += '</big>月</p><p class="grayWord">投资期限</p></div>';
                                }else{
                                    htmlStr += '</big>天</p><p class="grayWord">投资期限</p></div>';
                                }

                                if(loan.biddingAmount == loan.amount){

                                    if(loan.STATUS == 400){
                                        htmlStr += '<div class="fr full"><table><tr><td><p>已售罄</p></td></tr></table></div>';
    									htmlStr += '</div><div class="progress clearfix"><div class="fl progressBar"><p class="percent" style="width:100%"></p></div><div class="fr perText orangeWord">已完成100%</div></div></div></a></li>';				
                                    }else if(loan.STATUS == 500){
                                        htmlStr += '<div class="fr backSection"><table><tr><td><p>还款中</p></td></tr></table></div>';
                                        htmlStr += '</div><div class="progress clearfix"><div class="fl progressBar"><p class="percent" style="width:100%"></p></div><div class="fr perText orangeWord">已完成100%</div></div></div></a></li>';	
                                    }else if(loan.STATUS == 600){
                                        htmlStr += '<div class="fr backFinished"><table><tr><td><p>已完成</p></td></tr></table></div>';
                                        htmlStr += '</div><div class="progress clearfix"><div class="fl progressBar"><p class="percent"></p></div><div class="fr perText orangeWord">已完成100%</div></div></div></a></li>';	
                                    }
                                }else{
                                    if(loan.STATUS == 300){
                                        var bars = ((loan.biddingAmount/loan.amount)*100).toFixed(0);
                                        htmlStr += '<div class="fr ing"><table><tr><td><p>立即</p><p>加入</p></td></tr></table></div>';
                                        htmlStr += '</div><div class="fl progressBar"><p class="percent" style="width:'+loan.prjLoad+'%"></p></div><div class="fr perText orangeWord">已完成'+loan.prjLoad+'%</div></div></div></a></li>';

                                        /*
                                        htmlStr += '<div class="jd_t ohz"><div class="jdt_box fl">';
                                        htmlStr += '<div style="width:'+bars+'%">&nbsp;</div></div>';
                                        htmlStr += '<div class="itmes_num fl f12 c_blue">已抢购'+bars+'%</div>';
                                        htmlStr += '<div class="fr f12 items_mj">募集中...</div></div>';*/
                                    }else if(loan.STATUS == 330){
                                    
                                    	htmlStr += '<div class="fr will"><table><tr><td><p>即将</p><p>上线</p></td></tr></table></div> ';
    									htmlStr += '</div><div class="fr countdown clearfix"><i class="fl">距上线时间还有</i><input type="hidden" value="'+loan.prjLoad+'" id="prjLoad'+status.index+'"/><input type="hidden" value="'+loan.prjOnlineTime+'" class="prjOnlineTime" id="prjOnlineTime'+status.index+'" prop="'+status.index+'"><span class="orangeWord fl" id="time_back'+status.index+'"></span></div></div></div></a></li>';		
                                    	/*
                                        htmlStr += '<div class="jd_time">';
                                        htmlStr += '<input type="hidden" value="'+loan.prjOnlineTime+'" class="prjOnlineTime" id="prjOnlineTime'+(11+i+(10*(page-1)))+'" prop="'+(11+i+(10*(page-1)))+'">';
                                        htmlStr += '<p>距上线<span id="time_back'+(11+i+(10*(page-1)))+'"></span></p>';
                                        htmlStr += '</div>';
                                        time(currentTime,loan.prjOnlineTime,'time_back'+(11+i+(10*(page-1))));
                                        */
                                    }else if(loan.STATUS == 340){
                                    	var eprojectTimeL = new Date(loan.eprojectTime).Format("yyyy-MM-dd");
                                    	var eprojectTimeR = new Date(loan.eprojectTime).Format("hh:mm:ss");
                                    	htmlStr += '<div class="fr will"><table><tr><td><p>项目</p><p>预告</p></td></tr></table></div>';
    									htmlStr += '</div><div class="fr willText clearfix"><span class="orangeWord fl">'+eprojectTimeL+'</span><i class="fl orangeWord">|</i><span class="orangeWord fl">'+eprojectTimeR+'</span><span class="fl willSamll">上线</span></div></div></div></a></li>';		
                                    	/*
                                        htmlStr += '<div class="jd_t ohz" style="display:none;">';
                                        htmlStr += '<div class="jdt_box fl">';
                                        htmlStr += '<div style="width:0%">&nbsp;</div></div>';
                                        htmlStr += '<div class="itmes_num fl f12 c_blue">已抢购0%</div>';
                                        htmlStr += '<div class="fr f12 items_mj">募集中...</div></div>';
                                        var eprojectTime = new Date(loan.eprojectTime).Format("yyyy-MM-dd hh:mm:ss");
                                        htmlStr += '<div class="jd_time">';
                                        htmlStr += '<p>项目预告<span id="time">'+eprojectTime+'</span></p></div>';
                                        */
                                    }
                                }
                            
                            $('.itemList').append(htmlStr);
                        }
                    };
                }
            },
            complete:function(){
                $('#more').show();
                $('#more_list').removeClass('more_jz');
              //  $('.itmes_list .it_list').click(function(){
               //     var url=$(this).attr('url');
              //      window.location=url; 
              //  })
                $('.prjOnlineTime').each(function(index){
                    var prop = $(this).attr("prop");
					
                    var id = '#prjOnlineTime' + prop;
                    var prjOnlineTime = $(id).val();
                    var timeBack =  'time_back' + prop;
                    
                    var id2 = '#prjLoad' + prop;
                    var prjLoad =  $(id2).val();
                   // time(currentTime,prjOnlineTime,timeBack);
                    countDown(currentTime,prjOnlineTime,timeBack,prjLoad);
                });
            }
        });
	})
    
    $('.itmes_list .it_list').click(function(){
    	var url=$(this).attr('url');
    	window.location=url; 
    })
    function countDown(starttime , endtime, id, w) {
    	var time = (endtime-starttime)/1000;
		var period = time || 899;
		var m = 14;
		var s = 59;
		var obj = $('#'+id);
		clearInterval(obj.timer);
		
		obj.timer = setInterval(function(){
			period--;
			if(period <= 0){
				clearInterval(this.timer);
				
				$('#'+id).parents('li').find('.itemCont').children(':last').removeClass('will').addClass('ing').find('td').html('<p>募集中</p>');
				$('#'+id).parents('.progress').html('<div class="fl progressBar"><p class="percent" style="width:'+w+'%"></p></div><div class="fr perText orangeWord">已完成'+w+'%</div>');
				return;
			}
			s = Math.floor(period%60);
			m = Math.floor(period/60%60);
			h = Math.floor(period/60/60%60);
			if(s < 10){
				s = '0'+s;
			}
			if(m < 10){
				m = '0'+m;
			}
			if(h < 10){
				h = '0'+h;
			}
			$('#'+id).text(h+':'+m+':'+s);
			
		},1000);
		
	}
});
</script>	
</body>
</html>