/**
 * Created by 29059 on 2018/1/5.
 */
$(function(){
    //图表
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('chartBox'));
    var option={};
    var rank=0;//排行
    var isLogin=false;//判断是否登录(未登录就是围观状态)
    var starIndex=10;//判断星座index
    var shortMoney=0;//短期投资金额
    var middleMoney=0;//中期投资金额
    var longMoney=0;//长期投资金额
    //星座
    var starArr=['魔羯座',"水瓶座","双鱼座",
        "白羊座","金牛座","双子座",
        "巨蟹座","狮子座","处女座",
        "天秤座","天蝎座","射手座","魔羯座"];
    var starTittleArr=['于理财，我擅长研判大势','谋定而后动','投资，顺势而为','理财如探险','理财，我是行家','投资策略，统统拿下','擅长家庭财务计划','财商极高','收支平衡是门艺术','气质即财运','天生拥有赚钱能力','投资游戏的乐观赌徒'];
    var starDesArr=['宁可少赚但求保本，才是我的freestyle！','强推理、勇于突破的投资先驱者','爱大于钱；学习理财，积累财富，也是为了爱。','天生爱挑战，出手“快、狠、准”。','谨慎稳重，投资风险完美避开。','头脑灵活、口才极佳，投资环境与策略了解得非常透彻，就差行动啦！','更多的钱财可以带给家人安全感','收支不平衡算什么？有胆有识、思路开阔，会花也会赚。','我擅长分析、思维缜密，也花时间和精力钻研理财知识…….什么?<br/>投资机会错过了！！！','财运挡不住；收支平衡，根本不算个事。','敏锐直觉捕捉最佳投资机会，获利和财务盈余是常态。','“理财+消费”一步到位。没钱花的时候，就是投资理财的开始。'];
    var picArr=[
        basePath+"/resources/image/activity/annals/lookPic.png",
        basePath+"/resources/image/activity/annals/goldBg.png",
        basePath+"/resources/image/activity/annals/logo.png",
        basePath+"/resources/image/activity/annals/trImg.png",
        basePath+"/resources/image/activity/annals/singPic1.png",
        basePath+"/resources/image/activity/annals/conLeft.png",
        basePath+"/resources/image/activity/annals/text1.png",
        basePath+"/resources/image/activity/annals/text2.png",
        basePath+"/resources/image/activity/annals/text3.png",
        basePath+"/resources/image/activity/annals/text4.png",
        basePath+"/resources/image/activity/annals/text5.png",
        basePath+"/resources/image/activity/annals/text6.png",
        basePath+"/resources/image/activity/annals/text7.png",
        basePath+"/resources/image/activity/annals/text8.png",
        basePath+"/resources/image/activity/annals/footTips.png",
        basePath+"/resources/image/activity/annals/lookPic.png",
        basePath+"/resources/image/activity/annals/arrow.png",
        basePath+"/resources/image/activity/annals/noInvestTip.png",
        basePath+"/resources/image/activity/annals/singPic2.png",
        basePath+"/resources/image/activity/annals/singPic3.png",
        basePath+"/resources/image/activity/annals/singPic4.png",
        basePath+"/resources/image/activity/annals/singPic5.png",
        basePath+"/resources/image/activity/annals/singPic6.png",
        basePath+"/resources/image/activity/annals/star1.png",
        basePath+"/resources/image/activity/annals/star2.png",
        basePath+"/resources/image/activity/annals/star3.png",
        basePath+"/resources/image/activity/annals/star4.png",
        basePath+"/resources/image/activity/annals/star5.png",
        basePath+"/resources/image/activity/annals/star6.png",
        basePath+"/resources/image/activity/annals/star7.png",
        basePath+"/resources/image/activity/annals/star8.png",
        basePath+"/resources/image/activity/annals/star9.png",
        basePath+"/resources/image/activity/annals/star10.png",
        basePath+"/resources/image/activity/annals/star11.png",
        basePath+"/resources/image/activity/annals/star12.png"
    ];
    var img =  new Image();
    var sum = picArr.length;
    var now = 0;
    function loadImg(){
        img.src = picArr[now];
        function go () {
            now ++ ;
            $(".loading").html(parseInt( now/sum *100 ) + "%");
            $(".progress_bar .progress_bar_right").css({width:(100-parseInt( now/sum *100 )) + '%'});
            if(now < picArr.length){
                loadImg()
            }else{
                $(".schedule_count").hide();
                $(".swiper-wrapper").css("opacity",1);
                //初始化swiper
                var swiper = new Swiper('.swiper-container',{
                    direction : 'vertical',
                    // nextButton:'.nextBtn',
                    followFinger : false,
                    speed:800,
                    onSlideChangeEnd: function(swiper){
                        //切换结束时，告诉我现在是第几个slide
                        if((isLogin==true&&swiper.activeIndex==3)||(isLogin==false&&swiper.activeIndex==4)){
                            // 使用刚指定的配置项和数据显示图表。
                            myChart.setOption(option);
                        }else{
                            myChart.clear();
                        }
                    }
                });
            }
        }
        img.onerror = go;
        img.onload = go;
    }
    loadImg();
    //ajax 请求数据
    var flag=getadd ('flag');
    var userId=getadd('userId');
    var token=getadd('token');
    var data={};
    if(flag=='wx'){
        data={flag:'wx',userId:userId}
    }else{
        data={flag:'mobile',userId:userId,token:token}
    }
    $.ajax({
        dataType:'json',
        type:'post',
        url:basePath+'/annals/getUserAnnals.do',
        data:data,
        success:function(data){
            if(data.code==1){
                var res=data.data.result;
                if(res.loginStatus==0){
                    isLogin=false;
                    $(".one").show();
                }else{
                    isLogin=true;
                    $(".one").hide();
                }
                //第一页显示
                //如果用户已登录未投资或者已登录未开户（神秘融粉提示出现）
                if((res.loginStatus==1&&res.investStatus==0)||(res.loginStatus==1&&res.accountStatus==0)){
                    setTimeout(function(){
                        $(".noInvestTip").fadeIn().fadeOut(4000);
                    },500);
                }
                if(res.loginStatus==1&&res.investStatus==1){//如果用户已登录且已投资  则显示用户信息
                    var oStr='<p class="titleMain maxText">今年第一投</p> ' +
                        '<p class="titleDate maxText">'+year(res.userAnnals.firstInvestTime)+'<i class="minText">年</i>'+month(res.userAnnals.firstInvestTime)+'<i class="minText">月</i>'+day(res.userAnnals.firstInvestTime)+'<i class="minText">日</i></p>' +
                        '<p class="titleMoney minText">投资金额：【 <e class="mdText italic">'+fmCurrency(res.userAnnals.firstInvestAmount)+'</e>元 】</p>';
                    $(".two .investTitle").html(oStr).show();
                }else{
                    $(".two .noInvestTitle").show();
                }
                //第二页全年最大投资金额显示（用户投资显示用户数据，用户未投资显示平台数据）
                if(res.investStatus==1){
                    var tStr='<p class="titleMain maxText">全年投资最大额</p>' +
                        '<p class="titleDate maxText">'+year(res.userAnnals.maxInvestTime)+'<i class="minText">年</i>'+month(res.userAnnals.maxInvestTime)+'<i class="minText">月</i>'+day(res.userAnnals.maxInvestTime)+'<i class="minText">日</i></p>' +
                        '<p class="titleMoney minText">投资金额：【 <e class="mdText italic">'+fmCurrency(res.userAnnals.maxInvestAmount)+'</e>元 】</p>';
                    $(".three .investTitle").html(tStr).show();
                }else{
                    $(".three .noInvestTitle").show();
                }
                //第三页 投资最晚的一天（用户投资显示用户数据，用户未投资显示平台数据）
                if(res.investStatus==1){
                    var thStr='<p class="titleMain maxText">投资最晚的一天</p>' +
                        '<p class="titleDate maxText">'+year(res.userAnnals.lastInvestTime)+'<i class="minText">年</i>'+month(res.userAnnals.lastInvestTime)+'<i class="minText">月</i>'+day(res.userAnnals.lastInvestTime)+'<i class="minText">日</i></p>' +
                        '<p class="titleMoney minText">在【 <e class="mdText italic">'+res.userAnnals.lastInvestTime.split(" ")[1]+'</e> 】</p>'
                    $(".four .investTitle").html(thStr).show();
                }else{
                    $(".four .noInvestTitle").show();
                }
                //第四页 数据图表（用户投资显示用户数据，用户未投资显示平台数据）
                if(res.investStatus==1){
                    var dur="";//项目周期
                    var durDes="";//长中短
                    var durT="";//时间描述
                    if(res.userAnnals.userInvestorDistributionMap[0].termCountStatus==1){
                        dur='【 <e class="maxText">90</e> 天（含）内 】';
                        durT="90天（含）内";
                        durDes="短期"
                    }else if(res.userAnnals.userInvestorDistributionMap[0].termCountStatus==2){
                        dur='【 <e class="maxText">91-180</e> 天 】';
                        durDes="中期";
                        durT="91-180 天";
                    }else if(res.userAnnals.userInvestorDistributionMap[0].termCountStatus==3){
                        dur='【 <e class="maxText">181-365</e> 天 】';
                        durT="181-365 天";
                        durDes="长期"
                    }
                    var fStr='<p class="titleMain minText">偏爱'+dur+durDes+'项目</p>' +
                        '<p class="titleMain minText">全年在 '+durT+'项目共投资</p> ' +
                        '<p class="titleMain minText">【 <e class="maxText">'+fmCurrency(res.userAnnals.userInvestorDistributionMap[0].investAmount)+'</e>元 】</p>';
                    // shortMoney=res.userAnnals.userInvestorDistributionMap[0]?Number(res.userAnnals.userInvestorDistributionMap[0].investAmount):0;
                    // middleMoney=res.userAnnals.userInvestorDistributionMap[1]?Number(res.userAnnals.userInvestorDistributionMap[1].investAmount):0;
                    // longMoney=res.userAnnals.userInvestorDistributionMap[2]?Number(res.userAnnals.userInvestorDistributionMap[2].investAmount):0;
                    if(res.userAnnals&&res.userAnnals.userInvestorDistributionMap.length){
                        $(res.userAnnals.userInvestorDistributionMap).each(function(i,n){
                            if(n.termCountStatus==1){
                                shortMoney=res.userAnnals.userInvestorDistributionMap[i].investAmount;
                            }else if(n.termCountStatus==2){
                                middleMoney=res.userAnnals.userInvestorDistributionMap[i].investAmount;
                            }else if(n.termCountStatus==3){
                                longMoney=res.userAnnals.userInvestorDistributionMap[i].investAmount;
                            }
                        })
                    }
                    option = {
                        title: {
                            text: ''
                        },
                        tooltip: {
                            show:false
                        },
                        legend: {
                            data:['销量'],
                            show:false,
                            selectedMode:false
                        },
                        xAxis: {
                            data: ["短期","中期","长期"],
                            axisLine:{
                                lineStyle:{
                                    color:"#a6956d",
                                    width:'5'
                                }
                            },
                            nameTextStyle:{
                                color:'#a6956d'
                            },
                            axisTick:{
                                show:false
                            }
                        },
                        yAxis: {
                            show:false
                        },
                        series: [{
                            type:'bar',
                            label:{
                                normal:{
                                    show:true,
                                    position:'top',
                                    formatter:function(c){
                                        var result = [ ], counter = 0;
                                        var num_array = c.value.toString().split('.');
                                        var num = num_array[0];
                                        var newstr = '';
                                        for (var i = num.length - 1; i >= 0; i--) {
                                            counter++;
                                            result.unshift(num[i]);
                                            if (!(counter % 3) && i != 0) { result.unshift(','); }
                                        }
                                        if(num_array.length>1){
                                            newstr = result.join('');
                                            newstr += '.'+num_array[1];
                                            return '￥'+newstr;
                                        }else{
                                            return '￥'+result.join('');
                                        }
                                    }

                                }
                            },
                            data:[
                                {
                                    value:shortMoney,
                                    name:'销量',
                                    itemStyle:{
                                        normal:{
                                            color:" #a6956d"
                                        }
                                    }
                                },
                                {
                                    value:middleMoney,
                                    name:'销量',
                                    itemStyle:{
                                        normal:{
                                            color:"#a6956d"
                                        }
                                    }
                                },
                                {
                                    value:longMoney,
                                    name:'销量',
                                    itemStyle:{
                                        normal:{
                                            color:"#a6956d"
                                        }
                                    }
                                }
                            ]
                        }],
                        label:{
                            normal:{
                                show:true,
                                position:'top'
                            }
                        }
                    };
                    $(".five .investTitle").html(fStr).show();
                }else{
                    shortMoney=315182150;
                    middleMoney=56798000;
                    longMoney=15148550;
                    option = {
                        title: {
                            text: ''
                        },
                        tooltip: {
                            show:false
                        },
                        legend: {
                            data:['销量'],
                            show:false,
                            selectedMode:false
                        },
                        xAxis: {
                            data: ["短期","中期","长期"],
                            axisLine:{
                                lineStyle:{
                                    color:"#a6956d",
                                    width:'5'
                                }
                            },
                            nameTextStyle:{
                                color:'#a6956d'
                            },
                            axisTick:{
                                show:false
                            }
                        },
                        yAxis: {
                            show:false
                        },
                        series: [{
                            type:'bar',
                            label:{
                                normal:{
                                    show:true,
                                    position:'top',
                                    formatter:function(c){
                                        var result = [ ], counter = 0;
                                        var num_array = c.value.toString().split('.');
                                        var num = num_array[0];
                                        var newstr = '';
                                        for (var i = num.length - 1; i >= 0; i--) {
                                            counter++;
                                            result.unshift(num[i]);
                                            if (!(counter % 3) && i != 0) { result.unshift(','); }
                                        }
                                        if(num_array.length>1){
                                            newstr = result.join('');
                                            newstr += '.'+num_array[1];
                                            return '￥'+newstr;
                                        }else{
                                            return '￥'+result.join('');
                                        }
                                    }

                                }
                            },

                            data:[
                                {
                                    value:shortMoney,
                                    name:'销量',
                                    itemStyle:{
                                        normal:{
                                            color:" #a6956d"
                                        }
                                    }
                                },
                                {
                                    value:middleMoney,
                                    name:'销量',
                                    itemStyle:{
                                        normal:{
                                            color:"#a6956d"
                                        }
                                    }
                                },
                                {
                                    value:longMoney,
                                    name:'销量',
                                    itemStyle:{
                                        normal:{
                                            color:"#a6956d"
                                        }
                                    }
                                }
                            ]
                        }],
                        label:{
                            normal:{
                                show:true,
                                position:'top'
                            }
                        }
                    };
                    $(".five .noInvestTitle").show();
                }
                //第五页  平台奖励（未开户 未登录显示平台数据  已登录且已开户显示用户数据）
                if(res.loginStatus==1&&res.accountStatus==1&&res.investStatus==1){
                    var fiveStr='<p class="titleMain minText">全年平台活动共计发放奖励金额</p>' +
                        '<p class="titleMain minText">【 <e class="maxText">1.39</e>亿元 】</p>' +
                        '<p class="titleMain minText">我通过参与平台活动获得奖励</p>' +
                        '<p class="titleMain minText">【 <e class="maxText">'+fmCurrency(res.userAnnals.userAwardTotal)+'</e>元 】</p>';
                    $(".six .personal").html(fiveStr).show();
                }else if(res.loginStatus==1&&res.accountStatus==1&&res.investStatus==0){
                    var fiveStr='<p class="titleMain minText">全年平台活动共计发放奖励金额</p>' +
                        '<p class="titleMain minText">【 <e class="maxText">1.39</e>亿元 】</p>' +
                        '<p class="titleMain minText">我通过参与平台活动获得奖励</p>' +
                        '<p class="titleMain minText">【 <e class="maxText">0</e>元 】</p>';
                    $(".six .personal").html(fiveStr).show();
                }else{
                    $(".six .plat").show();
                }
                //第六页星座(生日明天确认)
                if(res.loginStatus==1&&(res.investStatus==1||res.investStatus==0)){
                    if(res.investStatus==0){
                        var birth=res.birthday.toString();
                    }else{
                        var birth=res.userAnnals.birthday.toString();
                    }

                    var m=birth.substr(0,2);
                    var d=birth.substr(2,2);
                    getxingzuo(m,d);
                    var sixStr='<p class="titleMain minText leftText">【<e class="maxText">'+getxingzuo(m,d)+'</e>】</p>' +
                        '<p class="titleMain minText leftText starM">'+starTittleArr[starIndex]+'</p>' +
                        '<p class="titleMain minText leftText">'+starDesArr[starIndex]+'</p>';
                    $(".seven .personal").html(sixStr).show();
                    $(".seven .starPic").attr("src",basePath+'/resources/image/activity/annals/star'+(starIndex+1)+'.png')
                }else{
                    $(".seven .plat").show();
                }

                //第七页 平台累计交易额
                if(res.loginStatus==1&&res.investStatus==1){//用户已登录且已投资展示用户数据
                    var sevenStr='<p class="titleMain minText leftText">全年共投资项目【 <e class="maxText">'+res.userAnnals.userInvestTime+'</e>笔 】</p>' +
                        '<p class="titleMain minText leftText">总投资 <e class="maxText">'+fmCurrency(res.userAnnals.investAmountTotal)+'</e> 元</p>' +
                        '<p class="titleMain minText leftText">所投最高年化收益<e class="maxText">'+res.userAnnals.userMaxRate+'</e>%</p>' +
                        '<p class="titleMain minText leftText">全年总收益 【 <e class="maxText">'+fmCurrency(res.userAnnals.leijishouyiTotal)+'</e> 】 元</p>';
                    $(".eight .personal").html(sevenStr).show();
                }else if(res.loginStatus==0){
                    $(".eight .plat").show();
                }else{
                    $(".eight .personalNoInvest").show();
                }
                //第八页  排行生成
                if(res.loginStatus==1||res.investStatus==0||res.accountStatus==0){
                    var rankStr="";
                    if(res.accountStatus==0||res.investStatus==0){
                        var rankNum=0;
                    }else{
                        var rankNum=parseInt(res.userAnnals.ranking);
                    }

                    if(rankNum<=100&&rankNum>0){
                        rank=1;
                        rankStr="富豪榜Top100";
                    }else if(rankNum>=100&&rankNum<=300){
                        rank=2;
                        rankStr="最具竞争力富豪";
                    }else if(rankNum>=300&&rankNum<=600){
                        rank=3;
                        rankStr="最具影响力富豪";
                    }else if(rankNum>600||rankNum==0){
                        rank=4;
                        rankStr="新晋潜力富豪";
                    }
                    // if(!res.userAnnals.ranking){
                    //     rankStr="最具影响力人物";
                    //     rank=0;
                    // }
                    $(".nine .personal .rank").html(rankStr);
                    $(".nine .personal").show()
                }else{
                    rank=-1;
                    $(".nine .plat").show();
                }
                // loadImg();
            }
        }

    });


    //点击生成年度封面人物
    $(".getCoverBtn").on("click",function(){
        window.location.href=basePath+'/annals/toAnnalsCover.do?rank='+rank+'&flag='+getadd('flag')+'&userId='+getadd('userId');
    });


    //app获取app还是wap
    function getadd (flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
    function getxingzuo(month, day) {
        var d = new Date(1999, month - 1, day, 0, 0, 0);
        var arr = [];
        arr.push(["魔羯座", new Date(1999, 0, 1, 0, 0, 0)])
        arr.push(["水瓶座", new Date(1999, 0, 20, 0, 0, 0)])
        arr.push(["双鱼座", new Date(1999, 1, 19, 0, 0, 0)])
        arr.push(["白羊座", new Date(1999, 2, 21, 0, 0, 0)])
        arr.push(["金牛座", new Date(1999, 3, 21, 0, 0, 0)])
        arr.push(["双子座", new Date(1999, 4, 21, 0, 0, 0)])
        arr.push(["巨蟹座", new Date(1999, 5, 22, 0, 0, 0)])
        arr.push(["狮子座", new Date(1999, 6, 23, 0, 0, 0)])
        arr.push(["处女座", new Date(1999, 7, 23, 0, 0, 0)])
        arr.push(["天秤座", new Date(1999, 8, 23, 0, 0, 0)])
        arr.push(["天蝎座", new Date(1999, 9, 23, 0, 0, 0)])
        arr.push(["射手座", new Date(1999, 10, 22, 0, 0, 0)])
        arr.push(["魔羯座", new Date(1999, 11, 22, 0, 0, 0)])
        for (var i = arr.length - 1; i >= 0; i--) {
            if (d >= arr[i][1]) {
                starIndex=i==12?0:i;
                return arr[i][0];
            }
        }
    }

    function year(date){
        return new Date(date.replace("年","/").replace("月","/").replace("日","")).getFullYear();
    }
    function month(date){
        var month=new Date(date.replace("年","/").replace("月","/").replace("日","")).getMonth()+1;
        return month>=10?month:'0'+month;
    }
    function day(date){
        var day=new Date(date.replace("年","/").replace("月","/").replace("日","")).getDate();
        return day>=10?day:'0'+day;
    }
    function fmCurrency (num) {
        num = num.toString().replace(/$|\,/g,'');
        if(isNaN(num))
            num = "0";
        sign = (num == (num = Math.abs(num)));
        num = Math.floor(num*100+0.50000000001);
        cents = num%100;
        num = Math.floor(num/100).toString();
        if(cents<10)
            cents = "0" + cents;
        for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
            num = num.substring(0,num.length-(4*i+3))+','+
                num.substring(num.length-(4*i+3));
        return (((sign)?'':'-') + num + '.' + cents);
    }
});
