$(function(){
//红包兑换
$('.convertBtnActive').live('click',function(){
	var code = $('.exeCode').val();
	if(code == ""){//若用户为未输入兑换码直接return
		$('.errorTips').css({"visibility":"visible"}).html('请输入兑换码');
		$('.exeCode').focus();
		$('.exeCode').attr('placeholder','');		
		return;
	};	
	$.ajax({		
		url:rootUrl+"/experienceMoney/convertExperience.do",
		data:{conversionCode:code},
		cache:false,
		dataType:'JSON',
		type:"POST",
		success:function(data){
			if(data.code==1){
				if(data.data.resMap.success){//兑换成功
					$('.exeCover,.successBox').show();
					setTimeout(function(){$('.exeCover,.successBox').hide();window.location.reload()},3000);
				}else{//兑换失败
					$('.errorTips').css({"visibility":"visible"}).html('兑换失败')
				};
			}else{
				$('.errorTips').css({"visibility":"visible"}).html(data.msg);
			}			
		},
		error:function(){
			alert('系统错误');
		}
	});
});
$('.exeCode').click(function(){
	$('.errorTips').css({"visibility":"hidden"});
});

//红包列表页新增模块代码
$('.carsh').eq(1).click(function(){ 
	 $('#crashModule').show();
	 $('#ExeModule').hide();
	 getCouponRecords(1);
	 $('#exeConList').empty();
});
$('.exeMoney').click(function(){
	  $('#crashModule').hide();
	 $('#ExeModule').show();
	 $('#exeConList').empty();	
	 $('#ExeModule span').eq(2).trigger('click');
});
$('.details_list span').click(function(){
	$(this).css({'background': 'rgb(0, 170, 233)','color': '#fff'})
	$('span',$(this).parent().siblings()).css({'color': '#00aae9','background':'rgb(246,246,246)'});
});
//体验金红包列表页

var initIndex1 = 1;//页码初始化
var initIndex2 = 1;//页码初始化
var initIndex3 = 1;//页码初始化
$('#exeRedList span').click(function(){
	$('#exeConList').html('');
	var id=$(this).attr('id');
	 initIndex1 = 1;//页码初始化
	 initIndex2 = 1;//页码初始化
	 initIndex3 = 1;//页码初始化
	$('.exeMore').show();
    if(id == 'noUse'){
        exeStatus = 0;
        getData(0,1)
    }else if(id == 'used'){
    	exeStatus = 1;
    	 getData(1,1)
    }else{
    	exeStatus = 2;
    	 getData(2,1)
    };    
   
});
//更多按钮交互

$('.exeMore').click(function(){
	if(exeStatus ==0){
		getData(0,initIndex1)
	}else if(exeStatus ==1){
		getData(1,initIndex2)
	}else{
		getData(2,initIndex3)
	}
	
});
function getData(exeStatus,initIndex){//获取数据
	var str = '';
	if(window.httpRequest){
		window.httpRequest.abort();    
	};
	window.httpRequest = $.ajax({
    	url:rootUrl + "/experienceMoney/experienceUseCondition.do",
    	data:{status:exeStatus,pageNum:initIndex,pageSize:4},
    	dataType:"JSON",
    	type:"POST",
    	cache:false,
    	success:function(json){
    		var data = json.data.resMap.useConditionList;
    		var sumNum = json.data.resMap.totalNum;
    		if(data.length==0){   				
    			if(exeStatus == 0){
    				str='<div class="no_xm">您没有未使用的红包</div>';
    			}else if(exeStatus == 1){
    				str='<div class="no_xm">您没有已使用的红包</div>';
    			}else{
    				str='<div class="no_xm">您没有已过期的红包</div>';
    			};           		
			}else{
				for(var i =0,len = data.length;i<len;i++){
    			
    				if(data[i].source==0){
            			var source = "系统奖励";
            		}else{
            			var source = "线下活动";
            		};
        			str += '<li id="listBox">'+						
    								'<div class="list_header">'+
    								'<span class="h_title">体验金红包(元)</span>'+
    								'<span class="h_money">有效期至 <em>'+data[i].endTime.substr(0,10)+'</em></span>'+
    							'</div>'+
    							'<div class="rules">'+					
    								'<div class="activity_title activity_money clearfix">'+
    									'<p class="money">'+data[i].money+'</p>'+
    									'<div>'+
    										'<span>'+data[i].validity+' 天</span>'+
    										'<p>来源：'+source+'</p>'+
    									'</div>'+
    								'</div>	'+				
    								'<span class="f_from">使用规则：'+data[i].rule+'</span>	'+												
    								'<div style="cursor:pointer;" class="use useIt" data-useId="'+data[i].useId+'"data-expMoneyId="'+data[i].expMoneyId+'">去使用</div>'+
    								'<div class="been_used"></div>'+
    								'<div class="been_past"></div>'+
    							'</div>'+
    						'</li>'	
    			};
    		};
    		$('#exeConList').append(str);
    		var liLen = $('#exeConList li').length;
    		if(liLen==sumNum){
    			$('.exeMore').hide();
    		};
    		if(exeStatus == 1||exeStatus == 2){
    	    	$('.activity_title').css('color','#999');
    	    	$('.use').hide();
    	    };
    	    if(exeStatus == 0){//使用按钮显示
    	    	$('.been_used,.been_past').hide();
    	    }else if(exeStatus == 1){//已使用图标显示
    	    	$('.been_past,.use').hide();
    	    }else if(exeStatus == 2){//已过期图标显示
    	    	$('.h_money,.been_used,.use').hide();
    	    };
    	    if(exeStatus == 0){
    	    	initIndex1++;
    	    }else if(exeStatus == 1){
    	    	initIndex2++;
    	    }else if(exeStatus == 2){
    	    	initIndex3++;
    	    };
    	},
    	error:function(){
    		alert('系统错误')
    	}
    });
};

//使用红包按钮
$('.useIt').live('click',function(){
	var useId = $(this).attr('data-useId');
	var expMoneyId = $(this).attr('data-expMoneyId');
	$.ajax({
		url:rootUrl+"/experienceMoney/useExperience.do",
		data:{useId:useId,expMoneyId:expMoneyId},
		dataType:'JSON',
		type:"POST",
		cache:false,
		success:function(data){
			var data = data.data.resMap
			if(data.status==4){
				$('.infoBox,.mark_box').show();
				$('.line1,.line2').html('');
				$('.line1').html('体验金红包使用成功');
				$('.line2').html('系统已为您自动计息');				
			}else if(data.status==1){
				$('.infoBox,.mark_box').show();
				$('.line1,.line2').html('');
				$('.line1').html('体验金正在计息时');
				$('.line2').html('不可同时使用其他体验金红包');
			}else if(data.status==0){
				$('.infoBox,.mark_box').show();
				$('.line1,.line2').html('');
				$('.line2').html('体验金使用失败');
			}else if(data.status==2){
				$('.infoBox,.mark_box').show();
				$('.line1,.line2').html('');
				$('.line2').html('该体验金红包已过期');
			}else if(data.status==3){
				$('.infoBox,.mark_box').show();
				$('.line1,.line2').html('');
				$('.line2').html('该体验金红包已使用');
			};			
		},
		error:function(){
			alert('系统错误')
		}
	});
});
$('.ensureBtn').click(function(){
	$('.infoBox,.mark_box').hide();
	$('#exeMoney').trigger('click');
});
$('.closeBtn').click(function(){
	window.location.href = rootUrl +"/index.do";
})
$(".exeCode").keyup(function(){
	var reg=/^[0-9a-zA-Z]*$/g.test($(this).val());
	if(!reg){$(this).val("")}
	if($(this).val().length>=8){
		$("#convertBtn").addClass('convertBtnActive');
	}else{
		$("#convertBtn").removeClass('convertBtnActive');
	}
	
})


})
	








