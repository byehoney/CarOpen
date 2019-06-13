<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="m.zhongzairong.cn">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<title>518理财狂欢季，现金壕礼送不停</title>
<%@ include file="/views/inc/inc.jsp"%>
<script src="http://www.zhongzairong.cn/js/v2/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="shortcut icon" href="http://m.zhongzairong.cn/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
<link rel="icon" href="http://m.zhongzairong.cn/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
<style>
body,html{-moz-user-select:none;-khtml-user-select:none;user-select:none;font-family:"Microsoft Yahei",Tahoma,"\5b8b\4f53",Arial,Helvetica,Arial}*{padding:0;margin:0}li{list-style:none}.clearfix{zoom:1}.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden}.wp_518_banner{width:100%}.wp_518_banner img{width:100%;display:block;border:none}.radios{position:relative;height:24px;line-height:24px;background:url(../resources/image/static/activity/radios.png) no-repeat 6px center;background-size:15px;border:1px solid #ffa71d;font-size:13px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.radios>div{width:100%;left:24px;position:absolute;top:0}.wp_lists{width:88%;height:80px;border-radius:4px;padding:0 1% 0 6%;margin:18px auto 0;background:#e06f12}.wp_lists .themes{width:80px;height:80px;position:relative;color:#eb6100;font-size:14px;font-weight:700;line-height:80px;margin-top:-9px;text-align:center;background:#e6e6e6;border-radius:50%;float:left}.wp_lists .text{width:62%;padding:12px 0;line-height:18px; border-radius:50px 0 0 50px;color:#313131;font-size:12px;padding-left:6%;margin-top:10px;float:right;background:#eee}.wp_lists .text span{color:red}.wp_lists .themes img{width:50px;position:absolute;left:-28px;bottom:-10px}.singing{background:#00b5c8}.singing .themes{color:#00abc0}.hammer{background:#6372c4}.hammer .themes{color:#5b69bf}.wp_518_btn{width:100%;padding-top:20px;text-align:center}.wp_518_btn a{width:60%;height:40px;line-height:40px;border:1px solid #ffb401;font-size:18px;display:block;margin:auto;background:#ffc701;text-align:center;text-decoration:none;color:#6a3906;font-weight:700;letter-spacing:2px}.wp_518_btn p{line-height:40px;font-size:13px; color:#6a3906;}.wp_gz{padding:16px 20px;background:#ffedaf;color:#eb6100;font-size:13px}.wp_gz ul li span{width:6%; line-height:22px; text-align:right;float:left}.wp_gz ul li p{width:94%;line-height:22px;float:right}.wp_footer{background:#353535;padding:20px 0}.wp_footer p{font-size:14px;color:#fff;line-height:20px;text-align:center}
@media screen and (min-width:640px){
.wp_lists .text{margin-top:19px;}
}
</style>
<script>
var pathUrl= '${pageContext.request.contextPath }';
$(function(){
	moneyHeroList();
})

 function moneyHeroList(){
	
	 jQuery.ajax( {  
         type : 'GET',  
         contentType : 'application/json',  
         url : pathUrl + '/myAccount/518/moneyHeroList.do',  
         dataType : 'json',  
         success : function(data) {  
        var data = data.data.resultList;
			$("#moneyHeroList").empty();
           if(data.length>0){
        	   moneyHeroList
        	   var htmlStr="";
        	   for(var i=0;i<data.length;i++){
                   htmlStr += '<p>恭喜'+userNameSubtring(data[i].nickName)+'获得'+data[i].name+'项目奖励。</p>';
               }
        	   $("#moneyHeroList").append(htmlStr); 
       		var i=0;
    		var h=$(".radios div p").height();
    		var len=$(".radios div p").length
    		setInterval(function(){
    		  i++
    		  if(i==len){
    		  $(".radios div").animate({top:0+"px"},10);
    		  i=0
    		  }else{
    			  $(".radios div").animate({
    				top:-i*h+"px"
    			  });
    		  }
    		},2000)
    		
        	    
           }else{
        	   
        	   $(".radios").hide();
           }
           
         },  
         error : function(data) {  
           alert("error")  
         }  
       });
 }
 
function userNameSubtring(userName){
	 var loginUserName = $("#loginUserName").val();
	 var userNameStr = userName.substring(0,3);
	 
	 if(loginUserName == userName){
		 userName = '<p style="color:red">'+userName+'</p>';
	 }else{
		 if(userNameStr == "zzr"){
			 userName = userNameStr + "***" + userName.substring(userName.length-4,userName.length);
		 }else{
			 userName =  userName.substring(0,1) + "***" + userName.substring(userName.length-1,userName.length)
		 }
	 }
	 return userName;
}
</script>
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
    <div class="wp_518_banner">
	    <img src="../resources/image/static/activity/w_518_banner.jpg" alt="518图片">
    </div>
	<div class="radios">
	  <div id="moneyHeroList">
	  </div>
	</div>
	<div class="wp_lists">
	   <div class="clearfix">
	      <div class="themes">一马当先<img src="../resources/image/static/activity/list_ico1.png"/></div>
		  <div class="text">活动期间，每个项目的首位投资者，可获<span>10元</span>现金红包。</div>
	   </div>
	 </div>
	 
	 <div class="wp_lists singing"> 
	   <div class="clearfix">
	      <div class="themes">一鸣惊人<img src="../resources/image/static/activity/list_ico2.png"/></div>
		  <div class="text">活动期间，每个项目投资金额最高者，最多可获<span>20元</span>现金红包。</div>
	   </div>
	 </div>
	 
	 <div class="wp_lists hammer">
	   <div class="clearfix">
	      <div class="themes">一锤定音<img src="../resources/image/static/activity/list_ico3.png"/></div>
		  <div class="text">活动期间，每个项目的最后一位投资者。可获<span>10元</span>现金红包。</div>
	   </div>
	</div>
	
	<div class="wp_518_btn">
		<c:if test="${empty userObj}">
	  		 <a href="${pageContext.request.contextPath }/userInfo/nologin.do">登录去投资</a>
	   </c:if>
	   <c:if test="${not empty userObj}">
	   		<a href="${pageContext.request.contextPath }/loan/list.do">去投资</a>
	   </c:if>
	   <p>获奖详情请使用电脑登录中再融官网查看</p>
	</div>
	
	<div class="wp_gz">     
	   <ul>
	      <li class="clearfix"><span>1.</span><p>当投资者同事满足上述两个以上条件是，奖励可以累加获得；</p></li>
		  <li class="clearfix"><span>2.</span><p>“一鸣惊人”奖，当投资金额>5000时，可获20元现金红包；</p><p>当3000<投资金额<5000时，可获10元现金红包；</p><p>当投资红包<3000时，可获5元现金红包；</p></li>
		  <li class="clearfix"><span>3.</span><p>“一鸣惊人”奖，当出现多名投资者投资金额相同时，按时间顺序，取最先投资者；</p></li>
<!-- 		  <li class="clearfix"><span>4.</span><p>自动结标的项目，无最后一名(一锤定音)奖励。</p></li> -->
		  <li class="clearfix"><span>4.</span><p>活动期间，每个用户不限投资次数；</p></li>
		  <li class="clearfix"><span>5.</span><p>现金红包将在此标的募集成功后，三个工作日内发放。</p></li>
		  <li class="clearfix"><span>6.</span><p>现金红包自获得日起有效期30天。</p></li>
		  <li class="clearfix"><span>7.</span><p>中再融对本活动有最终解释权。</p></li>
	   </ul>
	</div>
	
<!--底部-->
<div class="wp_footer">
   <p>中再融(北京)科技有限公司 版权所有</p>
   <p>京ICP备16002418号-1</p>
</div>
</body>
</html>