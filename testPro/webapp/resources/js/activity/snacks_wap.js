/**
 * 送零食活动
 */

 Date.prototype.diff = function(date){
	  return (this.getTime() - date.getTime())/(24 * 60 * 60 * 1000);
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
 function getMySnacksAwardList(){
	 jQuery.ajax( {  
         type : 'GET',  
         contentType : 'application/json',  
         url : pathUrl + '/snacks/getMySnacksAwardList.do',  
         dataType : 'json',  
         success : function(data) {  
        var data = data.data.resultList;
           if(data.length>0){
        	   for(var i=0;i<data.length;i++){
        		   
        		   var investA = data[i].investAmount!=null?data[i].investAmount:0;
            	   var htmlStr = '<li>'+data[i].registerTime+'</li>'
		                       +'<li>500</li>'
		                       +'<li>'+investA+'</li>';
            	   
            	   $("#mySnacksAward").append(htmlStr);
            	   
            	   var buttonStr = '';
            	   
//            	   var now = new Date();
//            	   var date = new Date(data[i].registerTime);
//            	   var diff = now.diff(date);
            	
//            	   if(diff <= 10){
            	   
	            	   if(data[i].investAmount >= 500){
	            		   
	            		   if(data[i].snacks == 0){
	            			   buttonStr = '<div class="receive" onclick="LoanActivitySnacksAddress(1)"><span>点击领取</span><p>零食大礼包</p><i></i></div>';
	            			   
	            		   }else{
	            			   buttonStr = '<div class="receive"><span>已领取</span><p>零食大礼包</p><i></i></div>';
	            		   }
	            		   
	            	   }else{
	            		   
	            		   buttonStr = '<div class="receive" onclick="loanInvest()"><span>去投资</span><p>零食大礼包</p><i></i></div>';
	            	   }
	            	   
	            	   $("#mySnacksAwardButton").append(buttonStr); 
	            	   if( $("#mySnacksAwardButton span").text()=="已领取"){
	            		   $("#mySnacksAwardButton").css({"background":"#f6f6f6","color":"#999"});;
	            	   }
	            	   
//            	   }else{
//            		   $("#mySnacksAwardButton").append('<div class="fun"><p class="receive" style="background-color: #aba9a9;">已失效</p></div>'); 
//            	   }
        	   }
        	   
           }else{
        	   
           }
           
         },  
         error : function(data) {  
           alert("error")  
         }  
       });
 }
 
 
 function getMyInvestAwardList(){
	 jQuery.ajax( {  
         type : 'GET',  
         contentType : 'application/json',  
         url : pathUrl + '/snacks/getMyInvestAwardList.do',  
         dataType : 'json',  
         success : function(data) {  
//        alert(JSON.stringify(data));
    	  var snacksItem = 0;
    	  var data = data.data.resultList;

           if(data.length>0){
        	   
        	   $("#noInvestAward").hide();
        	   $("#yesInvestAward").show();
        	   
        	   for(var i=0;i<data.length;i++){
        		   
        		   var snacksStr = '';
//        		   if(data[i].snacks == 0)
//        			   snacksStr = '否';
//        		   else
//        			   snacksStr = '是'; 
        		   
        		   if(data[i].investAmount >=500){
            		   snacksItem ++ ;
            		   snacksStr = '是'; 
            	   }else{
            		   snacksStr = '否';
            	   }
        		   
            	   var htmlStr = '<li>'+data[i].createTime+'</li>'
		                       +'<li>'+data[i].mobile+'</li>'
		                       +'<li>'+snacksStr+'</li>';
            	   
            	   $("#MyInvestAwardList").append(htmlStr);

               }
        	   
        	   var listnuber=$("#MyInvestAwardList li").length/3;
        	   var isd=0;
        	   var h=$("#MyInvestAwardList li").outerHeight();
        	   if(listnuber>2){
        		   setInterval(function(){
        			       ++isd
        			       $("#MyInvestAwardList").animate({top: -isd*h+"px"},1000,function(){
        				   $("#MyInvestAwardList li:lt(3)").clone(true).appendTo($("#MyInvestAwardList"));
        				   $("#MyInvestAwardList li:lt(3)").remove();
        				   $("#MyInvestAwardList").css({top:"0px"})
        				   isd=0; 
        			   });

        		   },4000)  
        	   }
        	   
        	   if(listnuber<=1){$("#MyInvestAwardButton").css({padding:"0.05rem 0"})}
        	   
       	        if(snacksItem >= 2 && data[0].snacks2 == 1){
       		//  if(snacksItem >= 2){
        		   $("#MyInvestAwardButton").html("<span>点击领取</span><p>趣味存钱罐</p><i></i>");
        		   $('#MyInvestAwardButton').attr('onclick',"LoanActivitySnacksAddress(2)");

        	   }else if(data[0].snacks2 >= 2){
        		   $("#MyInvestAwardButton").html("<span>已领取</span><p>趣味存钱罐</p><i></i>").css({"background":"#f6f6f6","color":"#999"});
        	   }else{
        		   $("#MyInvestAwardButton").html('<span class="invitation">去邀请领取</span><p>趣味存钱罐</p><i></i><div class="links_content"><i class="links_ioc"></i><div class="code"><img src="'+pathUrl+'/qrcode.do" alt=""/></div><p class="invite">长按识别二维码</p><p class="clearfix invite_link"></p></div>');
         		   $("#MyInvestAwardButton").toggle(function(event){ 
          			  $(".links_content").stop().fadeIn();
          			 event.stopPropagation();
         		   },function(){
         			   $(".links_content").stop().fadeOut();
         			   event.stopPropagation();
         		   })

         		 $(".links_content").on("click",function(){$(".links_content").fadeOut()})
         		 
        	   }

           }else{

    		   $("#MyInvestAwardButton").html('<span class="invitation">去邀请领取</span><p>趣味存钱罐</p><i></i><div class="links_content"><i class="links_ioc"></i><div class="code"><img src="'+pathUrl+'/qrcode.do" alt=""/></div><p class="invite">长按识别二维码</p><p class="clearfix invite_link"></p></div>');
        	   $("#MyInvestAwardList").html('<div class="zw">暂无邀请记录</div>'); 
     		   $("#MyInvestAwardButton").toggle(function(event){ 
     			  $(".links_content").stop().fadeIn();
     			 event.stopPropagation();
    		   },function(){
    			   $(".links_content").stop().fadeOut();
    			   event.stopPropagation();
    		   })
    		   $(".links_content").on("click",function(){$(".links_content").fadeOut()})

           }
           
         },  
         error : function(data) {  
           alert("error")  
         }  
       });
 }

 function LoanActivitySnacksAddress(prizeType){
	 //$("#LoanActivitySnacks").show();
	 openJWin("LoanActivitySnacks")
	 $('#confirmButton').attr('onclick',"saveLoanActivitySnacks("+prizeType+")");
	 
 }
 
 function loanInvest(){
	 window.location.href = pathUrl + "/loan/list.do";
 }
 function invitation(){
	 window.location.href = pathUrl + "/invitation.shtml";
 }
 function reloadSnack(){
	 window.location.href = pathUrl + "/snacks.do";
 }
 function saveLoanActivitySnacks(prizeType){
	
	var radioSelect = $('input[name="address"]:checked').val();

	var addressId = "";
	var province = "";
	var mycity = "";
	var district = "";
	var addressText = "";
	
	if(radioSelect == "0"){
		addressId = $("#addressId").val();
		if(addressId == "" || addressId == null || addressId == undefined || addressId == "undefined")
			alert("请选择其他地址填写收货地址！");
	}else{
		province = $("#province").val();
		mycity = $("#mycity").val();
		district = $("#district").val();
		addressText = $("#addressText").val();
		
		if(province == '-1' || mycity == '-1' || district == '-1'){
			alert("请选择省市县！");
			return;
		}
		if(addressText == '' || addressText == ''){
			alert("请填写详细地址！");
			return;
		}
		
		var reg=/^(?=.*?[\u4E00-\u9FA5])[\d\u4E00-\u9FA5A-Za-z]+$/;
		if(!reg.test(addressText)){
			alert("地址含有非法字符！");
			return ;
		}
		
		//判断详细地址的长度,不能超过200,一个汉字长度为2
		 if(Utils.getCharLen2(addressText) > 400){
			 alert("长度不要超过200个字符");
				return;
		  }
			
	}
	
	 jQuery.ajax( {  
         type : 'GET',  
         contentType : 'application/json',  
         url : pathUrl + '/snacks/saveLoanActivitySnacks.do',  
         data:{
        	 addressId:addressId,
        	 prizeType:prizeType,
        	 provinceId:province,
        	 cityId:mycity,
        	 districtId:district,
        	 addressText:encodeURI(addressText)
         },
         dataType : 'text',  
         success : function(message) {  
        	var object= $.parseJSON(message);
        	 var data=object.msg;
        	 if(data == "success"){
        		 alert("领取成功！");
        		 closeJWin("LoanActivitySnacks")
//        		 if(prizeType == "1"){
//        			 $("#mySnacksAwardButton p").html('<div class="receive"><span>已领取</span><p>零食大礼包</p><i></i></div>');
//        			 $("#mySnacksAwardButton").css({"background":"#f6f6f6","color":"#999"});
//        		     document.getElementById("mySnacksAwardButton").onclick = null; 
//        		
//        		 }else{
//        			 $("#MyInvestAwardButton").html("<span>已领取</span><p>趣味存钱罐</p><i></i>");
//        			 $("#MyInvestAwardButton").css({"background":"#f6f6f6","color":"#999"});
//        		     document.getElementById("MyInvestAwardButton").onclick = null; 
//        		 }
        		 reloadSnack();
        	 }else if(data == "noQualification"){
        		 alert("暂无领取资格，赶快去投资吧！");
        	 }else if(data == "noChannel"){
        		 alert("暂无领取资格，特定渠道专享！");
        	 }else{
        		 alert("暂无领取资格，赶快去邀请好友投资吧！"); 
        	 }
         },  
         error : function(data) {  
             alert("error")  
           }  
       });
 }
 


 
 /**
  * 第一个参数是要加载的select的父节点的id， 
           第二个参数当前页面上要加载的select元素的id
  */
 function loadOption(parentId, selectId){
 	$.ajax({
 		url:pathUrl +"/loadOption.do",
 		type:"post",
 		dataType:"text",
 		async:false,
 		data:{
 			parentId:parentId
 		},
 		success:function(responseText){
 			//清空要追加的select
 			if(selectId == "#mycity"){
 				//如果是选择其中一个省，加载该省下的所有的option时既要清空城市的option也要清空区县
 				$(selectId).empty();
 				$("#district").empty();
 				//把城市和区县的请选择的option给加回来
 				$(selectId).append("<option value='-1'>请选择</option>");
 				$("#district").append("<option value='-1'>请选择</option>");
 			}else{
 				//如果是选择城市，加载城市下的区县，只清区县下的option即可
 				$(selectId).empty();
 				$(selectId).append("<option value='-1'>请选择</option>");
 			}
 			
 			var jsonObj = $.parseJSON(responseText);
 			
 			for(var i = 0; i < jsonObj.aList.length; i++){
 				var opt = $("<option value='"+jsonObj.aList[i].regionId+"'>"+jsonObj.aList[i].name+"</option>");
 				//追加option
 				$(selectId).append(opt);
 			}
 		},
 		error:function(){
 			alert("系统错误");
 		}
 	})
 }
 
 $(function(){
        loadOption('1',"#province");
	    getMySnacksAwardList();
		getMyInvestAwardList();
		
		$("#province").change(function(){
			var parentId = $(this).val();
			loadOption(parentId, "#mycity");
		})
		$("#mycity").change(function(){
			var parentId = $(this).val();
			loadOption(parentId, "#district");
		})
		
		$(".investmentrs").click(function(){
			var addren=encodeURIComponent(window.location.href);
			window.location.href=pathUrl+"/userInfo/nologin.do?refPath="+addren
		})
		
       $(".qtz").click(function(){window.location.href=pathUrl+"/loan/list.do"})
       setTimeout(function(){$("#alertmask").hide();$(".links_content").hide()},800)
      
      
       
 })
 
  $(function(){
	 var timer;
	 $(".invitation").mouseover(function(){ clearTimeout(timer); $(".link_content").stop().fadeIn();})
	 $(".invitation").mouseleave(function(){
		 timer=setTimeout(function(){
			   $(".link_content").stop().fadeOut();
		   },800)
	 })
   $(".link_content").hover(function(event){ 
	   clearTimeout(timer);
	   event.stopPropagation();
   },function(){
	   $(".link_content").stop().fadeOut();
	   event.stopPropagation();
   })
 if( $("#addressId").val()==""){
	 $(".default_address").eq(0).remove();
	 $(".default_address_con input").eq(0).remove();
	 $(".default_address input").attr("checked",'checked');
 }   
	 
$("#addressText").focus(function(){
	if($("#addressText").val()=="请输入详细地址"){
		$("#addressText").val("");
	}
	
})	 
 
 })
 