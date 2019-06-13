<%@page import="com.yinker.wap.util.CommonUtil"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<%
String mongoPic = CommonUtil.MONGOFILEPATH;
%>
<%
String verCode = "?v=Version2015050817";
%>
<head>
<meta charset="UTF-8">
<title>中再融官网-安全 透明 规范的互联网金融平台</title>
<meta name="keywords" content="中再融,中再融官网,互联网金融,互联网金融平台,p2p理财平台,p2p投资理财平台,p2p理财,网络投资,投资理财平台,网络理财,p2p网站,p2p网贷,中再融p2p理财,投资理财,中再融P2P平台,中再融怎么样,中再融可靠吗">
<meta name="description" content="中再融是一个创新型互联网金融平台，p2p网贷行业领先品牌，北京市网贷行业协会副会长单位，中再融新手18%，凭借自身的技术和P2P产品优势，为广大投资者提供高收益、低风险的互联网理财产品。通过互联网技术降低融资成本，使投资人获得稳健的收益。让您足不出户轻松跑赢CPI，成为掌握财富密码的银行家。">
<meta name="author" content="wuyongjun_app">
<%@ include file="/views/inc/inc.jsp"%>
<link href="<%=request.getContextPath()%>/resources/css/activity/zodiac.css<%=verCode%>>" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/activity/jweixin-1.0.0.js"></script>	
</head>
<body class="zodiac zodiac-invite">
    <div class="banner"></div>
    <div class="invite-img"></div>
    <div class="share">立即分享好友</div>
    <div class="mask-floor">
        <div class="alert-box">
            <p>马上发送给好友吧！</p>
            <p class="sure">确定</p>
            <p class="arrow"></p>
        </div>
    </div>
<script>
function isWeiXin(){
    var ua = window.navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }else{
        return false;
    }
}
var arrtitle=['里约奥运会，壕撒百万元现金，可提现，亲测有效123！','亲测有效！快来与我一起领加油红包，为中国队加油，为中国健儿加油123!','边看奥运边拿钱，可提现，亲测有效！123','奥运会为中国队加油，还有现金拿，快来吧。么么哒123'];
var arrfried=['为奥运加油，领现金红包！','谁敢和我抢万元大奖！'];
var arrdesc=['壕撒百万元，人人有份','看奥运为中国队加油，万元奖品轻松拿回家。'];
var sj=parseInt(Math.random()*1);
var wxshareUrl = 'm.zhongzairong.cn';
function initWechatShare(){
    var shareurl = location.href.split('#')[0];
    $.ajax({
          url :'<%=request.getContextPath()%>/wechatShare.do',
          data : {"shareUrl":shareurl},
          dataType :'json',
          type : 'GET',
          cache : false,
          async : true,
          success : function(data){
        	  
            wx.config({
                debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                appId: 'wx91de33454c7f56f2', // 必填，公众号的唯一标识
                timestamp:data["timestamp"], // 必填，生成签名的时间戳
                nonceStr: data["nonceStr"], // 必填，生成签名的随机串
                signature:data["signature"],// 必填，签名，见附录1
                jsApiList: ['onMenuShareTimeline','onMenuShareAppMessage','onMenuShareQQ','onMenuShareWeibo','onMenuShareQZone']
            });
          }
      });
  }
initWechatShare();
 
wx.ready(function(){
    // 分享朋友圈
    wx.onMenuShareTimeline({
        title: arrtitle[parseInt(Math.random()*3)], // 分享标题
        link:   wxshareUrl+"12787", // 分享链接
        imgUrl: 'http://www.zhongzairong.cn/images/activity/olympic/jiayou.png', // 分享图标
        success: function () { 
        	 //alert("分享成功")
            // 用户确认分享后执行的回调函数
        },
        cancel: function () { 
        	 //alert("分享取消")
            // 用户取消分享后执行的回调函数
        }
    });
   // 分享朋友
    wx.onMenuShareAppMessage({
	    title:arrfried[sj], // 分享标题
	    desc:arrdesc[sj], // 分享描述
	    link: wxshareUrl, // 分享链接
	    imgUrl: 'http://www.zhongzairong.cn/images/activity/olympic/jiayou.png', // 分享图标
	    type: '', // 分享类型,music、video或link，不填默认为link
	    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
	    success: function () { 
	        // 用户确认分享后执行的回调函数
	        //alert('success')
	    },
	    cancel: function () { 
	        // 用户取消分享后执行的回调函数
	    }
	}); 
   //QQ
    wx.onMenuShareQQ({
        title: '', // 分享标题
        desc: '', // 分享描述
        link: '', // 分享链接
        imgUrl: '', // 分享图标
        success: function () { 
           // 用户确认分享后执行的回调函数
        },
        cancel: function () { 
           // 用户取消分享后执行的回调函数
        }
    });
   //腾讯微博
    wx.onMenuShareWeibo({
        title: '', // 分享标题
        desc: '', // 分享描述
        link: '', // 分享链接
        imgUrl: '', // 分享图标
        success: function () { 
           // 用户确认分享后执行的回调函数
        },
        cancel: function () { 
            // 用户取消分享后执行的回调函数
        }
    });
   //QQ空间
   /*  wx.onMenuShareQZone({
        title: '', // 分享标题
        desc: '', // 分享描述
        link: '', // 分享链接
        imgUrl: '', // 分享图标
        success: function () { 
        	alert('QZoneSuccess');
           // 用户确认分享后执行的回调函数
        },
        cancel: function () { 
            // 用户取消分享后执行的回调函数
        }
    }); */
/*     wx.hideMenuItems({
  	      menuList: [
  			"menuItem:favorite",
  			"menuItem:readMode",
  			"menuItem:openWithSafari",
  			"menuItem:share:email",
  			"menuItem:share:qq",
  			"menuItem:share:QZone",
  			"menuItem:openWithQQBrowser",
  			"menuItem:openWithSafari",
  			"menuItem:copyUrl"
  	      ]
  	});  */
      
  });
$(function(){
	$('.share').on('click',function(){
        $('.mask-floor').show();
    });
});  
</script> 
</body>
</html>
