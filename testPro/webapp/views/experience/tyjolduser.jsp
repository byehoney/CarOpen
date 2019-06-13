<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	Date nowTime = new Date();
	long r = nowTime.getTime();
%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-app-status-bar-style" content="black">
<meta name="apple-touch-fullscreen" content="YES">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1.0,  minimum-scale=1.0, maximum-scale=1.0">  
<title>体验金-中再融</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/apptyj.css?r=<%=r %>">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/wx_tyj.css?r=<%=r %>">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/nativeShare.css?r=<%=r %>">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jwin/jwin.css?r=<%=r %>">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jwin/avast.css?r=<%=r %>">
<script src="<%=request.getContextPath() %>/resources/js/common/jquery-1.8.3.min.js?r=<%=r %>"></script>
<script src="<%=request.getContextPath() %>/resources/js/warptyj.js?r=<%=r %>"></script>
<script src="<%=request.getContextPath() %>/resources/js/nativeShare.js?r=<%=r %>"></script>
<script src="<%=request.getContextPath() %>/resources/js/jwin/jwin.js?r=<%=r %>"></script>
<script src="<%=request.getContextPath() %>/resources/js/wx_tyj.js?r=<%=r %>"></script>
<script src="<%=request.getContextPath() %>/resources/js/common/jweixin-1.0.0.js"></script>
</head>
<body>
<div class="olduser">
   <div class="gz openguize">活动规则></div>
   <dl class="clearfx">
      <dt><img src="<%=request.getContextPath() %>/resources/image/app/apptyj/apptyj_4.png" alt=""></dt>
      <dd>我们已是老朋友啦</dd>
      <dd>体验金仅限未投资用户领取</dd>
   </dl>

<div class="app_invit">
	<img src="<%=request.getContextPath() %>/resources/image/app/apptyj/apptyj_2.jpg" alt="">
	<img src="<%=request.getContextPath() %>/resources/image/app/apptyj/apptyj_3.jpg" alt="">
	<div class="yqbtn morebtn"><a href="javascript:;" target="_blank"><img src="<%=request.getContextPath()%>/resources/image/app/wx_tyj/yqbtn.jpg" /></a></div> 
</div>
</div>

<div class="wx_guize">
	   <div class="top">
	   	   <img class="k1" src="<%=request.getContextPath()%>/resources/image/app/wx_tyj/gzlist_2.png"/>
	       <img class="k2" src="<%=request.getContextPath()%>/resources/image/app/wx_tyj/gzlist_3.png"/>
	   </div>
	   <div class="contertext">
	    <h3>活动规则<span>Ｘ</span></h3>
	       <div class="listtext clearfx"><span>1</span><p>注册/登录领取体验金</p></div>
	       <ul>
	          <li>体验金仅限中再融新注册用户及未投资过的用户领取；</li>
	          <li>体验金每个账户限领一份，每份10万元；</li>
	          <li>体验金不能提现，不能与其他奖励（红包、银票、加息券等）一起使用，只能投资“体验金专享理财计划”，到期自动收回。</li>
	       </ul>
	       
	       <div class="listtext clearfx"><span>2</span><p>投资新手项目激活体验金收益</p></div>
	       <ul>
	          <li>体验金领取之后自动投资“体验金专享理财计划”，投资当日开始计息，次日结息；</li>
	          <li>体验金收益自结息日当天起，30天内均可首次投资新手项目激活，过期作废；</li>
	          <li>30元收益激活后，自激活之日起30天内均可领取，领取后收益以现金红包的形式发放；</li>
	          <li>30元现金红包自发放之日起90天内有效，红包兑现后进入账户余额，可复投可提现。</li>
	       </ul>
	       
	       <div class="listtext clearfx"><span>3</span><p>邀请好友投资每人再帮你赚55元</p></div>
	       <ul>
	          <li>活动期间，给好友发体验金红包，只要1个好友首笔投资新手项目，你就可以获得55元（5元现金红包+50元投资返现红包）奖励，多邀多得，上不封顶。</li>
	       </ul>
	   </div>
	</div>
	<div class="marke"></div>
	
	<div class="marke2"></div>
	<div class="fx_shafe">
	    <div class="sj clearfx">
		  <img src='<%=request.getContextPath()%>/resources/image/app/wx_tyj/fx_shafe.png'/>
		</div>
		<p>点击右上角，</p>
		<p>选择<span>“发送给朋友”</span>或<span>“分享到朋友圈”</span></p>
		<p>立即发红包</p>
	</div>
	<!-- QQ，UC浏览器分享 -->
	 <div id="nativeShare"></div>
	 
<script type="text/javascript">
$("#weakOneKey").click(function(){
	 $.ajax({
		 url : "<%=request.getContextPath() %>/sendInvokeInvestMsg.do",
		 dataType : "json",
		 type : "post",
		 success : function(result){
			 var code = result.code;
			 if(code == 1){
				 alert("提醒成功");
			 }else if(code == -2){
				 alert("每个好友只能提醒一次，请邀请好友");
			 }else{
				 alert("提醒失败");
			 }
		 }
	 });
})
$(".weak").click(function(){
	 var langVal = $(this).attr("lang");
	 $.ajax({
		 url : "<%=request.getContextPath() %>/sendInvokeInvestMsgUserId.do",
		 dataType : "json",
		 type : "post",
		 data : "currentUserId=" + langVal,
		 success : function(result){
			 var code = result.code;
			 if(code == 1){
				 alert("提醒成功");
			 }else if(code == -2){
				 alert("每个好友只能提醒一次，请邀请好友");
			 }else{
				 alert("提醒失败");
			 }
		 }
	 });
})

function pageLoading(){
	var tar = $(".invat_nav").find(".active").attr("tar");
	if ($("." + tar).find("li:visible").length > 5) {
		$("." + tar).find("li:gt(4)").hide();
		$("#more_list_" + tar).show();
		$("#more_list_" + tar).text("查看更多");
	} else {
		if ($("." + tar).find("li").length <= 5){
			$("#more_list_" + tar).hide();
		}else{
			$("." + tar).find("li:gt(4)").show();
			$("#more_list_" + tar).show();
			$("#more_list_" + tar).text("收起");
		}
	}
}    

var browser = {
    versions: function () {
        var u = navigator.userAgent, app = navigator.appVersion;
        return {         //移动终端浏览器版本信息
            trident: u.indexOf('Trident') > -1, //IE内核
            presto: u.indexOf('Presto') > -1, //opera内核
            webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
            gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
            mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
            ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
            android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器
            iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
            iPad: u.indexOf('iPad') > -1, //是否iPad
            webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
        };
    }(),
    language: (navigator.browserLanguage || navigator.language).toLowerCase()
}



$(function(){
	pageLoading();
	var tabs = $("div.invat_nav").find("span");
	var cons = $('.main_con');
	tabs.each(function(index) {
		$(this).click(function() {
			tabs.removeClass('active').eq(index).addClass('active');
			cons.hide().eq(index).show();
			pageLoading();
		});
	});

	$(".more_list").click(function() {
		pageLoading();
	});
	$(".marke2").click(function() {
		$("#nativeShare").fadeOut();
	});
	
	function changeTitle(num){
		var retStr = "";
		if(num == 0){
			retStr = "1天的等待，换来30元的回报，约么？";
		}else if(num == 1){
			retStr = " 送你10万体验金，1天白赚30元收益，就是这么任性！";
		}else if(num == 2){
			retStr = "谁说天上不会掉馅饼？来银客，30元收益白给你！";
		}else if(num == 3){
			retStr = "来银客，躺着也能赚钱！1天白赚30元！你造吗？";
		}else if(num == 4){
			retStr = "送你1个神秘大红包，拆开有惊喜哦！";
		}else if(num == 5){
			retStr = "10万大红包眼都不眨就给了你，快抢！";
		}else if(num == 6){
			retStr = "我刚刚包了个神秘大红包，各位小主快抢，手慢无哦！";
		}else if(num == 7){
			retStr = "我最近赚钱了，送你一份神秘大礼，拆开就有钱！";
		}else if(num == 8){
			retStr = "银客最近发红包，刚抢到一个分享给你，快抢！";
		}else if(num == 9){
			retStr = "发红包的才是真爱，送你个大红包，拆开就有钱！";
		}
		
		return retStr;
	}

	var shareUrl = "<%=request.getContextPath() %>/goldWeChat/getGoldShareUrl.do?ykUserId=#userId";
	var userId = '${userId}';
	shareUrl = shareUrl.replace("#userId", userId);
	$.ajax({type:"post",url:shareUrl,async:false,  
         success : function(data){
        	 shareUrl = data;
         }  
    });
	
	var shareurl = location.href.split('#')[0];
	
	$.ajax({
        url :'<%=request.getContextPath()%>/weChat/weChatShare.do',
        data : {"shareUrl":shareurl},
        dataType :'json',
        type : 'GET',
        cache : false,
        async : true,
        success : function(data){
        	wx.config({
        	    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        	    appId: 'wxb0fa3e5b92d79f10', // 必填，公众号的唯一标识
        	    timestamp:data["timestamp"], // 必填，生成签名的时间戳
        	    nonceStr: data["nonceStr"], // 必填，生成签名的随机串
        	    signature:data["signature"],// 必填，签名，见附录1
        	    jsApiList: ['onMenuShareTimeline','onMenuShareAppMessage','hideMenuItems']
        	});
        }
    });
	
	wx.ready(function(){
		wx.hideMenuItems({
		      menuList: [
				"menuItem:favorite",
				"menuItem:readMode",
				"menuItem:openWithSafari",
				"menuItem:share:email",
				"menuItem:share:qq",
		      ]
		});
		
		var context = changeTitle(Math.floor(Math.random()*10));
		// 分享朋友圈
		wx.onMenuShareTimeline({
		    title: context, // 分享标题
		    link: shareUrl, // 分享链接
		    imgUrl: 'https://www.zhongzairong.cn/images/wx_tyj/shareHead.jpg', // 分享图标
		    success: function () {
		    },
		    cancel: function () { 
		    	
		        // 用户取消分享后执行的回调函数
		    }
		});

		// 分享朋友
		wx.onMenuShareAppMessage({
		    title: "白拿体验金，邀请赚现金", // 分享标题
		    desc: context,
		    link: shareUrl, // 分享链接
		    imgUrl: 'https://www.zhongzairong.cn/images/wx_tyj/shareHead.jpg', // 分享图标
		    type: '', // 分享类型,music、video或link，不填默认为link
		    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
		    success: function () { 
		    },
		    cancel: function () { 
		        // 用户取消分享后执行的回调函数
		    }
		});
	 	
	});
	
	$(".morebtn").click(function() {
		if (browser.versions.mobile) {
			//判断是否是移动设备打开
			var ua = navigator.userAgent.toLowerCase();//获取判断用的对象
			if (ua.match(/MicroMessenger/i) == "micromessenger") {
				//在微信中打开
				$(".marke2").fadeIn();
				$(".fx_shafe").fadeIn();
				/* window.open(shareUrl); */
				return;
			}
			if (ua.match(/QQ/i) == "qq") {
				$(".marke2").show();
				$("#nativeShare").show();
				 var context = changeTitle(Math.floor(Math.random()*10));
				 var shareIconUrl = "<%=request.getContextPath() %>/goldWeChat/getGoldShareUrl.do?ykUserId=#userId";
				 var userId = '${userId}';
				 $(function(){
				 	shareIconUrl = shareIconUrl.replace("#userId", userId);
				 	$.ajax({type:"post",url:shareIconUrl,async:false,  
				         success : function(data){
				         	shareIconUrl = data;
							//在QQ打开
							var config = {
								url : shareIconUrl,
					            title:"白拿体验金，邀请赚现金", // 分享标题
					            desc:context,
					            img:'https://www.zhongzairong.cn/images/wx_tyj/shareHead.jpg',
					            img_title:"白拿体验金，邀请赚现金", // 分享标题
					            from:'白拿体验金，邀请赚现金'
							};
							var share_obj = new nativeShare('nativeShare', config);
				         }
					});
				 });
				return;
			}
			if (browser.versions.ios) {
				//是否在IOS浏览器打开
				window.location.href = "<%=request.getContextPath() %>/toCodePage.do";
				return;
			}
			if (browser.versions.android) {
				//是否在安卓浏览器打开
				window.location.href = "<%=request.getContextPath() %>/toCodePage.do";
				return;
			}
		} else {
			//否则就是PC浏览器打开
			window.location.href = "<%=request.getContextPath() %>/toCodePage.do";
		}
	});
	
});
</script>

</body>
</html>