/**
 * Created by 29059 on 2018/6/1.
 */
$(function(){
    var flag=getadd('flag');
    var userId=getadd('userId');
    var token=getadd('token');
    var tipShow=false;
    var send =false;
    $.ajax({
        type:'POST',
        dataType:'JSON',
        data:{userId:userId,flag:flag,token:token},
        url:basePath+'/worldCup/invitationStatist.do',
        success:function(res){
            if(res.code==0){
                $(".invite_num").html(res.data.invitationNum);
                $(".invest_num").html(res.data.complate);
                $(".get").html(res.data.getReward+'元');
                // $("#userCode").val(res.data.userCode);
                // $("#userPhone").val(res.data.userPhone);
                if(res.data.recordList.length){
                    var str="";
                    $(res.data.recordList).each(function(i,n){
                        var send='';
                        if(n.investorMoney){
                            send='<p>'+n.investorMoney+'元</p>';
                        }else if(n.sendInfo==0&&res.data.camCode==0&&n.investorMoney==0){
                            send='<p uid="'+n.inviteUserId+'" class="tip">短信提醒</p>';
                        }else if(n.sendInfo==1&&res.data.camCode==0&&n.investorMoney==0){
                            send='<p class="tiped">已提醒</p>';
                        }else if(res.data.camCode==2&&n.investorMoney==0){
                            send='<p>0元</p>';
                        }
                        str+='<li><p>'+n.mobile+'</p><p>'+n.inviteMoney+'元</p>'+send+'</li>';
                    });
                    $(".list_body").html(str).show();
                }else{
                    if(res.data.camCode==2){
                        $(".no_data").html('活动已结束，您活动期间未成功邀请好友！').show();
                    }else if(res.data.camCode==0){
                        $(".no_data").html('您还没有邀请好友，快去邀请拿现金吧！').show();
                        $(".invite_more").show();
                    }
                }
            }
        }
    });
    $(".invest_list_box").on("click",'.tip',function(){
        if(send){return};
        send=true;
        var that=this;
        var uid = $(this).attr('uid');
        $.ajax({
            type:'POST',
            dataType:'json',
            data:{inviteUserId:uid,userId:userId,token:token,flag:flag},
            url:basePath+'/worldCup/sendMessage.do',
            success:function(res){
                send=false;
                if(res.code==0){
                    $(that).removeClass('tip').addClass('tiped').html('已提醒');
                    errTip($('.err'),res.msg,2000);
                }else{
                    errTip($('.err'),res.msg,2000);
                }
            }
        })
    });
    function getadd(flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
    //错误提示弹窗（活动）
    function errTip(obj,info,dur){
        if(!tipShow){
            tipShow=true;
            $(".overlay").show();
            $(obj).html(info).show();
            setTimeout(function(){
                $(".overlay").hide();
                $(obj).html("").hide();
                tipShow=false;
            },dur)
        }
    };
});