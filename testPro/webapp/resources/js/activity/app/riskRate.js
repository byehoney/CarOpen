/**
 * Created by 29059 on 2017/11/15.
 */
var tipShow=false;//错误提示弹窗是否显示中
var timer=null;
var riskRate={
    qIndex:0,//答题序号
    score:0,//答题得分
    qLen:0,//总共的题目数量
    qState:false,//答题状态  控制每一道题不能多次点击
    riskType:0,
    renderData:function(){
        //riskType  0或者""或者null,未评估  1/2/3  保守型/稳健型/成熟型
        riskRate.riskType=$("#riskType").val();
        if(riskRate.riskType==1){
            $(".riskBox").hide();
            $(".resultBox").eq(0).show();
        }else if(riskRate.riskType==2){
            $(".riskBox").hide();
            $(".resultBox").eq(1).show();
        }else if(riskRate.riskType==3){
            $(".riskBox").hide();
            $(".resultBox").eq(2).show();
        }else{
            $(".resultBox").hide();
            $(".riskBox").eq(0).show();
        }
    },
    bindEvent:function(){
        $(".riskBox .qBox").on("click","li",function(){//选择题目时跳下一题
            if(riskRate.qState){return}
            riskRate.qState=true;
            $(this).addClass("checkedLi").siblings().removeClass("checkedLi");
            $(this).siblings().find(".qCheck").removeClass("checked");
            $(this).find(".qCheck").addClass("checked");
            if(riskRate.qIndex<9&&$(this).parents(".riskBox").find(".checkedLi").size()){
                riskRate.qIndex++;
            }else{
                riskRate.qState=false;
                return;
            }
            if(riskRate.qIndex<=10){//前10道题目点击跳到下一题
                $(".riskBox").eq(riskRate.qIndex).siblings(".riskBox").fadeOut(50);
                timer=setTimeout(function(){
                    $(".riskBox").eq(riskRate.qIndex).fadeIn(0);
                    riskRate.qState=false;
                },0)
            }
        });

        $(".riskBox .btnBox").on("click",'.preBtn',function(){//点击上一题时返回上一题
            if(riskRate.qState){return}
            riskRate.qState=true;
            riskRate.qIndex--;
            // $(this).parents(".riskBox").find("li").removeClass("checkedLi");
            // $(this).parents(".riskBox").find(".qCheck").removeClass("checked");//移除当前题的选中
            // $(".riskBox .subBtn").removeClass("disableBtn").addClass("sendBtn");
            riskRate.score=0;//清空得分
            timer=setTimeout(function(){
                if(riskRate.qIndex>=0){//前10道题目点击跳到下一题
                    $(".riskBox").eq(riskRate.qIndex).show().siblings(".riskBox").hide();
                    riskRate.qState=false;
                }else{
                    riskRate.qState=false;
                    riskRate.qIndex=0;
                }
            },100)
        });

        $(".riskBox").off().on("click",'.sendBtn',function(){//点击提交计算得分
            riskRate.score=0;
            // alert($(".riskBox").find(".checked").size())
            if($(".riskBox").find(".checked").size()!=10){
                riskRate.errTip($(".err"),'请答完全部题目',2000);
                return;
            }
            $(".riskBox").each(function(i,n){
                if(i>=3){
                    var score=parseInt($(n).find(".checked").attr("data-score"));
                    riskRate.score+=score;
                }
            });
            // $(this).removeClass("sendBtn").addClass("disableBtn");
            // alert(riskRate.score);
            if(parseInt(riskRate.score)<=14){
                // $(".resultBox").eq(0).show();
                riskRate.riskType=1;
            }else if(parseInt(riskRate.score)>14&&parseInt(riskRate.score)<=25){
                // $(".resultBox").eq(1).show();
                riskRate.riskType=2;
            }else{
                // $(".resultBox").eq(2).show();
                riskRate.riskType=3;
            }
            // if(!$("#userId").val()){
            //     riskRate.errTip($(".err"),"请先登录",2000)
            // }
            $.ajax({
                type:'POST',
                dataType:'json',
                url:basePath+'/userPersonal/valueDateRiskType.do',
                data:{userId:$("#userId").val(),riskType:riskRate.riskType},
                success:function(data){
                    if(data==1){
                        $(".riskBox").hide();
                        if(parseInt(riskRate.score)<=14){
                            $(".resultBox").eq(0).show();
                        }else if(parseInt(riskRate.score)>14&&parseInt(riskRate.score)<=25){
                            $(".resultBox").eq(1).show();
                        }else{
                            $(".resultBox").eq(2).show();
                        }
                    }else{
                        riskRate.errTip($(".err"),'抱歉，提交未成功，请您重新提交。',2000)
                    }
                }
            });
        });

        $(".resultBox").on("click",".reRate",function(){//重新評估
            $(".resultBox").hide();
            $(".riskBox").eq(0).show();
            $(".riskBox").find("li").removeClass("checkedLi");
            $(".riskBox").find(".qCheck").removeClass("checked");
            riskRate.score=0;
            riskRate.qIndex=0;
        })
    },
    errTip:function(obj,info,dur){//错误提示弹窗
        if(tipShow){return}
        obj.show().html(info);
        tipShow=true;
        setTimeout(function(){
            tipShow=false;
            obj.html("").hide();
        },dur)
    }
};
$(function(){
    riskRate.renderData();
    riskRate.bindEvent();
});