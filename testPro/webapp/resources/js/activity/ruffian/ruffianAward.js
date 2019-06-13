/**
 * Created by 29059 on 2017/10/28.
 */
$(function () {
    var flag=getadd('flag');
    var userId=getadd('userId');
    //默认请求我的奖品数据
    getGiftData();
    $('.tabList li span').on('click', function () {
        $index = $(this).parent('li').index();
        $(this).addClass('active').parent().siblings('li').children().removeClass("active");
        $('.infoArea').eq($index).removeClass('hide').siblings('.infoArea').addClass('hide');
        if($index==0){
            getGiftData()
        }else if($index==1){
            getCoinData()
        }else if($index==2){
            getFriendData();
        }
    });
    //wap端点击提醒好友弹窗
    $(".inviteList").on("click",'.earmTd',function(){
       $(".overlay").show();
       $(".remind").show();
       $(".remind .copyContent").html('别怪我没提醒你，投资即可得20g金条。有6重壕奖，拿到手软！https://m.zhongzairong.cn/ruffian/friend/mind.do?userId='+userId+'&flag='+flag)
    });
    //wap复制后关闭弹窗
    $(".remind .btn").on("click",function(){
        $(".overlay").hide();
        $(".remind").hide();
    });
    function getGiftData(){
        $.ajax({
            type:"POST",
            dataType:'json',
            data:{userId:getadd('userId'),flag:getadd('flag')},
            url:basePath+'/ruffian/myPrize.do',
            success:function(data){
                if(data.code==1){
                    //可用金币数据
                    $(".goldCoin .usable").html(data.data.result.blance);
                    $(".goldCoin .used").html(data.data.result.consume);
                    $(".goldCoin .income").html(data.data.result.income);
                    //兑换奖品数据
                    if(!data.data.result.prizeNameList.length){//如果没有奖品数据兑换奖品隐藏
                        $(".prizeArea").hide();
                    }else{
                        $(data.data.result.prizeNameList).each(function(i,n){
                            if(n.tradeAmount==5000){
                                if(data.data.result.prizeNameList[i].count){
                                    $(".giftTab .goldBar").show().find(".rightNum").html('x'+n.count)
                                }else{
                                    $(".giftTab .goldBar").hide()
                                }
                            }
                            if(n.tradeAmount==3000){
                                if(data.data.result.prizeNameList[i].count){
                                    $(".giftTab .tv").show().find(".rightNum").html('x'+n.count)
                                }else{
                                    $(".giftTab .tv").hide()
                                }
                            }
                            if(n.tradeAmount==1000){
                                if(data.data.result.prizeNameList[i].count){
                                    $(".giftTab .sweeper").show().find(".rightNum").html('x'+n.count)
                                }else{
                                    $(".giftTab .sweeper").hide()
                                }
                            }
                            if(n.tradeAmount==500){
                                if(data.data.result.prizeNameList[i].count){
                                    $(".giftTab .microWave").show().find(".rightNum").html('x'+n.count)
                                }else{
                                    $(".giftTab .microWave").hide()
                                }
                            }
                            if(n.tradeAmount==200){
                                if(data.data.result.prizeNameList[i].count){
                                    $(".giftTab .redBagBig").show().find(".rightNum").html('x'+n.count)
                                }else{
                                    $(".giftTab .redBagBig").hide()
                                }
                            }
                            if(n.tradeAmount==50){
                                if(data.data.result.prizeNameList[i].count){
                                    $(".giftTab .redbagLittle").show().find(".rightNum").html('x'+n.count)
                                }else{
                                    $(".giftTab .redbagLittle").hide()
                                }
                            }
                        })
                    }
                    //兑换奖品记录
                    if(data.data.result.prizeList.length){
                        var tableStr="";
                        $(data.data.result.prizeList).each(function(i,n){
                            tableStr+='<tr><td>'+dateFormat(n.tradeTime.time)+'</td><td>'+n.tradePurpose+'</td><td>'+n.tradeAmount+'</td></tr>';
                        })
                        $(".prizeList .tab_body tbody").html(tableStr)
                    }else{
                        $(".prizeList .tab_body tbody").hide();
                        $(".prizeList .noData").show();
                    }
                }
            }
        })
    }
    function getCoinData(){
        $.ajax({
            type:"POST",
            dataType:'json',
            data:{userId:getadd('userId'),flag:getadd('flag')},
            url:basePath+'/ruffian//myCoin.do',
            success:function(data){
                if(data.code==1){
                    console.log(data)
                    $(".myCoin .invest").html(data.data.result.investAmount);
                    $(".myCoin .invite").html(data.data.result.inviteAmount);
                    if(data.data.result.coinList.length){
                        var coinStr="";
                        $(data.data.result.coinList).each(function(i,n){
                            coinStr+='<tr><td>'+dateFormat(n.tradeTime.time)+'</td><td>'+n.tradePurpose+'</td><td>'+n.tradeAmount+'</td></tr>';
                        });
                        $(".coinList .tab_body tbody").html(coinStr);
                    }else{
                        $(".coinList .tab_body tbody").hide();
                        $(".coinList .noData").show();
                    }
                }
            }
        })
    }
    function getFriendData(){
        $.ajax({
            type:"POST",
            dataType:'json',
            data:{userId:getadd('userId'),flag:getadd('flag')},
            url:basePath+'/ruffian/myInvite.do',
            success:function(data){
                if(data.code==1){
                    console.log(data)
                    $(".myInvite .regFriend").html(data.data.result.registerCount+'人');
                    $(".myInvite .invFriend").html(data.data.result.inviteCount+'人');
                    if(data.data.result.friendList.length){
                        var friendStr="";
                        $(data.data.result.friendList).each(function(i,n){
                            var isInvest="";
                            var tipBtn="";
                            if(n.isInvest=="是"){
                                isInvest="是";
                                tipBtn="";
                            }else{
                                isInvest="否";
                                if(flag=="mobile"){
                                    if(Number(n.remindCount)>0){//app端如果已提醒
                                        tipBtn+="<a href='javascript:void (0)' class='investTd shareBtn tip_btn'>已分享</a>";
                                    }else{
                                        tipBtn+="<a href='javascript:void (0)' data-mobile='"+n.mobiles+"' class='earmTdApp shareBtn'>分享</a>";
                                    }
                                }else{
                                    tipBtn+="<a href='javascript:void (0)'  class='earmTd shareBtn'>分享</a>";
                                }
                                if((Number(n.sendMsgCount)>0)){
                                    tipBtn+="<a href='javascript:void (0)'  class='investTd msg_btn'>已提醒</a>";
                                }else{
                                    tipBtn+="<a href='javascript:void (0)' data-mobile='"+n.mobiles+"'  class='infoTd msg_btn'>提醒</a>";
                                }
                            }
                            friendStr+='<tr><td>'+n.mobile+'</td><td class="isInvest">'+isInvest+'</td><td class="tip_btn">'+tipBtn+'</td></tr>';
                            $(".inviteList .tab_body tbody").html(friendStr);
                        })
                    }else{
                        $(".inviteList .tab_body tbody").hide();
                        $(".inviteList .noData").show();
                    }
                }
            }
        })
    }
    //短信提醒功能
    $(".myInvite").on("click",'.infoTd',function(){
        var msgIndex=$(this).parents("tr").index();
        var msgMobile=$(this).attr("data-mobile");
        console.log(msgIndex)
        $.ajax({
            type:'POST',
            dataType:'json',
            url:basePath+'/ruffian/sendMsg.do',
            data:{mobile:msgMobile},
            success:function(data){
                if(data.code==1){
                    Tips($(".err"),'短信已成功发送',2000);
                    $(".inviteList tbody tr").eq(msgIndex).find(".msg_btn").removeClass("infoTd").addClass("investTd").html("已提醒");
                }else{
                    Tips($(".err"),'短信发送失败，请稍后重试',2000);
                }
            }
        })
    });
    //app获取app还是wap
    function getadd(flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
    //时间转换
    function dateFormat(ms) {
        var _date=new Date(ms);
        var month=_date.getMonth()+1;
        var day=_date.getDate();
        var hour=_date.getHours();
        var minutes=_date.getMinutes();
        var seconds=_date.getSeconds();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (day >= 0 && day <= 9) {
            day = "0" + day;
        }
        if (hour >= 0 && hour <= 9) {
            hour = "0" + hour;
        }
        if (minutes >= 0 && minutes <= 9) {
            minutes = "0" + minutes;
        }
        if (seconds >= 0 && seconds <= 9) {
            seconds = "0" + seconds;
        }
        return month+'.'+day+' '+ hour+':'+minutes+':'+seconds;
    }
    /*叹号信息提示*/
    var tipShow=false;
    function Tips(obj,info,dur){
        obj.show().html(info);

        tipShow=true;
        setTimeout(function(){
            tipShow=false;
            obj.html("").hide();
        },dur)
    }
    $(".tipBox").on("click",function(){
        if(!tipShow){
            Tips($('.cueTips'),"新手项目除外",2000)
        }
    });
    //app获取app还是wap
    function getadd(flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }

    function setCookie(cname,cvalue,exdays)
    {
        var d = new Date();
        d.setTime(d.getTime()+(exdays*24*60*60*1000));
        var expires = "expires="+d.toGMTString();
        document.cookie = cname + "=" + cvalue + "; " + expires;
    }
    function getCookie(cname)
    {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for(var i=0; i<ca.length; i++)
        {
            var c = ca[i].trim();
            if (c.indexOf(name)==0) return c.substring(name.length,c.length);
        }
        return "";
    }
});
