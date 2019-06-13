<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的红包 - 中再融</title>
    <%@ include file="/views/inc/inc.jsp"%>
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/activity/experienceMoney/redpackek.css">
	<style type="text/css">
		.rules .been_used {width: 94px;height: 72px;background: url(${basePath}/resources/image/activity/experienceMoney/been_used_icon.png) no-repeat;background-size: 100%;position: absolute;right: 0;bottom: 0;}
.rules .been_past {width: 94px;height: 72px;background: url(${basePath}/resources/image/activity/experienceMoney/been_past_icon.png) no-repeat;background-size: 100%;position: absolute;right: 0;bottom: 0;}
	</style>
</head>
<body>
	<%@ include file="/views/inc/header.jsp"%> 
	<div id="content_height">
		<div class="hb_nav_top">
			<div id="crashModule">
				<ul class="redenvelopes_list clearfix">
					<li class="carsh">
						<span class="active">现金/返现红包</span>
					</li>
					<li class="exeMoney">
						<span >体验金红包</span>
					</li>				
				</ul>
				
	        	<ul id="chosebtn" class="details_list clearfix">
					<li id="link">
						<span class="plan_active Hborder">未使用</span>
					</li>
					<li id="hover">
						<span>已使用</span>
					</li>
					<li id="active">
						<span class=" bordernone" >已过期</span>
					</li>
				</ul>    
    	
	    		 <div class="hb_list" id="hb_link" style="display:block;"></div>
			    <div class="hb_list" id="hb_hover"></div>
			    <div class="hb_list" id="hb_active"></div>
			    <div id="more_list" style="display:none">
					<div class="" id="more">查看更多</div>
				</div>
    		</div>
    		<!-- 新增体验金模块  start-->
    		<div id="ExeModule" style="display:none;">
				<ul class="redenvelopes_list clearfix">
					<li class="carsh" >
						<span>现金/返现红包</span>
					</li>
					<li id="exeMoney" class="exeMoney">
						<span class="active">体验金红包</span>
					</li>				
				</ul>
				
				
				<ul id="exeRedList" class=" details_list clearfix">
					<li>
						<span id="noUse" class="plan_active">未使用</span>
					</li>
					<li>
						<span id="used">已使用</span>
					</li>
					<li>
						<span id="past" class=" bordernone">已过期</span>
					</li>
				</ul>
	    		<ul id="exeConList">
	    		<!-- 列表内容区 -->						
	    		</ul>
				<div id="more_list">
					<div class="exeMore" id="more">查看更多</div>
				</div>
    		</div>
    		
			<!-- 新增体验金模块 end -->
		</div>
		<!--体验金红包-->
	
   
  </div>

   
    <%@ include file="/views/inc/footer.jsp"%>
    <div class="mark_box"></div>
    <!-- 使用红包弹出层start -->
    <div class="infoBox">
    	<p class="line1"></p>
    	<p class="line2"></p>
    	<div class="btnBox">
    		<div class="closeBtn">去首页</div>
    		<div class="ensureBtn">关闭</div>
    	</div>    	
    	<p class="redinfo">温馨提示:登录PC端可查看更多体验金详情</p>
    </div>
    <!-- 使用红包弹出层end -->
	<script>
    var status = 1;
    var pageNumber = 1;
    var resultSize = 0;
    $(function(){ 
        getCouponRecords(1);
    });

    $('#chosebtn li').click(function(){
        	$(this).addClass('plan_active').siblings().removeClass('plan_active');
            var id=$(this).attr('id');
            if(id == 'link'){
                status = 1;
            }else if(id == 'hover'){
                status = 2;
            }else{
                status = 3;
            }
            pageNumber = 1;
            getCouponRecords(1);
            $('.hb_list').hide();
            $('#hb_'+id).show();
        })
  
    
  

    function getCouponRecords(pageNumber){
        $.ajax({
            type: 'POST',
            url: environment.basePath + "/myAccount/getCouponRecords.session",
            data: {"pageNumber":pageNumber,"status":status-1},
            beforeSend: function(){
                $('#more').hide();                
            },
            success: function(json) {
                if(json.code < 0){
                    dilog("提醒",json.msg,false);
                    return;
                }else{
                    resultSize = json.data.recordList.length;
                    initialTable(json.data.recordList,status);
                }
            },
            complete:function(){
                if(resultSize == 4){
                    $('#more_list').show();
                    $('#more').show();
                    $('#more_list').removeClass('more_jz');
                }
                if(pageNumber > 1 && resultSize < 4){
                    $('#more_list').hide();
                }
            }
        });
    }

    $('#more_list').click(function(){
        pageNumber ++;
        getCouponRecords(pageNumber);
    });

    function initialTable(recordList,status){
        if(pageNumber == 1){
            $("#hb_link").html("");
            $("#hb_hover").html("");
            $("#hb_active").html("");
        }
        var htmlStr = "";
        htmlStr += "<ul>";
        for (var i = 0; i < recordList.length; i++) {
           // var coupon = recordList[i];
           // var detailHtml = getDetailStr(coupon);
            //alert(coupon.isCash == false);
            var red = recordList[i];
            if(status == 3 && red.packageStatus == 2 && red.packageMoney > 0){
            	 //已过期
                htmlStr += '<li class="active_hb"><div class="list_header ohz">';
                if(red.packageType == 2){
                    htmlStr += '<span class="h_title">投资返现券</span>';
                    htmlStr += '<span class="h_money">￥'+red.packageMoney+'</div>';
                    htmlStr += '<p class="">使用规则：'+red.packageMemo+'</p>';
                    htmlStr += '<a href="javascript:;" class="m_list">查看全部  >></a>';
                    htmlStr += '<div class="list_footer ohz">';
                    htmlStr += '<span class="f_from fl">来源：'+red.sourceName+'</span>';
                    htmlStr += '<span class="f_time fr">有效期至：'+getLocalTime(red.endTime)+'</span></div></li>';
                }else if(red.packageType == 3){
                    htmlStr += '<span class="h_title">加息券</span>';
                    htmlStr += '<span class="h_money">'+red.packageMoney+'%</div>';
                    htmlStr += '<p class="">使用规则：'+red.packageMemo+'</p>';
                    htmlStr += '<a href="javascript:;" class="m_list">查看全部  >></a>';
                    htmlStr += '<div class="list_footer ohz">';
                    htmlStr += '<span class="f_from fl">来源：'+red.sourceName+'</span>';
                    htmlStr += '<span class="f_time fr">有效期至：'+getLocalTime(red.endTime)+'</span></div></li>';
                }else{
                    htmlStr += '<span class="h_title">现金红包</span>';
                    htmlStr += '<span class="h_money">￥'+red.packageMoney+'</div>';
                    htmlStr += '<p class="">使用规则：点击兑现可直接返现</p>';
                    htmlStr += '<a href="javascript:;" class="m_list">查看全部  >></a>';
                    htmlStr += '<div class="list_footer ohz">';
                    htmlStr += '<span class="f_from fl">来源：'+red.sourceName+'</span>';
                    htmlStr += '<span class="f_time fr">有效期至：'+getLocalTime(red.endTime)+'</span></div>';
                    htmlStr += '</li>';
                }
            }else if(status == 2 && red.packageStatus == 1 && red.packageMoney > 0){
            	  //已使用
                htmlStr += '<li class="hover_hb"><div class="list_header ohz">';
                if(red.packageType == 2){
                    htmlStr += '<span class="h_title">投资返现券</span>';
                    htmlStr += '<span class="h_money">￥'+red.packageMoney+'</div>';
                    htmlStr += '<p class="">使用规则：'+red.packageMemo+'</p>';
                    htmlStr += '<a href="javascript:;" class="m_list">查看全部  >></a>';
                    htmlStr += '<div class="list_footer ohz">';
                    htmlStr += '<span class="f_from fl">来源：'+red.sourceName+'</span>';
                    htmlStr += '<span class="f_time fr">有效期至：'+getLocalTime(red.endTime)+'</span></div></li>';
                }else if(red.packageType == 3){
                    htmlStr += '<span class="h_title">加息券</span>';
                    htmlStr += '<span class="h_money">'+red.packageMoney+'%</div>';
                    htmlStr += '<p class="">使用规则：'+red.packageMemo+'</p>';
                    htmlStr += '<a href="javascript:;" class="m_list">查看全部  >></a>';
                    htmlStr += '<div class="list_footer ohz">';
                    htmlStr += '<span class="f_from fl">来源：'+red.sourceName+'</span>';
                    htmlStr += '<span class="f_time fr">有效期至：'+getLocalTime(red.endTime)+'</span></div></li>';
                }else{
                    htmlStr += '<span class="h_title">现金红包</span>';
                    htmlStr += '<span class="h_money">￥'+red.packageMoney+'</div>';
                    htmlStr += '<p class="">使用规则：点击兑现可直接返现</p>';
                    htmlStr += '<a href="javascript:;" class="m_list">查看全部  >></a>';
                    htmlStr += '<div class="list_footer ohz">';
                    htmlStr += '<span class="f_from fl">来源：'+red.sourceName+'</span>';
                    htmlStr += '<span class="f_time fr">有效期至：'+getLocalTime(red.endTime)+'</span></div>';
                    htmlStr += '</li>';
                }
            	
            }else if(status == 1 && red.packageStatus == 0 && red.packageMoney > 0){
            	 //未使用
                htmlStr += '<li><div class="list_header ohz">';
                if(red.packageType==2){
                    htmlStr += '<span class="h_title">投资返现券</span>';
                    htmlStr += '<span class="h_money">￥'+red.packageMoney+'</div>';
                    htmlStr += '<p class="">使用规则：'+red.packageMemo+'</p>';
                    htmlStr += '<a href="javascript:;" class="m_list">查看全部  >></a>';
                    htmlStr += '<div class="list_footer ohz">';
                    htmlStr += '<span class="f_from fl">来源：'+red.sourceName+'</span>';
                    htmlStr += '<span class="f_time fr">有效期至：'+getLocalTime(red.endTime)+'</span></div></li>';
                }else if(red.packageType == 3){
                    htmlStr += '<span class="h_title">加息券</span>';
                    htmlStr += '<span class="h_money">'+red.packageMoney+'%</div>';
                    htmlStr += '<p class="">使用规则：'+red.packageMemo+'</p>';
                    htmlStr += '<a href="javascript:;" class="m_list">查看全部  >></a>';
                    htmlStr += '<div class="list_footer ohz">';
                    htmlStr += '<span class="f_from fl">来源：'+red.sourceName+'</span>';
                    htmlStr += '<span class="f_time fr">有效期至：'+getLocalTime(red.endTime)+'</span></div></li>';
                }else{
                    htmlStr += '<span class="h_title">现金红包</span>';
                    htmlStr += '<span class="h_money">￥'+red.packageMoney+'</div>';
                    htmlStr += '<p class="">使用规则：点击兑现可直接返现</p>';
                    htmlStr += '<a href="javascript:;" class="m_list">查看全部  >></a>';
                    htmlStr += '<div class="list_footer ohz">';
                    htmlStr += '<span class="f_from fl">来源：'+red.sourceName+'</span>';
                    htmlStr += '<span class="f_time fr">有效期至：'+getLocalTime(red.endTime)+'</span></div>';
                    htmlStr += '<div class="hb_btn"><a onclick="openMoney('+red.id+');">兑现</a></div></li>';
                }
            }
            
        }
        if(recordList.length != 0){
            if(status == 1){
                $("#hb_link").append(htmlStr);
            }else if(status == 2){
                $("#hb_hover").append(htmlStr);
            }else{
                $("#hb_active").append(htmlStr);
            }
        }else{
            if(status == 1 && pageNumber == 1){
                $("#hb_link").append('<div class="no_xm">您没有未使用的红包');
            }else if(status == 2 && pageNumber == 1){
                $("#hb_hover").append('<div class="no_xm">您没有已使用的红包');
            }else if(status == 3 && pageNumber == 1){
                $("#hb_active").append('<div class="no_xm">您没有已过期的红包');
            }
        } 
        $('.hb_list ul li p').each(function(){
        	if($(this).height()>20){
        		$(this).addClass('sl_html');
        		$(this).next().css('display','block');
        	}
        });
        $('.m_list').each(function(){
        	$(this).click(function(){
        		$(this).prev().removeClass('sl_html');
        		$(this).css('display','none');
        	})
        })
    }
    
    
    
    function openCoupon(couponId){
        var id = "openCoupon"+couponId;
        $.ajax({
            type: 'POST',
            url: environment.basePath + "/myAccount/openMyRedPackage.session",
            data: {"couponId":couponId},
            beforeSend: function(){
                $('#'+id).attr("onclick","javascript:void(0)");
            },
            success: function(json) {
                if(json.code < 0){
                    dilog("提醒",json.msg,false);
                    $('#'+id).attr("onclick","openCoupon("+id+")");
                    return;
                }else{
                    var content = "红包面额￥"+json.data.couponAmount+"元已转入您的中再融资金账户"
                    + "<br>投资后可提现。您的账户余额为￥"+json.data.user.cash+"元";
                    dilog("兑现红包成功",content,false,function(){window.location.reload();});
                }
            },
            complete:function(){}
        });
    }

function getDetailStr(obj){
    var typeVal = '',apply='',upperUse ='',useCondition ='',lowUse='',html = '';
    if(obj.useClientScope == 0){
        typeVal = '全部';
    }else if(obj.useClientScope == 1){
        typeVal = '中再宝';
    }else if(obj.useClientScope == 2){
        typeVal = '直投项目';
    }else if(obj.useClientScope == 3){
        obj.companyList.forEach(function(com,i){
            if(i+1 == obj.companyList.length){
                typeVal += com;
            }else{
                typeVal += com + ",";
            }
        });
    }
    
    var useLimit = '';
    if(useCondition == 0){
        useLimit = '全部';
    }else if(useCondition == 1){
        useLimit = 'WEB';
    }else if(useCondition == 2){
        useLimit = '手机';
    }
    
    if(obj.lowUse != '' && obj.lowUse != 'null' && obj.lowUse != null){
        lowUse = '投资'+ obj.lowUse +'元以上可用；';
    }
    
    if(obj.applyToUpper != '' && obj.applyToLow !='' 
            && obj.applyToUpper != 'null' && obj.applyToLow !='null'
                && obj.applyToUpper != null && obj.applyToLow !=null){
        apply = '适用于期限为'+ obj.applyToLow +'-'+ obj.applyToUpper + '天的项目；';
    }else if(obj.applyToLow !='' && obj.applyToLow !='null'  && typeof(obj.applyToLow) != 'undefined'){
        apply = '适用于期限大于'+ obj.applyToLow +'天的项目；';
    }
    
    if(obj.upperUse != '' && obj.upperUse != 'null' && obj.upperUse != null){
        upperUse ='加息上限为'+ obj.upperUse +'元，投资金额超过上限，超过部分不享受加息；';
    }
    
    if(useCondition != 0 && sobj.useCondition !='' && obj.useCondition != 'null'&& obj.useCondition != null){
        useCondition = '仅限'+ useLimit +'使用；';
    }
    
    html+="<span class='ruleDetail'>适用于"+typeVal+"项目；"
    +"债权转让不可使用；"+lowUse+apply+upperUse+useCondition+"</span>";
    return html;
}
function openMoney(obj){
	var url = environment.basePath + "/myAccount/openMoneyRedPackage.session";
	var id = obj;
	$.ajax({
		url : url,
		data : "id="+id,
		type : "post",
		success : function(data){
			var json = data.data;
			if(json.message == "success"){
				//alert("恭喜您，兑换成功");
				dilog("提醒","恭喜您，兑换成功",false);
				getCouponRecords(pageNumber);
				//$(".cashMoney i").text(money);
				//openJWin('receive_successful');
				//window.location.reload();
			}else if(json.message == "error"){
				//alert("对不起，兑换失败，请重试或者联系客服！");
				//openJWin('receive_failure');
				dilog("提醒","对不起，兑换失败，请重试或者联系客服！",false);
			}else if(json.message == "userexists"){
				if(dilog("提醒","用户不存在，请重新登录！",false,function link(){
					window.location.href = environment.basePath+ "/userInfo/nologin.do";})){
				}
			}else if(json.message == "notopen"){
				
				
				if(dilog("提醒","您尚未开通资金托管账户,请开户！",false,function link(){
					window.location.href = environment.basePath + "/recharge/openAccount.session?channel=5";})){
				}
			}
		}
	}); 
}

function getLocalTime(nS) {     
    return new Date(nS).Format("yyyy-MM-dd");      
 } ;
 $('.ts_footer a').live("click",function(){
	 window.location.reload();
 })
</script>
<script src="${basePath}/resources/js/activity/experienceMoney/experienceMoney.js"></script>
</body>
</html>