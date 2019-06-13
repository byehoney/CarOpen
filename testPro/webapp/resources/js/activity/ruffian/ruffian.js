/**
 * Created by 29059 on 2017/10/29.
 */
$(function(){
    var start_time="2017/11/07 00:00:00";
    var end_time = "2017/11/21 23:59:59";
    var doubleTimeBefore=new Date("2017/11/10 23:59:59").getTime();
    var doubleTimeAfter=new Date("2017/11/12 00:00:00").getTime();
    var curTime=$("#currentTime").val();
    var curHour=new Date(Number($("#currentTime").val())).getHours();//当前小时
    var timeArr1=[9,11,13,15,17];
    var timeArr2=[11,13];
    var actIndex=0;//当前时间轴前进的时间点
    var canGo=false;//判断是否在活动时间范围  false  不在   true 在
    var isNoStart=false;
    var isEnd=false;
    var tipShow=false;//错误提示显示状态
    var priceList=[5000,3000,1000,500,200,50];
    var classList=['gold','tv','sweeper','microWave','redPackBig','redPackLittle'];
    var giftList=['【20g 金条】','【55寸 小米电视】','【科沃斯扫地机】','【格兰仕微波炉】','【138 元现金红包】','【28 元现金红包】'];
    //项目卡片数据请求
    canInvest();
    if(isNoStart){
        $(".status").hide();
        $(".play_ball").show();
    }else{
        $.ajax({
            dataType:'json',
            type:'POST',
            url:basePath+'/ruffian/getRuffianLoanListForFirst.do',
            success:function(data){
                $(".play_ball").hide();
                if(data.code==1){
                    var proInfo=data.data.result.ruffianLoanListForFirst[0];
                    proId=proInfo.loanId;
                    if((curTime>doubleTimeBefore&&curTime<doubleTimeAfter)){//活动当天
                        $(".doubleElevenGoing").show();
                        $(".doubleElevenOut").hide();
                        $(".status").show();
                        timeAxis($(".doubleElevenGoing"),timeArr1,proInfo.STATUS,proInfo.borrowerInterest,proInfo.investRate,proInfo.loanId,proInfo.onlineTime,data.data.result.serverTime);
                    }else{
                        $(".doubleElevenGoing").hide();
                        $(".doubleElevenOut").show();
                        $(".status").show();
                        timeAxis($(".doubleElevenOut"),timeArr2,proInfo.STATUS,proInfo.borrowerInterest,proInfo.investRate,proInfo.loanId,proInfo.onlineTime,data.data.result.serverTime)
                    }
                }else{
                    errTip($(".err"),data.msg,2000)
                }
            }
        });
    }
    $.ajax({
        dataType:'json',
        type:'POST',
        data:{userId:$("#userId").val()},
        url:basePath+'/ruffian/convertRecordList.do',
        success:function(data){
            if(data.code==1){
                if(data.data.result.convertRecord.length){
                    var scrollStr="";
                    $(data.data.result.convertRecord).each(function(i,n){
                        scrollStr+='<li><span class="moreleft">'+n.mobile+'</span><span class="moreright">成功兑换'+n.tradePurpose+'</span></li>'
                    });
                    $(".notice ul").html(scrollStr);
                    if($(".notice li").size()>1){
                        $('#noticeBox').noticeScroll();
                    }
                }else{
                    $(".notice").hide();
                }
            }
        }
    });
    //立即兑换
    $(".prize_list.loginList .exchange").on("click",function(){
        canInvest();
        if(isNoStart){
            if(!tipShow){
                errTip($(".err"),'活动即将开始',2000);
            }
            return;
        }else if(isEnd){
            if(!tipShow){
                errTip($(".err"),'活动已结束',2000);
            }
            return;
        }
        var index=$(this).parents("li").index();
        var myGold=$("#myGold").val()?$("#myGold").val():0;
        if(myGold<priceList[index]){
            if(!tipShow){
                errTip($(".err"),'目前金币余额不足~',2000);
            }
        }else{
            $(".overlay").show();
            $(".sureExchangeBox").show();
            $(".sureExchangeBox .giftSuccessBox .gift").removeClass().addClass("gift").addClass(classList[index]);
            $(".sureExchangeBox .giftInfo").html('<p>您即将消耗 '+priceList[index]+' 枚金币兑换</p><p class="giftName">'+giftList[index]+'</p>');
            //点击取消兑换
            $(".sureExchangeBox .cancel").on("click",function(){
                $(".sureExchangeBox").hide();
                $(".overlay").hide();
                window.location.reload();
            });
            //点击确认兑换
            $(".sureExchangeBox .jumpAdd").on("click",function(){
                $(".sureExchangeBox").hide();
                $.ajax({
                   dataType:'json',
                    type:'POST',
                    url:basePath+'/ruffian/exchange/prize.do',
                    data:{
                        flag:$("#flag").val(),
                        userId:$("#userId").val(),
                        blance:$("#myGold").val(),
                        productNo:Number(index+1)
                    },
                    success:function(data){
                       if(data.code==0){
                           $(".login_gold em").html(data.data.blance);
                           if((data.data.userAddressFlag==0&&index<=3)){
                               $(".gitNoAddedBox").show();
                               $(".overlay").show();
                               $(".gitNoAddedBox .giftSuccessBox .gift").removeClass().addClass("gift").addClass(classList[index]);
                               $(".gitNoAddedBox .giftInfo").html('<p>您已成功兑换</p><p class="giftName">'+giftList[index]+'</p>');
                               $(".gitNoAddedBox .cancel").on("click",function(){
                                   $(".gitNoAddedBox").hide();
                                   $(".overlay").hide();
                                   window.location.reload();
                               });
                               $(".gitNoAddedBox .jumpAdd").on("click",function(){
                                   $(".gitNoAddedBox").hide();
                                   $(".overlay").hide();
                                   window.location.href=basePath+'/userAddress/toUserAddress.do?userId='+$("#userId").val()+'&flag='+$("#flag").val();
                               })
                           }else{
                               $(".giftAddedBox").show();
                               $(".overlay").show();
                               $(".giftAddedBox .giftSuccessBox .gift").removeClass().addClass("gift").addClass(classList[index]);
                               $(".giftAddedBox .giftInfo").html('<p>您已成功兑换</p><p class="giftName">'+giftList[index]+'</p><a class="giftCloseBtn">朕知道了</a><a class="jumpLink">查看收货地址</a>');
                               $(".giftAddedBox .giftCloseBtn").on("click",function(){
                                   $(".giftAddedBox").hide();
                                   $(".overlay").hide();
                                   window.location.reload();
                               });
                               $(".giftAddedBox .jumpLink").on("click",function(){
                                   $(".giftAddedBox").hide();
                                   $(".overlay").hide();
                                   window.location.href=basePath+'/userAddress/toUserAddress.do?userId='+$("#userId").val()+'&flag='+$("#flag").val();
                               })
                           }
                       }else if(data.code==8){
                           $(".overlay").hide();
                           if($("#flag").val()=='wap'){
                               var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
                               window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
                           }
                       }else{
                           // $(".overlay").hide();
                           errTip($(".err"),data.msg,2000);
                           setTimeout(function(){
                               window.location.reload();
                           },2100);
                       }
                    }
                });
            })
        }
    });
    //查看活动规则
    $(".regulation_btn").on("click",function(){
        $(".ruleMainBox").show();
        $(".overlay").show();
        $(".ruleMain").niceScroll().hide().show().resize();
        $("body").css({"overflow":"hidden",position:'fixed'});
    });
    //关闭活动规则
    $(".ruleCloseBtn").on("click",function(){
        $(".ruleMainBox").hide();
        $(".overlay").hide();
        $("body").css({"overflow":"auto",position:'relative'});
    });
    //滑动overlay的时候阻止滚动
    $(".overlay,.remind,.sureExchangeBox").on("touchmove",function(e){
        e.preventDefault();
    });

    //未登录状态点击  我的奖品 , 我的金币, 立即兑换 , 分享赚金币
    //未登陆点击我的金币
    $(".noLogin_gold").on("click",function(){
        canInvest();
       if(isNoStart){
           if(!tipShow){
               errTip($(".err"),'活动即将开始',2000)
           }
           return;
       }else{
           var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
           window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
       }
    });
    //未登陆点击分享赚金币
    $(".noLogin_share_btn").on("click",function(){
        canInvest();
        if(isNoStart){
            if(!tipShow){
                errTip($(".err"),'活动即将开始',2000)
            }
            return;
        }else{
            var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
            window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
        }
    });
    //未登录状态点击立即兑换
    $(".noLoginList .exchange").on("click",function(){
        canInvest();
        if(isEnd){
            if(!tipShow){
                errTip($(".err"),'活动已结束',2000)
            }
            return;
        }else if(isNoStart){
            if(!tipShow){
                errTip($(".err"),'活动即将开始',2000)
            }
            return;
        }else{
            var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
            window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
        }
    });
    //未登录状态下点击投资赚金币
    $(".noLogin_invest_btn,.login_invest_btn").on("click",function(){
        canInvest();
        if(isNoStart){
            if(!tipShow){
                errTip($(".err"),'活动即将开始',2000)
            }
            return;
        }else if(isEnd){
            if(!tipShow){
                errTip($(".err"),'活动已结束',2000)
            }
            return;
        }else{
            window.location.href = basePath+'/loan/list.do';
        }
    });

    //登陆状态下点击我的奖品
    $(".login_award_btn").on("click",function(){
        window.location.href=basePath+'/ruffian/ruffianAwardPage.do?userId='+$("#userId").val()+'&flag='+$("#flag").val();
    });
    //未登录状态下点我的奖品
    $(".noLogin_award_btn").on("click",function(){
        var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
        window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
    });

    //点击【立即抢】/【已结束】/【下一场xxxxxx后开始】(项目id待确认)
    $(".communal.going ,.communal.end, .communal.wait ").on("click",function(){
        // var proId=$(this).attr("data-loanId");
        window.location.href=basePath+'/loan/detail/'+proId+'.do';
    });
    //登陆后点击wap端分享赚金币
    $(".wap_login_share_btn").on("click",function(){
        canInvest();
        if(isNoStart){
            if(!tipShow){
                errTip($(".err"),'活动即将开始',2000)
            }
            return;
        }else{
            $(".remind").show();
            $(".overlay").show();
        }
    });
    //点击确认复制并关闭
    $(".remind .btn").on("click",function(){
        $(".remind").hide();
        $(".overlay").hide();
    });

    //错误提示弹窗
    function errTip(obj,info,dur){
        obj.show().html(info);
        tipShow=true;
        setTimeout(function(){
            tipShow=false;
            obj.html("").hide();
        },dur)
    }

    //活动是否开始弹窗
    function canInvest(){
        var now_time=$("#currentTime").val();
        var end_timed = Date.parse(new Date(end_time.replace(/-/g,"/")));      //活动结束时间
        var start_timed = Date.parse(new Date(start_time.replace(/-/g,"/")));  //活动开始时间
        end_timed = end_timed;
        start_timed=start_timed;
        if(now_time>end_timed){//未在活动时间范围
            isEnd=true;
        }else if(now_time<start_timed){
            isNoStart=true;
        }else{
            isNoStart=false;
            isEnd=false;
        }
    }
    //时间轴方法
    //el 控制时间轴 5个时间点  2个时间点
    //arr 时间数组   status:活动状态 rate:利率,progress进度条， loanId:项目id onlineTime:项目上线时间 serverTime:服务器时间
    function timeAxis (el,arr,status,rate,progress,loanId,onlineTime,serverTime) {
        $.each(arr,function(i, val) {
            if(val<=curHour){
                actIndex++;
                if(status){
                    el.find(".items").eq(i).removeClass("underway").addClass("finish");
                    el.find(".items").eq(i).removeClass("begin").addClass("finish");
                    el.find(".items").eq(i).removeClass("finish").addClass("finish");
                    el.find(".items").eq(i).find(".actText").html("已结束");
                }
            }
        });
        if(status==400||status==500||status==600){//已结束
            if(actIndex!=0){
                el.find(".items").eq(actIndex-1).removeClass().addClass("items fl finish");
                el.find(".items").eq(actIndex-1).find(".icon").addClass("finished_btn");
                el.find(".items").eq(actIndex-1).find(".actText").hide();
            }
            $(".communal.end").show();
            $(".end .progressbar_active").animate({width:(1*100)+'%'},1000);
            $(".end").attr("data-loanId",loanId)
        }else if(status==300){//进行中
            if(actIndex!=0){
                el.find(".items").eq(actIndex-1).removeClass().addClass("items fl underway");
                el.find(".items").eq(actIndex-1).find(".icon").addClass("underway_btn");
                el.find(".items").eq(actIndex-1).find(".actText").hide();
            }
            $(".communal.going").show();
            $(".going .rate").html(rate);
            $(".going .progressbar_active").animate({width:(progress*100)+'%'},1000);
            $(".going").attr("data-loanId",loanId)
        }else if(status==330){//待开始
            el.find(".items").eq(actIndex).removeClass().addClass('items fl begin');
            el.find(".items").eq(actIndex).find(".icon").addClass("initiate_btn");
            el.find(".items").eq(actIndex).find(".actText").hide();
            $(".communal.wait").show();
            $(".wait .progressbar_active").animate({width:(0*100)+'%'},1000);
            $(".wait").attr("data-loanId",loanId);
            var now_time=new Date(serverTime);
            var end_time=new Date(onlineTime.replace(/-/g,"/"));
            var timerX = setInterval(function(){
                now_time.setSeconds(now_time.getSeconds()+1);
                var str ='<span>下一场  '+countdown(end_time,now_time).slice(0,-4)+':'+countdown(end_time,now_time).slice(-4,-2)+
                    ':'+countdown(end_time,now_time).slice(-2)+' 后开始</span>';
                $('#advNotice').html(str);
            },1000);
        }

        canInvest();
        //如果上线时间大于当天的23:59:59
        if((new Date(onlineTime.replace(/-/g,"/"))>new Date(getDate(serverTime)))){
            $.each(arr,function(i, val) {
                el.find(".items").eq(i).removeClass("underway").addClass("finish");
                el.find(".items").eq(i).removeClass("begin").addClass("finish");
                el.find(".items").eq(i).removeClass("finish").addClass("finish");
                el.find(".items").eq(i).find(".actText").html("已结束").show();
            });
        }
        if(isEnd){
            $.each(arr,function(i, val) {
                el.find(".items").eq(i).removeClass("underway").addClass("finish");
                el.find(".items").eq(i).removeClass("begin").addClass("finish");
                el.find(".items").eq(i).removeClass("finish").addClass("finish");
                el.find(".items").eq(i).find(".actText").html("已结束").show();
                el.find(".items").eq(i).find(".icon").hide();
            });
        }
    }

    //倒计时
    function countdown(time_end,time_now){
        time_now = time_now||new Date();  // 获取当前时间

        var time_distance = time_end - time_now;  // 结束时间减去当前时间

        var int_day, int_hour, int_minute, int_second;
        if(time_distance <1000){location.href=location.href;}
        if(time_distance >= 0){
            // 天时分秒换算
            int_day = Math.floor(time_distance/86400000);
            time_distance -= int_day * 86400000;
            int_hour = Math.floor(time_distance/3600000);
            time_distance -= int_hour * 3600000;
            int_minute = Math.floor(time_distance/60000);
            time_distance -= int_minute * 60000;
            int_second = Math.floor(time_distance/1000);

            // 时分秒为单数时、前面加零站位
            int_hour = int_day*24+int_hour;
            if(int_hour < 10)
                int_hour = "0" + int_hour;
            if(int_minute < 10)
                int_minute = "0" + int_minute;
            if(int_second < 10)
                int_second = "0" + int_second;
            return ""+int_hour+int_minute+int_second;
        }
    };

    function getDate(ms) {
        var _date=new Date(ms);
        var _year=_date.getFullYear();
        var month=_date.getMonth()+1;
        var day=_date.getDate();

        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (day >= 0 && day <= 9) {
            day = "0" + day;
        }

        return _year+'/'+month+'/'+day+' 23:59:59';
    }

    //滚动条优化
    //自定义滚动条
    $(".ruleMain").niceScroll({
        cursorwidth:6,
        cursorcolor:'#49347d',
        cursorborder:'none',
        cursorborderradius:3,
        autohidemode:false,
        background:'#2e2050',
        railoffset:'top'
    })


    //解决刷新问题
    if ((/iphone|ipod|ipad.*os 5/gi).test(navigator.appVersion)) {
        window.onpageshow = function(event) {
            if (event.persisted) {
                window.location.reload()
            }
        };
    }else{
        onload=function(){
            var refreshedId=document.getElementById("refreshed");
            if(refreshedId.value=="no"){
                refreshedId.value="yes";
            } else{
                refreshedId.value="no";
                location.reload();
            }
        }
    }
    $(window).bind("unload", function() { });
});