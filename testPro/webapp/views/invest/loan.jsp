<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>我要投资 - 中再融</title>
<meta name="keywords" content="">
<meta name="description" content="">
<%@ include file="/views/inc/inc.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${basePath}/resources/css/items.css">
<link type="text/css" rel="stylesheet"
	href="${basePath}/resources/css/details.css">
<link type="text/css" rel="stylesheet"
	href="${basePath}/resources/css/ykb.css">
</head>
<body>
	<%@ include file="/views/inc/header.jsp"%>
	<c:if
		test="${not empty result.data.detailMap.rookie && result.data.detailMap.rookie eq 1}">
		<div class="newtip">新手专享项目，仅限未投资过的新用户投资，每人限投一次，上限10000元。</div><%--标记--%>
	</c:if>
	<div id="content_height">
		<c:if test="${result.data.detailMap.loan.loanProductID == 7}">
			<div class='ykbb_header'>
				<span href="javascript:;">${result.data.detailMap.loan.title}</span>
			</div>
		</c:if>
		<!-- 新加 -->
		<div class="xq_list">
			<ul>
				<li style="width: 33%">
					<p class="f13 c_red">${result.data.ykbMap.loan.aunualInterestRate}%</p>
					<p class='f12 c_h'>年化收益率</p>
				</li>

				<li style="width: 33%" class='border_li'>
					<p class="f13">
						<c:if test="${not empty result.data.ykbMap.qfqDays}">${result.data.ykbMap.qfqDays}天</c:if>
						<c:if test="${empty result.data.ykbMap.qfqDays}">
							<c:if test="${result.data.ykbMap.loan.termUnit==1 }">${result.data.ykbMap.loan.termCount }天</c:if>
							<c:if test="${result.data.ykbMap.loan.termUnit!=1 }">${result.data.ykbMap.loan.termCount }月</c:if>
						</c:if>
					</p>
					<p class='f12 c_h'>计划期限</p>
				</li>

				<li style="width: 33%" class='border_li'>
					<p class='f13'>
						<fmt:formatNumber pattern="#,##0.00#" type="currency"
							value="${result.data.ykbMap.loan.amount}" />
					</p>
					<p class='f12 c_h'>本期规模(元)</p>
				</li>
			</ul>
		</div>

		<div class="xq_content">
			<div class='xqc_title'>
				计划介绍<span class="showup"><span>收起</span> <i></i>
			</div>
			<div class="code_more">
				<p>
					<span class="xqct_title">还款方式</span>
					<c:choose>
						<c:when test="${result.data.detailMap.loan.repayType eq 1}">
							<span>等额本息</span>
						</c:when>
						<c:when test="${result.data.detailMap.loan.repayType eq 5}">
							<span>按月计息，到期还本</span>
						</c:when>
						<c:when test="${result.data.detailMap.loan.repayType eq 10}">
							<span>先息后本</span>
						</c:when>
						<c:when test="${result.data.detailMap.loan.repayType eq 15}">
							<span>一次性还本付息</span>
						</c:when>
						<c:otherwise>
							<span>先息后本</span>
						</c:otherwise>
					</c:choose>
				</p>
				<p>
					<span class="xqct_title">保障方式</span> <span> 长城计划
					<%--<c:if
							test="${result.data.ykbMap.loan.companyid==49}">
							100%适用${result.data.ykbMap.companyName }
							</c:if> <c:if test="${result.data.ykbMap.loan.companyid!=49}">
								由${result.data.ykbMap.companyName }提供<c:if
								test="${fn:length(result.data.ykbMap.loan.securityMode)> 12}">${fn:substring(result.data.ykbMap.loan.securityMode, 0, 10)}...</c:if>
							<c:if
								test="${fn:length(result.data.ykbMap.loan.securityMode)<= 12}">${result.data.ykbMap.loan.securityMode}</c:if>
						</c:if>--%>
					</span>
				</p>
				<p>
					<span class="xqct_title">收益期间</span> <span><fmt:formatDate
							value="${result.data.ykbMap.loan.releaseTime }"
							pattern="yyyy年MM月dd日" />-<fmt:formatDate
							value="${result.data.ykbMap.loan.endTime }" pattern="yyyy年MM月dd日" /></span>
				</p>
				<p>
					<span class="xqct_title">加入条件</span>
					<c:choose>
						<c:when
							test="${not empty result.data.detailMap.rookie && result.data.detailMap.rookie eq 1}">
							<span >每人限投一次，上限10000元</span> <%--标记--%>
						</c:when>
						<c:otherwise>
							<span>50元起投</span>
						</c:otherwise>
					</c:choose>
				</p>
				<p class="footer_people" style="margin-bottom: 10px">
					加入人次<span>${result.data.ykbMap.investCount}</span>
				</p>
			</div>
		</div>

		<div class="tz_content">
			<div class='tz_box'>
				<div class="tz_sum">
					<c:if test="${!empty result.data.detailMap.user }">
						<div class="tz_ye">
							账户余额：<span class="c_blue">${result.data.detailMap.user.cash}</span>元
						</div>
						<a class="cz_btn" href="${basePath}/recharge/index.session">去充值</a>
					</c:if>
				</div>
				<div class="tz_fe">
					项目进度：<span class="c_blue">${result.data.ykbMap.prjLoad }%</span>
				</div>
				<div class="tz_fe">
					<%--新增新手投资上限10000最低1000--%>
					<c:if test="${not empty result.data.detailMap.rookie && result.data.detailMap.rookie eq 1}">
						可投金额：<span class="c_blue"><fmt:formatNumber
							pattern="#,##0.00#" type="currency"
							value="${(result.data.detailMap.loan.amount - result.data.detailMap.loan.biddingAmount)>=10000?10000:(result.data.detailMap.loan.amount - result.data.detailMap.loan.biddingAmount)-(result.data.detailMap.loan.amount - result.data.detailMap.loan.biddingAmount)%1000}" /></span><span
						class="">元</span>
					</c:if>
					<c:if test="${not empty result.data.detailMap.rookie && result.data.detailMap.rookie eq 0}">
						可投金额：<span class="c_blue"><fmt:formatNumber
							pattern="#,##0.00#" type="currency"
							value="${result.data.detailMap.loan.amount - result.data.detailMap.loan.biddingAmount}" /></span><span
						class="">元</span>
					</c:if>
				</div>
			</div>

			<div class="tz_fs">
				<!-- <span class="fl" style="font-size:13px; margin-left:5px; color:#b5b5b5">请输入投资金额</span> -->
				<%-- 去除银客宝		<c:if test="${result.data.detailMap.loan.loanProductID == 7}">
		<div class="txt_box fl"><input type='text' id="investAmount" placeholder="最少1000，最多100000" 
		<c:if test="${result.data.detailMap.loan.status!=300}">disabled="disabled"</c:if>
		style="outline:none; text-align:right; width:100%;"></div>
		</c:if>
		<c:if test="${result.data.detailMap.loan.loanProductID != 7 && result.data.detailMap.rookie == 1}">
		<div class="txt_box fl"><input type='text' id="investAmount" value="2000" disabled="disabled" style="outline:none; text-align:right; width:100%;"></div>
		</c:if>
		<c:if test="${result.data.detailMap.loan.loanProductID != 7 && result.data.detailMap.rookie != 1}">
		<div class="txt_box fl"><input type='text' id="investAmount" <c:if test="${result.data.detailMap.loan.status!=300}">disabled="disabled"</c:if>
		 style="outline:none; text-align:right; width:100%;"></div>
		</c:if> --%>


			
				<c:if test="${result.data.detailMap.rookie == 1}">
					<div class="txt_box fl">
						<input type='text' id="investAmount" 
							style="outline: none; text-align: right; width: 100%;">
					</div>
				</c:if>
				<c:if test="${result.data.detailMap.rookie != 1}">
					<div class="txt_box fl">
						<input type='text' id="investAmount"
							<c:if test="${result.data.detailMap.loan.status!=300}">disabled="disabled"</c:if>
							style="outline: none; text-align: right; width: 100%;">
					</div>
				</c:if>

				<span class="f13 fr mr10">元</span>
			</div>
			<!-- 用户可使用红包 -->
				<c:if test="${result.data.usableRedPackageListSize > 0 }">
					<div class="input" id="myInvestSpan2">
						<select id="usableRedPackage" class="usableRedPackage">
							<option value="0">选择红包</option>
						<c:forEach items="${result.data.usableRedPackageList}"
							var="usableRedPackageList" varStatus="star">
							<c:if test="${usableRedPackageList.packageType=='3' && result.data.detailMap.rookie != 1}">
								<option style="color:#000;" value="${usableRedPackageList.id}"
									class="${usableRedPackageList.needInvestMoney}"
									data-packagetype="${usableRedPackageList.packageType }"
									data-maxneed="${usableRedPackageList.needInvestmMaxMoney}"
									data-lixi="${usableRedPackageList.packageMoney}"
									data-prodate="${usableRedPackageList.interestDate}">
									加息${usableRedPackageList.packageMoney}%,
									<c:if test="${usableRedPackageList.needInvestMoney != null}">投资满${usableRedPackageList.needInvestMoney}元可用,</c:if>
									<c:if
										test="${usableRedPackageList.needInvestmMaxMoney != null}">最高加息${usableRedPackageList.needInvestmMaxMoney}元,</c:if>
									<c:if test="${usableRedPackageList.interestDate != null}">加息${usableRedPackageList.interestDate}天,</c:if>
									${usableRedPackageList.endTime}&nbsp;到期
								</option>
							</c:if>
							<c:if test="${usableRedPackageList.packageType!='3'}">
								<option style="color:#000;" value="${usableRedPackageList.id}"
									class="${usableRedPackageList.needInvestMoney}">${usableRedPackageList.packageName}&nbsp;&nbsp;${usableRedPackageList.endTime}&nbsp;到期</option>
							</c:if>
						</c:forEach>

					</select>
					</div>
				</c:if>
<script type="text/javascript">
var jxMinmoney=jxMaxmoney=jxLixi=jxProdate=0;
/* 	function selRedPackage() {//8.09改
		var myinvestValue = $("#investAmount").val();
		$("#investAmount").css("color", "#f87e2d");

		var str = "";
		if (parseInt(myinvestValue) >= 50) {

			$("#usableRedPackage option").each(
				function() {
					var optionClassIsRedPackageMoney = $(this).attr('class');
					str = optionClassIsRedPackageMoney ? optionClassIsRedPackageMoney: "";
					if(optionClassIsRedPackageMoney==''){
						optionClassIsRedPackageMoney=0;
					}
					if (myinvestValue.length >= str.length&& parseInt(myinvestValue) >= parseInt(optionClassIsRedPackageMoney)) {
						$(this).attr("selected","selected");
						jxMinmoney=parseInt($(this)[0].className);
						jxMaxmoney=parseInt($(this).data('maxneed'));
						jxLixi=parseFloat($(this).data('lixi'));
						jxProdate=parseInt($(this).data('prodate'));
						return false;
					} else {
						$("#usableRedPackage option:first").prop("selected",'selected');
						jxMinmoney=jxMaxmoney=jxLixi=jxProdate=0;
					}

				});
		}
	} */
	 function changeRed(){//8.09改
  	  var campaignsID = $("#usableRedPackage").val();
  	  if(campaignsID == null ||campaignsID == ''||campaignsID == '0'){
  		$("#usableRedPackage").css('color','#e2482c');
  	  }else{
  		$("#usableRedPackage").css('color','#000');
  	  }
    }
	$("#usableRedPackage").change(function(){
		changeRed();
		$(this).children("option").each(function(){
			if($(this).attr("selected")=="selected"){
				jxMinmoney=parseInt($(this)[0].className);
				jxMaxmoney=parseInt($(this).data('maxneed'));
				jxLixi=parseFloat($(this).data('lixi'));
				jxProdate=parseInt($(this).data('prodate'));
				return false;
			}
		})
		investCheck();
		
	})
</script>
			<div class="mt10 f12" style="display: none" id="profitTip">
				到期收益：<span class="c_js f12"></span><span class="c_red f12">元</span>
			</div>
			<div class="tz_error" style="display: none" id="errorTip"></div>

			<c:if test="${result.data.detailMap.loan.status == 300}">
				<a href="javascript:;" class="zrtz_btn" onclick="invest();">立即投资</a>
			</c:if>

			<c:if
				test="${result.data.detailMap.loan.status == 200 || result.data.detailMap.loan.status == 100}">
				<a href="javascript:;" class="zrtz_btn yg_btn"> <span
					class="btn_icon">&nbsp;</span> <span><fmt:formatDate
							pattern="MM月dd日 HH:mm"
							value="${result.data.detailMap.loan.onlineTime}"></fmt:formatDate>
						开始</span>
				</a>
			</c:if>
			<c:if test="${result.data.detailMap.loan.status >= 400}">
				<a href="javascript:;" class="zrtz_btn over_btn">已抢购完毕</a>
			</c:if>

		</div>
		<div class="xy_ok">
			<input style="position: relative;top:2px;" type="checkbox" id="agreement" checked="checked">我同意并接受<a
				href="${basePath}/views/agreement/serve_agreement.jsp" style="text-decoration: underline;">《中再融投资咨询与管理服务电子协议》</a>和<a
				href="${basePath}/agreementFbact.do
" style="text-decoration: underline;">《网络借贷风险和禁止性行为提示书》</a>
		</div>
		<c:if test="${!empty result.data.detailMap.user }">
			<%-- <a href="javascript:;" class="yh_btn ohz" id="yh_btn">
				<p class="left_icon">
					<img src="${basePath}/resources/image/xj_left_icon.jpg" />
				</p>
				<p class="yh_content" id="coupon">不使用红包</p>
				<p class="right_icon">
					<img src="${basePath}/resources/image/xj_right_icon.jpg" />
				</p>
			</a> --%>
		</c:if>
		<!-- 新加了解更多 -->
		<div class='ykbo_header ykb_more'
			style="margin-top: 15px; display: none;"
			url="https://www.zhongzairong.cn/openServicenew/view/page/ykb.html">
			<a href="javascript:;">了解更多</a>
		</div>

		<div class='mark_box'></div>
		<div class='Delta_box'
			style="overflow: auto;; top: 0px; padding: 10px; border: 1px solid #919191">
			<div class="closed_btn" id='closed_btn'>
				<img src="${basePath}/resources/image/closed_icon.png">
			</div>
			<div id="hb_list"></div>
		</div>

		<div id="investForm"></div>
	</div>
	<%@ include file="/views/inc/footer.jsp"%>
	<script type="text/javascript">
		/* 计划介绍 */
		$(".showup").click(
				function() {
					$(".showup span").text(
							$(".code_more").is(":hidden") ? "收起" : "展开");
					$(".code_more").slideToggle();
					$(".showup i").toggleClass("showdown");
				});

		//期数
		var termCount = parseInt('${result.data.detailMap.loan.termCount }');
		//还款方式
		var repayType = '${result.data.detailMap.loan.repayType}';
		//年化利率
		var aunualInterestRate = '${result.data.detailMap.loan.aunualInterestRate}' * 1;
		//项目总金额
		var amount = parseFloat('${result.data.detailMap.loan.amount }');

		var loanProductID = '${result.data.detailMap.loan.loanProductID}';

		var rookie = '${result.data.detailMap.rookie}';
		var maxloan = parseInt(
				"<fmt:formatNumber value="${result.data.detailMap.loan.amount-result.data.detailMap.loan.biddingAmount}" pattern="#"/>",
				10);
        //		新增判断当为新手时可投金额为可投金额1000的最小整数倍
        if(rookie==1){//新手
            maxloan=parseInt(
                "<fmt:formatNumber value="${result.data.detailMap.loan.amount-result.data.detailMap.loan.biddingAmount>=10000?10000:(result.data.detailMap.loan.amount-result.data.detailMap.loan.biddingAmount)-(result.data.detailMap.loan.amount-result.data.detailMap.loan.biddingAmount)%1000}" pattern="#"/>",
                10);
        }
		var availableloan = maxloan; //////去除银客宝限制  100000-"${result.data.detailMap.thisUserLoanInvestedAmount}"-maxloan<0 ? 100000-"${result.data.detailMap.thisUserLoanInvestedAmount}" : maxloan;

		var user = '${result.data.detailMap.user}';

		var per10000In = mySubString(getAllMakeMoney(10000, aunualInterestRate,
				termCount, repayType));

		var isNovice = '${result.data.detailMap.isNovice}';

		$(function() {
			$('#investAmount').keyup(function() { // 键盘事件
				//selRedPackage();
				investCheck();
				$('.yh_content').html('不使用红包').attr('list_id', '');
				
			});

			$('.ykb_more').click(function() {
				var url = $(this).attr('url');
				window.location = url;
			});

			investCheck();
			getCampaigns();
			var isAutoSubmit = '${isAutoSubmit}';
			if (isAutoSubmit == 'true') {
				$("body").html("");
				$("body").html('<div id="investForm"></div>');
				var loanId = '${pnrLoanId}';
				var investAmount = '${pnrInvestAmount}';
				var campaignsID = '${pnrCouponId}';
				$.ajax({
					type : 'POST',
					url : environment.basePath + "/invest.session",
					data : {
						"loanId" : loanId,
						"investAmount" : investAmount,
						"campaignsID" : campaignsID
					},
					beforeSend : function() {
					},
					success : function(json) {
						if (json.code < 0) {
							dilog("提醒", json.msg, false);
							return;
						} else {
							var investForm = json.data.postForm;
							$('#investForm').html(investForm);
							var form = $('#postPnrForm');
							form.submit();
						}
					},
					complete : function() {
					}
				});
			}
		});

		// $("#investAmount").live('blur',investCheck);
		//新手项目、银客宝、优选项目区分
		function investCheck() {
			var profitTip = $("#profitTip");
			var errorTip = $("#errorTip");
			profitTip.hide();
			errorTip.hide();
			var myinvest = $("#investAmount").val(), myin = mySubString(getAllMakeMoney(
					myinvest, aunualInterestRate, termCount, repayType));
			var jxdate,jxmoney,jxshow,jxnum;
			if(isNaN(jxMinmoney)||jxMinmoney==''||jxMinmoney==null){jxMinmoney=0};
			 if (myinvest>=jxMinmoney) {//1最小金额是否满足
			 	if (!isNaN(jxProdate)&&jxProdate!=''&&jxProdate!=null) {//2加息天数为空
			 		if (jxProdate>=termCount) {
			 			jxdate=termCount;//全项目天数
			 		}else{
			 			jxdate=jxProdate;
			 		};
			 	}else{
			 		jxdate=termCount;//全项目天数
			 	};
			 	if (!isNaN(jxMaxmoney)&&jxMaxmoney!=''&&jxMaxmoney!=null) {
			 		if (myinvest>=jxMaxmoney) {
				 		jxmoney=jxMaxmoney;
				 	}else{
				 		jxmoney=myinvest;
				 	};
			 	}else{
			 		jxmoney=myinvest;
			 	};
			 	if (isNaN(jxLixi)||jxLixi==''||jxLixi==null) {
			 		jxLixi=0;
			 	}
			 	jxnum=jxdate*jxmoney*jxLixi/100/365;
			 	jxshow=jxnum.toFixed(2);
			 	if(jxnum==0){
			 		jxshow='';
			 	}else{
		 			jxshow='+'+jxnum.toFixed(2);
			 	}		 	
			 }
			 else{
			 	jxshow='';
	 		};
			
			
 			if (loanProductID == 7) {
				// 银客宝
				if (myinvest) {
					if (!(myinvest % 1000 == 0) || !/^\d+$/.test(myinvest)) {
						errorTip.html("投资金额必须为1000的整数倍");
						errorTip.show();
						return false;
					}
					if (myinvest < 1000) {
						errorTip.html("最少投资1000元");
						errorTip.show();
						return false;
					}
					if (myinvest > availableloan || myinvest > maxloan) {
						errorTip.html("最多可投资" + availableloan + "元");
						errorTip.show();
						return false;
					}
					profitTip.html('投资：<span class="c_js f12">' + myinvest
							+ '</span>元，到期收益：<span class="c_js f12">'
							+ numberLocalString(myin)[0]+jxshow
							+ '</span><span class="c_red f12">元</span>');
					profitTip.show();
					return true;
				} else {
					profitTip.html('到期收益：<span class="c_js f12">0</span><span class="c_red f12">元</span>');
					profitTip.show();
					return false;
				}
			} else {
				if (rookie == 1) {
		/* 			//新手项目
					var per2000In = mySubString(getAllMakeMoney(2000,
							aunualInterestRate, termCount, repayType));
					profitTip.html('到期收益：<span class="c_js f12">'
							+ numberLocalString(per2000In)[0]
							+ '</span><span class="c_red f12">元</span>');
					profitTip.show();
					return true; */
					var per10000In = mySubString(getAllMakeMoney(10000, aunualInterestRate,
							termCount, repayType));//改
					if(myinvest){
//					    最新修改新手项目投资最低1000
						if (myinvest < 1000) {
							errorTip.html("最少投资1000元");
							errorTip.show();
							return false;
						}
						if (!(myinvest % 1000== 0) || !/^\d+$/.test(myinvest)) {
							errorTip.html("投资金额必须为1000的整数倍");
							errorTip.show();
							return false;
						}
						if(maxloan>=10000){
							if(myinvest>10000){
								errorTip.html("新手项目最多可投资10000元");//改了
								errorTip.show();
								return false;
							}
						}else{
							if (myinvest > maxloan) {
								errorTip.html("最多可投资" + availableloan + "元");
								errorTip.show();
								return false;
							}
						}
						
						profitTip.html('投资：<span class="c_js f12">' + myinvest
								+ '</span>元，到期收益：<span class="c_js f12">'
								+ numberLocalString(myin)[0]+jxshow
								+ '</span><span class="c_red f12">元</span>');
						profitTip.show();
						return true;
					}else{
						profitTip.html('投资<span class="c_js f12">10000</span>到期收益：<span class="c_js f12">'//改了
								+ numberLocalString(per10000In)[0]+jxshow
								+ '</span><span class="c_red f12">元</span>');
						profitTip.show();
						return false;
					}
				} else {
					//优选项目
					if (myinvest) {
						if (myinvest < 50) {
							errorTip.html("最少投资50元");
							errorTip.show();
							return false;
						}
						if (!(myinvest % 50 == 0) || !/^\d+$/.test(myinvest)) {
							errorTip.html("投资金额必须为50的整数倍");
							errorTip.show();
							return false;
						}
						if (myinvest > maxloan) {
							errorTip.html("最多可投资" + availableloan + "元");
							errorTip.show();
							return false;
						}
						profitTip.html('投资：<span class="c_js f12">' + myinvest
								+ '</span>元，到期收益：<span class="c_js f12">'
								+ numberLocalString(myin)[0]+jxshow
								+ '</span><span class="c_red f12">元</span>');
						profitTip.show();
						return true;
					} else {
                        var per10000In = mySubString(getAllMakeMoney(10000, aunualInterestRate,
                            termCount, repayType));//改
						profitTip
								.html('投资<span class="c_js f12">10000</span>到期收益：<span class="c_js f12">'
										+ numberLocalString(per10000In)[0]+jxshow
										+ '</span><span class="c_red f12">元</span>');
						profitTip.show();
						return false;
					}
				}
			}
		}

		function invest() {
			if (user == null || user == '') {
				/* $("#profitTip").hide();
				$("#errorTip").html("您尚未登录，请先登录后重试");
				$("#errorTip").show(); */
				window.location.href = "${basePath}/userInfo/nologin.do?refPath="
						+ encodeURIComponent(window.location.href);
				return;
			}
			var myinvest = $("#investAmount").val();
			if (myinvest == "" || typeof (myinvest) == "undefined") {
				$('#errorTip').html("请输入投资金额");
				$('#errorTip').show();
				return;
			}
			var needInvestMoney = $("#usableRedPackage").find("option:selected").attr('class');
			if(parseInt(myinvest)< parseInt(needInvestMoney)){
				$('#errorTip').html("红包不可用");
				$('#errorTip').show();
				return;
			}
			if (!investCheck()) {
				return;
			}
			var agreement = $("#agreement").attr("checked");
			if (agreement != 'checked') {
				$("#profitTip").hide();
				$('#errorTip').html("请同意《中再融投资咨询与管理服务电子协议》");
				$('#errorTip').show();
				return;
			}
			var campaignsID =$("#usableRedPackage").val();
			if (campaignsID == undefined || campaignsID == '' || campaignsID == null) {
				campaignsID = '0';
			}//改7.24
			
			var investAmount = $("#investAmount").val();
			var pnrUserCustId = '${result.data.detailMap.user.pnrUserCustId}';
			if (pnrUserCustId == null || pnrUserCustId == '') {
				//未开户
				window.location.href = "${basePath}/recharge/openAccount.session?channel=3&pnrLoanId="
						+ '${result.data.detailMap.loan.loanId}'
						+ "&pnrInvestAmount="
						+ investAmount
						+ '&pnrRechargeAmount='
						+ investAmount
						+ "&pnrCouponId=" + campaignsID;
				return;
			}
			if (rookie == 1 && isNovice == 'false') {
				$("#profitTip").hide();
				$("#errorTip").html("您已不是新手，不能投资新手项目");
				$("#errorTip").show();
				return;
			}
			var cash = Number('${result.data.detailMap.user.cash}');
			if (cash < investAmount) {
				// $("#profitTip").hide();
				// $("#errorTip").html("账户余额不足，请先充值");
				// $("#errorTip").show();
				// dilog("充值提醒","您的当前余额："+cash+"已不足，请先充值",false);
				var title = "充值提醒", content = "您的账户余额为：" + cash + "元，请先充值";
				dilog(title, content, true);
				return;
			}
			/* if (campaignsID == '' || campaignsID == null) {
				campaignsID = 0;
			} */
			$.ajax({
				type : 'POST',
				url : environment.basePath + "/invest.session",
				data : {
					"loanId" : '${result.data.detailMap.loan.loanId}',
					"investAmount" : $("#investAmount").val(),
					"campaignsID" : campaignsID,
					"isNovice" : isNovice,
					"rookie" : rookie,
					"amount" : amount,
				},
				beforeSend : function() {
				},
				success : function(json) {
					if (json.code < 0) {
						dilog("提醒", json.msg, false);
						return;
					} else {
						var investForm = json.data.postForm;
						$('#investForm').html(investForm);
						var form = $('#postPnrForm');
						form.submit();
					}
				},
				complete : function() {
				}
			});
		}

		function getAllMakeMoney(amount, rate, nMonth, type) {
			var rate_month = rate / 1200.0;
			//等额本息
			if (type == "1") {
				var tmp = Math.pow(1 + rate_month, nMonth);
				var rs = amount * (rate_month * tmp) / (tmp - 1);
				rs = ForDight(rs, 2);
				var i = 0;
				var interestMonth;
				var interestAll = 0;
				var repay;
				var amountLeft = amount;
				for (i = 0; i < nMonth; i++) {
					interestMonth = ForDight(amountLeft * rate_month, 2);
					repay = rs - interestMonth;
					amountLeft = amountLeft - repay;
					interestAll += interestMonth;
				}
				interestAll = ForDight(interestAll, 2);
				return interestAll;
			} else if (type == "5") {
				return rate_month * amount * nMonth;
			} else if (type == "10" || type == "15") {
				return amount * (rate / 100) * nMonth / 365;
			}

		}

		function numberLocalString(val) {
			val = val.toString();
			var arr = val.split(".");
			arr[0] = parseFloat(arr[0]);
			arr[0] = arr[0].toLocaleString().split(".")[0];
			if (!arr[0])
				arr[0] = "0";
			if (!arr[1])
				arr[1] = "00";
			val = arr.join(".");
			arr.unshift(val);
			return arr;
		}

		//保留两位，只舍
		function mySubString(val_) {
			var val_ = val_ + "";
			if (val_.indexOf(".") != -1) {
				return val_.substring(0, val_.indexOf(".") + 3)
			} else {
				return val_;
			}
		}

		function ForDight(dight, n) {
			dight = Math.round(dight * Math.pow(10, n)) / Math.pow(10, n);
			return dight;
		}

		function getCampaigns() {
			var nUseClientScope = 1;
			if (loanProductID == 7) {
				nUseClientScope = 2;
			}
			$.ajax({
				type : 'POST',
				url : environment.basePath + "/invest/getCampaigns.do",
				data : {
					"loanId" : '${result.data.detailMap.loan.loanId}',
					"nUseClientScope" : nUseClientScope
				},
				beforeSend : function() {
				},
				success : function(json) {
					if (json.code < 0) {
						return;
					} else {
						var date = json.data.campaignRecords;
						data_val = date;
						if (!date.length) {
							// $('.yh_content').html('不使用红包');
							$('#yh_btn').hide();
							return false;
						}
						$('#hb_list').html('');
						var val = $('#investAmount').val();
						for (var i = 0; i < date.length; i++) {
							if (date[i].awardType == 3) {
								if (date[i].lowUse <= val) {
									$('#hb_list').prepend(
											create_elem(date[i], true));
								} else {
									$('#hb_list').append(
											create_elem(date[i], false));
								}
							} else {
								if (date[i].reBackAmount <= val) {
									$('#hb_list').prepend(
											create_elem(date[i], true));
								} else {
									$('#hb_list').append(
											create_elem(date[i], false));
								}
							}
						}
						xz();
					}
				},
				complete : function() {
				}
			});
		}

		var data_val = '';
		var bool = true, b_num = true;
		function create_elem(data, bool) {
			var s_html = '';
			if (bool) {
				s_html = '<div class="hb_list" list_id='+data["id"]+'>';
			} else {
				s_html = '<div class="hb_list no_hb" list_id='+data["id"]+'>';
			}
			var time = new Date(data["effectiveDate"]);
			var m = time.getMonth() + 1;
			var timeHtml = time.getFullYear() + '-' + m + '-' + time.getDate();
			var awardType = data["awardType"];
			var end_html = "";
			if (awardType == 3) {
				end_html = '<div class="hb_radio">&nbsp;</div>'
						+ '<div class="hb_c">' + '<p class="hb_title"><span>'
						+ data["rateCoupon"] + '%</span>加息券</p>'
						+ '<p class="m_line">投资满<span>' + data["lowUse"]
						+ '</span>元可用';
				if (data["upperUse"] != null && data["upperUse"] > 0) {
					end_html += '，加息上限<span>' + data["upperUse"] + '</span>元';
				}
				end_html += '</p><p>有效期至：<span>' + timeHtml
						+ '</span></p></div></div>';
			} else {
				end_html = '<div class="hb_radio">&nbsp;</div>'
						+ '<div class="hb_c">' + '<p class="hb_title"><span>'
						+ data["number"] + '</span>元投资返现券</p>'
						+ '<p class="m_line">投资满<span>' + data["reBackAmount"]
						+ '</span>元，返<span>' + data["number"] + '</span>元</p>'
						+ '<p>有效期至：<span>' + timeHtml + '</span></p>'
						+ '</div>' + '</div>';
			}
			return s_html + end_html;
		}
		function end_elem() {
			return '<div class="hb_list"><div class="hb_radio">&nbsp;</div><div class="hb_c">不使用红包</div></div>';
		}

		$('#yh_btn').click(function() {
			couponCheck();
		});
		function couponCheck() {
			if (!investCheck()) {
				return;
			}

			if (!data_val.length) {
				$('.yh_content').html('不使用红包');
				return false;
			}
			$('#yh_btn').live('click', function() {
				mark(false)
			});
			$('#hb_list').html('');
			var val = $('#investAmount').val();
			for (var i = 0; i < data_val.length; i++) {
				var coupon = data_val[i];
				if (coupon.awardType == 3) {
					//加息券
					if (coupon.lowUse <= val) {
						if (b_num) {
							$('#hb_list').append(end_elem());
							b_num = false;
						}
						$('#hb_list').prepend(create_elem(data_val[i], true));
					} else {
						if (b_num) {
							$('#hb_list').append(end_elem());
							b_num = false;
						}
						$('#hb_list').append(create_elem(data_val[i], false));
					}
				} else {
					if (coupon.reBackAmount <= val) {
						if (b_num) {
							$('#hb_list').append(end_elem());
							b_num = false;
						}
						$('#hb_list').prepend(create_elem(data_val[i], true));
					} else {
						if (b_num) {
							$('#hb_list').append(end_elem());
							b_num = false;
						}
						$('#hb_list').append(create_elem(data_val[i], false));
					}
				}
			}
			b_num = true;
			xz();
		}

		function xz() {
			$('#hb_list .hb_list').each(
					function() {

						$(this).live(
								'click',
								function() {
									if ($(this).hasClass('no_hb')) {
										return;
									}
									var i = $(this).index();
									$('#hb_list .hb_radio').each(function() {
										$(this).removeClass('radio_checked');
									})
									$(this).find('.hb_radio').addClass(
											'radio_checked');
									var content_html = $(this)
											.find('.hb_title').html();
									var id = $(this).attr('list_id');
									if (content_html == undefined) {
										$('.yh_content').html('不使用红包').attr(
												'list_id', '');
									} else {
										$('.yh_content').html(content_html)
												.attr('list_id', id);
									}
									$('.Delta_box').hide();
									$('.mark_box').hide();
									b_num = true;
								})
					})
		}
	</script>
</body>
</html>