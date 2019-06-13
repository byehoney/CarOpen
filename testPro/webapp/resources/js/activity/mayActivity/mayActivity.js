/**
 * Created by 29059 on 2018/4/26.
 */
$(function(){
    var flag = $("#flag").val();
    var loginStatus = $("#loginStatus").val();
    var userId = $("#userId").val();
    var currentTime = $("#currentTime").val();
    var campaignStartTime = $("#campaignStartTime").val();
    var campaignEndTime = $("#campaignEndTime").val();
    var totalInvestMoney = $("#totalInvestMoney").val();
    var dh=0;//页面距离顶部滚动距离
    var addressId="";//是否有addressId， 保存过地址则有，否则无
    var type=0;//0  保存  1修改
    var tipShow=false;//错误提示是否在显示
    var giftDes="";//获得的奖品
    //判断福利一按钮状态
    if(currentTime>=campaignStartTime&&currentTime<=campaignEndTime){//进行中
        $(".welfare_details .invest_btn").removeClass("no_started");
    }else if(currentTime<campaignStartTime){//未开始
        $(".welfare_details .invest_btn").addClass("no_started").html("活动未开始")
    }else if(currentTime>campaignEndTime){//已结束
        $(".welfare_details .invest_btn").addClass("no_started").html("活动已结束")
    }
    //判断获得的奖品
    if(totalInvestMoney>=500000){
        giftDes="小蚁微单相机套装";
    }else if(totalInvestMoney>=200000&&totalInvestMoney<500000){
        giftDes="米家压力IH电饭煲";
    }else if(totalInvestMoney>=100000&&totalInvestMoney<200000){
        giftDes="飞利浦电动牙刷";
    }else if(totalInvestMoney>=50000&&totalInvestMoney<100000){
        giftDes="200元京东卡";
    }else if(totalInvestMoney>=30000&&totalInvestMoney<50000){
        giftDes="100元京东卡";
    }else{
        giftDes="暂未获得奖品"
    }
    if(giftDes=='暂未获得奖品'){
        $(".getGift").html(giftDes);
    }else{
        $(".getGift").html('当前获得'+'<span class="sum">'+giftDes+'</span>');
    }
    //判断福利三文案显示
    if(currentTime<campaignStartTime){//活动未开始不显示投资金额和获得奖品
        $(".cumulative_amount").hide();
        $(".site").hide();
    }
    //活动期间点击立即投资按钮
    $(".invest_btn").on("click",function(){
        if(!$(this).hasClass('no_started')&&$(this).hasClass('wap_invest')){
            window.location.href='https://m.zhongzairong.cn/views/static/download.jsp';
        }else if(!$(this).hasClass('no_started')){
           window.location.href=basePath+'/loan/list.do';
       }
    });
    //未登录wap点击填写收货人信息
    $(".noLoginSite,.loginCheck").on("click",function(){
        var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
        window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
    });
    //点击活动规则
    $(".rule_pic").on("click",function(){
       $(".overlay").show();
       $(".rule_pop_box").show();
    });
    //点击关闭活动规则
    $(".rule_pop_box .close_btn").on("click",function(){
        $(".overlay").hide();
        $(".rule_pop_box").hide();
    });
    //阻止滑动穿透
    $(".overlay,.rule_pop_box,.site_cont").on("touchmove",function(e){
        e.preventDefault();
    });
    //点击登陆后查看收货地址
    $(".loginSite").on("click",function(){
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
});