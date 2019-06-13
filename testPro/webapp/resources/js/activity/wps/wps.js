/**
 * Created by 29059 on 2018/5/15.
 */
$(function(){
    var noStart = false;//活动未开始
    var end = false;//活动已结束
    var startTimestamp = $("#startTimestamp").val();
    var endTimestamp = $("#endTimestamp").val();
    var nowTimestamp = $("#nowTimestamp").val();
    var sourceStatus = $("#sourceStatus").val();
    var flag = $("#flag").val();
    var loginStatus = $("#loginStatus").val();
    //如果是wap 未登录 先登录
    if(flag!='mobile'&&loginStatus==0){
        var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
        window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
    }
    // else if(flag=='mobile'&&loginStatus==0){
    //     userLogin();
    // }
    if(flag!='mobile'&&loginStatus==1&&sourceStatus==0){
        window.location.href=basePath+'/index.do';
    }
    $(".act_year").html(timestampToYear(parseInt(startTimestamp)));
    $(".act_date").html(timestampToTime(parseInt(startTimestamp))+'-'+timestampToTime(parseInt(endTimestamp)));
    actState();
    //请求项目列表
    if(!noStart&&!end&&!isNoPro()){//活动进行中
        $.ajax({
            type:'POST',
            dataType:'json',
            url:basePath+'/WPS/queryLoanList.do',
            success:function(res){
                if(res.data.newLoanList.length){//新手项目
                    $(".new_project .percentage").html(res.data.newLoanList[0].aunualInterestRate+'%');
                    $(".new_project .date em").html(res.data.newLoanList[0].termCount);
                    $(".new_project .Involved-btn").attr("pid",res.data.newLoanList[0].loanId);
                    $(".new_items").show();
                }else{
                    $(".no_new_project").show();
                }
                if(res.data.loanList.length){//普通项目
                    var cStr="";
                    $(res.data.loanList).each(function(i,n){
                        cStr+='<div class="novice_project_left swiper-slide swiper_active">';
                        cStr+='<div class="novice_project clearfix"><div class="fl percentage_left">';
                        cStr+='<div class="percentage">'+n.aunualInterestRate+'%</div><p>年化收益率</p></div>';
                        cStr+='<div class="fl date"><div><em>'+n.termCount+'</em>天</div><p>项目期限</p></div></div>';
                        cStr+='<div class="Involved-btn" pid="'+n.loanId+'"><a>立即加入</a></div></div>';
                    });
                    $(".common_items .swiperOne .swiper-wrapper").html(cStr);
                    $(".common_items").show();
                    restSwiper();
                }else{
                    $(".no_common_project").show();
                }
            }
        });
    }else if(!noStart&&!end&&isNoPro()){
        $(".Close_Time").show();
    }else if(noStart){
        $(".activity").show().find('.no-start').show();
        $(".acquisition").hide();
    }else if(end){
        $(".activity").show().find('.finish').show();
    }
    $(".status").off("click",'.Involved-btn').on("click",'.Involved-btn',function(){
        var pid = $(this).attr('pid');
        if($(this).hasClass('new')){
            window.location.href=basePath+'/loan/rookie.do?loanId='+pid+'&flag=0';
        }else{
            window.location.href=basePath+'/loan/detail/'+pid+'.do';
        }
    });
    $(".status").off("click",'.more').on("click",'.more',function(){
        window.location.href=basePath+'/loan/list.do';
    });
    // function userLogin(){
    //     anniversary.userLogin();
    // }
    function isNoPro(){//判断是否在切标
        var cHour = new Date(Number(nowTimestamp)).getHours();
        if(cHour>=23){
            return true;
        }else{
            return false;
        }
    }
    function actState(){//判断活动状态  未开始  已结束
        if(nowTimestamp>endTimestamp){
            end=true;
            noStart=false;
        }else if(nowTimestamp<startTimestamp){
            noStart=true;
            end=false;
        }else{
            end=false;
            noStart=false;
        }
    }
    function timestampToYear(timestamp){//返回活动年份
        var date = new Date(timestamp);
        var Y = date.getFullYear();
        return Y;
    }
    function timestampToTime(timestamp) {//返回活动时间
        var date = new Date(timestamp);
        var M = (date.getMonth()+1)+ '月';
        var D = date.getDate() + '日';
        return M+D;
    }
    function restSwiper(){
        var swiper = new Swiper('.swiper-container', {
            pagination: '.swiper-pagination',
            slidesPerView: "auto",
            spaceBetween: 30,
            centeredSlides: !0,
            watchSlidesProgress: !0,
            onProgress: function(a) {
                var b, c, d;
                for (b = 0; b < a.slides.length; b++) c = a.slides[b],
                    d = c.progress,
                    scale = 1 - Math.min(Math.abs(.2 * d), 1),
                    es = c.style,
                    // es.opacity = 1 - Math.min(Math.abs(d / 2), 1),
                    es.webkitTransform = es.MsTransform = es.msTransform = es.MozTransform = es.OTransform = es.transform = "translate3d(0px,0," + -Math.abs(150 * d) + "px)"
            },
            onSetTransition: function(a, b) {
                $(".swiper-slide").removeClass("activeSlide");
                $(".swiper-slide").eq(a.activeIndex).addClass("activeSlide");
                for (var c = 0; c < a.slides.length; c++) es = a.slides[c].style,
                    es.webkitTransitionDuration = es.MsTransitionDuration = es.msTransitionDuration = es.MozTransitionDuration = es.OTransitionDuration = es.transitionDuration = b + "ms"
            }
        });
    }
});