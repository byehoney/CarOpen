<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>开户 - 中再融</title>
    <%@ include file="/views/inc/inc.jsp"%>
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/login.css">
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/wap_login.css"/>	
    <script>vans_trans = "action&username=${sessionScope.user.nickName}";</script>  
    <script language="javascript" type="text/javascript" src="//dsp.svc.mobivans.com/track/js/44c38924-d3dd-49a7-b94a-a622a415f8d6"></script> 
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
<div id="content_height">
<section class="moblie_validation content">	
<div class="registration_nav">

        <c:if test="${channel == 1}">
        
   <!--  <div class="left">
        <p class="num_list wd_list">1</p>
        <p>注册</p>
    </div>
    
    <div class="center">
        <p class="num_list wd_list">2</p>
        <p>开户</p>
    </div>
    
    <div class="right"> 
        <p class="num_list">3</p>
        <p>成功</p>
    </div>
    <div class="line linebg"></div>
    <div class="line2"></div> -->
        
        </c:if>

        <c:if test="${channel == 2 || channel == 5}">
        
     <div class="left">
        <p class="num_list wd_list">1</p>
        <p>开户</p>
    </div>
    
    <div class="center">
        <p class="num_list">2</p>
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
        <p class="num_list">2</p>
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
<div class="monety_hint" style="display:none;">
    <c:if test="${channel == 1}">
   		 还差一步，开户成功就可以使用红包赚收益啦！
    </c:if>
    <c:if test="${channel == 5 || channel == 2 || channel == 3 || channel == 4}">
   		赶紧去开户，赚钱收益吧。
    </c:if>
</div>


<c:if test="${channel == 1}">
	<div class="clearfix successfully_con"><i class="tick"></i></div>
		<p class="successfully">注册成功</p>
		<div class="money clearfix">
			<i class="activation">您有<span>999元</span>红包到账，开户即可激活</i>
	</div>
</c:if>


<c:if test="${channel == 5 || channel == 2 || channel == 3 || channel == 4}">
	<div class="safe_img">
	    <img src="${basePath}/resources/image/safe_icon.png">
	</div> 
</c:if>

<input type="hidden" name="authenType" id="authenType" value="1"/>
<input type="hidden" name="openUserFlag" id="openUserFlag" value="QOU"/>
<input type="hidden" name="mobile" id="mobile" value="${result.data.user.mobile }"/>
<input type="hidden" name="userId" id="userId" value="${result.data.user.userId }"/>

<div class="safe_ts">
   <%--  <c:if test="${channel == 1 || channel == 2}"> --%>
    <c:if test="${channel == 2 || channel == 5}">
   		  第三方资金托管账户保障资金安全 
    </c:if>
    <c:if test="${channel == 3 || channel == 4}">
    	您第一次中再融投资之旅，由开户开始，<br>第三方账户保证您的资金安全
    </c:if>
</div>

<input type="hidden" name="authenType" id="authenType" value="1"/>
<input type="hidden" name="openUserFlag" id="openUserFlag" value="QOU"/>
<input type="hidden" name="mobile" id="mobile" value="${result.data.user.mobile }"/>
<input type="hidden" name="userId" id="userId" value="${result.data.user.userId }"/>

	<c:if test="${channel == 1}">
		
			<div class="open_btn_box">
			    <div class="next_step open">
			        <a href="javascript:;" onclick="openAccount();">立即开通</a>
			    </div>
			</div>
			<p class="lose  login"><a href="javascript:;">开通第三方资金托管账户，保护资金安全</a></p>
		
		<div class=" third_js lose  account " style="text-align:center;"><a href="javascript:;">什么是第三方资金托管账户？</a></div>
	</c:if>

	<c:if test="${channel == 2 || channel == 3 || channel == 4 || channel ==5 }">
		<div class="open_btn_box">
		    <div class="open_btn bg1">
		        <a href="javascript:;" onclick="openAccount();">立即开通</a>
		    </div>
		</div>
		<div class="third_js"><a href="javascript:;">什么是第三方资金托管账户？</a></div>
	</c:if>
	
</section>
<div class="mark_box"></div>
<div class="Delta_box">
    <h2>第三方资金托管账户</h2>
    <p>中再融为保护用户的投资权益，通过汇付天下进行第三方资金托管。投资人在中再融投资时，资金会直接进入汇付天下账户，并在募集完毕后将资金直接打入借款人账户，中再融不接触投资人的资金，实现了平台与资金真正隔离，确保投融资交易真实和投资人资金安全。<p>
    <div class="Delta_btn bg1" id="iknow">
        <a href="javascript:;">我知道了</a>
    </div>
</div>
<div id="openAccount"></div>

</div>
<%@ include file="/views/inc/footer.jsp"%>
<script src="${basePath}/resources/js/login.js"></script>
<script type="text/javascript">
function openAccount(){
	$.ajax({
		type: 'POST',
		url: environment.basePath + "/doOpenAccount.session",
		data: {"openUserFlag":$('#openUserFlag').val(),"mobile":$('#mobile').val(),"userId":$('#userId').val(),"authenType":$('#authenType').val()},
		beforeSend: function(){},
		success: function(json) {
			if(json.code < 0){
				dilog("提醒",json.msg,false);
				return;
			}else{
				var openAccountForm = json.data.openAccountForm;
				$('#openAccount').html(openAccountForm);
				var form = $('#postPnrForm');
				form.submit();
			}
		},
		complete:function(){}
	});
}
</script>
<!-- Google Code for &#27880;&#20876;&#25104;&#21151; Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 878611354;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "08oWCJ73oGgQmpf6ogM";
var google_remarketing_only = false;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/878611354/?label=08oWCJ73oGgQmpf6ogM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
</body>
</html>