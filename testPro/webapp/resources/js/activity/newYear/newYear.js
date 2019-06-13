/**
 * Created by 29059 on 2018/1/22.
 */
$(function () {
    var isEnd=false;
    var isNoStart=false;
    var isFeeding=false;
    var dis=0;
    var limitTime=1518364799000;
    if($("#loginStatus").val()==1&&$("#currentTime").val()<limitTime&&$("#popupFlag").val()==0){
        $(".overlay").show();
        $(".limitPop").show();
    }
    //进入页面判断今日是否喂猫
    var userId=$("#userId").val();
    var flag=$("#flag").val();
    var token=getadd("token");
    if(flag=="mobile"){
        var data={userId:userId,token:token,flag:flag};
    }else{
        var data={userId:userId,flag:flag};
    }
    $.ajax({
        type:'POST',
        dataType:'json',
        url:basePath+'/newYearActivity/getRedPackageStatus.do',
        data:data,
        success:function(res){
            console.log(res);
            if(res.code==1){
                if(res.data.result.loginStatus==0){
                    $(".noFeed").show();
                    $(".haveFeed").hide();
                    $(".cat").attr("src",basePath+'/resources/image/activity/newYear/noFeedCat.gif').show();
                    $(".dialog1").show();
                }else{
                    if(res.data.result.status==0){
                        $(".noFeed").hide();
                        $(".haveFeed").show();
                        $(".cat").attr("src",basePath+'/resources/image/activity/newYear/fedCat.gif').show();
                        $(".dialog2").show();
                    }else{
                        $(".noFeed").show();
                        $(".haveFeed").hide();
                        $(".cat").attr("src",basePath+'/resources/image/activity/newYear/noFeedCat.gif').show();
                        $(".dialog1").show();
                    }
                }
                $(".dialog").css({
                    left:$(".main").width()/2+$(".cat").width()/4
                })
            }
        }
    });
    //已获得返现金额轮播
    var scrollSpace = 2500;//滚动间隙
    setInterval(function(){
        if($('#noticeBox ul li').size()>1){
            noticeScrollUp($('#noticeBox'));
        }
    }, scrollSpace );

//    初始化滚动条
    $(".dataContent").niceScroll({
        cursorwidth:8,
        cursorcolor:'#f4b5a0',
        cursorborder:'none',
        cursorborderradius:8,
        autohidemode:false,
        // background:'#f3774f',
        railoffset:'top'
    });
//    未登录点击喂猫
    $(".noLoginFeed").on("click",function(){
        var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
        window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
    });
//    已经喂过猫以后点击
    $(".haveFeed").on("click",function(){
        canInvest();
        if(isEnd){
            errTip($(".err.end"),2000);
            return;
        }else if(isNoStart){
            errTip($(".err.noStart"),2000);
            return;
        }else{
            errTip($(".err.next"),2000);
            return;
        }

    });
//    已登录未喂过猫
    $(".noFeed.loginFeed").on("click",function(){
        canInvest();
        if(isEnd){
            errTip($(".err.end"),2000);
            return;
        }else if(isNoStart){
            errTip($(".err.noStart"),2000);
            return;
        }else if(!isFeeding){
            isFeeding=true;
            if(flag=="mobile"){
                var dataCat={userId:userId,token:token,flag:flag};
            }else{
                var dataCat={userId:userId,flag:flag};
            }
            $.ajax({
                type:'POST',
                dataType:'json',
                url:basePath+'/newYearActivity/receiveRedPackage.do',
                data:dataCat,
                success:function(res){
                    console.log(res);
                    if(res.code==1){
                        if(res.data.result.status==1){//领取成功
                            $(".cat").attr("src",basePath+'/resources/image/activity/newYear/feedingCat.gif');
                            $(".dialog1").hide();
                            setTimeout(function(){
                                $(".overlay").show();
                                $(".rewardPop").show().addClass("animated zoomIn");
                                $(".cashCard .amount span").html(res.data.result.packageMoney);
                                $(".noFeed").hide();
                                $(".haveFeed").show();
                                $(".dialog2").show();
                                isFeeding=false;
                            },3500)
                        }else if(res.data.result.status==0){
                            isFeeding=false;
                            errTip($(".err.next"),2000);
                            setTimeout(function(){
                                window.location.reload();
                            },2100)
                        }
                    }else{
                        errTip($(".err.fail"),2000);
                        isFeeding=false;
                    }
                }
            })
        }
    });
//   点击红包弹窗的我知道了
    $(".iknowBtn").on("click",function(){
        $(".overlay").hide();
        $(".rewardPop").hide();
        window.location.reload();
    });
//    点击投资新增门槛我知道了
    $(".limitBtn").on("click",function(){
        $(".overlay").hide();
        $(".limitPop").hide();
        var userId=$("#userId").val();
        var flag=$("#flag").val();
        var token=getadd("token");
        if(flag=="mobile"){
            var dataLimit={userId:userId,token:token,flag:flag};
        }else{
            var dataLimit={userId:userId,flag:flag};
        }
        $.ajax({
            dataType:'json',
            type:'POST',
            url:basePath+'/newYearActivity/setNewYearPopupFlag.do',
            data:dataLimit,
            success:function(res){

            }
        })
    });
//    点击立即投资享好礼
    $(".investBtn,.goInvest").on("click",function(){
        window.location.href = basePath+'/loan/list.do';
    });
// 未登录点击查看获奖明细
    $(".noLoginCheckRewardDetail").on("click",function(){
        var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
        window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
    });
//    点击查看投资明细
    $(".loginCheckRewardDetail").on("click",function(){
        canInvest();
        if(isEnd){
            errTip($(".err.end"),2000);
            return;
        }else if(isNoStart){
            errTip($(".err.noStart"),2000);
            return;
        }else{
            if(flag=="mobile"){
                var dataDetail={userId:userId,token:token,flag:flag};
            }else{
                var dataDetail={userId:userId,flag:flag};
            }
            dis=$(window).scrollTop();
            $.ajax({
                dataType:'json',
                type:'POST',
                url:basePath+'/newYearActivity/awardDetail.do',
                data:dataDetail,
                success:function(res){
                    console.log(res)
                    if(res.code==1){
                        if(res.data.result&&res.data.result.length){
                            var rewardStr="";
                            $(res.data.result).each(function(i,n){
                                rewardStr+='<ul><li class="left">'+getNowFormatDate(n.createTime.time)+'</li><li class="mid">'+n.source+'</li><li class="right">'+n.packageMoney+'</li></ul>';
                            });
                            $(".dataHeader").show();
                            $(".dataContent").html(rewardStr).show();
                            $(".overlay").show();
                            $(".rewardDetails").show();
                            $(".dataContent").getNiceScroll().show().resize();
                            $("body,html").css({"overflow":"hidden","position":"fixed"});
                        }else{
                            $(".noData").show();
                            $(".rewardDetails").show();
                            $(".overlay").show();
                            $("body,html").css({"overflow":"hidden","position":"fixed"});
                        }
                    }
                }
            });
        }
    });
//    点击查看活动奖励明细关闭
    $(".closePopBtn").on("click",function(){
       $(".overlay").hide();
       $(".rewardDetails").hide();
        $("body,html").css({"overflow":"auto","position":"relative"});
        $("body,html").animate({scrollTop:dis},10)
    });
//    点击查看活动规则
    $(".actRuleBtn").on("click",function(){
        $(".overlay").show();
        $(".actRules").show();
        $(".dataContent").niceScroll().hide().show().resize();
    });
//    点击关闭活动规则弹框按钮
    $(".actRules .close-btn").on("click",function(){
        $(".overlay").hide();
        $(".actRules").hide();
    });
//    滑动遮罩，活动规则时页面不能跟随滑动
    $(".overlay,.actRules,.rewardPop,.limitPop").on("touchmove",function(e){
        e.preventDefault();
        return false;
    });
//    页面滚动超过一屏高度  返回顶部按钮显示
    $(window).on("scroll",function(){
        var top=$(this).scrollTop();
        var pos=$(window).height();
        if(top>pos){
            $(".backTopBtn").show();
        }else{
            $(".backTopBtn").hide();
        }
    });
//    点击返回顶部按钮 滚动会顶部
    $(".backTopBtn").on("click",function(){
        $('body,html').animate({ scrollTop: 0 }, 1000);
    });

//错误提示弹窗
function errTip(obj,dur){
    $(".overlay").show();
    $(obj).show();
    setTimeout(function(){
        $(".overlay").hide();
        $(obj).hide();
    },dur)
}
//活动是否开始弹窗
function canInvest(){
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
}
function noticeScrollUp(obj){
    var liHeight = .55;//每个li的高度
    var scrollSpeed = 500;//滚动速度
    var $noticeContext = obj.find("ul:first");
    $noticeContext.animate({ "margin-top" : -liHeight +"rem" },scrollSpeed , function(){
        $noticeContext.css({"margin-top":"0px"}).find("li:first").appendTo($noticeContext);
    });
}
//app获取app还是wap
function getadd(flag){
    var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}
function getNowFormatDate(date) {//获取时间
    var date = new Date(date);
    var seperator1 = ".";
    var seperator2 = ":";
    var h=date.getHours()>9?date.getHours():'0'+date.getHours();
    var m=date.getMinutes()>9?date.getMinutes():'0'+date.getMinutes();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
        + " " + h + seperator2 + m
    return currentdate;
}
});