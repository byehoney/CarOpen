<%@page import="com.kunpeng.zzr.constant.CommonDef"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<%
String mongoPic = CommonDef.MONGO_FILE_SHOW_PATH;
%>
<%
String verCode = "?v=Version20160928";
%>
<head>
<meta charset="UTF-8">
<title>中再融官网-中再生协会唯一指定互联网金融平台</title>
 <meta name="Keywords" content="投资产品,投资,P2P网贷平台,投资理财，短期理财，理财计划，个人理财，网络理财，P2P理财，互联网金融，汽车抵押贷款，短期贷款，P2P贷款"/>
 <meta name="description" content="中再融（www.zhongzairong.cn）系中再生协会唯一指定互联网金融平台，依托中华全国供销合作总社以及协会下属万余家再生资源企业的资源，通过专业的互联网团队、完善的风控体系、实力强劲的合作机构为投资用户提供安全、透明、便捷的互联网理财服务。">
<meta name="author" content="wuyongjun_app">
<%@ include file="/views/inc/inc.jsp"%>
<link href="<%=request.getContextPath()%>/resources/css/style.css?v=201601062" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/resources/css/common/swiper-3.4.2.min.css?v=201601062" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/resources/css/present/indexWap.css<%=verCode%>" rel="stylesheet" type="text/css">	
<script src="<%=request.getContextPath()%>/resources/js/common/jquery.event.drag-1.5.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common/jquery.touchSlider.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/index.js?r=Version2015050817"></script>
<script src="<%=request.getContextPath()%>/resources/js/common/swiper-3.4.2.jquery.min.js"></script>
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
	<div class="main">
	
		<!--app下载提示-->
		<a href="${basePath}/views/static/download.jsp">
			<div class="appDown clearfix">
				<span class="fl iconBack iconLogo"></span>
				<span class="fl">下载中再融App,享受安全便捷的理财方式。</span>
			</div>
		</a>
		
		<!--轮播图-->
			<div class="main_visual">
			  <%--<div class="flicking_con" style="font-size: 0;">--%>
			  <%--<c:forEach items="${result.data.bannerList}" var="banner">--%>
			      <%--<a href="javascript:;"></a>--%>
			      <%--</c:forEach>--%>
			  <%--</div>  --%>
			  <%--<div class="main_image">--%>
			  <%--<ul> --%>
			   <%--<c:forEach items="${result.data.bannerList}" var="banner">--%>
			    <%--<li style=" background-color:${banner.backgroundColor};">--%>
			    <%--<c:if test="${banner.url!=''}"><a href="${banner.url}"><img src="<%=mongoPic%>/${banner.mongoFile}" /></a></c:if>--%>
			    <%--<c:if test="${banner.url==''}"> <a href="javascript:;"></a></c:if>--%>
			    <%--</li>--%>
			     <%--</c:forEach>--%>
			  <%--</ul>--%>
			  <%--<a href="javascript:;" id="btn_prev"></a>--%>
			  <%--<a href="javascript:;" id="btn_next"></a>--%>
			   <%--</div>--%>
				<div class="swiper-container newBanner">
					<div class="swiper-wrapper">
						<c:forEach items="${result.data.bannerList}" var="banner">
							<div class="swiper-slide" style=" background-color:${banner.backgroundColor};">
								<c:if test="${banner.url!=''}"><a href="${banner.url}"><img src="<%=mongoPic%>/${banner.mongoFile}" /></a></c:if>
								<c:if test="${banner.url==''}"> <a href="javascript:;"></a></c:if>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			   <img class="imgheiht" style="display:none;" src="${basePath}/resources//image/index/wpbanner_1.jpg" />
			</div>
			<!--轮播图end--> 
			<%-- 
			<div class="bannerBox">
			<div class="swiper-container">
			    <div class="swiper-wrapper">
			    	<c:forEach items="${result.data.bannerList}" var="banner">
				   	<div class="swiper-slide">
				    	<c:if test="${banner.url!=''}"><a href="${banner.url}"><img style="width:100%;height:100%;" src="<%=mongoPic%>/${banner.mongoFile}" /></a></c:if>
				    	<c:if test="${banner.url==''}"> <a href="javascript:;"></a></c:if>
				    </div>
				    </c:forEach>
			    </div>
			    <!-- 如果需要分页器 -->
			     <div class="swiper-pagination">

			     </div>
			    
			</div>
			</div>
			--%>
		
		<!--引导-->
		<ul class="guideBox clearfix whiteBack">
			<li class="fl">
				
					<c:choose>
					  	<c:when test="${empty result.data.indexData.user}">
					  		<a href="${basePath}/userInfo/nologin.do">
					  			<p class="iconBack loginIcon"></p>
								<p>登录/注册</p>
					  		</a>
					  	</c:when>
						<c:otherwise>
						    <a href="${basePath}/myAccount/myAccountInfo.session">
							    <p class="iconBack loginIcon"></p>
								<p>我的账户</p>
						    </a>
						</c:otherwise>
					</c:choose>
				
			</li>
			<li class="fl">
				<a href="${basePath}/views/static/wxintroduced.jsp">
					<p class="iconBack weiChatIcon"></p>
					<p>微信公众号</p>
				</a>
			</li>
			<li class="fl">
				<a href="${basePath}/views/static/download.jsp">
					<p class="iconBack appIcon"></p>
					<p>APP下载</p>
				</a>
			</li>
		</ul>
		<%--新增新手展示图--%>
		<c:if test="${empty result.data.indexData.user}">
			<img class="exhibition_btn" src="<%=request.getContextPath()%>/resources/image/static/present/exhibition_pic.png" alt="">
		</c:if>
		<!--项目列表-->
		<ul class="itemList">
			
			<!--新手项目-->
		 	<c:if test="${result.data.indexData.isNewPeople}">
				<c:forEach items="${result.data.indexData.rookieLoan}" var="rookieLoan" varStatus="status">
		 		<li class="whiteBack" >
		 		<a href="${basePath}/loan/rookie.do?loanId=${rookieLoan.loanid}&flag=0">
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
				                   <span class="fl"><fmt:formatNumber value="${rookieLoan.borrowerInterest }" type="number" pattern="${aunualInterestRateExp}"></fmt:formatNumber>%</span><span class="fl"><small>+</small><fmt:formatNumber value="${rookieLoan.platAddInterest }" type="number" pattern="${aunualInterestRateExp}"></fmt:formatNumber>%</span>
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
			<!--直投项目-->
			
			<% int a = 1; %>
			<c:if test="${result.data.loanList.size() > 0}">
			 	<c:forEach items="${result.data.loanList}" var="loan" varStatus="status">
			 		
			 		
			 		<%if (a<4){ %>
			 		 <c:if test="${loan.isRookie!= 1}">
			 		 	<% a++; %>
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
											<c:if test="${loan.platAddInterest > 0}" >
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
			 		
			 		<% } %>
				</c:forEach>
			 </c:if>
		</ul>
	
		<!--底部导航-->
		<footer>
			<ul class="nav whiteBack clearfix">
				<li class="fl">
					<a href="<%=request.getContextPath()%>/index.do" class="act">
						<p class="iconBack indexIcon"></p>
						<p>主页</p>
					</a>
				</li>
				<li class="fl">
					<a href="<%=request.getContextPath()%>/loan/list.do">
						<p class="iconBack investIcon"></p>
						<p>投资</p>
					</a>
				</li>
				<li class="fl">
					<a href="<%=request.getContextPath()%>/myAccount/myAccountInfo.session">
						<p class="iconBack accountIcon"></p>
						<p>我的账户</p>
					</a>
				</li>
			</ul>
		</footer>
	</div>
<script>
	$(function(){

		 var mySwiper = new Swiper ('.swiper-container', {
		    direction: 'horizontal',
		    autoplay : 2000,
		    autoplayDisableOnInteraction : false,
		    loop: true,
		    pagination: '.swiper-pagination',
		    paginationClickable: true
		  });
//		 点击新手图片
		$(".exhibition_btn").on("click",function(){
            var _host = '<%=request.getContextPath()%>' , encodeUrl = encodeURIComponent(window.location.href);
            window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
		});
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
