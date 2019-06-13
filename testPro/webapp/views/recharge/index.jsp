<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>我要充值 - 中再融</title>
    <%@ include file="/views/inc/inc.jsp"%>
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/delta.css">
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
<div id="content_height">
<c:if test="${not empty channel}">
	<div class="registration_nav">
        <c:if test="${channel == 2}">
        
    <div class="left">
        <p class="num_list wd_list">1</p>
        <p>开户</p>
    </div>
    
    <div class="center">
        <p class="num_list wd_list">2</p>
        <p>充值</p>
    </div>
    
    <div class="right"> 
        <p class="num_list">3</p>
        <p>充值成功</p>
    </div>
    <div class="line linebg"></div>
    <div class="line2"></div>
        </c:if>

        <c:if test="${channel == 3 || channel == 4}">
        
     <div class="left">
        <p class="num_list wd_list">1</p>
        <p>开户</p>
    </div>
    
    <div class="center">
        <p class="num_list wd_list">2</p>
        <p>充值</p>
    </div>
    
    <div class="right"> 
        <p class="num_list">3</p>
        <p>成功投资</p>
    </div>
    <div class="line linebg"></div>
    <div class="line2"></div>
        </c:if>
	</div>
	</c:if>
	
	<div class="delta_content">
		<div class="delta">  
	        <h2 class="del_title">充值金额(元)：</h2>
	        <div class="money_num">
	        	<c:if test="${not empty pnrRechargeAmount && isAutoRecharge}">
	        	<input type="text" placeholder="请输入充值金额" id="money_num" value="${pnrRechargeAmount}" disabled="disabled">
	        	</c:if>
	        	<c:if test="${empty pnrRechargeAmount || empty isAutoRecharge}">
	        	<input type="text" placeholder="请输入充值金额" id="money_num" onkeyup="this.value=this.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3')"  onblur="this.value=this.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3')">
	        	</c:if>
	        </div>
		<div id="money_wrong" class="money_wrong"></div>
	     <c:if test="${not empty result.data.bankCardMap.bankCardType && result.data.bankCardMap.bankCardType > 0}">
	        <div id="money_wrong" class="money_wrong"></div>
	        <div class="ka_user">
	            <span>持卡人:</span>
	            <div id="ka_user">${result.data.user.realName}</div>
	        </div>
	        <div class="bank_ka">
	            <span>银行卡:</span>
	            <div id="bank_num">${result.data.bankCardMap.qpMap.name}（${result.data.bankCardMap.qPBankCard }）</div>
	        </div>
	        <div class="delta_ts">单笔限额：${result.data.bankCardMap.qpMap.oneAmount}元，日累积限额：${result.data.bankCardMap.qpMap.maxAmount}元</div>
	    </c:if>

	    <c:if test="${empty result.data.bankCardMap.bankCardType || result.data.bankCardMap.bankCardType eq 0 }">
	    <div class="bank_select">
            <div class="select_title">
                <div class="t_left fl w90" id="selected">
                    <!-- <div class="bank_icon"><img src="http://www.yinker.com/images/user/ICBC.png"></div>
                    <span class="bank_name">工商银行</span>
                    <span class="bank_js">5万元/笔，5万元/日</span>
                    <input type="hidden" value="ICBC" id="bankCode"> -->
                    <div class="bank_icon"><img src="${result.data.bankCardMap.bankInfos.banks[0].img}"></div>
                    <span class="bank_name">${result.data.bankCardMap.bankInfos.banks[0].name}</span>
                    <span class="bank_js">${result.data.bankCardMap.bankInfos.banks[0].oneAmount}元/笔，${result.data.bankCardMap.bankInfos.banks[0].maxAmount}元/日</span>
                    <input type="hidden" value="${result.data.bankCardMap.bankInfos.banks[0].code}" id="bankCode">
                </div>
                <div class="t_right" id="select_icon">
                    <a href="javascript:;"><img src="${basePath}/resources/image/select_btn.png"></a>
                </div>
            </div>
            <div class="select_list" id="select_list">
                <ul>



                	<c:forEach items="${result.data.bankCardMap.bankInfos.banks}" var="bank">
                	<%-- <c:if test="${bank.code != 'ICBC'}">
                	<li>
                        <div class="bank_icon"><img src="${bank.img}"></div>
                        <span class="bank_name">${bank.name}</span>
                        <span class="bank_js">${bank.oneAmount}元/笔，${bank.maxAmount}元/日</span>
                        <input type="hidden" value="${bank.code}" id="bankCode">
                    </li>
                	</c:if> --%>
                	<li>
                        <div class="bank_icon"><img src="${bank.img}"></div>
                        <span class="bank_name">${bank.name}</span>
                        <span class="bank_js">${bank.oneAmount}元/笔，${bank.maxAmount}元/日</span>
                        <input type="hidden" value="${bank.code}" id="bankCode">
                    </li>
                	</c:forEach>
					
                </ul>
            </div>
		</div>
        <div class="delta_ts">充值卡与提现卡为同一张卡，绑定后不可修改</div>
    	</c:if>

	     <div class="delta_btn" id="delta_ok">确认充值</div>
	     <div class="delta_gz"><a href="javascript:;">查看充值规则</a></div>	    
	</div>
 </div>
	<div class="mark_box"></div>
	<div class="Delta_box">
		<div class="Delta_con">
		    <h2>充值提示</h2>
		    <p>1.中再融充值过程免费，无任何手续费</p>
		    <p>2.为保证您的资金安全，资金账户由汇付天下进行第三方托管。</p>
		    <p>3.只能绑定一张银行卡作为快捷卡，且只可以提现到该快捷卡，一经绑定，其余银行卡自动解绑。</p>
		    <p>4.为了您的资金安全，更换快捷卡需人工审核，请选择常用的银行卡为快捷卡。</p>
		    <p>5.当日通过快捷支付或网银充值金额，若有提现需求，须在充值后的第二天发起提现申请，单日限额为1万元。</p>
		    <p>6.快捷支付服务由汇付天下支付提供。</p>
	    </div>
	    <div class="Delta_btn bg1" id="iknow">
	        <a href="javascript:;">我知道了</a>
	    </div>
	</div>
	<div id="recharge"></div>
</div>
	<%@ include file="/views/inc/footer.jsp"%>
<script src="${basePath}/resources/js/delta.js"></script>
<script type="text/javascript">

$('#iknow').click(function(){	
	if($(this).parents('.Delta_box').attr('btn')=='btn'){
		recharge();
	}
});

function recharge(){
	var bankType = Number('${result.data.bankCardMap.bankCardType}');
	var bankId = 0;
	if(bankType == 0){
		 bankId = $("#selected").children("#bankCode").val();
	}else{
		bankId = '${result.data.bankCardMap.qpMap.code}';
	}
	/* if(bankId == 'ICBC'){
		dilog("提醒","非常抱歉，由于第三方汇付平台与工商银行的接口正在技术调整，暂时无法使用，请选择其它银行或网银方式进行充值，感谢您的理解和支持。",false);
		return;
	} */
	var amount = $("#money_num").val();
	if(amount < 0){
		dilog("提醒","充值金额不能小于0",false);
		return;
	}
	var channel = "${channel}";
	var loanId = "${loanId}";
	//校验金额
	$.ajax({
		type: 'POST',
		url: environment.basePath + "/recharge/doRecharge.session",
		data: {"userId":'${result.data.user.userId}',"amount":amount,
		"bankType":0,"bankId":bankId,"channel":channel,"loanId":loanId},
		beforeSend: function(){},
		success: function(json) {
			if(json.code < 0){
				dilog("提醒",json.msg,false);
				return;
			}else{
				var rechargeForm = json.data.rechargeForm;
				$('#recharge').html(rechargeForm);
				var form = $('#postPnrForm');
				form.submit();
			}
		},
		complete:function(){}
	});
}
</script>
</body>
</html>