/**
 * Created by 29059 on 2018/3/12.
 */
$(function(){
    var flag=$("#flag").val();
    var userId=$("#userId").val();
    var loginStatus=$("#loginStatus").val();
    var isDrawGift=$("#isDrawGift").val();
    var campaignType=$("#campaignType").val();
    var isEnd=false;//活动已结束
    var isNoStart=false;//活动未开始
    var dh=0;//页面距离顶部滚动距离
    var rolling=false;//判断是否在抽奖中
    var tipShow=false;//错误提示是否在显示
    var addressId="";//是否有addressId， 保存过地址则有，否则无
    var type=0;//0  保存  1修改
    var giftName="";
    canInvest();
    //闪灯效果
    var num = 0;
    $("#shandeng").attr("class",function(){
        setInterval(function(){
            num++;
            if(num%2==0){
                $('#shandeng').addClass("lantern_active");
                $('#shandeng').removeClass('lantern_icon');
            }else{
                $('#shandeng').addClass("lantern_icon");
                $('#shandeng').removeClass('lantern_active');
            }
        },500)
    });
    //抽奖按钮
    //gameOne-btn（未开始） gameTwo-btn（每日可免费抽奖一次） gameThree-btn（明日再来）
    if(isNoStart){//活动未开始
        $(".game-btn").addClass("gameOne-btn");
    }else if(isEnd){//活动已结束
        $(".game-btn").addClass("gameFour-btn");
    }else if(loginStatus==1&&isDrawGift){//登陆并且已抽奖
        $(".game-btn").addClass("gameThree-btn");
    }else if(loginStatus==1&&!isDrawGift){//登陆未抽奖
        $(".game-btn").addClass("gameTwo-btn game-login-btn");
    }else if(loginStatus==0){//未登录
        if(flag=='wap'){
            $(".game-btn").addClass("gameTwo-btn noLogin-wap-game-btn");
        }else if(flag=='mobile'){
            $(".game-btn").addClass("gameTwo-btn noLogin-app-game-btn");
        }
    }
    //抽奖逻辑
    $.extend({
        luckGame: function(options) {
            var defaults = {
                'gameLen': '18',
                'game_pagesize':10,//生成多少圈同样的东西
                'zj_arr': { //中奖数组，第一个表示是否中奖，第二个中奖号码
                    'is_win':1,
                    'number':[17,9,6]
                }
            };
            var settings = $.extend(defaults, options);
            w_config={
                'w':$(window).width(),
                'h':$(window).height()
            }
            var gameArr=[];
            var gameLen=settings.gameLen;
            var game_list_h='';
            var game_init=[];
            var game_list_item_h=0;

            //每次进来随机3个数字，来启动当前的选择的状态
            for (var i = 0; i < 3; i++) {

                game_init.push(Math.floor(Math.random() * gameLen));
            }
            createGame();
            // $(window).resize(function(){
            //
            //     createGame();
            // });
            function createGame(){
                getHeight();
                setLi();
                pushLi(gameArr);
                start();
            }


            function getHeight(){
                w_config={
                    'w':$(window).width(),
                    'h':$(window).height()
                };
                game_list_item_h=(w_config.w*320/750*0.78).toFixed(2);
                // game_list_item_h=$(".game-goods-wrap").height();
            }


            //设置奖品
            function setLi(){

                for (var j = 1; j <= settings.game_pagesize; j++) {
                    for (var i = 1; i <= gameLen; i++) {
                        gameArr.push({'type':j,'index':i,'src':basePath+'/resources/image/activity/twoYearsAnniversary/'+i+'.png'});
                    }
                }


            }
            //写入，初始化奖品的滚动
            function pushLi(arr){
                var html_str='';
                for (var i = 0; i < arr.length; i++) {
                    html_str+='<li style="height:'+game_list_item_h+'px" data-index="'+arr[i]['index']+'" data-type="'+arr[i]['type']+'"><img src="'+arr[i]['src']+'"></li>';
                    // html_str+='<li style="height:'+game_list_item_h+'px;background:url('+arr[i]['src']+') no-repeat 0 0;background-size:100%" data-index="'+arr[i]['index']+'" data-type="'+arr[i]['type']+'"></li>';
                }
                $(".game-goods-ul").each(function(e){
                    $(this).empty().append(html_str);
                    game_list_h=$(this).height();
                    y=game_list_item_h*game_init[e];

                    $(this).css({
                        'transition-duration': '0ms',
                        'transform':'translate(0px, -'+y+'px) translateZ(0px)'
                    })
                });


            }

            function start(){
                $(".game-content").off("click",'.game-login-btn').on("click",'.game-login-btn',function(){
                    if(rolling){
                        return;
                    }
                    //我的获奖记录
                    if(flag=='wap'){
                        var giftData={flag:flag}
                    }else if(flag=='mobile'){
                        var giftData={flag:flag,userId:userId,token:getadd('token')}
                    }
                    rolling=true;
                    $.ajax({
                        type:'POST',
                        dataType:'json',
                        url:basePath+'/anniversary/drawGift.do',
                        data:giftData,
                        success:function(res){
                            if(res.code==1){
                                $(".game-btn").removeClass("gameTwo-btn").removeClass("game-login-btn").addClass("gameThree-btn");
                                var rollArr=[];
                                $(res.data.result).each(function(i,n){
                                    rollArr.push(n-1);
                                });
                                settings.zj_arr.number=rollArr;
                                //如果中奖
                                if(settings.zj_arr.is_win==1)
                                {

                                    $(".game-goods-ul").each(function(e){
                                        console.log(settings.zj_arr.number)
                                        setTimeout(function(){
                                            y=(settings.zj_arr.number[e]+settings.gameLen*(settings.game_pagesize-1))*game_list_item_h;
                                            $(".game-goods-ul").eq(e).css({
                                                'transition-duration': '5000ms',
                                                'transform':'translate(0px, -'+y+'px) translateZ(0px)'
                                            })
                                        }, e*300);
                                        //判断最后面是否完毕
                                        //判断最后面是否完毕
                                        y2=settings.zj_arr.number[0]*game_list_item_h;
                                        y3=settings.zj_arr.number[1]*game_list_item_h;
                                        y4=settings.zj_arr.number[2]*game_list_item_h;
                                        $("#game3").find(".game-goods-ul").on("webkitTransitionEnd", function() {

                                            $(".game-goods-ul").eq(2).css({
                                                'transition-duration': '00ms',
                                                'transform':'translate(0px, -'+y4+'px) translateZ(0px)'
                                            });
                                            $(".rollTip").show();
                                            rolling=false;
                                            $("#game3").find(".game-goods-ul").unbind("webkitTransitionEnd");
                                        });
                                        $("#game2").find(".game-goods-ul").on("webkitTransitionEnd", function() {

                                            $(".game-goods-ul").eq(1).css({
                                                'transition-duration': '00ms',
                                                'transform':'translate(0px, -'+y3+'px) translateZ(0px)'
                                            });
                                            $("#game2").find(".game-goods-ul").unbind("webkitTransitionEnd");
                                        });
                                        $("#game1").find(".game-goods-ul").on("webkitTransitionEnd", function() {

                                            $(".game-goods-ul").eq(0).css({
                                                'transition-duration': '00ms',
                                                'transform':'translate(0px, -'+y2+'px) translateZ(0px)'
                                            });
                                            $("#game1").find(".game-goods-ul").unbind("webkitTransitionEnd");
                                        })
                                    })

                                }
                            }else{
                                errTip($(".err"),'抽奖失败，请您稍后再试！',2000);
                                setTimeout(function(){
                                    window.location.reload();
                                },2500)
                            }
                        }
                    });

                })
            }
            function randNum2(){
                a=Math.floor(Math.random() * gameLen);
                b=Math.floor(Math.random() * gameLen);
                c=Math.floor(Math.random() * gameLen);
                arr=[];
                if(a==b)
                {
                    return randNum2();
                }else
                {
                    return arr=[a,b,c];
                }
            }
        }
    });
    setTimeout(function(){
        $.luckGame({
            'zj_arr': {
                'is_win':1,
                'number':[16,9,6]//从0算起，就是10了
            },
            gameLen:12,//产品抽奖数量，
            game_pagesize:6
        });
    },100);
    //项目标卡片渲染
    if(isNoPro()){
        $(".supernatant").show();
        $(".swiperOne").hide();
        $(".more").hide();
    }else{
        $.ajax({
            type:'POST',
            dataType:'json',
            url:basePath+'/anniversary/activityLoanList.do',
            success:function(res){
                if(res.code==1){
                    if(res.data.result&&res.data.result.length){
                        var proStr="";
                        $(res.data.result).each(function(i,n){
                            var rateStr="";
                            if(parseFloat(n.platAddInterest)==0 || n.platAddInterest==""){
                                rateStr="";
                            }else{
                                rateStr=' + '+n.platAddInterest+'%';
                            }
                            proStr+='<div pid="'+n.loanId+'" class="swiper-slide swiper_item"><div class="clearfix"><div class="percentage fl">';
                            proStr+='<div><span>'+n.borrowerInterest+'</span>% <em>'+rateStr+'</em></div><p>年化收益率</p></div>';
                            proStr+='<div class="date fr"><div><em>'+n.termCount+'</em>天</div><p>投资期限</p></div></div>';
                            proStr+='<div class="Involved-btn"><a href="javascript:;">立即加入</a></div></div>';
                        });
                        $(".swiperOne .swiper-wrapper").html(proStr);
                        $(".supernatant").hide();
                        $(".swiperOne").show();
                        //项目轮播
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
                                    es.opacity = 1 - Math.min(Math.abs(d / 2), 1),
                                    es.webkitTransform = es.MsTransform = es.msTransform = es.MozTransform = es.OTransform = es.transform = "translate3d(0px,0," + -Math.abs(150 * d) + "px)"
                            },
                            onSetTransition: function(a, b) {
                                for (var c = 0; c < a.slides.length; c++) es = a.slides[c].style,
                                    es.webkitTransitionDuration = es.MsTransitionDuration = es.msTransitionDuration = es.MozTransitionDuration = es.OTransitionDuration = es.transitionDuration = b + "ms"
                            }
                        });
                    }
                }
            }
        });
    }
    //滚动条优化
    //自定义滚动条
    $(".scrollContent").niceScroll({
        cursorwidth:5,
        cursorcolor:'#fff8e3',
        cursorborder:'none',
        cursorborderradius:3,
        autohidemode:false,
        background:'#ff713d',
        railoffset:'top'
    });
    //根据投资金额判断奖品获得情况
    var totalInvestMoney=parseFloat($("#totalInvestMoney").val());
    if(loginStatus==0 || (loginStatus==1&&totalInvestMoney<50000)){
        $(".prize_list .isGet").addClass("grey");
        $(".prize_list .isGet i").removeClass("active");
    }else if(loginStatus==1&&totalInvestMoney>=500000){
        $(".cash .getIcon").show();
    }else if(loginStatus==1&&totalInvestMoney>=300000){
        $(".prize_list ul li").eq(2).find(".getIcon").show();
        $(".isGet").eq(3).removeClass("grey").find("i").addClass("active");
        giftName="周大福黄金吊坠";
    }else if(loginStatus==1&&totalInvestMoney>=200000){
        $(".prize_list ul li").eq(3).find(".getIcon").show();
        $(".isGet").eq(2).removeClass("grey").find("i").addClass("active");
        giftName="小米空气净化器";
    }else if(loginStatus==1&&totalInvestMoney>=100000){
        $(".prize_list ul li").eq(1).find(".getIcon").show();
        $(".isGet").eq(1).removeClass("grey").find("i").addClass("active");
        giftName="苏泊尔电饭煲";
    }else if(loginStatus==1&&totalInvestMoney>=50000){
        $(".prize_list ul li").eq(0).find(".getIcon").show();
        $(".isGet").eq(0).removeClass("grey").find("i").addClass("active");
    }
    if(isEnd || isNoStart){
        $(".prize_list .isGet").addClass("grey");
        $(".prize_list .isGet i").removeClass("active");
    }
    if(flag=='wap'){
        var giftListData={flag:flag}
    }else if(flag=='mobile'){
        var giftListData={flag:flag,userId:userId,token:getadd('token')}
    }
    $.ajax({
        type:'POST',
        dataType:'json',
        data:giftListData,
        url:basePath+'/anniversary/getUserMatterGiftDetail.do',
        success:function(res){
            if(res.code==-2&&giftName==""){
                $(".giftList").html("暂未获得实物奖品哦");
            }else if(res.code==-2&&giftName!=""){
                $(".giftList").html('实物奖品：'+giftName);
            }else if(res.code==1){
                if(giftName!=""){
                    $(".giftList").html('实物奖品：'+res.data.result+'、'+giftName);
                }else{
                    $(".giftList").html('实物奖品：'+res.data.result);
                }

            }
        }
    });
    //点击登陆后我的奖励按钮
    $(".login-game-prize").on("click",function(){
        if(flag=='wap'){
            var recordData={flag:flag}
        }else if(flag=='mobile'){
            var recordData={flag:flag,userId:userId,token:getadd('token')}
        }
        dh=$(window).scrollTop();
        $.ajax({
            dataType:'json',
            type:'POST',
            url:basePath+'/anniversary/getMyDrawGift.do',
            data:recordData,
            success:function(res){
                if(res.code==1){
                    if(res.data.result&&res.data.result.length){
                        var tStr="";
                        $(res.data.result).each(function(i,n){
                            tStr+='<tr><td>'+n.drawDate+'</td><td>'+n.giftName+'</td><td>'+n.giftDescription+'</td></tr>';
                        });
                        $(".overlay").show();
                        $(".popup .tableData tbody").html(tStr);
                        $(".popup .tableData").show();
                        $(".popup .noData").hide();
                        $(".popup").show();
                        $(".scrollContent").getNiceScroll().show().resize();
                        $("body,html").css({"overflow":"hidden","position":"fixed"});
                    }else{
                        $(".overlay").show();
                        $(".popup .tableData").hide();
                        $(".popup .noData").show();
                        $(".popup").show();
                        $("body,html").css({"overflow":"hidden","position":"fixed"});
                    }
                }else{
                    window.location.reload();
                }
            }

        })
    });
    //点击登陆后查看收货地址
    $(".loginSite").on("click",function(){
        if(isNoStart){
            errTip($(".err"),'活动未开始，敬请期待',2000);
            return;
        }else if(isEnd){
            errTip($(".err"),'活动已结束',2000);
            return;
        }
        dh=$(window).scrollTop();
        $(".overlay").show();
        $(".site_cont").show();
        $("body,html").css({"overflow":"hidden","position":"fixed"});
        $.ajax({//请求数据判断该用户是否保存过地址信息
            dataType:'json',
            type:'POST',
            url:basePath+'/userAddress/getUserAddressByUserId.do',
            data:{flag:flag,userId:userId},
            success:function(data){
                if(data.code==1){
                    if(data.data.userAddress){//如果有保存过地址
                        editable=false;
                        editableFun(editable);
                        $(".twoModifyBox").show();
                        $(".twoAddBox").hide();
                        var userInfo=data.data.userAddress;
                        pro=userInfo.provinceText;
                        city=userInfo.cityText;
                        dis=userInfo.districtText;
                        proId=userInfo.provinceId;
                        cityId=userInfo.cityId;
                        disId=userInfo.districtId;
                        $(".userName").val(userInfo.name);
                        $(".userTel").val(userInfo.moblie);
                        $(".userAdd").val(pro+' '+city+' '+dis);
                        $(".addDetail").val(userInfo.address);
                        addressId=userInfo.addressId;
                        type=1;
                    }else{//没有保存过地址
                        editable=true;
                        editableFun(editable);
                        $(".twoModifyBox").hide();
                        $(".twoAddBox").show();
                        type=0;
                    }
                }else{
                    window.location.reload()
                }
            }
        });
    });
    // 点击修改地址
    $(".twoModify").on("click",function(){
        $(".twoModifyBox").hide();
        $(".twoAddBox").show();
        editable=true;
        editableFun(editable);
    });
    // 点击保存地址时
    $(".twoSave").on("click",function(){
        var addrUserName=$(".userName").val().trim();
        var addrUserMobile=$(".userTel").val().trim();
        var userAdd=pro+city+dis;
        var address=$(".addDetail").val().trim();
        if(checkInfo(addrUserName,addrUserMobile,userAdd,address)){
            if(type==1){
                var data={
                    flag:flag,
                    userId:userId,
                    addressId:addressId,
                    provinceId:proId,
                    cityId:cityId,
                    districtId:disId,
                    address:address,
                    name:addrUserName,
                    mobile:addrUserMobile
                }
            }else{
                var data={
                    flag:flag,
                    userId:userId,
                    provinceId:proId,
                    cityId:cityId,
                    districtId:disId,
                    address:address,
                    name:addrUserName,
                    mobile:addrUserMobile
                }
            }
            $.ajax({
                type:'POST',
                dataType:'json',
                url:basePath+'/userAddress/addUserAddress.do',
                data:data,
                success:function(data){
                    if(data.code==1){
                        if(!tipShow){
                            errTipAdd($(".err"),'保存成功',2000);
                        }
                        setTimeout(function(){
                            $(".twoModifyBox").show();
                            $(".twoAddBox").hide();
                            editable=false;
                            editableFun(editable);
                        },2000)
                    }else{
                        if(!tipShow){
                            errTipAdd($(".err"),data.msg,2000)
                        }
                    }
                }
            })
        }
    });
    // 判断当前输入框以及地址选择框能否编辑
    function editableFun(editable){
        if(!editable){
            $(".userName").attr("readonly",true);
            $(".userTel").attr("readonly",true);
            $(".addDetail").attr("readonly",true);
        }else{
            $(".userName").attr("readonly",false);
            $(".userTel").attr("readonly",false);
            $(".addDetail").attr("readonly",false);
        }
    }
    var Utils = {
        isChinese2 : function(str) {
            var lst = /[\u4e00-\u9fa5]/;
            return lst.test(str);
        },
        getCharLen2 : function(str) {
            var strlength = 0;
            for (var i = 0; i < str.length; i++) {
                if (this.isChinese2(str.charAt(i)) == true)
                    strlength = strlength + 2;
                else
                    strlength = strlength + 1;
            }
            return strlength;
        },
        checkCuMobile : function(num) {
            var mobile = /^(1)\d{10}$/;
            if(!mobile.test(num)){
                return false;
            }else{
                return true;
            }
        }
    };
    function checkInfo(addrUserName,addrUserMobile,userAdd,address){
        if(addrUserName=='' || addrUserName==null){
            if(!tipShow){
                errTipAdd($(".err"),"请输入收货人姓名",2000);
            }
            return false;
        }

        var regUserName=/^([\u4e00-\u9fa5]+|([a-zA-Z]+\s?)+)$/;

        if(!regUserName.test(addrUserName)){
            if(!tipShow){
                errTipAdd($(".err"),"收货人姓名非法",2000);
            }
            return false;
        }
        if(addrUserMobile=='' || addrUserMobile==null){
            if(!tipShow){
                errTipAdd($(".err"),"请输入手机号码",2000);
            }
            return false;
        }

        //var regMobile=/^(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
        var regMobile = /^1[3-9]\d{9}$/;

        if(!regMobile.test(addrUserMobile)){
            if(!tipShow){
                errTipAdd($(".err"),"手机号非法",2000);
            }
            return false;
        }
        if(userAdd==''||userAdd==null){
            if(!tipShow){
                errTipAdd($(".err"),"请选择省市区",2000);
            }
            return false;
        }
        if(address==''||address==null){
            if(!tipShow){
                errTipAdd($(".err"),"请输入详细地址",2000);
            }
            return false;
        }

        var reg=/^(?=.*?[\u4E00-\u9FA5])[\d\u4E00-\u9FA5A-Za-z]+$/;

        if(!reg.test(address)){
            if(!tipShow){
                errTipAdd($(".err"),"地址含有非法字符",2000);
            }
            return false;
        }

        //判断详细地址的长度,不能超过200,一个汉字长度为2
        if(Utils.getCharLen2(address) > 400){
            if(!tipShow){
                errTipAdd($(".err"),"长度不要超过200个字符",2000);
            }
            return false;
        }
        return true;
    }
    //点击查看收货地址弹窗关闭按钮
    $(".site_cont .close_btn,.twoClose").on("click",function(){
        $(".site_cont").hide();
        $(".overlay").hide();
        $("body,html").css({"overflow":"auto","position":"relative"});
        $("body,html").animate({scrollTop:dh},10)
    });
    //点击项目卡片跳转项目
    $(".swiperOne").on("click",'.swiper_item',function(){
       var pid=$(this).attr("pid");
       window.location.href=basePath+'/loan/detail/'+pid+'.do';
    });
    //点击查看更多    投资赢大奖
    $(".more,.big_prize").on("click",function(){
        window.location.href=basePath+"/loan/list.do";
    });
    //点击关闭按钮关闭我的奖品弹窗
    $(".popup .close").on("click",function(){
       $(".popup").hide();
       $(".overlay").hide();
       $("body,html").css({"overflow":"auto","position":"relative"});
       $("body,html").animate({scrollTop:dis},10)
    });
    $(".overlay").on("touchmove",function(e){
       e.preventDefault();
    });
    //未登录点击我的奖品按钮
    $(".nologin-game-prize").on("click",function(){
        var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
        window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
    });
    //点击未登录状态的抽奖按钮
    $(".game-content").on("click",'.game-btn.noLogin-wap-game-btn',function(){
        var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
        window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
    });
    //点击登陆后明日再来抽奖按钮
    $(".game-content").off("click",'.game-btn.gameThree-btn').on("click",'.game-btn.gameThree-btn',function(){
        if(!rolling){
            errTip($(".err"),'今天已经抽过奖了，明天再来吧！',2000)
        }
    });
    //点击登陆后抽奖按钮 未开始
    $(".game-content").off("click",'.game-btn.gameOne-btn').on("click",'.game-btn.gameOne-btn',function(){
        errTip($(".err"),'活动未开始，敬请期待',2000)
    });
    //点击登陆后抽奖按钮已结束
    $(".game-content").off("click",'.game-btn.gameFour-btn').on("click",'.game-btn.gameFour-btn',function(){
        errTip($(".err"),'活动已结束',2000)
    });
    //未登录点击查看我的奖励
    $(".examine_btn .examine_award").on("click",function(){
        var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
        window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
    });
    //点击未登陆查看收货地址
    $(".nologinSite").on("click",function(){
        if(isNoStart){
            errTip($(".err"),'活动未开始，敬请期待',2000);
        }else if(isEnd){
            errTip($(".err"),'活动已结束',2000);
        }else{
            var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
            window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
        }
    });
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
    //错误提示弹窗（地址）
    function errTipAdd(obj,info,dur){
        if(!tipShow){
            tipShow=true;
            $(obj).html(info).show();
            setTimeout(function(){
                $(obj).html("").hide();
                tipShow=false;
            },dur)
        }
    };
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
    };
    //判断是否在切标时间段
    function isNoPro(){
        var d = new Date(Number($("#currentTime").val()));
        var hours=d.getHours();
        if(hours>=23&&hours<=24){
            return true;
        }
        return false;
    };
    //app获取app还是wap
    function getadd(flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
});