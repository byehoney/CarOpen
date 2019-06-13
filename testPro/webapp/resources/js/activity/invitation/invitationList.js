/**
 * Created by 29059 on 2018/7/14.
 */
$(function(){
    var page = 1;
    var pageSize = 5;
    var total = 0;//总条数
    var loading = false;
    var token = getadd('token');
    var userId = getadd('userId');
    getData(page);
    $(document.body).infinite().on("infinite", function() {
        if(loading) return;
        loading = true;
        page++;
        getData(page);
    });
    function getData (page){
        $.ajax({
            dataType:'json',
            type:'POST',
            data:{
              userId:userId,
              token:token,
              page:page
            },
            url:basePath+'/invitation/friendInvitationList.do',
            success:function(res){
                if(res.code==0){
                    total=res.data.count;
                    if(res.data.count>0){
                        if(res.data.interestList.length){
                            $.each(res.data.interestList,function(i,n){
                                $(".list").append('<li><span>'+n.createTime+'</span><span>'+n.remarks+'</span><span>¥'+n.amount+'</span></li>');
                            });
                            if(res.data.interestList.length<pageSize){
                                $(document.body).destroyInfinite();
                                $(".end").show();
                                $(".weui-loadmore").hide();
                            }
                            if($(".list").height()<$(window).height()){
                                $(".list").scroll();
                            }
                        }else{
                            $(document.body).destroyInfinite();
                            $(".end").show();
                            $(".weui-loadmore").hide();
                        }
                    }else{//暂无数据
                        $(".wrap").hide();
                        $(".noData").show();
                        $(".weui-loadmore").hide();
                    }
                }
                loading=false;
            }
        })
    }
    //app获取app还是wap
    function getadd(flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
});