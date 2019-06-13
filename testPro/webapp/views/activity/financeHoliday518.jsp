<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="author" content="m.zhongzairong.cn">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<title>中再融518理财，全民有奖</title>
<%@ include file="/views/inc/inc.jsp"%>
<script src="${basePath}/resources/js/activity/holiday518.js${verCode }"></script>
<link rel="stylesheet" href="${basePath}/resources/css/activity/holiday518.css${verCode }">
<app:script href="js/common/jweixin-1.0.0.js${verCode}"/>
<!--PC百度统计代码-->
<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?455a255e408c3cc82f67b07d05532d54";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
</script>
<!--热力图-->
<script type="text/javascript">
    window._pt_lt = new Date().getTime();
    window._pt_sp_2 = [];
    _pt_sp_2.push('setAccount,392d7037');
    var _protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    (function() {
        var atag = document.createElement('script'); atag.type = 'text/javascript'; atag.async = true;
        atag.src = _protocol + 'js.ptengine.cn/pta.js';
        var stag = document.createElement('script'); stag.type = 'text/javascript'; stag.async = true;
        stag.src = _protocol + 'js.ptengine.cn/pts.js';
        var s = document.getElementsByTagName('script')[0]; 
        s.parentNode.insertBefore(atag, s); s.parentNode.insertBefore(stag, s);
    })();
</script>
</head>
<body>
 	<div class="page">
            <div class="tree">
                <div class="tree_bg">
                    <div class="tree_head">
                        <div class="tree_redpack"></div>
                    </div>
                    <div class="tree_trunk"></div>
                </div>
            </div>
            <div class="prize_rank">
                <div class="rank_mask">
                    <ul>
                    </ul>
                </div>
            </div>
            <div class="prize_record">
                <i></i>
				<c:if test="${userId == '' }"><span class="tologin">登录查看我的获奖记录</span></c:if>
                <c:if test="${userId != '' }"><span class="prizebtn">查看我的获奖记录</span></c:if>
            </div>
            <div class="tools clearfix">
                <div class="fertilize fl">
                    <div class="tools_bg"></div>
                        <div class="tools_btn">施肥</div>
                        <c:if test="${userId == '' }"> <p>当前剩余<span class="cur_count">0</span>次</p></c:if>
		                <c:if test="${userId != '' }"> <c:if test="${code == '1' }"><p>当前剩余<span class="cur_count">${cur_fertilize }</span>次</p></c:if></c:if>
		                <c:if test="${userId != '' }"><c:if test="${code == '2' }"><p>当前剩余<span class="cur_count">0</span>次</p></c:if></c:if>
                </div>
                <div class="watering fl">
                    <div class="tools_bg"></div>
                    <div class="tools_btn">浇水</div>
                    <c:if test="${userId == '' }"><p>当前剩余<span class="cur_count">0</span>次</p></c:if>
                    <c:if test="${userId != '' }"><c:if test="${code == '1' }"><p>当前剩余<span class="cur_count">${cur_water }</span>次</p></c:if></c:if>
                    <c:if test="${userId != '' }"><c:if test="${code == '2' }"><p>当前剩余<span class="cur_count">0</span>次</p></c:if></c:if>
                </div>
                <div class="disinsection fr">
                    <div class="tools_bg"></div>
                    <div class="tools_btn">除虫</div>
                  <c:if test="${userId == '' }"><p>当前剩余<span class="cur_count">0</span>次</p></c:if>
                     <c:if test="${userId != '' }"><c:if test="${code == '1' }"><p>当前剩余<span class="cur_count">${cur_disinsection }</span>次</p></c:if></c:if>
                    <c:if test="${userId != '' }"><c:if test="${code == '2' }"><p>当前剩余<span class="cur_count">0</span>次</p></c:if></c:if>
                </div>
            </div>
            <div class="projectCount">
                <div class="title01"></div>
                <div class="invite">
                    <h4><i></i><span>邀请好友注册</span></h4>
                    <div class="desc clearfix">
                        <span class="fl"></span>
                        <div class="fl">
                            <p>活动期间</p>
                            <p>成功邀请2个好友注册会为您增加2次浇水次数</p>
                        </div>
                    </div>
                    <c:if test="${userId != '' }"> 
	                    <div class="clearfix">
	                        <img class="ewm fl" alt="二维码" src="https://www.zhongzairong.cn/WeChat518ShareController/getQRCode.shtml?imgType=1&userId=${userId}&mobile=${mobile}">
	                            <div class="inv_num fl">
	                                <div>
	                                    <span>您的邀请码为：</span><div id='copytxt'><span>${inviteCode }</span></div>
	                                </div>
	                                <div class="inv_btn">请将邀请码分享给好友吧！</div>
	                            </div>
	                    </div>
	                    <div class="wxShare">
	                    	<span class="wxShare01">分享到微信朋友圈</span>
	                    	<span class="wxShare02">分享给微信好友</span>
	                    </div>
                    </c:if>
                    <c:if test="${userId == '' }">
	                        <div class="invlink tologin">登录查看我的邀请链接</div>
						</c:if>
                </div>
                <div class="invest">
                    <h4><i></i><span>投资赢次数</span></h4>
                    <div class="desc clearfix">
                        <span class="fl"></span>
                        <div class="fl">
                            <p>活动期间</p>
                            <p>您每日的前2次投资为您获得2次施肥次数</p>
                        </div>
                    </div>
                    <div class="desc clearfix">
                        <span class="fl"></span>
                        <div class="fl">
                            <p>您邀请注册的好友，每日的前2次投资为您获得2次除虫次数</p>
                        </div>
                    </div>
                    <a class="inv_btn" href="javascript:;" onclick="toInvest()">去投资</a>
                </div>
            </div>
            <div class="proExample">
                <div class="title02"></div>
                    <div class="desc clearfix">
                        <span class="fl"></span>
                        <div class="fl">
                            <p>活动期间，每笔投资按所投资期限、金额返年化5‰现金，多投多返（仅限投资非新手项目）。</p>
                        </div>
                    </div>
                    <div class="forExample">
                        <p>举个栗子：</p>
                        <p>小融活动期间，单笔投资了5万元90天项目，单笔投资10万元180天项目，那么小融可以获得现金奖励是：</p>
                        <p>5万元*90天/365*5‰=61.64元</p>
                        <p>10万元*180天/365*5‰=246.58元</p>
                    </div>
                    <div class="desc clearfix">
                        <span class="fl"></span>
                        <div class="fl">
                            <p>凡活动期间邀请好友注册并投资，邀请人均能享受好友首笔投资额1%现金奖励。</p>
                        </div>
                    </div>
                    <div class="forExample">
                        <p>举个栗子：</p>
                        <p>小融的好友活动期间注册并投资，首笔投资了5万元，那么小融可以获得的现金奖励是：</p>
                        <p>5万元*1%=500元</p>
                    </div>
            </div>
            <div class="totalRank">
                <div class="title03"></div>
                <table>
                    <thead>
                    <tr>
                        <th class="num">序号</th>
                        <th class="tel">手机号</th>
                        <th class="count">领取福卡次数</th>
                        <th class="money">活动期间投资金额</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <p class="undata clearfix"><span class="fl"></span>暂无数据<span class="fr"></span></p>
            </div>
            <div class="rule_txt">
                <div class="title04"><i class="rule_icon"></i><span>活动规则</span><i class="sj_down"></i></div>
                <div class="rule_mask">
                    <div>
                        <div class="clearfix">
                            <span class="fl">1、</span>
                            <p  class="fl">用户范围：中再融所有注册用户；</p>
                        </div>
                        <div class="clearfix">
                            <span class="fl">2、</span>
                            <p  class="fl">活动时间：2017年5月18日-2017年5月31日；</p>
                        </div>
                        <div class="clearfix">
                            <span class="fl">3、</span>
                            <div class="rule3 fl">
                                <p>系统奖励每位用户每日3次领取福卡的次数，但可通过邀请或投资方式增加，每位用户每日限领9次；</p>
                                <p>红包福，即投资返现红包，单个红包最高988元（红包福有效期1天）；</p>
                                <p>加息福，即1%加息券，领取投资即可享受全场加息，新手项目除外（加息福有效期1天）；</p>
                                <p>体验金福，即5188元体验金，计息1天，有效期30天，领取激活后单笔投资满1000元方可获得体验金收益；</p>
                                <p>安全福，每日首次分享即得1888元体验金，计息1天，有效期30天，领取激活后投资任意金额方可获得体验金收益；</p>
                            </div>
                        </div>
                        <div class="clearfix">
                            <span class="fl">4、</span>
                            <p class="fl">全民有奖环节的现金奖励将在用户投资后两个工作日内发放；</p>
                        </div>
                        <div class="clearfix">
                            <span class="fl">5、</span>
                            <p class="fl">本活动解释权归中再融所有； </p>
                        </div>
                </div>
                </div>
            </div>
            <!--弹窗-->
            <div class="redAlert rAlert">
                <input id="redType" type="hidden">
                <div class="alertTitle clearfix">
                    <span class="fl"></span>
                    <h3 class="fl">红包福</h3>
                    <span class="fr"></span>
                </div>
                <p>亲爱的融粉，恭喜您获得投资返现红包使用资格， 以下返现方式您只能选取一种，且只限今日投资使用，多投多得现金奖励哦！</p>
                <div class="redlist">
                    <ul class="clearfix">
                        <li>
                            <div class="redicon r988"></div>
                            <p>单笔投资</p>
                            <p>满100000元可用</p>
                            <div class="redbtn" data-redtype="5">领取</div>
                        </li>
                        <li>
                            <div class="redicon r288"></div>
                            <p>单笔投资</p>
                            <p>满30000元可用</p>
                            <div class="redbtn" data-redtype="4">领取</div>
                        </li>
                        <li>
                            <div class="redicon r118"></div>
                            <p>单笔投资</p>
                            <p>满10000元可用</p>
                            <div class="redbtn" data-redtype="3">领取</div>
                        </li>
                        <li>
                            <div class="redicon r58"></div>
                            <p>单笔投资</p>
                            <p>满5000元可用</p>
                            <div class="redbtn" data-redtype="2">领取</div>
                        </li>
                        <li>
                            <div class="redicon r10"></div>
                            <p>单笔投资</p>
                            <p>满1000元可用</p>
                            <div class="redbtn" data-redtype="1">领取</div>
                        </li>
                    </ul>
                </div>
                
            </div>
            <div class="tyjAlert rAlert">
                <div class="alertTitle clearfix">
                    <span class="fl"></span>
                    <h3  class="fl">体验金福</h3>
                    <span class="fr"></span>
                </div>
                <div class="r5188"></div>
                <p class="tyj_txt">小融送您5188元体验金，请尽快激活领取收益！</p>
                <div class="tyjbtn01">立即激活</div>
                <div class="tyjbtn02 clickBtn clearfix">
                    <a class="tyjUse fl" href="javascript:;" onclick="toInvest()">立即投资</a>
                    <a class="tyjClose fr">回到活动</a>
                </div>
                <div class="tyjbtn03 tyjClose">确认</div>
                <div class="close_btn tyjClose"></div>
            </div>
            <div class="jxAlert rAlert">
                <div class="alertTitle clearfix">
                    <span class="fl"></span>
                    <h3  class="fl">加息福</h3>
                    <span class="fr"></span>
                </div>
                <div class="per1"></div>
                <p>小融送您一张满载心意的1%加息券，限当日投资有效哦！</p>
                <div class="clickBtn clearfix">
                    <a class="jxUse fl" href="javascript:;" onclick="toInvest()">去投资</a>
                    <a class="jxClose fr">回到活动</a>
                </div>
                <div class="close_btn jxClose"></div>
            </div>
            <div class="safeAlert rAlert">
                <input id="safeType" type="hidden">
                <div class="alertTitle clearfix">
                    <span class="fl"></span>
                    <h3  class="fl">安全福</h3>
                    <span class="fr"></span>
                </div>
                <div class="safeIcon"></div>
                <p class="safetxt">太平洋保险为中再融提供账户安全承保赔付服务，风控防火墙再度升级</p>
                <div class="shareBtn">分享赢现金</div>
                <div class="close_btn safeClose"></div>
            </div>
            <div class="ewmAlert rAlert">
                <img class="ewmImg" src="https://www.zhongzairong.cn/WeChat518ShareController/getQRCode.shtml?imgType=2&userId=${userId }" alt="二维码">
                <p>分享即可获得1888元体验金</p>
                <div class="wxShare">
                	<span class="wxShare01">分享到微信朋友圈</span>
	                <span class="wxShare02">分享给微信好友</span>
	            </div>
                <div class="close_btn ewmClose"></div>
            </div>
            <div class="prizesAlert">
                <div class="w300">
                    <div class="title clearfix">
                        <span class="fl">时间</span>
                        <span class="fr">获得福利</span>
                    </div>
                </div>
                <div class="prizesList">
                    <ul></ul>
                </div>
                <div class="w350 clearfix jumpbtn">
                    <a href="javascript:;" class="redUse fl" onclick="toInvest()">去使用</a>
                    <a href="javascript:;" class="redlistBtn fr" onclick="toRedPacket()">去查看</a>
                </div>
                <div class="close_btn listClose"></div>
            </div>
            <div id="overlay"></div>
            <div class="error_msg">系统提示</div>
            <div class='hiddenImg'></div>
            <input type="hidden" value="${userId }" id="userId">
            <input type="hidden" value="${inviteCode }" id="invc">
            <input type="hidden" value="${mobile }" id="mob"> 
        </div>
        
        <script type="text/javascript">
	       var uId=$("#userId").val();
	       var invc=$("#invc").val();
	       var mob=$("#mob").val();
	       var arrtitle=['全民有奖，一起火拼，开启你的518掘金时刻！','518全民狂欢，中再融送你大大大礼包，请拿走！'];
	        var arrdesc=['来中再融，召唤好友，多重壕礼请拿走，单个礼包最高988，礼包送不停，给“利”不手软！','这波礼包有点大！注册就送100，还有机会领取988！一起提钱享受！一起发财走着！'];
	        var safetitle="安全稳健的国资系互联网金融平台—中再融";
	        var safedes="五重保障，十项措施，安全投资，省心更安心！";
	       var zcurl="https://www.zhongzairong.cn/WeChat518Controller/oauth.shtml?imgType=1&userId="+uId+"&inviteCode="+invc+"&mobile="+mob;
	       var safeurl="https://www.zhongzairong.cn/satetyGuarantee.shtml";
	       var zcIconurl="https://www.zhongzairong.cn/images/activity/holiday518/518share_icon.png";
	       var safeIconurl="https://www.zhongzairong.cn/images/biglogo.png";

	     // app 端调用改变页面点击事件或样式
	        function changeForApp(){
	            $('.redUse,.jxUse,.tyjUse,.invest .inv_btn').click(jumpInvest);
	            $('.redlistBtn').click(jumpRedPacket);
	            $('.wxShare').show();
	            if(typeof(anniversary.getUserMessageWith) == "function") {
	            	$('.invite .wxShare01').click(function(){
	            		  userMessage("WechatTimeLine");
	  	            });
	  	            $('.invite .wxShare02').click(function(){
	  	            	userMessage("WechatSession");
	  	            });
	            	
	            }else{
	            	 $('.invite .wxShare01').click(function(){
		 	            	shareMessageToSingle(arrtitle[sj],arrdesc[sj],"WechatTimeLine",zcurl,zcIconurl);
		 	            });
	 	            $('.invite .wxShare02').click(function(){
	 	            	shareMessageToSingle(arrtitle[sj],arrdesc[sj],"WechatSession",zcurl,zcIconurl);
	 	            });
	            }
	            $('.ewmAlert .wxShare01').click(function(){
 	            	shareMessageToSingle(safetitle,safedes,"WechatTimeLine",safeurl,safeIconurl);
 	            });
	            $('.ewmAlert .wxShare02').click(function(){
	            	shareMessageToSingle(safetitle,safedes,"WechatSession",safeurl,safeIconurl);
	            });
	           
	        }
	     // 去投资
	     	function toInvest(){
	     		window.location.href = rootUrl+'/loan/list.do';
	     }
	        function jumpInvest(){
	            anniversary.jumpInvest();
	        }
	     // 查看红包
	     	function toRedPacket(){
	     		window.location.href = rootUrl+'/myAccount/coupon.session';
	        }
	        function jumpRedPacket(){
	            anniversary.jumpRedPacket();
	        }
	        
	       
	        function GetRandomNum(Min,Max){   
		        var Range = Max - Min;   
		        var Rand = Math.random();   
		        return(Min + Math.round(Rand * Range));
	        }   
	        var sj = GetRandomNum(0,1);
	     // 分享功能调用
	        function shareMessage(){
	            // 替换参数值 链接要完整
	            var shareInfo = JSON.stringify({"title": arrtitle[sj], "desc": arrdesc[sj], "shareUrl": "http://duanhan.ren/WeChat518Controller/oauth.shtml?imgType=1&userId="+uId+"&inviteCode="+invc+"&mobile="+mob,
	                                           "shareIco":"https://www.zhongzairong.cn/images/activity/holiday518/518share_icon.png",
	                                           "platAry":["WechatSession","WechatTimeLine"]});
	                                           
	            anniversary.htmlShare(shareInfo);
	            
	        }
	     // 直接调用分享的方法
	        function shareMessageToSingle(title,des,palt,url,iconurl) {
	        
	            // 替换参数值 链接要完整
	            // plat 的参数值 WechatSession 微信 WechatTimeLine 朋友圈 QQ qq好友 Qzone qq空间 Sina 新浪
	            var shareInfo = JSON.stringify({
	                                       "title": title, "desc": des, "shareUrl": url,
                                           "shareIco":iconurl,
	                                       "plat":palt});
	            anniversary.htmlShareToSinglePlat(shareInfo);
	        }
	     // 获取用户授权信息
	        function userMessage(arg){
	           var shareInfo = JSON.stringify({"plat":arg});
	           anniversary.getUserMessageWith(shareInfo);
	        }
	        // 接受用户信息
	      
	        function sendUserInfo(openId,name,iconUrl,plat){
	        	
	            // 替换参数值 链接要完整
	            // plat 的参数值 WechatSession 微信 WechatTimeLine 朋友圈 QQ qq好友 Qzone qq空间 Sina 新浪
	             var shareInfo = JSON.stringify({"title": arrtitle[sj], "desc": arrdesc[sj], "shareUrl": "https://www.zhongzairong.cn/WeChat518Controller/oauth.shtml?imgType=1&openId="+openId+"&inviteCode="+invc+"&mobile="+mob,
	    	                                           "shareIco":"https://www.zhongzairong.cn/images/activity/holiday518/518share_icon.png",
	    	                                           "plat":plat});
	            if(openId.length!=0&&name.length!=0&&iconUrl.length!=0){
	            
	            // 添加微信用户信息的 分享
	                shareInfo = JSON.stringify({"title": arrtitle[sj], "desc": arrdesc[sj], "shareUrl": "https://www.zhongzairong.cn/WeChat518Controller/toActivty518.shtml?imgType=1&openId="+openId+"&inviteCode="+invc+"&mobile="+mob,
	    	                                           "shareIco":"https://www.zhongzairong.cn/images/activity/holiday518/518share_icon.png",
	    	                                           "plat":plat});
	            }
	            $.ajax({
	            	url:encodeURI(encodeURI(rootUrl+"/financeHoliday518/insertAppWxUserInfo.do?nickName="+name)),
	            	type:"GET",
	            	data:{"headimgurl":iconUrl,
	            		"openId":openId
	            		},
	            	success:function(data){
	            	}
	            })
	            anniversary.htmlShareToSinglePlat(shareInfo);
	        }
	    	
        </script>
</body>
</html>