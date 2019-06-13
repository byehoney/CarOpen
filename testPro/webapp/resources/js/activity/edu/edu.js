/**
 * 
 * @authors HFJK
 * @date    2017-10-09 10:29:04
 * @version 0.1
 */
var platFlag;
function changeForApp() {
    platFlag = 1;
};
window.onload = function(){
    $('.load').hide();
    $('.main,.musicCtrl').show();
    $('body').addClass('bgColor');
    $('#bgm').show().attr('autoplay','autoplay');
    $('#bgm').get(0).play();
    var Qindex = 1;//答题序列号
    var arr = ['1','2','3','3','12','012','02'];//正确答案
    var sum = 0;//答题正确数目
    var j = '';
    $('.sign').click(function(){
        $.ajax({
            url:environment.basePath +'/count.do',
            type:"POST"
        });
        $('.main').hide();
        $('.mainContent,.questionOne').show();
        $('.questionOne').find('.questionSelect').stop().animate({'left':'0%'},900);
    });
    $('.questionSelect button').click(function(){
        var i = Number($(this).parent().parent().attr('data-i'));
        var k = ($(this).index()).toString();
        if(i<5){
            $(this).siblings().removeClass('select');
            $(this).addClass('select');
            j = k;
        }else{
            if($(this).hasClass('select')){
                $(this).removeClass('select');
                sArr.splice($.inArray(k,sArr),1);
                //console.log('后来=='+sArr)
            }else{
                sArr.push(k)
                $(this).addClass('select');
                //console.log('原始=='+sArr)
            };
            j = sArr.join('');
        };
    });
    $('.nextBtn').click(function(){//下一题
        Qindex = Number($(this).parent().attr('data-i'));
        $('.question'+(Qindex+1)+'').find('.questionSelect').stop().animate({'left':'100%'},10).animate({'left':'0px'},900);
        //$('.question'+(Qindex+1)+'').find('.questionSelect').stop().animate({'left':'100%'},0).animate({'left':'0%'},900);
        if(!$(this).hasClass('flag')){
            if(checkAnwser(Qindex,j)){//正确
                if(Qindex==7){
                    seven();
                }else{
                    $('.question'+Qindex+'').hide();
                    $('.question'+(Qindex+1)+'').show();
                }
            }else{//错误
                $(this).addClass('flag');
                $('.questionSelect'+Qindex+'').hide();
                $('.analysisBox'+Qindex+'').show();
            };
        }else{
            //$('.question'+(Qindex+1)+'').find('.questionSelect').stop().animate({'left':'0%'},900);
            $(this).removeClass('flag');
            if(Qindex==7){
                seven();
            }else{
                $('.question'+Qindex+'').hide();
                $('.question'+(Qindex+1)+'').show();
            }
        };
        j = '';
        sArr = [];
    });
//第七题逻辑
    var seven = function(){
        $('.question'+Qindex+'').hide();
        if(sum>=6){//
            $('.registerBox').show();
            $('.againBox').hide();
            $('.winner span').html(sum);
        }else{
            $('.againBox').show();
            $('.registerBox').hide();
            if(sum>3){
                $('.Dtitle').html('恭喜您，答对<span>'+sum+'</span>道题目');
            }else{
                $('.Dtitle').html('很遗憾，只答对<span>'+sum+'</span>道题目');
            };
            if(sum==5){
                $('.downDiv').html('网贷投资榜眼');
            }else if(sum==4){
                $('.downDiv').html('网贷投资探花');
            }else{
                $('.downDiv').html('不幸落榜啦');
            };
        };
    };
//review
    $('.aginBtn').click(function(){
        Qindex = 1;
        j = '';
        sArr = [];
        sum = 0;
        $('.questionSelect,.questionOne').show();
        $('.analysisBox,.againBox').hide();
        $('.questionSelect button').removeClass('select');
        $('.questionSelect').css({'left':'100%'});
        $('.questionOne').find('.questionSelect').stop().animate({'left':'0%'},900);
    });
    var checkAnwser = function (i,j){//type 题号 i 答案
        if(i==1){
            if(j==1){//正确 当前隐藏显示下一题
                sum+=1;
                return true;
            }else{//错误 显示错误答案
                return false;
            }
        }else if(i==2){
            if(j==2){//正确 当前隐藏显示下一题
                sum+=1;
                return true;
            }else{//错误 显示错误答案
                return false;
            }
        }else if(i==3){
            if(j==3){//正确 当前隐藏显示下一题
                sum+=1;
                return true;
            }else{//错误 显示错误答案
                return false;
            }
        }else if(i==4){
            if(j==3){//正确 当前隐藏显示下一题
                sum+=1;
                return true;
            }else{//错误 显示错误答案
                return false;
            }
        }else if(i==5){
            if(j.length==2){//正确 当前隐藏显示下一题
                if(j.indexOf('1')>=0 && j.indexOf('2')>=0){//正确
                    sum+=1;
                    return true;
                }else{//错误
                    return false;
                }
            }else{//错误 显示错误答案
                return false;
            }
        }else if(i==6){
            if(j.length==3){//正确 当前隐藏显示下一题
                if(j.indexOf('0')>=0 && j.indexOf('2')>=0 && j.indexOf('1')>=0){//正确
                    sum+=1;
                    return true;
                }else{//错误
                    return false;
                }
            }else{//错误 显示错误答案
                return false;
            }
        }else if(i==7){
            if(j.length==2){//正确 当前隐藏显示下一题
                if(j.indexOf('0')>=0 && j.indexOf('2')>=0){//正确
                    sum+=1;
                    return true;
                }else{//错误
                    return false;
                }
            }else{//错误 显示错误答案
                return false;
            }
        }
    };
    /*领取操作*/
//var inviteCode = '';//邀请码

    $('.btnMoney').click(function(){
        var val = $('.phoneInp').val();
        var reg = /^1[3-9]\d{9}$/;
        if (val == '' || val == '请输入手机号' || val==null) {
            $('.err01').show().html('手机号不能为空');
            setTimeout(function () {
                $('.err01').show().html('');
            },4000)
            return false;
        }else if(!reg.test(val)){
            $('.err01').show().html('请输入正确的11位手机号');
            setTimeout(function () {
                $('.err01').show().html('');
            },4000)
            return false;
        };
        $('.overlay,.verify').show();
        $('.err01').html('');
        $('#mobile_num').val(val);
    });
    $('#img_code_pic').click(function(){
        refresh()
    });
    function refresh(){
        $('#img_code_pic').attr('src',environment.basePath +'/userInfo/getCode.do?v='+Math.random());
    };
//duanxin
    $('.pop_msg_count').click(function(){
        var phone = $('#mobile_num').val();
        var code = $('#img_code').val();
        if(!bool){
            return;
        };
        if(code==''){
            regErro($('.errormsg'),'请输入图片验证码');
            return ;
        };
        if(checked_mobile(phone,$('.errormsg'))){
            send($(this),phone,code);
        }
    });
//领取
    $('#go_reg').click(function () {
        var phone = $('#mobile_num').val();
        var code = $('#img_code').val();
        var msg =  $('#msg_code').val();
        if(!checked_mobile(phone,$('.errormsg'))){
            return;
        };
        if(code == ''){
            regErro($('.errormsg'),'请输入图片验证码');
            return ;
        };
        if(msg == ''){
            regErro($('.errormsg'),'请输入短信验证码');
            return ;
        };
        $.ajax({
            url:environment.basePath +'/get68.do',
            type:'post',
            data:{
                mobile:phone,
                loanCommentCode:code,
                mobileVCode:msg
            },
            dataType:"JSON",
            success:function(data){
                if(data.code==-1){
                    regErro($('.errormsg'),'图形验证码错误');
                    refresh();
                }else if(data.code==-2){//短信验证码错误或为空
                    regErro($('.errormsg'),'短信验证码错误');
                    refresh();
                }else if(data.code==-3){//异常
                    regErro($('.errormsg'),'操作异常');
                }else if(data.code==-4){//注册短信验证失败
                    regErro($('.errormsg'),'短信验证码验证失败');
                    refresh();
                }else if(data.code==-5){//用户密码不正确 或用户注册失败
                    regErro($('.errormsg'),'操作失败');
                }else if(data.code==2 || data.code==3){// 登陆成功未领取过红包 || 新注册
                    regErro($('.errormsg'),'');
                    $('.overlay,.verify,.registerBox').hide();
                    $('.redPacket').show();
                }else if(data.code==4){//登陆成功已领取过红包
                    regErro($('.errormsg'),'');
                    $('.overlay,.verify,.registerBox').hide();
                    $('.receiveRedPacket').show();
                }
            }
        });
    });
    /*邀请好友*/
    var shareUrl ='https://m.zhongzairong.cn/investeducation.do';
    $('.inviteFri').click(function(){
        if(platFlag==1){//app打开
            shareMessage()
        }else{
            $('.overlay,.share').show();
        }
    });
    $('.overlay,.share').click(function(){
        $('.overlay,.share').hide();
    });
    $('.closebtn').click(function(){
        $('.overlay,.verify').hide();
        $('.errormsg,.err01').html('');
        $('#mobile_num,#img_code,#msg_code').val('');
    });
    wxShareApi(shareUrl);
    wx.ready(function(){
        var bgm = document.getElementById('bgm');
        bgm.play();
        //分享朋友圈
        wx.onMenuShareTimeline({
            title: '网贷科举，金榜题名，领红包啦！',// 分享标题
            link: shareUrl, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: 'https://m.zhongzairong.cn/resources/image/activity/edu/eduShare.png', // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
                $('.overlay,.share').hide();
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
                $('.overlay,.share').hide();
            }
        });
        // 分享朋友
        wx.onMenuShareAppMessage({
            title:'网贷科举，金榜题名，领红包啦！', // 分享标题
            desc:'我在中再融参加了网贷科举考试，邀您一起领红包！', // 分享描述
            link: shareUrl, // 分享链接
            imgUrl: 'https://m.zhongzairong.cn/resources/image/activity/edu/eduShare.png', // 分享图标
            type: '', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
                $('.overlay,.share').hide();
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
                $('.overlay,.share').hide();
            }
        });
        // 分享QQ
        wx.onMenuShareQQ({
            title:'网贷科举，金榜题名，领红包啦！', // 分享标题
            desc:'我在中再融参加了网贷科举考试，邀您一起领红包！', // 分享描述
            link: shareUrl, // 分享链接
            imgUrl: 'https://m.zhongzairong.cn/resources/image/activity/edu/eduShare.png', // 分享图标
            type: '', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
                $('.overlay,.share').hide();
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
                $('.overlay,.share').hide();
            }
        });
        // 分享Qzone
        wx.onMenuShareQZone({
            title:'网贷科举，金榜题名，领红包啦！', // 分享标题
            desc:'我在中再融参加了网贷科举考试，邀您一起领红包！', // 分享描述
            link: shareUrl, // 分享链接
            imgUrl: 'https://m.zhongzairong.cn/resources/image/activity/edu/eduShare.png', // 分享图标
            type: '', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
                $('.overlay,.share').hide();
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
                $('.overlay,.share').hide();
            }
        });
    });
    /*回首页*/
    $('.toIndex').click(function(){
        if(platFlag==1){//app打开
            jumpInvest();
        }else{
            window.location.href =environment.basePath + '/index.do';
        }
    });
    function checked_mobile(val) {
        var reg = /^1[3-9]\d{9}$/;
        if (val == '' || val == '请输入手机号' || val==null) {
            regErro($('.errormsg'),'手机号不能为空');
            return false;
        }else if(!reg.test(val)){
            regErro($('.errormsg'),'请输入正确的11位手机号');
            return false;
        };
        return true;
    };
    function send(obj,mobile,veCode){
        $.ajax({
            url:environment.basePath +'/graphiccode.do',
            type:'post',
            data:{
                mobile:mobile,
                veCode:veCode
            },
            dataType:"JSON",
            success:function(data){
                if(data.code==1){//发送成功
                    time(obj);
                    regErro($('.errormsg'),'');
                }else if(data.code==-1){
                    regErro($('.errormsg'),'图片验证码错误');
                    refresh();
                }else if(data.code==-2){
                    regErro($('.errormsg'),'短信发送失败');
                    refresh();
                }else if(data.code==-3){
                    regErro($('.errormsg'),'系统异常');
                    refresh();
                }
            }
        })
    };
    function regErro(obj,con){
        obj.show().html(con);
        if(con!=''){
            setTimeout(function () {
                $('.errormsg').show().html('');
            },4000);
        }
    };
    var bool=true;
    function time(obj){
        var time=59,timer;
        if(!bool){return;}
        bool=false;
        clearInterval(timer);
        obj.html(time+'秒重新发送');
        timer=setInterval(function(){
            if(time==0){
                bool=true;
                clearInterval(timer);
                obj.show().html('重新发送');
            }else{
                time--;
                obj.show().html(time+'秒重新发送');
            }
        },1000);
    };
//微信分享
function wxShareApi(shareUrl){
    $.ajax({
        type : "POST",
        dataType:"JSON",
        url : environment.basePath + "/WxShare.do",
        async : false,
        cache : false,
        data : {'shareUrl':shareUrl},
        success : function(data) {
            wx.config({
                debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                appId: data.appId, // 必填，公众号的唯一标识
                timestamp: data.timestamp, // 必填，生成签名的时间戳
                nonceStr: data.nonceStr, // 必填，生成签名的随机串
                signature: data.signature,// 必填，签名，见附录1
                jsApiList: ['onMenuShareTimeline','onMenuShareAppMessage','onMenuShareQQ','onMenuShareQZone'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
            });
        }
    });
};
//音乐播放控制
    var bgm = document.getElementById('bgm');
    if (/i(Phone|P(o|a)d)/.test(navigator.userAgent)) {
        $(document).one('touchstart',
            function(e) {
                bgm.load();
                bgm.play();
                return false;
            });
    };
    $('.musicCtrl').click(function () {
        if($(this).hasClass('on')){
            $(this).removeClass('on');
            bgm.pause();
        }else{
            $(this).addClass('on');
            bgm.play();
        }
    });
    //原生方法
    function shareMessage() {
        // 替换参数值 链接要完整
        //platAry 控制显示哪一种平台  WechatSession 微信 WechatTimeLine 朋友圈 QQ qq好友 Qzone qq空间 Sina 新浪
        var shareInfo = JSON.stringify({
            "title": "网贷科举，金榜题名，领红包啦！",
            "desc": "我在中再融参加了网贷科举考试，邀您一起领红包！",
            "shareUrl": shareUrl,
            "shareIco": "https://m.zhongzairong.cn/resources/image/activity/edu/eduShare.png",
            "platAry": ["WechatSession", "WechatTimeLine", "QQ", "Qzone", "Sina"]
        });
        anniversary.htmlShare(shareInfo);
    };
    function jumpInvest() {
        anniversary.jumpInvest();
    }
}
