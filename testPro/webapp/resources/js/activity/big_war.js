$(function(){
    if($("#userCampaignStatus").val()==0&&$("#loginStatus").val()==1){
        $(".overlay,.Show_pop").show();
        $(".go_register,.go_new,.list_one").css("background","#666");
        $(".examine_btn").show();
    }
    $.ajax({
        dataType: 'json',
        type: 'POST',
        url: basePath + '/getLoanInvestorPhaseDate.do',
        data: {
            flag: getadd("flag"),
            userId:getadd("userId"),
            token:getadd("token")
        },
        success: function (data) {
            if($("#loginStatus").val()==1){
                if($("#userCampaignStatus").val()==1){
                    if(data.data.investStatus==0||data.data.investStatus==2){ //投资普通项目和全投项目
                        $(".step_four").eq(0).show().find(".register_btn").hide();
                        $(".step_four").eq(0).show().find(".Show_center p").text("投资成功  5%加息券已到账");
                        $(".step_four").eq(0).find(".rough_one .rough_red").addClass("rough_green");
                        $(".examine_btn").show();
                        for(var i=0; i<3; i++){
                            $(".project_list ul li").eq(i).show().find(".rough").eq(1).show()
                        }
                        if(data.data.investStatus==0){
                            $(".project_list ul li").eq(1).show().find(".rough").eq(1).find("p").eq(0).hide()
                            $(".project_list ul li").eq(1).show().find(".rough").eq(1).find("p").eq(1).text("您投资了其他项目 已跳过此关");
                            $(".step_two").eq(2).find(".Show_center p").text("您投资了其他项目 已跳过此关");
                        }else if(data.data.investStatus==2){
                            $(".project_list ul li").eq(1).show().find(".rough").eq(1).find("p").eq(1).text("专享15%年化收益");
                        }
                    }
                    if(data.data.investStatus==1){ //投资新手项目
                        $(".step_four").eq(0).show();
                        for(var i=0; i<3; i++){
                            $(".project_list ul li").eq(i).show().find(".rough").eq(1).show()
                        }

                    }
                    if(data.data.investStatus==99){ //无投资记录
                        $(".step_two").eq(0).show();
                        $(".project_list ul li").eq(0).show().find(".rough").eq(1).show()
                        $(".project_list ul li").eq(2).show().find(".rough").eq(0).show()
                        $(".project_list ul li").eq(3).show().find(".rough").eq(0).show()
                    }
                    if(data.data.result.phaseStatus==0){//正常还款
                        var day=data.data.result.loanInvestorPhaseDate;
                        $(".project_list ul li").eq(2).show().find(".rough").eq(1).find("p").eq(0).text(day+"天后将收到第");
                        $(".project_list ul li").eq(2).show().find(".rough").eq(1).find("p").eq(1).text("1笔利息和20元红包");
                        var html="";
                        var arr=day.toString().split("");
                        if(arr.length==3){
                            html+="<span>"+arr[0]+"</span>"+"<span>"+arr[1]+"</span><span>"+arr[2]+"</span>";
                        }else if(arr.length==2){
                            html+="<span>0</span><span>"+arr[0]+"</span>"+"<span>"+arr[1]+"</span>";
                        }else if(arr.length==1){
                            html+="<span>0</span><span>0</span><span>"+arr[0]+"</span>";
                        }
                        $(".step_three").eq(2).find(".distance").html(html+"天后将收到第1笔利息和20元红包").css("lineHeight",".5rem")
                    }else if(data.data.result.phaseStatus==1){ //已还款
                        $(".project_list ul li").eq(2).show().find(".rough").eq(1).find("p").eq(0).text("首笔利息已还款");
                        $(".project_list ul li").eq(2).show().find(".rough").eq(1).find("p").eq(1).text("20元红包已到账");
                        $(".step_three").eq(2).find(".distance").text("首笔利息已还款,20元红包已到账")
                    }else if(data.data.result.phaseStatus==2){ //无回款计划
                        $(".project_list ul li").eq(2).show().find(".rough").eq(1).find("p").eq(0).text("明日开始计息");
                        $(".project_list ul li").eq(2).show().find(".rough").eq(1).find("p").eq(1).text("请等待利息还款");
                        $(".step_three").eq(2).find(".distance").text("明日开始计息,请等待利息还款")
                    }
                }
            }
        }
    })
    var isd;
    $(".project_list>ul .rough").click(function(){
        var index=$(".project_list>ul .rough").index($(this));
        dis = $(window).scrollTop();
        $("body").addClass('fixedPos').css({top:-1*dis+'px'});
        $(window).scrollTop(dis);
        //  if($("#userStatus").val()==1){
        if(index<=2){
            index=$(".project_list>ul .rough").index($(this))+1
        }else if(index<=3){
            index=$(".project_list>ul .rough").index($(this))+2
        }else if(index<=5){
            index=$(".project_list>ul .rough").index($(this))+3
        }else if(index<=7){
            index=$(".project_list>ul .rough").index($(this))+4
        }
        // }else{
        // index=$(".project_list>ul .rough").index($(this))+1;
        //   }
        //alert(index)
        isd=index;
        $(".overlay").show();
        $(".big_distance .Show_state ").eq(index).show().addClass("showactive")
    })
    $(".travel_cont ").click(function(){
        dis = $(window).scrollTop();
        $("body").addClass('fixedPos').css({top:-1*dis+'px'});
        $(window).scrollTop(dis);
        $(".weixin-modal,.overlay").show();
    })
    $(".overlay").click(function(){
        $('body').removeClass('fixedPos').css({top:0});
        $(window).scrollTop(dis);
        $(".overlay").hide(300);
        $(".weixin-modal").hide();
        $(".big_distance .Show_state ").eq(isd).hide(300);
    })


    function olduser_tip(obj){
        $(obj).parent().parent().find(".olduser_tip").text("您是我们的老朋友啦！").fadeIn();
        setTimeout(function(){
            $(".olduser_tip").stop().fadeOut();
        },1000)
    }

    if(getadd("flag")=="mobile"){
        $(".rule_show").eq(0).show();
        $(".go_register").off().on("click",function(){
            if($("#userCampaignStatus").val()==0&&$("#loginStatus").val()==1){
                olduser_tip($(this));
            }else{
                userLogin();
            }

        })
        $(".go_list").off().on("click",function(){
            if($("#userCampaignStatus").val()==0&&$("#loginStatus").val()==1){
                olduser_tip($(this));
            }else{
                jumpInvest();
            }
        })
        $(".olduser_btn,.examine_btn").click(function(){
            jumpInvest();
        })

    }else{
        $(".go_register").click(function(){
            if($("#userCampaignStatus").val()==0&&$("#loginStatus").val()==1){
                olduser_tip($(this));
            }else{
                var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
                window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
            }

        })
        $(".go_list").off().on("click",function(){
            if($("#userCampaignStatus").val()==0&&$("#loginStatus").val()==1){
                olduser_tip($(this));
            }else{
                var _host = basePath;
                window.location.href = _host+ '/loan/list.do';
            }

        })
        $(".olduser_btn,.examine_btn").click(function(){
            var _host = basePath;
            window.location.href = _host+ '/loan/list.do';
        })
        $(".rule_show").eq(1).show();
    }

    $(".go_new").off().on("click",function(){
        if($("#userCampaignStatus").val()==0&&$("#loginStatus").val()==1){
            olduser_tip($(this));
        }else{
            if($("#loanId").val()>0){
                if(getadd("flag")=="mobile"){
                    jumpInvestDetail($("#loanId").val())
                }else{
                    var _host = basePath;
                    window.location.href = _host+ '/loan/detail/'+$("#loanId").val()+'.do';
                }
            }else{
                if(getadd("flag")=="mobile"){
                    jumpInvest();
                }else{
                    var _host = basePath;
                    window.location.href = _host+ '/loan/list.do';
                }
            }
        }

    })

    $('.close').click(function(){
        $(this).parents('.showactive').hide(300);
        $(".overlay").hide(300)
    })

    function getadd(name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }

    //   app去登陆
    function userLogin(){
        anniversary.userLogin();
    }
    //app去投资
    function jumpInvest(){
        anniversary.jumpInvest();
    }
    // 跳转到投资详情
    function jumpInvestDetail(pid){
        anniversary.jumpInvestDetail(pid);
    }

})