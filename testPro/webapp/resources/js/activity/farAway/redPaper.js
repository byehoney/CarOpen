$(function () {
    FastClick.attach(document.body);//绑定fastclick
    $(".field").css('top','-.3rem');//没有输入内容的时候输入框的位置
    var canScale=true;
    //按钮可否点击flag
    var go=true;
    var canGo=true;
    //点击输入区域出现光标
    $(".field").on("click",function(){
        if($(".number").val()==''){
            $(".cursor.blink").show();
            $(".number").attr('placeholder','');
            if(canScale){
                $(".listUl span").stop(true,true);
                $(".listUl span").css('transform','scale(0.8)');
                $(".listUl span").animate({transform:'scale(0.8)'},250,'swing',function(){
                    $(".listUl span").css('transform','scale(1)');
                    canScale=false;
                });
            }
        }
    });
    //点击计算器输入金额
    var redNum="";//红包金额字符串
    var redArr;//红包金额储存数组
    $(".listUl span").click(function(){
        //点击数字按键 隐藏光标
        $(".cursor.blink").hide();
        $(".number").attr('placeholder','输入10的倍数，上限1000元');
        //按键缩放
        $(".listUl span").stop(true,true);
        $(this).css('transform','scale(0.8)');
        $(this).animate({transform:'scale(0.8)'},50,function(){
            $(this).css('transform','scale(1)');
        });
        var btnType=$(this).attr("data-i");
        if(btnType=='reset'){//清零
            $(".number").val("");
            redNum="";
            $(".field p").hide();//清零后隐藏金额提示
            $(".field").css('top','-.3rem');
        }else if(btnType=='del'){//删除
            redArr=redNum.split("");
            if(!redArr.length){
                $(".number").val("");
                return;
            }
            redArr.splice(-1,1);
            redNum=redArr.join("");
            $(".number").val(redNum);
            if($(".number").val()){//如果输入矿中有值
                $(".field p").show().html('<i></i>投资 '+Number($(".number").val())*200+'元 激活红包');
                $(".field").css('top','-.5rem');
            }else{
                $(".field p").hide()
                $(".field").css('top','-.3rem');
            }
        }else{//输入
            if(redNum.length>3){
                return;
            }
            redNum+=String(btnType);
            if(redNum=='0'){
                redNum="";
                return;
            }
            $(".number").val(redNum);
            $(".field p").show().html('<i></i>投资 '+Number($(".number").val())*200+'元 激活红包');
            $(".field").css('top','-.5rem');
        }

    });
    //未登录时点击领红包
    $(".receive").on("click",function(){
        if(!$("#userId").val()){
            var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
            window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
        }



    });
    //领取红包
    $(".getRedPackage").on("click",function(){
        //点击数字按键 隐藏光标
        $(".cursor.blink").hide();
        $(".number").attr('placeholder','输入10的倍数，上限1000元');
        canInvest();
        if(!canGo){
            return;
        }
        if(go){
            go=false;
            var redMoney=Number($(".number").val());
            if(!redMoney || redMoney>1000 || redMoney%10!=0 ){
                $(".err01").show().css({top:'30%',position:'fixed'});
                setTimeout(function(){
                    $(".err01").hide();
                    go=true;
                },2000);
                return;
            }else if((Number($("#todayMoney").val())+redMoney)>5000){
                $(".err02").show().css({top:'30%',position:'fixed'});
                setTimeout(function(){
                    $(".err02").hide();
                    go=true;
                },2000)
                return;
            }else if(Number($("#todayMoney").val())>=5000 || Number($("#todayNum").val())>=10){
                $(".overlay").show();
                $(".noChance").show();
                return;
            }else{
                $.ajax({
                    type:'POST',
                    dataType:'json',
                    data:{
                        userId:$("#userId").val(),
                        redPackageMoney:$(".number").val(),
                        investAmount:Number($(".number").val())*200
                    },
                    url:basePath+'/addGrantRedPackage.do',
                    success:function(data){
                        if(data.code==1){
                            //定义一个接收飞碟展示红包个数的src变量
                            if(parseInt(data.data.redPackageMap.redPackageNumber)<=10){
                                var redSrc=basePath+'/resources/image/activity/farAway/red_'+(Number($("#unusedRedPackageNumber").val())+1)+'.png';
                            }else{
                                $(".overlay").show();
                                $(".noChance").show();
                                return;
                            }
                            $('body').animate( {scrollTop: 0},500,function(){
                                fly(redSrc);
                            });
                        }else if(data.code==99||data.code==98||data.code==97||data.code==-2 ||data.code==-3) {
                            //请求失败后的返回
                            $(".err03").show().html(data.msg).css({top:'30%',position:'fixed'});
                            setTimeout(function(){
                                $(".err03").hide();
                                go=true;
                            },2000)
                        }
                        go=true;
                    }

                });
            }
        }else{
            return;
        }
    });
   // 活动详情弹窗显示隐藏
   $('.activeDetial').on('click',function () {
       $('.overlay,.ruleBox').show();
   });
    $('.ruleBox .close-btn').on('click',function () {
        $('.overlay,.ruleBox').hide();
    });
    //今日无领取机会弹窗关闭点击事件
    $(".noChance .close-btn").on("click",function(){
        $(".overlay").hide();
        $(".noChance").hide();
        $(".number").val("");//清空输入金额
        redNum="";//清空保存输入金额的字符串变量
        $(".field p").hide();//隐藏下方提示文字
        $(".field").css('top','-.3rem');
        go=true;
    });
    // 点击红包弹窗关闭按钮
    $(".activation .close_red_btn").on("click",function(){
        $(".overlay").hide();//遮罩
        $(".activation").hide();//红包弹窗
        window.location.reload();
    });
   //未登录状态点击查看我的红包
    $(".tipWord .nlogin").on("click",function(){
        var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
        window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
    });
    //未登录点击查看我的排名
    $(".checkRank").on("click",function(){
        var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
        window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
    });
    //登陆后点击去投资, 领红包后点击去激活红包
    $(".goInvest,.activatePackets,.actRedPack").on("click",function(){
        canInvest();
        if(canGo){
            window.location.href = basePath+'/loan/list.do';
        }
    });
   //点击查看更多排名
    $(".ranking .moreSpan").on("click",function(){
        window.location.href=basePath+'/queryRanking.do?userId='+$("#userId").val();
    });

    $.ajax({
        type:'POST',
        dataType:'json',
        url:basePath+'/queryUserRanking.do',
        data:{
            userId:$("#userId").val()
        },
        success:function(data){
            if(data.code==1){
                //判断当前用户排名以及用户得奖 以及继续投资多少可以获得高一等级的奖品
                var ranking=$("#ranking").val();//当前用户排名
                var rankArr=data.data.investorList?data.data.investorList:[];//储存用户排名的数组
                var mobile="";//当前用户获得手机
                var userInvestAmount=Number($("#userInvestAmount").val());//用户投资金额
                if(ranking<=100 && ranking>0 && userInvestAmount>=500000){
                    mobile='iPhone 8';
                    $(".giftCont .gift").html('保持排名即可拿走iPhone 8 手机');
                }else if(ranking<=130 && ranking>0 && userInvestAmount>=300000){
                    mobile='小米 6';
                    $(".giftCont .gift").html('当前获得小米 6手机');
                }else if(ranking<=160 && ranking>0 && userInvestAmount>=200000){
                    mobile='华为畅享7';
                    $(".giftCont .gift").html('当前获得华为畅享 7手机');
                }else if(ranking<=200 && ranking>0 && userInvestAmount>=100000){
                    mobile='红米4X';
                    $(".giftCont .gift").html('当前获得红米 4X手机');
                }else if(ranking==0){
                    mobile='暂未上榜';
                }
                if(mobile=='暂未上榜'){
                    if(rankArr.length<200){
                        $(".giftCont .moreMoney").html('再投资 <span>'+fmoney((100000-userInvestAmount),0)+'元</span>可升级到红米 4X手机');
                    }else if(rankArr.length>=200){
                        if(rankArr[199].investAmount>=100000){
                            var otherMoney=Number(rankArr[199].investAmount);
                            $(".giftCont .moreMoney").html('再投资 <span>'+fmoney((otherMoney-userInvestAmount+50),0)+'元</span>可升级到红米 4X手机');
                        }else{
                            $(".giftCont .moreMoney").html('再投资 <span>'+fmoney((100000-userInvestAmount),0)+'元</span>可升级到红米 4X手机');
                        }
                    }
                }else if(mobile == '红米4X'){
                    if(rankArr.length<160){
                        $(".giftCont .moreMoney").html('再投资 <span>'+fmoney((200000-userInvestAmount),0)+'元</span>可升级到华为畅享 7手机');
                    }else if(rankArr.length>=160){
                        if(rankArr[159].investAmount>=200000){
                            var otherMoney=Number(rankArr[159].investAmount);
                            $(".giftCont .moreMoney").html('再投资 <span>'+fmoney((otherMoney-userInvestAmount+50),0)+'元</span>可升级到华为畅享 7手机');
                        }else{
                            $(".giftCont .moreMoney").html('再投资 <span>'+fmoney((200000-userInvestAmount),0)+'元</span>可升级到华为畅享 7手机');
                        }
                    }
                }else if(mobile=='华为畅享7'){
                    if(rankArr.length<130){
                        $(".giftCont .moreMoney").html('再投资 <span>'+fmoney((300000-userInvestAmount),0)+'元</span>可升级到小米 6手机');
                    }else if(rankArr.length>=130){
                        if(rankArr[129].investAmount>=300000){
                            var otherMoney=Number(rankArr[129].investAmount);
                            $(".giftCont .moreMoney").html('再投资 <span>'+fmoney((otherMoney-userInvestAmount+50),0)+'元</span>可升级到小米 6手机');
                        }else{
                            $(".giftCont .moreMoney").html('再投资 <span>'+fmoney((200000-userInvestAmount),0)+'元</span>可升级到小米 6手机');
                        }
                    }
                }else if(mobile=='小米 6'){
                    if(rankArr.length<100){
                        $(".giftCont .moreMoney").html('再投资 <span>'+fmoney((500000-userInvestAmount),0)+'元</span>可升级到iPhone 8手机');
                    }else if(rankArr.length>=100){
                        if(rankArr[99].investAmount>=500000){
                            var otherMoney=Number(rankArr[99].investAmount);
                            $(".giftCont .moreMoney").html('再投资 <span>'+fmoney((otherMoney-userInvestAmount+50),0)+'元</span>可升级到iPhone 8手机');
                        }else{
                            $(".giftCont .moreMoney").html('再投资 <span>'+fmoney((500000-userInvestAmount),0)+'元</span>可升级到iPhone 8手机');
                        }
                    }
                }else if(mobile=='iPhone 8'){
                    $(".giftCont .moreMoney").html()
                }
            }
            // else{
            //     var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
            //     window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
            // }
        }
    });
    $('.overlay,.activation,.ruleBox').on('touchmove',function (e) {
        e.preventDefault();
    });
    //飞机飞行动画
    // 飞机起飞
    function fly(redSrc){
        var top=0;//默认的飞机top位置
        var right=0;//默认的飞机right位置
        var stepT=15;//飞机飞行过程中的top步长
        var stepR=20;//飞机飞行过程中的right步长
        var timer ;//定时器
        var scale=50;//默认的飞机初始大小
        $(".flyer").show();
        timer= setInterval(function(){
            if(parseInt($(".flyer").css("right")) >$(window).width()+50){//如果飞出屏幕 飞机隐藏
                $(".flyer").css({top:'0',right:'0',width:'50px',height:'50px',position:'absolute',zIndex:1,display:'none'});
                clearInterval(timer);
                $(".redBox img").hide();
                $(".redBox img").fadeOut(2000).attr('src',redSrc).fadeIn(3000);
                $(".overlay").show();//遮罩
                $(".activation").show();//红包弹窗

                $(".activation .monery span").html($(".number").val());
                $(".success .successP span").html($(".number").val()+'元');
                $(".extraP span").html(Number($(".number").val()*200*0.001)+'元');
                $(".number").val("");//清空输入金额
                redNum="";//清空保存输入金额的字符串变量
                $(".field p").hide();//隐藏下方提示文字
                $(".field").css('top','-.3rem');
                return;
            }
            if(parseInt($(".flyer").css("right")) >($(window).width())/2){//飞机飞到屏幕中心开始缩小
                $(".flyer").show().css({
                    top:(top+=stepT)+'px',
                    right:(right+=stepR)+'px',
                    width:(scale-=2)+'px',
                    height:(scale-=2)+'px',
                    zIndex:1
                })
            }else{//飞机飞入屏幕开始放大
                $(".flyer").show().css({
                    top:(top+=stepT)+'px',
                    right:(right+=stepR)+'px',
                    width:(scale+=3)+'px',
                    height:(scale+=3)+'px',
                    zIndex:1
                })
            }
        },70)
    };
    function  minArr(arr) {
        var min = arr[0];
        var len = arr.length;
        for (var i = 1; i < len; i++){
            if (arr[i] < min){
                min = arr[i];
            }
        }
        return min;
    };
    function fmoney(s, n) {
        n = n > 0 && n <= 20 ? n : 2;
        s = parseFloat((s + '').replace(/[^\d\.-]/g, '')) + '';
        var l = s.split('.') [0].split('').reverse(),
            r = s.split('.') [1];
        var t = '';
        for (var i = 0; i < l.length; i++)
        {t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? ',' : '');}
        if (!r) { r = '0'; }
        if (r.length < n) {for (var i = r.length; i < n; i++) {r += '0';}}else{ r=r.substr(0,n);}
        return t.split('').reverse().join('');
    }
    //活动是否开始弹窗
    function canInvest(){
        var now_time=$("#currentTime").val();
        var start_time="2017-09-29 00:00:00";
        var end_time = "2017-10-27 23:59:59";
        var end_timed = Date.parse(new Date(end_time.replace(/-/g,"/")));      //活动结束时间
        var start_timed = Date.parse(new Date(start_time.replace(/-/g,"/")));  //活动开始时间
        end_timed = end_timed;
        start_timed=start_timed;
        if(now_time>end_timed){//未在活动时间范围
            $(".err03").show().html('活动已结束').css({top:'30%',position:'fixed'});
            setTimeout(function(){
                $(".err03").hide();
                go=true;
            },2000);
            canGo=false;
        }else if(now_time<start_timed){
            $(".err03").show().html('活动未开始').css({top:'30%',position:'fixed'});
            setTimeout(function(){
                $(".err03").hide();
                go=true;
            },2000);
            canGo=false;
        }else{
            canGo=true;
        }
    }
    //解决刷新问题
    if ((/iphone|ipod|ipad.*os 5/gi).test(navigator.appVersion)) {
        window.onpageshow = function(event) {
            if (event.persisted) {
                window.location.reload()
            }
        };
    }else{
        onload=function(){
            var refreshedId=document.getElementById("refreshed");
            if(refreshedId.value=="no"){
                refreshedId.value="yes";
            } else{
                refreshedId.value="no";
                location.reload();
            }
        }
    }
    $(window).bind("unload", function() { });
});
