var tipShow=false;//错误提示是否在展示中
var isEnd=false;//活动是否结束
var isNoStart=false;//活动是否尚未开始
var zero=0;
var first=parseFloat($(".first").width());
var second=parseFloat($(".second").width());
var third=parseFloat($(".third").width());
var last=parseFloat($(".last").width());
var carve={
    count:0,//横向滚动初始num
    loginStatus:$("#loginStatus").val(),//登陆状态  1登陆  0未登录
    totalMoney:$("#totalMoney").val()/10000,//累计交易额(以万元为单位比较)
    investMoney:$("#investMoney").val(),//今日投资额
    todayMoney:$("#todayMoney").val(),//今日交易额
    getMoney:$("#getMoney").val(),//获得奖励
    totoalUserMoney:$("#totoalUserMoney").val(),//用户累计投资金额
    mySwiper:'',
    def_swipe_left:0,//初始滚动位置
    def_money:0,//初始获得金额
	def_state:0,//初始获得金额状态（ 0即将 、1瓜分）
    renderData:function(){
        // 设置zero的宽度获取go的初始位置
        // zero=$(".swiper-wrapper").width()/2;
        zero=$(window).width()/2;
        $(".zero").width(zero);
        $(".swiper-wrapper").width(zero+first+second+third+last+1000);
        //今日获得奖励轮播显示逻辑
        var loginStatus=$("#loginStatus").val();
        var totalMoney=$("#totalMoney").val();
        var investMoney=$("#investMoney").val();
        var todayMoney=$("#todayMoney").val();
        var getMoney=$("#getMoney").val();
        var totoalUserMoney=$("#totoalUserMoney").val();
        if(investMoney>0&&todayMoney>=2000000){
            $(".noticeBox .get").html(' <p>今日交易额：'+todayMoney+'元</p><p>获得奖励：'+getMoney+'元</p>')
        }else{
            $(".noticeBox .get").html(' <p>今日交易额：'+todayMoney+'元</p><p>获得奖励：未满足条件</p>')
        }
        if($(".noticeBox ul li").size()>1){
            $(".noticeBox").noticeScroll()
        }
        // 默认金额显示
        if(carve.loginStatus==0||carve.totoalUserMoney==0){
            if(carve.totalMoney<3000){
                $(".showMoney").html('即将瓜分76000元');
                $(".carve_count .num").html(carve.fmCurrency(76000));
                carve.def_money=carve.fmCurrency(76000);
            }else if(carve.totalMoney>=3000&&carve.totalMoney<5000){
                $(".showMoney").html('即将瓜分174000元');
                $(".carve_count .num").html(carve.fmCurrency(174000));
                carve.def_money=carve.fmCurrency(174000);
            }else if(carve.totalMoney>=5000){
                $(".showMoney").html('即将瓜分500000元');
                $(".carve_count .num").html(carve.fmCurrency(500000));
                carve.def_money=carve.fmCurrency(500000);
            }
        }else if(carve.loginStatus!=0||carve.totoalUserMoney!=0){
            if(carve.totalMoney<2000){
                $(".showMoney").html('即将瓜分'+carve.totoalUserMoney*0.38/100+'元');
                $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*0.38/100));
                carve.def_money=carve.fmUserCurrency(carve.totoalUserMoney*0.38/100);
            }else if(carve.totalMoney>=2000&&carve.totalMoney<3000){
                $(".showMoney").html('瓜分'+carve.totoalUserMoney*0.38/100+'元');
                $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*0.38/100));
                carve.def_money=carve.fmUserCurrency(carve.totoalUserMoney*0.38/100);
            }else if(carve.totalMoney>=3000&&carve.totalMoney<5000){
                $(".showMoney").html('瓜分'+carve.totoalUserMoney*0.58/100+'元');
                $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*0.58/100));
                carve.def_money=carve.fmUserCurrency(carve.totoalUserMoney*0.58/100);
            }else if(carve.totalMoney>=5000){
                $(".showMoney").html('瓜分'+carve.totoalUserMoney*1/100+'元');
                $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*1/100));
                carve.def_money=carve.fmUserCurrency(carve.totoalUserMoney*1/100);
            }
        }
        // 根据瓜分即将瓜分控制显示三角的颜色
        if($(".showMoney").html().indexOf("即将")!=-1){
            $(".present_carve").hide();
            $(".about_carve").show();
			carve.def_state=0;
        }else{
            $(".present_carve").show();
            $(".about_carve").hide();
            carve.def_state=1;
        }
        //瓜分进度显示逻辑
        carve.mySwiper = new Swiper ('.swiper-container', {
            freeMode : true,
            loop: false,
            spaceBetween : 0,
            freeModeMomentum:false,
            freeModeMomentumBounce:false,
            resistanceRatio:0,
            freeModeSticky:true,
            autoplayStopOnLast:true,
            slidesPerView :'auto',
            onInit:function(swiper){
                swiper.setWrapperTransition(1500);
                swiper.setWrapperTranslate(carve.getTranslate(zero,first, second, third, last));
                swiper.update(true);
                carve.def_swipe_left=Math.abs(carve.getTranslate(zero,first, second, third, last));
            },
            onTouchMove: function(swiper){
                //滑动时移除加的动画
                $(".arrow_btn").removeClass("animated bounce");
                //获取默认没有开始滑动时候的金额
                var oNum=parseFloat($(".carve_count .num").html().split(",").join(""));
                //你的事件
                var dis=Math.abs(swiper.translate);
                if(dis>carve.def_swipe_left+1){//滑动时指针指向
                    $(".arrow_btn").css("transform","rotate(90deg)")
                }else if(dis<carve.def_swipe_left-1){
                    $(".arrow_btn").css("transform","rotate(-90deg)")
                }else if(dis>carve.def_swipe_left-1||dis<carve.def_swipe_left+10){
                    $(".arrow_btn").css("transform","rotate(0deg)")
                }

                if(carve.loginStatus==0||carve.totoalUserMoney==0){
                    if(carve.totalMoney<2000){
                        if(dis<first+second){
                            $(".showMoney").html('即将瓜分76000元');
                            $(".carve_count .num").html(carve.fmCurrency(76000));
                        }else if(dis>=(first+second) && dis<(first+second+third) ){
                            $(".showMoney").html('即将瓜分174000元');
                            $(".carve_count .num").html(carve.fmCurrency(174000));
                        }else if(dis>=(first+second+third)){
                            $(".showMoney").html('即将瓜分5000000元');
                            $(".carve_count .num").html(carve.fmCurrency(500000));
                        }
                    }else if(carve.totalMoney>=2000&&carve.totalMoney<3000){
                        if(dis<first){
                            $(".showMoney").html('即将瓜分76000元');
                            $(".carve_count .num").html(carve.fmCurrency(76000));
                        }else if(dis<first+second){
                            $(".showMoney").html('即将瓜分76000元');
                            $(".carve_count .num").html(carve.fmCurrency(76000));
                        }else if(dis>=(first+second) && dis<(first+second+third) ){
                            $(".showMoney").html('即将瓜分174000元');
                            $(".carve_count .num").html(carve.fmCurrency(174000));
                        }else if(dis>=(first+second+third)){
                            $(".showMoney").html('即将瓜分5000000元');
                            $(".carve_count .num").html(carve.fmCurrency(500000));
                        }
                    }else if(carve.totalMoney>=3000&&carve.totalMoney<5000){
                        if(dis<first){
                            $(".showMoney").html('即将瓜分174000元');
                            $(".carve_count .num").html(carve.fmCurrency(174000));
                        }else if(dis<first+second){
                            $(".showMoney").html('即将瓜分174000元');
                            $(".carve_count .num").html(carve.fmCurrency(174000));
                        }else if(dis>=(first+second) && dis<(first+second+third) ){
                            $(".showMoney").html('即将瓜分174000元');
                            $(".carve_count .num").html(carve.fmCurrency(174000));
                        }else if(dis>=(first+second+third)){
                            $(".showMoney").html('即将瓜分5000000元');
                            $(".carve_count .num").html(carve.fmCurrency(500000));
                        }
                    }else if(carve.totalMoney>=5000){
                        if(dis<first){
                            $(".showMoney").html('即将瓜分500000元');
                            $(".carve_count .num").html(carve.fmCurrency(500000));
                        }else if(dis<first+second){
                            $(".showMoney").html('即将瓜分500000元');
                            $(".carve_count .num").html(carve.fmCurrency(500000));
                        }else if(dis>=(first+second) && dis<(first+second+third) ){
                            $(".showMoney").html('即将瓜分500000元');
                            $(".carve_count .num").html(carve.fmCurrency(500000));
                        }else if(dis>=(first+second+third)){
                            $(".showMoney").html('即将瓜分5000000元');
                            $(".carve_count .num").html(carve.fmCurrency(500000));
                        }
                    }
					if(dis<=carve.def_swipe_left){//如果滑动位置小于等于初始位置（向左滑保持数值不变）
                        $(".carve_count .num").html(carve.def_money);
					}
                }

                if(carve.loginStatus==1&&carve.totoalUserMoney!=0){
                    if(carve.totalMoney<2000){
                        if(dis<first+second){
                            $(".showMoney").html('即将瓜分'+carve.totoalUserMoney*0.38/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*0.38/100));
                        }else if(dis>=first+second&&dis<first+second+third){
                            $(".showMoney").html('即将瓜分'+carve.totoalUserMoney*0.58/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*0.58/100));
                        }else if(dis>=first+second+third){
                            $(".showMoney").html('即将瓜分'+carve.totoalUserMoney*1/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*1/100));
                        }
                    }else if(carve.totalMoney>=2000&&carve.totalMoney<3000){
                        if(dis<first){
                            $(".showMoney").html('瓜分'+carve.totoalUserMoney*0.38/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*0.38/100));
                        }else if(dis<first+second){
                            $(".showMoney").html('瓜分'+carve.totoalUserMoney*0.38/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*0.38/100));
                        }else if(dis>=first+second&&dis<first+second+third){
                            $(".showMoney").html('即将瓜分'+carve.totoalUserMoney*0.58/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*0.58/100));
                        }else if(dis>=first+second+third){
                            $(".showMoney").html('即将瓜分'+carve.totoalUserMoney*1/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*1/100));
                        }
                    }else if(carve.totalMoney>=3000&&carve.totalMoney<5000){
                        if(dis<first){
                            $(".showMoney").html('瓜分'+carve.totoalUserMoney*0.58/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*0.58/100));
                        }else if(dis<first+second){
                            $(".showMoney").html('瓜分'+carve.totoalUserMoney*0.58/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*0.58/100));
                        }else if(dis>=first+second&&dis<first+second+third){
                            $(".showMoney").html('瓜分'+carve.totoalUserMoney*0.58/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*0.58/100));
                        }else if(dis>=first+second+third){
                            $(".showMoney").html('即将瓜分'+carve.totoalUserMoney*1/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*1/100));
                        }
                    }else if(carve.totalMoney>=5000){
                        if(dis<first){
                            $(".showMoney").html('瓜分'+carve.totoalUserMoney*1/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*1/100));
                        }else if(dis<first+second){
                            $(".showMoney").html('瓜分'+carve.totoalUserMoney*1/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*1/100));
                        }else if(dis>=first+second&&dis<first+second+third){
                            $(".showMoney").html('瓜分'+carve.totoalUserMoney*1/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*1/100));
                        }else if(dis>=first+second+third){
                            $(".showMoney").html('瓜分'+carve.totoalUserMoney*1/100+'元');
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.totoalUserMoney*1/100));
                        }
                    }
                }
                // 根据瓜分即将瓜分控制显示三角的颜色
                if($(".showMoney").html().indexOf("即将")!=-1){
                    $(".present_carve").hide();
                    $(".about_carve").show();
                }else{
                    $(".present_carve").show();
                    $(".about_carve").hide();
                }
                if(dis<=carve.def_swipe_left){//如果滑动位置小于等于初始位置（向左滑保持数值不变）
                    if(carve.loginStatus==1&&carve.totoalUserMoney!=0){
                        if(carve.totalMoney>=2000){
                            $(".carve_count .num").html(carve.fmUserCurrency(carve.def_money));
                            $(".present_carve").show();
                            $(".about_carve").hide();
                        }
					}else{
                        $(".carve_count .num").html(carve.fmCurrency(carve.def_money));
					}
                }
                var mNum=parseFloat($(".carve_count .num").html().split(",").join(""));
                if(oNum!=mNum){
                    $(".carve_count>div").css('transform','scale(1.1)');
                    $(".carve_count>div").animate({transform:'scale(1.1)'},400,function(){
                        $(".carve_count>div").css('transform','scale(1)');
                    });
                }
            }
        });
	//获取加息券信息(不在活动范围，在活动范围)
		carve.canInvest();
		if(isNoStart){
			$(".rate_coupon ").show().addClass("noStartCoupon");
			$(".rate_coupon .immediate_pic3").show();
		}else if(isEnd){
            $(".rate_coupon ").show().addClass("isEndCoupon");
            $(".rate_coupon .immediate_pic3").show();
		}else{
            carve.getTicketInfo();
		}

    //    加息券动画
		setTimeout(function(){
            carve.fly();
		},800);
        setTimeout(function(){
            //箭头抖动
            $(".arrow_btn").addClass("animated bounce");
        },2000)
    },
    getTranslate:function(zero,first,second,third,last){//获取初始时滚动的距离
        var defDis=$(".swiper-container").width()/2;//屏幕一半的距离
        if(carve.totalMoney<=2000&&carve.totalMoney>0){
            return (((carve.totalMoney*first/2000))*-1);
        }else if(carve.totalMoney<=0){
            return 0
        }else if(carve.totalMoney<=3000&&carve.totalMoney>2000){
            return ((carve.totalMoney*(first+second)/3000))*-1
        }else if(carve.totalMoney>3000&&carve.totalMoney<=5000){
            return ((carve.totalMoney*(first+second+third)/5000))*-1
        }else if(carve.totalMoney>5000){
            return ((first+second+third+(last/4)))*-1;
        }
    },
    //格式化成钱币格式
    fmCurrency: function (num) {
		num = num.toString().replace(/$|\,/g,'');
		if(isNaN(num))
			num = "0";
		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num*100+0.50000000001);
		cents = num%100;
		num = Math.floor(num/100).toString();
		if(cents<10)
			cents = "0" + cents;
		for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
			num = num.substring(0,num.length-(4*i+3))+','+
				num.substring(num.length-(4*i+3));
		return (((sign)?'':'-') + num);
	},
    //格式化成钱币格式
    fmUserCurrency: function (num) {
        num = num.toString().replace(/$|\,/g,'');
        if(isNaN(num))
            num = "0";
        sign = (num == (num = Math.abs(num)));
        num = Math.floor(num*100+0.50000000001);
        cents = num%100;
        num = Math.floor(num/100).toString();
        if(cents<10)
            cents = "0" + cents;
        for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
            num = num.substring(0,num.length-(4*i+3))+','+
                num.substring(num.length-(4*i+3));
        return (((sign)?'':'-') + num + '.' + cents);
    },
    fly:function(){
		$(".rate_coupon").animate({
			top:'50%'
		},800)
	},
    getTicketInfo:function(){
		var userId=$("#userId").val();
		var token=carve.getadd('token');
		var flag=$("#flag").val();
		var data={};
		if(flag=='mobile'){
			data={
				userId:userId,
				token:token,
				flag:flag
			}
		}else{
            data={
                flag:flag
            }
		}
		$.ajax({
			dataType:'json',
			type:'POST',
			url:basePath+'/doubleDan/getReceiveCouponStatus.do',
			data:data,
			success:function(res){
				if(res.code==1){
					var couponStatus=Number(res.data.result.couponStatus);
					if(res.data.result.loginStatus==0){//用户未登陆
						$(".rate_coupon .immediate_pic0").show();
						$(".rate_coupon .usage_btn").hide();
						if(flag=='wap'){
                            $(".rate_coupon").addClass("noLoginWapCoupon");
						}else if(flag=='mobile'){
                            $(".rate_coupon").addClass("noLoginMobileCoupon");
						}
					}else{
                        $(".rate_coupon").attr("data-tid",res.data.result.redPackageId);
						if(couponStatus==-10){//10%未领取
                            $(".immediate_pic3").show();
                            $(".immediate_pic2").hide();
                            $(".immediate_pic1").hide();
                            $(".rate_coupon .usage_btn").hide();
                            $(".rate_coupon").attr("data-rateNum","-10");
						}else if(couponStatus==10){//10%已领取
                            $(".immediate_pic3").show();
                            $(".immediate_pic2").hide();
                            $(".immediate_pic1").hide();
                            $(".rate_coupon .usage_btn").show();
                            $(".rate_coupon").attr("data-rateNum","10");
						}else if(couponStatus==-8){//8%未领取
                            $(".immediate_pic2").show();
                            $(".immediate_pic3").hide();
                            $(".immediate_pic1").hide();
                            $(".rate_coupon .usage_btn").hide();
                            $(".rate_coupon").attr("data-rateNum","-8");
                        }else if(couponStatus==8){//8%已领取
                            $(".immediate_pic2").show();
                            $(".immediate_pic3").hide();
                            $(".immediate_pic1").hide();
                            $(".rate_coupon .usage_btn").show();
                            $(".rate_coupon").attr("data-rateNum","8");
                        }else if(couponStatus==-5){//5%未领取
                            $(".immediate_pic1").show();
                            $(".immediate_pic2").hide();
                            $(".immediate_pic3").hide();
                            $(".rate_coupon .usage_btn").hide();
                            $(".rate_coupon").attr("data-rateNum","-5");
                        }else if(couponStatus==5&&res.data.result.packageStatus==0){//5%已领取
                            $(".immediate_pic1").show();
                            $(".immediate_pic2").hide();
                            $(".immediate_pic3").hide();
                            $(".rate_coupon .usage_btn").show();
                            $(".rate_coupon").attr("data-rateNum","5");
                        }else if(couponStatus==5&&res.data.result.packageStatus==1){//如果5%的已领取且使用，今天的券全部领完
							$(".immediate_pic1").hide();
                            $(".immediate_pic2").hide();
                            $(".immediate_pic3").show();
                            $(".rate_coupon .usage_btn").hide();
                            $(".rate_coupon").attr("data-rateNum","0");
						}
                        var couponState=parseInt($(".rate_coupon").attr("data-rateNum"));
                        if(flag=='wap'){
                        	if(couponState<0){
                                $(".rate_coupon").addClass("loginCoupon");
							}else if(couponState>0){
                                $(".rate_coupon").addClass("loginWapCoupon");
							}else if(couponState==0){
                                $(".rate_coupon").addClass("noChanceCoupon");
							}
                        }else if(flag=='mobile'){
                            if(couponState<0){
                                $(".rate_coupon").addClass("loginCoupon");
                            }else if(couponState>0){
                                $(".rate_coupon").addClass("loginMobileCoupon");
                            }else if(couponState==0){
                                $(".rate_coupon").addClass("noChanceCoupon");
                            }
                        }
					}
				}
			}
		})
	},
    //app获取app还是wap
    getadd:function (flag){
		var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if(r!=null)return  unescape(r[2]); return null;
	},
    errTip:function(obj,info,dur){//错误提示弹窗
		obj.show().html(info);
		tipShow=true;
		setTimeout(function(){
			tipShow=false;
			obj.html("").hide();
		},dur)
	},
    //活动是否开始弹窗
    canInvest:function (){
		var now_time=$("#currentTime").val();
		var start_time=$("#campaignStartTime").val();
		var end_time =$("#campaignEndTime").val();
		if(now_time>end_time){//未在活动时间范围
			isEnd=true;
		}else if(now_time<start_time){
			isNoStart=true;
		}else{
			isNoStart=false;
			isEnd=false;
		}
	},
    isWx:function(){
        var ua = window.navigator.userAgent.toLowerCase();
        if(ua.match(/MicroMessenger/i) == 'micromessenger'){
            return true;
        }else{
            return false;
        }
    },
    bindEvent:function(){
        $(".arrow_btn").on("click",function(){
            carve.mySwiper.setWrapperTransition(800);
            carve.mySwiper.setWrapperTranslate(carve.getTranslate(zero,first, second, third, last));
            $(".arrow_btn").css("transform","rotate(0deg)");
            $(".carve_count .num").html(carve.def_money);
            if(carve.def_state==0){
                $(".present_carve").hide();
                $(".about_carve").show();
			}else if(carve.def_state==1){
                $(".present_carve").show();
                $(".about_carve").hide();
			}
        });
        //活动未开始显示加息券点击提示
		$(".egg_pair_b").on("click",'.noStartCoupon',function(){
			carve.errTip($(".err"),'活动即将开始',2000);
		});
        //活动已结束显示加息券点击提示
        $(".egg_pair_b").on("click",'.isEndCoupon',function(){
            carve.errTip($(".err"),'活动已结束',2000);
        });
        //今天没有机会点击领取加息券
        $(".egg_pair_b").on("click",'.noChanceCoupon',function(){
        	carve.errTip($(".err"),'没有机会了，请明日再来！',2000)
		});
        //未登陆点击领取加息券
		$(".egg_pair_b").on("click",'.noLoginWapCoupon',function(){
            var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
            window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
		});
		//登陆后点击已经领取的加息券跳转到投资列表页面
		$(".egg_pair_b").on("click",'.loginWapCoupon',function(){
            carve.canInvest();
            if(isNoStart){
                carve.errTip($(".err"),'活动即将开始',2000);
                return;
            }else if(isEnd){
                carve.errTip($(".err"),'活动已结束',2000);
                return;
            }
            window.location.href = basePath+'/loan/list.do';
		});
		$(".egg_pair_b").off("click",'.loginCoupon').on("click",'.loginCoupon',function(){//领取加息券
			carve.canInvest();
			if(isNoStart){
				carve.errTip($(".err"),'活动即将开始',2000);
				return;
			}else if(isEnd){
                carve.errTip($(".err"),'活动已结束',2000);
                return;
			}
			var userId=$("#userId").val();
			var token=carve.getadd('token');
			var flag=$("#flag").val();
			var redPackageId=$(this).attr("data-tid");
			var data={};
			var rate=Math.abs(Number($(this).attr("data-rateNum")));
			if(flag=='mobile'){
				data={
					userId:userId,
					token:token,
					flag:flag,
					redPackageId:redPackageId
				}
			}else{
				data={
					flag:flag,
					redPackageId:redPackageId
				}
			}
			$.ajax({
				dataType:'json',
				type:'POST',
				url:basePath+'/doubleDan/receiveCoupon.do',
				data:data,
				success:function(res){
					if(res.code==1){
						if(res.data.result.status==1){//领取成功
							$(".overlay").show();
							$(".tic_pop_contaienr").show().find(".rate em").html(rate);
							if(rate==10){
								$(".tic_pop_contaienr .limit").html("仅限投资2万元使用");
							}else{
								$(".tic_pop_contaienr .limit").html("投资任意金额使用");
							}
							if(flag=='wap'){
								$(".tic_pop_contaienr .ticBtn").removeClass("mobileTicBtn").addClass("wapTicBtn");
							}else if(flag=='mobile'){
								$(".tic_pop_contaienr .ticBtn").removeClass("wapTicBtn").addClass("mobileTicBtn");
							}
						}else if(res.data.result.status==0){//已领取
							//您已经领取过了哦~
							carve.errTip($(".err"),'您已经领取过了哦~',2000);
							setTimeout(function(){
                                if(carve.isWx()){//解决微信不能不能刷新重新请求数据
                                    window.location.href=window.location.href+"&ref="+10000*Math.random();
                                }else{
                                    window.location.reload();
                                }
							},2000)
						}
					}else{
						carve.errTip($(".err"),res.msg,2000)
					}
				}
			})

		});
        //关闭加息券
        $(".tic_pop_contaienr .closeBtn").on("click",function(){
            $(".overlay").hide();
            $(".tic_pop_contaienr").hide();
            if(carve.isWx()){//解决微信不能不能刷新重新请求数据
                window.location.href=window.location.href+"&ref="+10000*Math.random();
            }else{
                window.location.reload();
            }

        });
        //未登录点击邀请好友
		$(".rewards_pic.noLoginFriendBtn").on("click",function(){
            var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
            window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
		});
		//登陆以后点击邀请好友
        $(".rewards_pic.loginFriendBtn").on("click",function(){
            var token=carve.getadd('token');
            var flag=$("#flag").val();
            if(flag=='wap'){
                window.location.href=basePath+"/doubleDan/inviteFriends.do?flag="+$("#flag").val()+'&userId='+$("#userId").val()+'&yqm='+$("#userInvitationCode").val();
			}else if(flag=='mobile'){
                window.location.href=basePath+"/doubleDan/inviteFriends.do?flag="+$("#flag").val()+'&userId='+$("#userId").val()+'&yqm='+$("#userInvitationCode").val()+'&token='+token;
			}
		});
		//领取加息券后点击去投资
		$(".tic_pop_contaienr").on("click",'.wapTicBtn',function(){
            window.location.href = basePath+'/loan/list.do';
		});
		//点击活动规则
		$(".rule_btn").on("click",function(){
			window.location.href=basePath+'/doubleDan/ruleSet.do';
		});
		//遮罩出现后禁止屏幕滚动
		$(".overlay,.tic_pop_contaienr").on("touchmove",function(e){
			e.preventDefault();
		})
    },
    init:function(){
        this.renderData();
        this.bindEvent();
    }
};
$(function(){
    // //解决刷新问题
    // if ((/iphone|ipod|ipad.*os 5/gi).test(navigator.appVersion)) {
    //     window.onpageshow = function(event) {
    //         if (event.persisted) {
    //             window.location.reload()
    //         }
    //     };
    // }else{
    //     onload=function(){
    //         var refreshedId=document.getElementById("refreshed");
    //         if(refreshedId.value=="no"){
    //             refreshedId.value="yes";
    //         } else{
    //             refreshedId.value="no";
    //             location.reload();
    //         }
    //     }
    // }
    // $(window).bind("unload", function() { });
    carve.init();
});
