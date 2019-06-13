$(function(){
	var userId=getadd('userId');
    var toolsFlag=true;
    var safeArr=['中再融携手贵州银行资金存管，账户安全又升级','中再生协会指定互联网金融平台，安心理财，值得托付','太平洋保险为中再融提供账户承保赔付服务'];
    //初始化总获奖记录
    $.ajax({
    	 url: rootUrl+'/financeHoliday518/getAllReward.do',
         type: 'GET',
         dataType: 'json',
         data:{userId:userId},
         success:function (rdata) {
        	 var data=rdata.data.resultMap.result;
        	 var lis='';
        	 if(data.length>0){
	        	 $.each(data,function(i,el){
	        		 lis += '<li>'+el+'</li>';
	        	 })
	        	 $('.rank_mask ul').append(lis);
        	 }else{
        		 $('.rank_mask').html('暂无获奖记录');
        	 }
         }
    })
    //初始化发财排行榜
    $.ajax({
    	 url: rootUrl+'/financeHoliday518/findRankingList.do',
         type: 'GET',
         dataType: 'json',
         data:{userId:userId},
         success:function (rdata) {
        	 var data=rdata.data.resultMap;
        	 if(data.code==1){
	        	 if(data.rankingList.length>0){
	        		 var str='';
	        		 $.each(data.rankingList,function(i,ele){
	        			 str+='<tr><td>'+(i+1)+'</td><td>'+ele.mobile+'</td><td>'+ele.hisTotalFortuneBag+'</td><td>'+fmoney(ele.investAmount,2)+'</td></tr>';
	        		 })
	        		 if(data.myselfInfo){
	        			 str+='<tr style="border: 2px solid #000;"><td>我的</td><td>'+data.myselfInfo.mobile+'</td><td>'+data.myselfInfo.hisTotalFortuneBag+'</td><td>'+fmoney(data.myselfInfo.investAmount,2)+'</td></tr>';
	        		 }
	        		 
	        		 $('.totalRank tbody').append(str);
	        	 }else{
	        		 $('.totalRank .undata').show();
	        	 }
	        	}else if(data.code==-3){
	        		$('.totalRank .undata').html('<span class="fl"></span>活动已结束<span class="fr"></span>').show();
	        	}
        	 }
    })
    //初始化个人获奖记录
	$.ajax({
	   	 url: rootUrl+'/financeHoliday518/getMyReward.do',
	        type: 'GET',
	        dataType: 'json',
	        data:{userId:userId},
	        success:function (rdata) {
	        var data=rdata.data.resultMap.result;
	       	 if(data.length>0){
	       		 var list='';
	       		 $.each(data,function(i,el){
	       			list += '<li class="clearfix"><span class="fl">'+el.createTime+'</span><span class="fr">'+el.welfare+'</span></li>'    
	       		 })
	       		 $('.prizesList ul').append(list);
	       	 }else{
	       		$('.prizesList').html('暂无获奖记录！').css({fontSize:'.18rem',lineHeight:'1.2rem'});
	       		$('.prizesAlert .jumpbtn').hide();
	       	 }
	        }
	   })
	   $('.tologin').click(function(){
		   var _host = rootUrl , encodeUrl = encodeURIComponent(window.location.href);
			window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
	   })
    var fnum = $('.fertilize .cur_count').text();
    var wnum = $('.watering .cur_count').text();
    var dnum = $('.disinsection .cur_count').text();
    if(fnum==0){
    	$('.fertilize .tools_btn').addClass('tools_unact');
    }
    if(wnum==0){
    	$('.watering .tools_btn').addClass('tools_unact');
    }
    if(dnum==0){
    	$('.disinsection .tools_btn').addClass('tools_unact');
    }
    $('.fertilize .tools_btn').on('click',function(){
    	if(fnum>0){
    		toolsBling('.fertilize .tools_btn','2');
    	}else{
    		$(this).addClass('tools_unact');
    	}
    })
    $('.watering .tools_btn').on('click',function(){
    	
    	if(wnum>0){
    		toolsBling('.watering .tools_btn','1');
    	}else{
    		$(this).addClass('tools_unact');
    	}
        
    })
    $('.disinsection .tools_btn').on('click',function(){
    	
    	if(dnum>0){
    		toolsBling('.disinsection .tools_btn','3');
    	}else{
    		$(this).addClass('tools_unact');
    	}
        
    })
  //获奖记录
    $('.prize_record .prizebtn').click(function(){
    	$('.prizesAlert').show();
      	showOverlay();
    })
    $('.prizesAlert .listClose').click(function(){
    	$('.prizesAlert').hide();
    	$("#overlay").hide();
    })

    //现金红包
    $('.redbtn').click(function(){
    	var redtype = $(this).data('redtype');
    	var operateType = $('#redType').val();
    	redPackage (redtype,operateType);
    	$('.redbtn').css({backgroundColor:'#959595'});
    	$('.redbtn').off('click');
    	setTimeout(function(){
    	$("#overlay").hide();
   	 	window.location.reload();
    	},2000)
    })
    //体验金
    $('.tyjbtn01').click(function(){
    	var useId = $(this).data('useid');
    	var expMoneyId = $(this).data('expmoneyid');
    	$.ajax({
    		url:rootUrl+"/experienceMoney/useExperience.do",
    		data:{useId:useId,expMoneyId:expMoneyId,userId:userId},
    		dataType:'JSON',
    		type:"GET",
    		cache:false,
    		success:function(rdata){
    			var data=rdata.data.resMap;
    			if(data.status==1){
    				$('.tyjbtn01').hide();
    				$('.tyj_txt').text("小确幸，限量版体验金又被您抽到啦！");
    				$('.tyjbtn03').show();
    			}else if(data.status==4){
    				$('.tyjbtn01').hide();
    				$('.tyj_txt').text("激活成功啦，赶快去投资领取收益吧！");
    				$('.tyjbtn02').show();
    			}else if(data.status==0){
    				$('.tyjAlert').hide();
    				infoTips('快去红包页使用吧');
    				setTimeout(function(){
    			   	 	window.location.reload();
    			    },2000)
    			}
    		},
    		error:function(){
    			alert('系统错误');
    		}
    	})
    })

    //关闭按钮
    $('.redClose').click(function(){
	  $('.redAlert').hide();
    	$("#overlay").hide();
   	 	window.location.reload();
    }) 
    $('.tyjClose,.tyjbtn03').click(function(){
    	$('.tyjAlert').hide();
    	$("#overlay").hide();
   	 	window.location.reload();
    })
   $('.jxClose').click(function(){
	   	$('.jxAlert').hide();
		$("#overlay").hide();
	 	window.location.reload();
   })
   $('.safeClose').click(function(){
	   	$('.safeAlert').hide();
		$("#overlay").hide();
	 	window.location.reload();
   })
    $('.shareBtn').click(function(){
	   	$('.safeAlert').hide();
	   var opertype=$('#safeType').val();
	   	redPackage ('6',opertype);
	   	$('.ewmAlert').show();
   })
    $('.ewmClose').click(function(){
	   	$('.ewmAlert').hide();
		$("#overlay").hide();
		window.location.reload();
   })
   
   $('.sj_down').click(function(){
        $('.rule_mask').slideToggle('slow');
        $(this).toggleClass('sj_up');
    }) 
    
    
  //现金红包 
     function redPackage (redType,operateType) {
        $.ajax({
            url: rootUrl+'/financeHoliday518/receiveRedPackage.do',
            type: 'POST',
            dataType: 'json',
            data: {
                redPackageType : redType,
                operateType : operateType,
                userId: userId
            },
            success:function (rdata) {
            	var data = rdata.data.resultMap.result;
                if (data) {
                	if(redType!=6){
                		$('.redAlert').hide();
                		infoTips('领取成功！');
                	}
                }else{
                	if(redType!=6){
                		infoTips('领取失败');
                	}
                };
            },
    		error:function(){
    			alert('系统错误')
    		}
        })
    }
//大树抽奖
	function luckyDraw (arg) {
	        $.ajax({
	            url: rootUrl+'/financeHoliday518/toLuckyDraw.do',
	            type: 'POST',
	            dataType: 'json',
	            data: {lotteryType: arg,userId: userId},
	            success:function (rdata) {
	            	var data=rdata.data.resultMap;
	            	if(data.code==3){
	            		if (data.tick=='1') {//红包福
			            	showOverlay();
			                $('.redAlert').show();
			                $('#redType').val(data.lotteryType);
		               }else if (data.tick=='2') {//加息
				            showOverlay();
			                $('.jxAlert').show();
		               }else if (data.tick=='3') {//体验金
				            showOverlay();
			                $('.tyjAlert').show();
			                $('.tyjbtn01').attr('data-expmoneyid',data.expMoneyId);
			                $('.tyjbtn01').attr('data-useid',data.useId);
		               }else if (data.tick=='4') {//安全
				            showOverlay();
				            var safeIndex = Math.floor(Math.random()*3);
				            $('.safetxt').html(safeArr[safeIndex]);
			                $('.safeAlert').show();
			                $('#safeType').val(data.lotteryType);
		               }
	            	}else if(data.code==2){
	            		infoTips('抽奖失败');
	            	}else if(data.code==1){
	            		infoTips('当前抽奖次数不够！');
	            		setTimeout(function(){
	            			window.location.reload();
	            		},2000)
	            	}else if(data.code==0){
	            		infoTips('缺少参数');
	            		setTimeout(function(){
	            			window.location.reload();
	            		},2000)
	            	}else if(data.code==5){
	            		var _host = rootUrl , encodeUrl = encodeURIComponent(window.location.href);
	        			window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
	            	}else if(data.code==6){
	            		infoTips('活动已结束！');
	            		setTimeout(function(){
	            			window.location.reload();
	            		},2000)
	            	}
	
	            },
	    		error:function(){
	    			alert('系统错误')
	    		}
	        });
	    }
    
    function toolsBling(ele,arg){
    	if(toolsFlag){
            toolsFlag=false;
            $(ele).addClass('tools_act');
            var toolsTimer=setInterval(function () {
                $(ele).prev().toggleClass('tools_bling');
            }, 500)
            
            treeShake();
            setTimeout(function(){
                clearInterval(toolsTimer);
                $('.tools_btn').removeClass('tools_act').prev().removeClass('tools_bling');
                luckyDraw(arg);
                toolsFlag=true;
            },3000)
        }
    }
    
    function  treeShake(){
        $('.tree_head').css({transform: 'rotate(1deg)'})
        $('.tree_redpack').css({transform: 'rotate(2deg)'});
        setTimeout(function(){
            $('.tree_head').css({transform: 'rotate(-1deg)'})
            $('.tree_redpack').css({transform: 'rotate(-2deg)'});
        },1000)
        setTimeout(function(){
            $('.tree_head').css({transform: 'rotate(0deg)'})
            $('.tree_redpack').css({transform: 'rotate(0deg)'});
        },2000)
    }
    
   
    $.fn.extend({
        noticeScroll : function(){
            var $this = $(this);
            var scrollTimer;
            var liHeight = 0.45;//每个li的高度
            var scrollSpace = 3000;//滚动时间间隙
            var scrollSpeed = 500;//滚动速度
            $this.hover(function(){
                clearInterval(scrollTimer);
            },function(){
                scrollTimer = setInterval(function(){
                    noticeScrollUp($this);
                }, scrollSpace );
            }).trigger("mouseout");

            function noticeScrollUp(obj){
                var $noticeContext = obj.find("ul:first");
                if($noticeContext.height()>obj.height()){
                    $noticeContext.animate({ "margin-top" : -liHeight +"rem" },scrollSpeed , function(){
                        $noticeContext.css({"margin-top":"0px"}).find("li:first").appendTo($noticeContext);
                    });
                }
            }
        }
    });
    $(".prize_rank").noticeScroll();

    function infoTips(tip){
    	showOverlay();
        $(".error_msg").html(tip).show();
        setTimeout(function  () {
            $(".error_msg").hide();
            $("#overlay").hide();
        }, 1500)
    }

    function showOverlay() {
        var pageHeight=$(document).height();
        var pageWidth=$(document).width();
        $("#overlay").height(pageHeight);
        $("#overlay").width(pageWidth);
        $("#overlay").show();
    }
    $("#overlay").on('touchmove',function(e){
    	e.preventDefault();
    })
    
//    金额千分位
    function fmoney(s, n){
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
  //app获取用户名
    function getadd(name){
         var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
         var r = window.location.search.substr(1).match(reg);
         if(r!=null)return  unescape(r[2]); return null;
    }
	
})
