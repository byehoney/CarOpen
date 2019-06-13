<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
  <script>
  
  var cookie={
			getCook : function(name){
				var cookieArray = document.cookie.split("; ");//得到分割的cookie名值对
			    var cookie = {};
			    for(var i=0; i<cookieArray.length; i++) {
			      var arr = cookieArray[i].split("=");//将名和值分开
			      if(arr[0]==name) return unescape(arr[1]);//如果是指定的cookie，则返回它的值
			    }
			    return false;
			},
			setCook : function(name, value, option){
			  //用于存储赋值给document.cookie的cookie格式字符串
			    var str = name+"="+escape(value);
			    if(option) {
				//如果设置了过期时间
				console.log(option.expireDays);
				if(option.expireDays) {
				  var date = new Date();
				  var ms = option.expireDays*24*3600*1000;
			     date.setTime(date.getTime()+ms);
				   str += "; expires="+date.toGMTString();
				 }
				  if(option.path) str += "; path="+path;//设置访问路径
				  if(option.domain) str += "; domain="+domain;//设置访问主机
				  if(option.secure) str += "; true";//设置安全性
			   }
			   str += "; path=/";
			   document.cookie = str;
			}
		}
  		
  	
	    $(function(){
	    	if(cookie.getCook('no')){
	    		$('.download_app').css('display','none');
	    	}
	    	$(".menu").click(function(event){
	    		if($('.nav_list').css('display')=='none'){
	    			$(this).css({background:'url('+environment.basePath + '"/resources/image/nav_top_hover.png") no-repeat right center',backgroundSize:'25px'});
	    			$(".list_jb,.nav_list").show();
	    		}else{
	    			$(".list_jb,.nav_list").hide();
	    			$(this).css({background:'url('+environment.basePath +'"/resources/image/nav_top.png") no-repeat right center',backgroundSize:'25px'});
	    		}
	    		event.stopPropagation();
	    	})
	    	$(document).click(function(){
	    		$(".list_jb,.nav_list").hide();
	    	})
	    	$('.download_app').click(function(){
	    		window.location.href= environment.basePath + "/download.do";
	    	})
	    	$('.app_closed').click(function(event){
	    		$(this).parent().hide();
	    		cookie.setCook('no','true');
	    		return false;
	    	})
	    })
    </script>	
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
<div class="download_app" style="display:none;">
	<div class="download">  
		中再融APP（理财放心、便捷省心）
	</div>
	<a href="javascript:;" class="app_closed">&nbsp;</a>
</div>
<div class="hd_logo">
	<a href="<%=request.getContextPath()%>/index.do">
		<img class="logo" src="<%=request.getContextPath()%>/resources/image/index/hd_logo.png">
	</a>
</div>

<%-- <div class="navigation">
 <div class="userlogo"><a href="${basePath}/myAccount/myAccountInfo.session"></a></div>
 <a href="${basePath}/index.do"><img class="logo" src="<%=request.getContextPath()%>/resources/image/index/logo.png" /></a>
 <div class="menu">
      <div id="menu"><img class="list_jb" src="<%=request.getContextPath()%>/resources/image/index/list_jb.png" /></div>
      <div class="nav_list list" style="display:none">
        <c:if test="${empty userObj}">
         <ul>
            <li><a href="${basePath}/">首页</a></li>
            <li><a href="${basePath}/loan/list.do">投资</a></li>
            <li><a href="${basePath}/register/toRegister.do">注册/登录</a></li>
            <li><a href="${basePath}/userInfo/nologin.do">登录</a></li>
            <li style="display:none;"><a href="${basePath}/download.do">下载App</a></li>
         </ul>
        </c:if>
        <c:if test="${not empty userObj}">
	        <ul>
	           <li><a href="${basePath}/">首页</a></li>
	           <li><a href="${basePath}/loan/list.do">投资</a></li>
	           <li style="display:none;"><a href="${basePath}/toInviteList.do">我的邀请</a></li>
	           <li style="display:none;"><a href="${basePath}/download.do">下载App</a></li>
	           <li style="display:none;"><a href="${basePath}/experienceGoldIndex.do">体验金</a></li>
	           <li><a href="${basePath}/userInfo/logout.do">退出</a></li>
	        </ul>
        </c:if>
      </div>
   </div>
</div>--%>
<!--导航栏end-->