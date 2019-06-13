<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>我要投资 - 中再融</title>
    <meta name="keywords" content="">
    <meta name="description" content=""> 
    <%@ include file="/views/inc/inc.jsp"%>
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/items.css">
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>

<div id="content_height">
<div class="tz_content">
	<div class='tz_box'>
		<div class="tz_sum">
			<div class="tz_ye">账户余额：<span class="c_blue">${result.data.detailMap.user.cash}</span>元</div>
			<a class="cz_btn" href="${basePath}/recharge/index.session">去充值</a>
		</div>
		<div class="tz_fe">可投份额：<span class="c_blue">
			<c:if test="${result.data.detailMap.loan.repayType == 1}">1</c:if>
			<c:if test="${result.data.detailMap.loan.repayType != 1}">
			<fmt:formatNumber pattern="#,##0" type="currency"
                  value="${(result.data.detailMap.creditRightsInfo.transAmount - result.data.detailMap.creditRightsInfo.finishTransAmount)/result.data.detailMap.creditRightsInfo.minInvestUnit}" />
			</c:if>
		</span><span class="c_blue">份</span></div>
	</div>

	<div class="tz_fs">
		<div class="txt_box fl">
			<c:if test="${result.data.detailMap.loan.repayType == 1}">
			<input type='text' id="buyCount" style="outline:none; text-align:right; width:100%;" disabled="disabled" value="1">
			</c:if>
			<c:if test="${result.data.detailMap.loan.repayType != 1}">
			<input type='text' id="buyCount" style="outline:none; text-align:right; width:100%;" value="<fmt:formatNumber pattern='###0' value='${(result.data.detailMap.creditRightsInfo.transAmount- result.data.detailMap.creditRightsInfo.finishTransAmount)/result.data.detailMap.creditRightsInfo.minInvestUnit}'/>">
			</c:if>
		</div>
		<span class="f13 fr mr10">份</span>
	</div>
	
	<div class="mt10 f12" style="display:none" id="profit"></div>
	<div class="tz_error" id="errorTip"></div>
	
	<a href="javascript:;" class="zrtz_btn" onclick="invest();">立即投资</a>
</div>
<div class="xy_ok"><input type="checkbox" id="agreement" checked="checked"><a href="${basePath}/views/agreement/serve_agreement.jsp">我同意并接受《中再融投资咨询与管理服务电子协议》</a></div>
<div id="investForm"></div>
</div>
<%@ include file="/views/inc/footer.jsp"%>
<script type="text/javascript">
//还款方式
var repayType='${result.data.detailMap.loan.repayType}';
//年化利率
var aunualInterestRate= '${result.data.detailMap.loan.aunualInterestRate}'*1;

//转让份额
var curDebtAmount=parseInt('${result.data.detailMap.creditRightsInfo.transAmount/result.data.detailMap.creditRightsInfo.minInvestUnit }');

//剩余份额
var curDebtnuber=parseInt('${(result.data.detailMap.creditRightsInfo.transAmount-result.data.detailMap.creditRightsInfo.finishTransAmount)/result.data.detailMap.creditRightsInfo.minInvestUnit}');
//计算
var comCount='${result.data.detailMap.creditRightsInfo.comCount}';
//收益
var toBeIncome=${result.data.detailMap.creditRightsInfo.toBeIncome};
//转让总价格
var preTransAmount=${result.data.detailMap.creditRightsInfo.preTransAmount}
//转让本金
var transAmount=${result.data.detailMap.creditRightsInfo.transAmount};

$(function(){
	investCheck();
	var isAutoSubmit = '${isAutoSubmit}';
	if(isAutoSubmit == 'true'){
		$("body").html("");
		$("body").html('<div id="investForm"></div>');
		var investAmount = '${pnrInvestAmount}';
		$.ajax({
			type: 'POST',
			url: environment.basePath + "/debtInvest.session",
			data: {"loanId":'${result.data.detailMap.loan.loanId}',"investAmount":investAmount,"debtApplyId":'${pnrLoanId}',"transferUserId":"${result.data.detailMap.creditRightsInfo.transUserID}"},
			beforeSend: function(){},
			success: function(json) {
				if(json.code < 0){
					dilog("提醒",json.msg,false);
					return;
				}else{
					var investForm = json.data.postForm;
					$('#investForm').html(investForm);
					var form = $('#postPnrForm');
					form.submit();
				}
			},
			complete:function(){}
		});
	}
})

$("#buyCount").on('blur',investCheck);
function investCheck(){
	var profit = $("#profit");
	var errorTip = $("#errorTip");
	profit.hide();
	errorTip.hide();
	var perInNum = (getAllMakeMoney(10*curDebtAmount,aunualInterestRate,comCount,repayType)).toFixed(2);
	var preInAmount=mySubString((10*preTransAmount/transAmount));
	var myinvest=$("#buyCount").val()
	var myinone=(getAllMakeMoney(1*10,aunualInterestRate,comCount,repayType)).toFixed(2);
	if(myinvest==null || myinvest==""|| myinvest=="undefined")
	 {
		errorTip.html("请输入1至"+curDebtnuber+"的之间的整数");
		errorTip.show();
		return false;
	}

	var reg = /^\d+$/;
	if(!reg.test(myinvest)) {
		errorTip.html("请输入1至"+curDebtnuber+"的之间的整数");
		errorTip.show();
		return false;
	}

	if(myinvest>curDebtnuber)
	{
		errorTip.html("最多可购买"+curDebtnuber+"份");
		errorTip.show();
		return false;
	}else if(myinvest<=0){
		errorTip.html("最少需购买1份");
		errorTip.show();
		return false;
	}
	if(repayType == 1){
		profit.html('需投资：<span class="c_js f12">'+numberLocalString(preTransAmount)[0]+'元</span>，到期收益：<span class="c_js f12">'+numberLocalString(toBeIncome)[0]+'</span><span class="c_red f12">元</span>');
		profit.show();
	}else{
		if(myinvest!="" && myinvest!=null)
		{
			var myInAmount=mySubString((10*myinvest*preTransAmount/transAmount));
			var myin=(getAllMakeMoney(myinvest*10,aunualInterestRate,comCount,repayType)).toFixed(2);
		  	profit.html('需投资：<span class="c_js f12">'+numberLocalString(myInAmount)[0]+'元</span>，到期收益：<span class="c_js f12">'+numberLocalString(myin)[0]+'</span><span class="c_red f12">元</span>');
			profit.show();
		}
		else
		{
			profit.html('购买：<span class="c_js f12">'+numberLocalString(preInAmount)[0]+'元</span>，可获得收益：<span class="c_js f12">'+perInNum+'</span><span class="c_red f12">元</span>');
			profit.show();
		}
	}
	
	return true;
}

function getAllMakeMoney(amount, rate, nMonth,type) {
	//按月
     if(type=="5")
	{
    	 var rate_month = rate/1200.0;
		return rate_month*amount*nMonth-preTransAmount*amount/transAmount+amount;
	}
	else if(type=="10" || type=="15")
	{
		return amount*(rate/100)*nMonth/365-preTransAmount*amount/transAmount+amount;
	}else if(type = "1"){
		return toBeIncome;
	}
}

function invest(){
	if(!investCheck()){return;}
	var agreement = $("#agreement").attr("checked");
	if(agreement!='checked'){
		$("#profit").hide();
		$('#errorTip').html("请同意《中再融投资咨询与管理服务电子协议》");
		$('#errorTip').show();
		return;
	}

	var user = '${result.data.detailMap.user}';
	if(user == null || user == ''){
		$("#profit").hide();
		$("#errorTip").html("您尚未登录，请先登录后重试");
		$("#errorTip").show();
		return;
	}

	var pnrUserCustId = '${result.data.detailMap.user.pnrUserCustId}';
	var buyCount = $('#buyCount').val();
	//转让本金
	var transAmount=Number('${result.data.detailMap.creditRightsInfo.transAmount}');
	//投资金额
	var investAmount = 0;
	var rechargeAmount = 0;
	if(Number(repayType) == 1){
		investAmount = transAmount;
		rechargeAmount = preTransAmount;
	}else{
		investAmount = Number('${result.data.detailMap.loan.minInvestUnit}')*buyCount;
		rechargeAmount = mySubString(Number('${result.data.detailMap.loan.minInvestUnit}')*buyCount*preTransAmount/transAmount);
	}
	if(pnrUserCustId == null || pnrUserCustId == ''){
		//未开户
		window.location.href = "${basePath}/recharge/openAccount.session?channel=4&pnrLoanId="+'${result.data.detailMap.creditRightsInfo.ID}&pnrInvestAmount='+investAmount+'&pnrRechargeAmount='+rechargeAmount;
		return;
	}

	var cash = Number('${result.data.detailMap.user.cash}');
	if(cash < rechargeAmount){
		var title="充值提醒",content="您的账户余额为："+cash+"元，请先充值";
		dilog(title,content,true);
		return;
	}

	$.ajax({
		type: 'POST',
		url: environment.basePath + "/debtInvest.session",
		data: {"loanId":'${result.data.detailMap.loan.loanId}',"investAmount":investAmount,"debtApplyId":"${result.data.detailMap.creditRightsInfo.ID}","transferUserId":"${result.data.detailMap.creditRightsInfo.transUserID}"},
		beforeSend: function(){},
		success: function(json) {
			if(json.code < 0){
				dilog("提醒",json.msg,false);
				return;
			}else{
				var investForm = json.data.postForm;
				$('#investForm').html(investForm);
				var form = $('#postPnrForm');
				form.submit();
			}
		},
		complete:function(){}
	});
}

function numberLocalString(val){
	val = val.toString();
	var arr = val.split(".");
	arr[0] = parseFloat(arr[0]);
	arr[0] = arr[0].toLocaleString().split(".")[0];
	if(!arr[0])arr[0]="0";
	if(!arr[1])arr[1]="00";
	val = arr.join(".");
	arr.unshift(val);
	return arr;
}

//保留两位，只舍
function mySubString(val_)
{
	var val_=val_+"";
	if(val_.indexOf(".")!=-1){
		return val_.substring(0,val_.indexOf(".")+3)
	}else{return val_;}
}
</script>
</body>
</html>