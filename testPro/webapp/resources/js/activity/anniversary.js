/**
 * 周年庆wap
 */
$(document).ready(function(){
	var clickone=true;
	var clickten=true;
	var userid=getadd('userId');
	var invitcode=$('#invitcode').val();//邀请码
	//初始化成交额
	$.ajax({
	    type: "POST",
	    url: environment.basePath+"/anniversary/shareMillionBonus.do" ,
	    dataType : 'json',
	    data:{userId:userid},
	    success: function(data){
	    	 var resultdata = data.data.resultMap;
	    	  $("#bonusAmount").html(fmoney(resultdata.bonusAmount,2)+' 元');
	    	  $("#splitAmount").html(fmoney(resultdata.splitAmount,2)+' 元');
	    	  $("#turnOver").html('￥<em>'+fmoney(resultdata.turnOver,2)+'</em>');
	     },
         error: function() {
             alert("服务器忙！");
         }
	});
	//活动时间内
	var nowDay=$('#nowDate').val();
	if(nowDay<1493049600000){	
			//抽奖一次
			$(".draw_big").click(function(){
				if(clickone==true){
					clickone=false;
					tick(1);
					setTimeout(function(){clickone=true},3000)
				}else{
					alert('您操作太过频繁')
				}
				
			})
			
			//抽奖10次
			$(".smoke_big").click(function(){
				if(clickten==true){
					clickten=false;
					tick(10);
					setTimeout(function(){clickten=true},3000)
				}else{
					alert('您操作太过频繁')
				}
				
			});
			
			//确定按钮隐藏弹窗
			$(".deno").click(function(){
				$("#inv_code,#red_day,#obtain_ten,#red_one,.alertmask").hide();
			})
			
			//365大礼包
			$(".gift365").click(function(){
				if($(".gift365").hasClass("gift_gray")){
					$("#inv_code,.alertmask").show();
				}else{
					$.ajax({
					    type: "POST",
					    url: environment.basePath+"/anniversary/thanksgivingSendRed.do" ,
					    dataType : 'json',
					    data:{userId:userid},
					    async:false,
					    success: function(data){
					    	var rdata = data.data.resultMap;
					    	if(rdata.code==0){
					    		var encodeUrl = encodeURIComponent(window.location.href);
								window.location.href = environment.basePath+ '/userInfo/nologin.do?refPath=' + encodeUrl;
					    	}else if(rdata.code==1){
					    		$("#inv_code,.alertmask").show();
						    	$(".gift365").addClass("gift_gray").text("已领取365元投资大礼包");
					    	}else if(rdata.code==404){
					    		alert('404系统异常');
					    	}else if(rdata.code==-4){
					    		$("#inv_code,.alertmask").show();
					    		$(".gift365").addClass("gift_gray").text("已领取365元投资大礼包");
					    	}else if(rdata.code==-3||rdata.code==-2){
					    		alert('活动已结束！')
					    	}else{
					    		alert('请稍后再试！')
					    	}
					     },error: function() {
			                 alert("服务器忙！");
			             }
					});
				}
				anniversaryShare(invitcode);});
			//天天领红包
			$("#ceoRed").click(function(){
				if($("#ceoRed").hasClass("receive_icon")){
					alert('明日再来领取!');
				}else{
					$.ajax({
					    type: "POST",
					    url: environment.basePath+"/anniversary/ceoRed.do" ,
					    dataType : 'json',
					    data:{userId:userid},
					    success: function(data){
					    	var rdata = data.data.resultMap;
					    	if(rdata.code==0){
					    		var encodeUrl = encodeURIComponent(window.location.href);
								window.location.href = environment.basePath+ '/userInfo/nologin.do?refPath=' + encodeUrl;
					    	}else if(rdata.code==1){
					    		$("#red_day,.alertmask").show();
					    		$("#ceoRed").addClass("receive_icon");
					          	   $("#red_day li img").attr({src:environment.basePath+"/resources/image/activity/anniversary/large4.png"});
					          	   $("#red_day li p").html('获得20元红包').css({fontSize:".26rem"});
					    	}else if(rdata.code==-4){
					    		alert('明日再来领取!');
					    		$("#ceoRed").addClass("receive_icon");
					    	}else if(rdata.code==-3||rdata.code==-2){
		                    	  alert("活动已结束!");
		                     }else if(rdata.code==404){
					    		alert('404系统异常');
					    	}else{
					    		alert('请稍后再试！');
					    	}
					     },error: function() {
			                 alert("服务器忙！");
			             }
					});
				}
			});
			
			//查看奖励记录
			$(".record span").click(function(){
					var i=$(".record span").index($(this));
					$(this).removeClass("active").siblings().addClass("active");
					$(".activities_reward table").hide().eq(i).fadeIn();
					
					if(i==0){
						$("#cashmoney").nextAll().remove();
						cashmoney();
					}else{
						$("#invitations").nextAll().remove();
						invitations();
					}
			});	
	}else{
		$('#tickcount').html('0');
		//抽奖按钮、365、ceo
		$(".draw_big,.smoke_big,.gift365,#ceoRed").click(function(){alert('活动已结束');return false;});
		//查看奖励记录
		$(".record span").click(function(){
				var i=$(".record span").index($(this));
				$(this).removeClass("active").siblings().addClass("active");
				$(".activities_reward table").hide().eq(i).fadeIn();
		});
	}
	//狂欢节灯光闪烁
	setInterval(function () {
   		$('.lantern_icon').toggleClass('lantern_switch');
   }, 500)
   
	//CEO的信三角切换
   $('.scroll_right').click(function(){
		$('.scroll_right').toggleClass('scroll_r');
	})
	//CEO的信
	$(".scroll_right").toggle(function(){
		var h=$('.letterWrap').height();
		$("#letter_txt").animate({height:h})
	},function(){
		$("#letter_txt").animate({height:"2.4rem"})
		
	})
	
	//邀请好友记录显示
	if($(".Log_view").attr("datauser")!=""){
		cashmoney();
	}


	//立即抽奖/连抽十次
	function tick (num) {
		$.ajax({
          type : "POST",
          url : environment.basePath+"/anniversary/luckyDraw.do",
          dataType : 'json',
          cache : false,
          data : {
          	"tickCount" : num,
          	userId : userid
          },
          success : function(data) {
             var resultdata = data.data.resultMap;
             if(resultdata.logintStatus==1){
            	 var encodeUrl = encodeURIComponent(window.location.href);
					window.location.href = environment.basePath + '/userInfo/nologin.do?refPath=' + encodeUrl;
             }else if(resultdata.code=='-2'){
          	   if(num==1){
          		   $(".investment_chance").show();
              	   setTimeout(function () {
        				 $(".investment_chance").hide();
        			 }, 1000)
          	   }else{
          		   $(".Lottery_chance").show();
              	   setTimeout(function () {
          			$(".Lottery_chance").hide();
          			 }, 1000)
          	   }
             }else if(resultdata.code=='0'){
            	   alert('您操作太过频繁')
             }else if(resultdata.lottery.length==1){
          	   $("#red_one").show();
          	   $(".alertmask").show();
          	   $("#red_one li img").attr({src:environment.basePath+"/resources/image/activity/anniversary/large"+resultdata.lottery+".png"});
          	   $("#red_one li p").html('获得'+money(resultdata.lottery)+'元红包');
          	   $("#tickcount").html(resultdata.balanceTickCount)
             }else if(resultdata.lottery.length>1){
            	 $("#obtain_ten").show();
            	 $(".alertmask").show();
            	var html = '';
        		var n = 0;
          	   var tickarr = resultdata.lottery.split(',');
          	   $.each(tickarr,function(i,ele){
          		   html += '<li><img src="'+environment.basePath+'/resources/image/activity/anniversary/big_'+ele+'.png" width="98" height="137" alt=""/><div>恭喜您</div><p>'+money(ele)+'元红包</p>';
          		   n += money(parseInt(ele));
          	   });
          	   $("#obtain_ten ul").html(html);
          	   $("#sum_money").html(n);
          	   $("#tickcount").html(resultdata.balanceTickCount)
             }else if(data.success==fail){
            	 alert('请稍后再试！')
             }
          },
          error: function() {
              alert("服务器忙！");
          }
      });
	}

function money(m){
	var num='';
	if(m==1){
		num=1;
	}else if(m==2){
		num=5;
	}else if(m==2){
		num=5;
	}else if(m==3){
		num=10;
	}else if(m==4){
		num=20;
	}else if(m==5){
		num=50;
	}else if(m==6){
		num=100;
	}
	   return num;
}
//金额数字分隔
function fmoney(s, n)
{
  n = n > 0 && n <= 20 ? n : 2;
  s = parseFloat((s + '').replace(/[^\d\.-]/g, '')) + '';
  var l = s.split('.') [0].split('').reverse(),
  r = s.split('.') [1];
  var t = '';
  for (var i = 0; i < l.length; i++)
  {t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? ',' : '');}
  if (!r) { r = '0'; }
  if (r.length < n) {for (var i = r.length; i < n; i++) {r += '0';}}else{ r=r.substr(0,n);}
  return t.split('').reverse().join('') + '.' + r;
}
//现金奖励
function invitations(){
	$.ajax({
	    type: "POST",
	    url: environment.basePath+"/anniversary/getMoneyRewards.do" ,
	    dataType : 'json',
	    data:{userId:userid},
	    success: function(data){
	    	var rdata = data.data.resultMap;
	    	if(rdata.logintStatus==1){
//	    		var encodeUrl = encodeURIComponent(window.location.href);
//				window.location.href = environment.basePath+ '/userInfo/nologin.do?refPath=' + encodeUrl;
	    	}else if(rdata.code==404){
		    	 alert("404系统异常");
		    	 return;
		     }
		      var html="";
		      if(rdata.result.length>0){
	               for(var i=0; i<rdata.result.length; i++){
	           		html+="<tr><td>"+rdata.result[i].investTime+"</td><td>"+rdata.result[i].investAmount+"</td><td>"+rdata.result[i].termCount+"</td><td>"+rdata.result[i].awardAmount+"</td></tr>";
	               } 
		    	}else{
		    		html+="<tr><td class='goloan' colspan='4' style='width:100%;cursor: pointer;' ><a href='"+environment.basePath+"/loan/list.do' style='color:#fff;text-decoration: underline;'>您还未获得奖励，立即去投资吧！</a></td></tr>";
		    	}						
	           $("#invitations").after(html);
	    	},
         error: function() {
             alert("服务器忙！");
         }
	});
}
//邀请记录
function cashmoney(){
	$.ajax({
	    type: "POST",
	    url: environment.basePath+"/anniversary/findCallingFriendsRecords.do" ,
	    dataType : 'json',
	    data:{userId:userid},
	    success: function(data){
	    	var rdata = data.data.resultMap;
	    	if(rdata.code==0){
//	    		var encodeUrl = encodeURIComponent(window.location.href);
//				window.location.href = environment.basePath+ '/userInfo/nologin.do?refPath=' + encodeUrl;
	    	}else if(rdata.code==404){
		    	 alert("404系统异常");
		    	 return false;
		     }else if(rdata.code==1){
		      var html="";
		      if(rdata.myInvitationRecords.length>0){
		    	   var tolmoney;
	               var cash;
	               for(var i=0; i<rdata.myInvitationRecords.length; i++){ 
			    	   if(rdata.myInvitationRecords[i].investAmount>0){
			    		   tolmoney=rdata.myInvitationRecords[i].investAmount;
			    		   cash=rdata.myInvitationRecords[i].packageMoney;
			    	   }else{
			    		   tolmoney="未获得";
			    		   cash="未获得";
			    	   }
	           		 html+="<tr><td>"+rdata.myInvitationRecords[i].mobile+"</td><td>"+ tolmoney +"</td><td>"+cash+"</td></tr>";
	               } 
		    	}else{
		    		 html+="<tr><td colspan='3' style='width:100%;cursor: pointer;text-decoration: underline;' ><span class='yqfriend'>您暂未邀请好友，快去邀请好友吧！</span></td></tr>";
		    	}						
	           $("#cashmoney").after(html);
	           $('.yqfriend').click(function(){
	        		$('body,html').animate({ scrollTop:$('#inves_on').offset().top+"px"},800);
	        	})
			  }else{
				  alert('请稍后再试！')
			  }
	    	},
         error: function() {
             alert("服务器忙！");
         }
	});
}
//app获取用户名
function getadd(name){
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
} 
$('.wxewm').click(function(){
	anniversaryShare(invitcode);
})

//app获取分享链接
function anniversaryShare(inviteCode){
    var url = "/weChatAnniversary/oauth.shtml?inviteCode="+inviteCode+"&userType=2";
	window.anniversary.anniversaryShare(url);
}

})