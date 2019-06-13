/**
 * Created by 29059 on 2017/12/7.
 */
var tipShow=false;
var isNoStart=false;
var isEnd=false;
var loading=false;
function getadd (flag){ //app获取app还是wap
    var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}
//格式化成钱币格式
 function fmCurrency (num) {
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
}
function errTip (obj,info,dur){//错误提示弹窗
    obj.show().html(info);
    tipShow=true;
    setTimeout(function(){
        tipShow=false;
        obj.html("").hide();
    },dur)
}
var invite={
    curPage:1,
    pageSize:3,
    sumPage:1,
    userId:getadd('userId'),
    flag:getadd('flag'),
    token:getadd('token'),
    yqm:getadd('yqm'),
    renderData:function(){
        invite.getData(invite.curPage);
        if(invite.flag=='wap'){
            $(".invite_friends").addClass("wap_invite_friends");
        }else if(invite.flag=='mobile'){
            $(".invite_friends").addClass("mobile_invite_friends");
        }
    },
    getData:function(curPage){
        loading=true;
        //获取用户邀请好友数据
        if(invite.flag=='wap'){
            var data={flag:invite.flag,curPage:curPage,userId:invite.userId,pageSize:invite.pageSize};
        }else if(invite.flag=='mobile'){
            var data={flag:invite.flag,curPage:curPage,userId:invite.userId,pageSize:invite.pageSize,token:invite.token};
        }
        $.ajax({
            dataType:'json',
            type:'POST',
            data:data,
            url:basePath+'/doubleDan/showFriendsInviteInfo.do',
            success:function(res){
                if(res.code==1){
                    var userInfo=res.data.friendsInvestAmountMap;
                    var friendList=res.data.friendsPhoneInvestCountsMap;
                    $(".invite_left .inviteNum").html(userInfo.friendNum+'人');
                    $(".invite_right .inviteAward").html(fmCurrency(userInfo.friendAmount)+'元');
                    if(friendList.length){
                        $(".invite_list").show();
                        $(".friends_pic").hide();
                        var listStr="";
                        $(friendList).each(function(i,n){
                            var tipBtn="";
                            if(n.counts==0){
                                if(n.remiand==0){//未提醒
                                    tipBtn='<div class="tipBtn" data-mobile="'+n.mobile+'"><img src="'+basePath+'/resources/image/activity/doubleDan/alarm_yellow.png" alt=""> <p>提醒</p></div>';
                                }else if(n.remiand==1){//已提醒
                                    tipBtn='<div class="tipedBtn" data-mobile="'+n.mobile+'"><img src="'+basePath+'/resources/image/activity/doubleDan/alarm_grey.png" alt=""> <p style="color:#999">已提醒</p></div>';
                                }
                            }
                            listStr+='<li><i>'+n.rank+'</i><div>';
                            listStr+='<p>'+n.mobile.substr(0,3)+'****'+n.mobile.substr(7,11)+'</p><p>投资次数 : <span>'+n.counts+'</span></p></div>'+tipBtn;
                            listStr+='</li><b></b>';
                        });
                        $(".invite_list").html(listStr);
                        $(".paging .curPage").html(invite.curPage);
                        $(".paging .sumPage").html(res.data.pageSum);
                        invite.sumPage=res.data.pageSum;
                    }else{
                        $(".invite_list").hide();
                        $(".friends_pic").show();
                    }
                }else{
                    errTip($(".err"),res.msg,2000)
                }
                loading=false;
            }
        })
    },
    //活动是否开始弹窗
    canInvest:function  (){
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
    bindEvent:function(){
        //点击短信提醒
        $(".invite_list").on("click",'.tipBtn',function(){
            var mobile=$(this).attr("data-mobile");
            var that=this;
            $.ajax({
                dataType:'json',
                type:'POST',
                url:basePath+'/doubleDan/remindFriends.do',
                data:{mobile:mobile},
                success:function(res){
                    if(res.code==1){
                        errTip($(".err"),'提醒短信已成功发送',2000);
                        $(that).removeClass("tipBtn").addClass("tipedBtn");
                       $(that).find("img").attr("src",basePath+'/resources/image/activity/doubleDan/alarm_grey.png');
                       $(that).find("p").html("已提醒").css("color","#999");
                    }else{
                        errTip($(".err"),res.msg,2000)
                    }
                }
            })
        });
        //点击翻页
        $(".paging .left_arrow").on("click",function(){
            if(invite.sumPage>1&&invite.curPage>=2&&!loading){
                invite.curPage--;
                $(".paging .curPage").html(invite.curPage);
                invite.getData(invite.curPage);
            }
        });
        $(".paging .right_arrow").on("click",function(){
            if(invite.sumPage>1&&invite.curPage<invite.sumPage&&!loading){
                invite.curPage++;
                $(".paging .curPage").html(invite.curPage);
                invite.getData(invite.curPage);
            }
        });
        //wap端点击邀请好友
        $(".record_three").on("click",'.wap_invite_friends',function(){
            invite.canInvest();
            if(isNoStart){
                errTip($(".err"),'活动即将开始',2000);
                return;
            }else if(isEnd){
                errTip($(".err"),'活动已结束',2000);
                return;
            }
            $(".invite_pup .popText").html('朋友，我为你准备了999元大红包！点击领取→https://m.zhongzairong.cn/redpackets.do?yqm='+invite.yqm);
            $(".invite_pup").show();
            $(".overlay").show();
        });
        //wap端点击关闭弹窗
        $(".invite_pup .close_btn").on("click",function(){
            $(".invite_pup").hide();
            $(".overlay").hide();
        });
        //遮罩出现时页面禁止滚动
        $(".overlay,.invite_pup").on("touchmove",function(e){
            e.preventDefault();
        })
    },
    init:function(){
        invite.renderData();
        invite.bindEvent();
    }
};
$(function(){
   invite.init();
});