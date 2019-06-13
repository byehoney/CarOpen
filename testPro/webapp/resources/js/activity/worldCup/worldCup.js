/**
 * Created by 29059 on 2018/6/1.
 */
$(function(){
    var flag=getadd('flag');
    var token=getadd('token');
    var dh=0;//页面距离顶部滚动距离
    var addressId="";//是否有addressId， 保存过地址则有，否则无
    var type=0;//0  保存  1修改
    var tipShow=false;//错误提示是否在显示
    var shoting = false;
    var userId = $("#userId").val();
    var code = $("#code").val();
    var loterNum =0;//抽奖次数
    var lotterArr = [{'type':'返现红包','giftNum':'20元'},{'type':'返现红包','giftNum':'50元'},{'type':'返现红包','giftNum':'100元'},{'type':'现金红包','giftNum':'100元'},{'type':'加息券','giftNum':'1%'},{'type':'加息券','giftNum':'5%'},{'type':'加息券','giftNum':'8%'},{'type':'加息券','giftNum':'10%'}];


    $(".ball").addClass('animated bounce infinite');
    //踢球
    $(".ball.login").on("click",function(){
        $(".clickMe_btn").hide();
        shoot();
    });
    //踢球抽奖
    function shoot(){
        if(shoting){return};
        shoting = true;
        $.ajax({
            type:'POST',
            dataType:'json',
            url:basePath+'/worldCup/lotter.do',
            data:{flag:flag,token:token,userId:userId},
            success:function(res){
                if(res.code==0){
                    $(".ball").removeClass('animated bounce infinite');
                    var lotterId = res.data.lotterId;//奖品id
                    var index = $('.gifts[data-lIndex='+lotterId+']').index();//奖品对应div序号
                    $(".red_packet .type").html(lotterArr[lotterId].type);
                    $(".red_packet .num").html(lotterArr[lotterId].giftNum);
                    loterNum = res.data.countNum;
                    if(res.data.countNum==0){
                        $(".pop_box .repetition_btn").hide();
                        $(".ballBox .tip").html('机会已用完请明日再来');
                    }else if(res.data.countNum>0){
                        $(".ballBox .tip span").html(res.data.countNum);
                    }
                    var tW =$(".gifts").eq(index).width()/2 //储存礼品自身宽度 中心
                    var tH =$(".gifts").eq(index).height()/2 //储存礼品自身高度 中心
                    var ds = ($(window).width()-$(".ball_net").width())/2;//球网距两边距离
                    var bw = $(".ball").width()*0.45/2;
                    var pLeft = parseFloat($(".gifts").eq(index).position().left+ds);
                    var pTop = parseFloat($(".gifts").eq(index).position().top);
                    var dur = index>5?800:1000;
                    var scaleNum = 1;//球的缩放比例
                    var timer = null;
                    timer = setInterval(function(){
                        scaleNum-=0.004;
                        if(scaleNum>=0.45){
                            // $(".ball").css('transform',"rotate(360deg)");
                            // $(".ball").css({'width':$(".ball").width()*(scaleNum),'height':$(".ball").height()*(scaleNum)});
                            $(".ball").css('transform','scale('+scaleNum+')');
                        }
                    },10);
                    $(".ball").animate({
                        top:(pTop-tH)+'px',
                        left:(pLeft-bw)+'px',
                        marginLeft:0,
                        marginTop:0
                    },dur,function(){
                        shoting = false;
                        clearInterval(timer);
                        $(".ball").addClass('animated bounce infinite').hide();
                        $(".overlay").show();
                        $(".pop_box").addClass("zoomAnimated zoomIn").show();
                        $(".gifts").not( $(".gifts")[index] ).hide();
                        $(".ball").css({
                            'left':'50%',
                            'top': '65%',
                            'marginLeft': '-.61rem',
                            'transform':'scale(1)'
                        });
                    })
                }else if(res.code==-6){
                    shoting = false;
                    errTip($('.err'),res.msg,2000);
                    setTimeout(function(){
                        window.location.reload();
                    },2000);
                }else{
                    shoting = false;
                    errTip($('.err'),res.msg,2000)
                }
            }
        });
    }
    //我的抽奖记录
    $(".record").on("click",function(){
        $.ajax({
            dataType:'json',
            type:'post',
            url:basePath+'/worldCup/queryTodayProbList.do',
            data:{flag:flag,token:token,userId:userId},
            success:function(res){
                if(res.code == 0){
                    if(res.data.packageList.length){
                        var prizeStr='';
                        $(res.data.packageList).each(function(i,n){
                            var giftName='';
                            var giftNum='';
                            if(n.packageType==1){
                                giftName='现金红包';
                                giftNum=n.packageMoney+'元';
                            }else if(n.packageType==2){
                                giftName='返现红包';
                                giftNum=n.packageMoney+'元';
                            }else if(n.packageType==3){
                                giftName='加息券';
                                giftNum=n.packageMoney+'%';
                            }
                            prizeStr+='<div><img src="'+basePath+'/resources/image/activity/worldCup/welfare_small.png" alt=""><span><em>'+giftName+'</em>'+giftNum+'</span></div>'
                        });
                        $(".has_prize .prize_info").html(prizeStr);
                        $(".overlay").show();
                        $(".has_prize").show();
                    }else{
                        $(".overlay").show();
                        $(".no_prize").show();
                    }
                }
            }
        })
    });
    //点击关闭我的抽奖记录
    $(".no_prize .close_off,.no_prize .go_raffle").on("click",function(){
        $(".overlay").hide();
        $(".no_prize").hide();
    });
    $(".has_prize .close_off").on("click",function(){
        $(".overlay").hide();
        $(".has_prize").hide();
    });
    //点击登陆后查看收货地址
    $(".site_pic,.addSite").on("click",function(){
        dh=$(window).scrollTop();
        $(".overlay").show();
        $(".site_cont").show();
        // $("body,html").css({"overflow":"hidden","position":"fixed"});
        $.ajax({//请求数据判断该用户是否保存过地址信息
            dataType:'json',
            type:'POST',
            url:basePath+'/userAddress/getUserAddressByUserId.do',
            data:{userId:userId,flag:flag},
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
    //点击关闭获奖弹窗，点击再来一次
    $(".pop_box .close_btn,.pop_box .repetition_btn").on("click",function(){
        $(".pop_box").hide();
        $(".overlay").hide();
        $(".ball").show();
        // if(loterNum>0){
        //     $(".ball").show();
        // }
        $(".gifts").show();
    });
    //点击查看收货地址弹窗关闭按钮
    $(".site_cont .close_btn,.twoClose").on("click",function(){
        $(".site_cont").hide();
        $(".overlay").hide();
        // $("body,html").css({"overflow":"auto","position":"static"});
        $("body,html").animate({scrollTop:dh},10)
    });
    //阻止滑动穿透
    $(".overlay,.site_cont,.calculator").on("touchmove",function(e){
        e.preventDefault();
    });

    //点击计算收益
    $(".count_get").on("click",function(){
        dh=$(window).scrollTop();
        $(".Wps_page").addClass('docWrapper');
        $(".overlay").show();
        $(".earnings_cont.calculator").show()
    });
    //计算器逻辑
    $(".count_input").on("keyup",function(){
        var rate = 0;
        var getMoney = parseFloat($("#getMoney").val().trim());
        var range = parseInt($("#range").val().trim());
        var needMoney = 0;
        if(getMoney&&range){
            if(parseInt($("#range").val())<=30){
                rate = 0.065;
            }else if(parseInt($("#range").val())>30&&parseInt($("#range").val())<=60){
                rate = 0.07;
            }else if(parseInt($("#range").val())>60&&parseInt($("#range").val())<=90){
                rate = 0.09;
            }else if(parseInt($("#range").val())>90&&parseInt($("#range").val())<=180){
                rate = 0.1;
            }else if(parseInt($("#range").val())>180&&parseInt($("#range").val())<=360){
                rate = 0.11;
            }
            needMoney = Math.ceil(getMoney/range*365/rate)%50==0?Math.ceil(getMoney/range*365/rate):Math.ceil(getMoney/range*365/rate)+(50-Math.ceil(getMoney/range*365/rate)%50);
            $(".needMoney").html(needMoney)
        }else{
            $(".needMoney").html('')
        }
    });
    //点击计算收益弹窗取消
    $(".invest .cancel_btn").on("click",function(){
        $(".Wps_page").removeClass('docWrapper');
        $(".overlay").hide();
        $(".earnings_cont.calculator").hide();
        $(".needMoney").html('');
        $(".count_input").val('');
        $("body,html").animate({scrollTop:dh},10);
    });
    //点击查看排行榜
    $(".check_rank").on("click",function(){
       window.location.href = basePath+'/worldCup/torankingList.do?flag='+flag+'&token='+token+'&userId='+userId;
    });
    //点击我的邀请记录
    $(".my_invite_record").on("click",function(){
        window.location.href = basePath+'/worldCup/toInvitationList.do?flag='+flag+'&token='+token+'&userId='+userId;
    });
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
    //app获取app还是wap
    function getadd(flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
});