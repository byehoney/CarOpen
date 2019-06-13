/**
 * Created by 29059 on 2018/7/14.
 */
$(function(){
    var token = getadd('token');
    var userId = $("#userId").val();
    var startTime = $("#startTime").val().replace('年','.').replace('月','.').replace('日','');
    var endTime =$("#endTime").val().replace('年','.').replace('月','.').replace('日','');
    var startY = startTime.split('.')[0];
    var startM = parseInt(startTime.split('.')[1]);
    var startD = parseInt(startTime.split('.')[2]);
    var endY = endTime.split('.')[0];
    var endM = parseInt(endTime.split('.')[1]);
    var endD = parseInt(endTime.split('.')[2]);
    $(".activeDay").html(startY+'.'+startM+'.'+startD+'-'+endY+'.'+endM+'.'+endD);
    $('#noticeBox').noticeScroll();

    var codeLogin = $("#codeLogin").val();
    if(codeLogin==1){
        $(".invitation .checkList").addClass("noLoginGo");
    }else{
        $(".invitation .checkList").addClass("loginGo");
    }
    $(".invitation").on("click",'.loginGo',function(){
        window.location.href=basePath+'/invitation/friendInvitationPage.do?token='+token+'&userId='+userId;
    });
    $(".rule").on("click",function(){
       window.location.href=basePath+'/invitation/toInvitationRule.do';
    });
    //app获取app还是wap
    function getadd(flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
});
~(function(){
    $.fn.extend({
        noticeScroll : function(){
            var $this = $("#noticeBox");
            var scrollTimer;
            var liHeight = .54;//每个li的高度
            var scrollSpace = 3000;//滚动间隙
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
                $noticeContext.animate({ "margin-top" : -liHeight +"rem" },scrollSpeed , function(){
                    $noticeContext.css({"margin-top":"0rem"}).find("li:first").appendTo($noticeContext);
                });
            }
        }
    });
})();