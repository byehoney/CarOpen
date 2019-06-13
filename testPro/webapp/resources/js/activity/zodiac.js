/**
 * 生肖活动
 */

var pathUrl = environment.basePath;
 Date.prototype.diff = function(date){
	  return (this.getTime() - date.getTime())/(24 * 60 * 60 * 1000);
 }
 
	function getadd(name)
	{
	     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	     var r = window.location.search.substr(1).match(reg);
	     if(r!=null)return  unescape(r[2]); return null;
	} 
 
 var Utils = {
			isChinese2 : function(str) {
				var lst = /[\u4e00-\u9fa5]/;
				return lst.test(str);
			},
			getCharLen2 : function(str) {
				var strlength = 0;
				for (var i = 0; i < str.length; i++) {
					if (this.isChinese2(str.charAt(i)) == true)
						strlength = strlength + 2;
					else
						strlength = strlength + 1;
				}
				return strlength;
			}
		}
 
 
	/**
	 *   我的奖励  活动一
	 */
function myAward(){
	
	 jQuery.ajax( {  
   type : 'GET',  
   contentType : 'application/json',  
   url : pathUrl + '/chineseZodiac/myAward.do?userId='+getadd("userId"),  
   data :{
// 	  page:"0",
// 	  rows:"5"
   },
   dataType : 'json',  
   success : function(data) {  
 	  
//	  alert(JSON.stringify(data.data));

	  var data = data.data.resultList;

	  var myAwordAmount = data.myAwordAmount?data.myAwordAmount:0;
	  $("#getAmountTotal").append(myAwordAmount.toFixed(2)); 
	  
	  var myInvest = data.myInvest;
	  $("#friendsAmount").append(myInvest); 
	  
	  
	  var resultList = data.resultList;

     if(resultList !=null && resultList.length>0){
  	   
  	   for(var i=0;i<resultList.length;i++){
  		   
      	   var htmlStr = '<li class="clearfix"><span class="fl">'+resultList[i].mobile1+"****"+resultList[i].mobile2+'</span>'
		                   	+'<span class="fl">'+(resultList[i].amount?'是':'否')+'</span>'
		                   	+'<span class="fl">'+(resultList[i].amount?resultList[i].amount:0).toFixed(2)+'元</span></li>';	
      	   
      	   $("#myAwordTab1").append(htmlStr); 

         }
  	   
  	   
     }else{
    	 $('#myAwordTab1').append('<li style="height:2rem; line-height:2rem; text-align:center;">暂无数据</li>');
     }
     
   },  
   error : function(data) {  
     //alert("error")  
   }  
 });
}


/**
*   我的奖励  活动二
*/
function myAwardActivity2(){
	jQuery.ajax( {  
	type : 'GET',  
	contentType : 'application/json',  
	url : pathUrl + '/chineseZodiac/myAwardActivity2.do?userId='+getadd("userId"),  
	data :{
//		  page:"0",
//		  rows:"5"
	},
	dataType : 'json',  
	success : function(data) {  
		  
//	alert(JSON.stringify(data));
	var data = data.data.resultList;
	
	var card_CNT = data.card_CNT;
	$("#zodiacAmount").append(card_CNT);
	$("#hasAmounts").html(card_CNT);
	if(card_CNT>=12){
		$("#18888div").parent().html('<span id="18888div">已</span>获得988元现金')
		$("#noHasAmounts").parent().html("&nbsp").next().text("可获得988元现金");
	}else{
		$("#18888div").parent().html('<span id="18888div">暂</span>未获得988元现金')
		$("#noHasAmounts").html(12 - card_CNT);
	}
	
	var myInvest = data.myInvest;
	$("#zodiacFriends").append(myInvest);
	
	
	var myChineseZodiacClass = data.myChineseZodiacClass;
	$("#hasZodiac").html(myChineseZodiacClass);
	if(myChineseZodiacClass >= 12){
		$("#18888div").parent().html('<span id="18888div">可</span>获得18888元现金');
		$("#hasAmounts").parent().next().next().text("人缘真是好极了！");
		$("#noHasZodiac").parent().html("&nbsp").next().text("可获得18888元现金！");
	}else{
		if(card_CNT>=12){
			$("#18888div").parent().html('<span id="18888div">已</span>获得988元现金')
			$("#noHasZodiac").html(12 - myChineseZodiacClass);
		}else{
			$("#18888div").parent().html('<span id="18888div">暂</span>未获得18888元现金');
			$("#988div").parent().html('<span id="988div">暂</span>未获得988元现金');
			$("#noHasZodiac").html(12 - myChineseZodiacClass);	
		}
	}
	
	
	var resultList = data.resultList;
	
	 if(resultList !=null && resultList.length>0){
		   
		   for(var i=0;i<resultList.length;i++){
			   
			   var chineseZodiac = '无';
    		   if(resultList[i].type == '1'){            //  生肖卡属性1.虎2.马3.狗4.兔5.猪6.羊7蛇8鸡9牛10猴11鼠12龙
    			   chineseZodiac = '生肖虎卡1枚'; //2017-01-03改  生肖卡属性1.虎2.马3.狗4.兔5.猪6.羊7蛇8牛9鼠10鸡11猴12龙 
    		   }else if(resultList[i].type == '2'){
    			   chineseZodiac = '生肖马卡1枚';
    		   }else if(resultList[i].type == '3'){
    			   chineseZodiac = '生肖狗卡1枚';
    		   }else if(resultList[i].type == '4'){
    			   chineseZodiac = '生肖兔卡1枚';
    		   }else if(resultList[i].type == '5'){
    			   chineseZodiac = '生肖猪卡1枚';
    		   }else if(resultList[i].type == '6'){
    			   chineseZodiac = '生肖羊卡1枚';
    		   }else if(resultList[i].type == '7'){
    			   chineseZodiac = '生肖蛇卡1枚';
    		   }else if(resultList[i].type == '8'){
    			   chineseZodiac = '生肖牛卡1枚';
    		   }else if(resultList[i].type == '9'){
    			   chineseZodiac = '生肖鼠卡1枚';
    		   }else if(resultList[i].type == '10'){
    			   chineseZodiac = '生肖鸡卡1枚';
    		   }else if(resultList[i].type == '11'){
    			   chineseZodiac = '生肖猴卡1枚';
    		   }else if(resultList[i].type == '12'){
    			   chineseZodiac = '生肖龙卡1枚';
    		   }
			   
		  	   var htmlStr = '<li class="clearfix"><span class="fl">'+resultList[i].mobile1+"****"+resultList[i].mobile2+'</span>'
			                   	+'<span class="fl">'+(resultList[i].type?'是':'否')+'</span>'
			                   	+'<span class="fl">'+chineseZodiac+'</span></li>';	
	  	   
	  	   $("#myAwordTab2").append(htmlStr); 
	
	     }
		   
		   
	 }else{
		 $('#myAwordTab2').append('<li style="height:2rem; line-height:2rem; text-align:center;">暂无数据</li>'); 
	 }
	 
	},  
	error : function(data) {  
	 //alert("error")  
	}  
	});
}

 function loanInvest(){
	 window.location.href = pathUrl + "/invest/projectlist.shtml";
 }
 function invitation(){
	 window.location.href = pathUrl + "/invitation.shtml";
 }
 
 function reloadSnack(){
	 window.location.href = pathUrl + "/snacks.shtml";
 }
 
$(function(){
	
    //判断登录状态
    var login = false;
    login = $('.zodiac-icon-box').attr('isLogin');
   
    //用户邀请码
    var inviteCode = $('.zodiac-icon-box').attr('inviteCode')
    if(login != 0){
    	
    	//活动一
    	function getMyAwordAmountList(){
    		 jQuery.ajax( {  
    	         type : 'GET',  
    	         contentType : 'application/json',  
    	         url : pathUrl + '/chineseZodiac/getMyAwordAmountList.do?userId='+getadd("userId"),  
    	         dataType : 'json',  
    	         success : function(data) { 
    	           if(data.data.resultList.length > 0){
    	        	   if(data.data.resultList[0].rebateInvestAmount){
    	        		 //获得现金
        	               $('#getMoney').html(data.data.resultList[0].rebateInvestAmount.toFixed(2));
    	        	   }
    	        	  
    	           }
    	           
    	         },  
    	         error : function(data) {  
    	           
    	         }  
    	       });
    	 }
    	getMyAwordAmountList();
    	//活动二
    	function getMyInvestAwardList(){
    		 jQuery.ajax( {  
    	         type : 'GET',  
    	         contentType : 'application/json',  
    	         url : pathUrl + '/chineseZodiac/getMyChineseZodiacAwardList.do?userId='+getadd("userId"),  
    	         dataType : 'json',  
    	         success : function(data) {  
    	        	 if(data.data.resultList.length > 0){
    	        		 
    	        		 $.each(data.data.resultList,function(index,value){
    	        			 
    	        			            //生肖卡属性1.虎2.马3.狗4.兔5.猪6.羊7蛇8鸡9牛10猴11鼠12龙
    	        			//2017-01-03改  生肖卡属性1.虎2.马3.狗4.兔5.猪6.羊7蛇8牛9鼠10鸡11猴12龙 
    	        			 switch (value.name)
    	        			 {
	    	        			 case 11:
	    	        				 $('.zodiac-icon-box li').eq(0).find('.large-icon').addClass('act');
	    	        				 $('.zodiac-icon-box li').eq(0).find('.num-tip').show().html(value.num);	 
	    	        				 break;
	    	        			 case 10:
	    	        				 $('.zodiac-icon-box li').eq(1).find('.large-icon').addClass('act');
	    	        				 $('.zodiac-icon-box li').eq(1).find('.num-tip').show().html(value.num);
	    	        				 break;
	    	        			 case 12:
	    	        				 $('.zodiac-icon-box li').eq(2).find('.large-icon').addClass('act');
	    	        				 $('.zodiac-icon-box li').eq(2).find('.num-tip').show().html(value.num);
	    	        				 break;
	    	        			 case 1:
	    	        				 $('.zodiac-icon-box li').eq(3).find('.small-icon').addClass('act');
	    	        				 $('.zodiac-icon-box li').eq(3).find('.num-tip').show().html(value.num);
	    	        				 break;
	    	        			 case 2:
	    	        				 $('.zodiac-icon-box li').eq(4).find('.small-icon').addClass('act');
	    	        				 $('.zodiac-icon-box li').eq(4).find('.num-tip').show().html(value.num);
	    	        				 break;
	    	        			 case 3:
	    	        				 $('.zodiac-icon-box li').eq(5).find('.small-icon').addClass('act');
	    	        				 $('.zodiac-icon-box li').eq(5).find('.num-tip').show().html(value.num);
	    	        				 break;
	    	        			 case 4:
	    	        				 $('.zodiac-icon-box li').eq(6).find('.small-icon').addClass('act');
	    	        				 $('.zodiac-icon-box li').eq(6).find('.num-tip').show().html(value.num);
	    	        				 break;
	    	        			 case 5:
	    	        				 $('.zodiac-icon-box li').eq(7).find('.small-icon').addClass('act');
	    	        				 $('.zodiac-icon-box li').eq(7).find('.num-tip').show().html(value.num);
	    	        				 break;
	    	        			 case 9:
	    	        				 $('.zodiac-icon-box li').eq(11).find('.small-icon').addClass('act');
	    	        				 $('.zodiac-icon-box li').eq(11).find('.num-tip').show().html(value.num);
	    	        				 break;
	    	        			 case 7:
	    	        				 $('.zodiac-icon-box li').eq(9).find('.small-icon').addClass('act');
	    	        				 $('.zodiac-icon-box li').eq(9).find('.num-tip').show().html(value.num);
	    	        				 break;
	    	        			 case 8:
	    	        				 $('.zodiac-icon-box li').eq(10).find('.small-icon').addClass('act');
	    	        				 $('.zodiac-icon-box li').eq(10).find('.num-tip').show().html(value.num);
	    	        				 break;
	    	        			 case 6:
	    	        				 $('.zodiac-icon-box li').eq(8).find('.small-icon').addClass('act');
	    	        				 $('.zodiac-icon-box li').eq(8).find('.num-tip').show().html(value.num);
	    	        				 break;
	    	        			 default:
    	        			 }
    	        			 
    	        		 });
    	        	 }
    	        	    	   
    	           
    	         },  
    	         error : function(data) {  
    	           
    	         }  
    	       });
    	 }
    	getMyInvestAwardList();
    	myAward();
    	myAwardActivity2();
        //查看我的奖励
        $('#myPre').on('click',function(){
       	    $('body,html').animate({ scrollTop: 0 }, 100);
            $('.mask-floor').show();
            $('.user-rewards').show();
        });
        $('#closeReward').on('click',function(){
            $('.mask-floor').hide();
            $('.user-rewards').hide();
        });
        //查看我的生肖卡
        $('#myZodiac').on('click',function(){
            $('.mask-floor').show();
            $('.user-zodiac').show();
        });
        $('#closeZodiac').on('click',function(){
            $('.mask-floor').hide();
            $('.user-zodiac').hide();
        });
    }else {

    }

    //立即邀请好友
    $('.inviteFriends').on('click',function(){
    	window.location.href ="https://www.zhongzairong.cn/theChineseZodiacInvite.shtml?code="+login;
    });
    
    

});
