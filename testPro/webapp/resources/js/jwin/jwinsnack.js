function createMobileWin(){
var html = "";
html+="<div id=\"yinkermask\">";
html+="</div>";


html+="<div class=\"yk_tc\" id=\"yk_tc\" style=\"display: none;\" > ";
html+="<div class=\"tophead\">";
html+="<span class=\"b1\">验证手机号码</span><span class=\"b2\"><img class=\"close\" src='"+$.getContextPath()+"/images/jwin/yk_close.jpg' onclick='closeMobileWin()'/></span>";
html+="</div>";

html+="<div class=\"textconter clearfx\">";
html+="<p class=\"p1\">请确保当前绑定手机可接收验证码</p> ";
html +=" <p class=\"p2\"><span class=\"sjh\">手&nbsp;机&nbsp;号：</span><input class=\"m1\" type=\"text\" id='mobilePhone' name='mobilePhone' value='"+MyMobile+"' onfocus=\"closeMsg('mobilePhone')\"/><span class=\"hq\">获取验证码</span><span class=\"yzm\">验证码已发送</span><font class=\"nanber\">120</font></p>  "
html+="</div>";

html+="<div class=\"textconter clearfx\">";
html+="<p class=\"p2\"><span class=\"sjh\">验&nbsp;证&nbsp;码：</span><input class=\"m1\" type=\"text\" id='verifyMobilecode' name='verifyMobilecode' onfocus=\"closeMsg('verifyMobilecode')\"/></p>  ";
html+="</div>";
html+="<div class=\"yk_btn clearfx\">";
html+=" <a class=\"left\" id='mobileCheckButton' onclick='mobileSubmit()' >确&nbsp;定</a><a class=\"right\" id='yk_btn_mqx' onclick='closeMobileWin()'>取&nbsp;消</a>";
html+=" </div> ";
html+="</div>";
$('body').append(html);	
};
 
function jump(count) {
    window.setTimeout(function(){
        count--;
        if(count > 0) {
            $(".nanber").html(count);
            jump(count);
        } else {
			$(".yzm").hide();
			$(".nanber").hide();
			$(".hq").show();
        }
    }, 1000);
}

 function openMobileWin(str){
	//创建遮罩
		$("#yinkermask").css({
			width	:	$(document).outerWidth(),
			height	:	$(document).outerHeight()
		})
		
		//弹出层
		$("#"+str).show();
		$("#yinkermask").show();
		
		$("#"+str).css({
			left	:	($(window).innerWidth() - $("#"+str).outerWidth()) / 2+"px",
			top		:	(($(window).innerHeight() - $("#"+str).outerHeight()) / 2 + $(document).scrollTop())+"px"
		});
		
			

		$(window).on('scroll resize', function() {
			
			$("#"+str).css({
				left	:	($(window).innerWidth() - $("#"+str).outerWidth()) / 2+"px",
				top		:	(($(window).innerHeight() -$("#"+str).outerHeight()) / 2 + $(document).scrollTop())+"px"
			});
			
		});
		
		$(window).on('resize', function() {
			$("#yinkermask").css({
				width	:	$(document).outerWidth()+"px",
				height	:	$(document).outerHeight()+"px"
			})
			
			
			
		});
		
		
	}
 

//关闭
 function closeJWin(str,foo){
	if(typeof(str)=="string"){
		$("#"+str).animate({opacity:0},200,"linear",function(){$("#"+str).hide();close();});
	}
	else{
		$("#alertid").animate({opacity:0},200,"linear",function(){});
		$("#confirmid").animate({opacity:0},200,"linear",function(){});
		$("#alertmask").animate({opacity:0},200,"linear",function(){$("#alertid").hide();$("#confirmid").hide();$("#alertmask").hide();close();call();});
	}
	foo && foo();
	function close(){
		if($(".yk_tc").is(":visible")||$(".yinker_mx").is(":visible")||$(".jxl_mx").is(":visible")){}else{
			//if(typeof(str)=="string")
			$("#yinkermask").animate({opacity:0},200,"linear",function(){$("#yinkermask").hide();});
		}
		window.alert_win=0;
		$(window).unbind('DOMMouseScroll', preventDefault);
		$(window).unbind('mousewheel', preventDefault);
		$(window).unbind('mousedown', preventDefault);
		$("body").unbind('DOMMouseScroll', preventDefault);
		$("body").unbind('mousewheel', preventDefault); 
		$("body").unbind('mousedown', preventDefault);
//		$("body").unbind("click",closeJWin);
//		$("#"+str+" .close").unbind("click",closeJWin);
	}
	function call(){
		if(window.alert_arr){if(window.alert_arr.length>0){alert_call();}}
	}
 }
 
 function openJWin(str,clickClose,scrollLock,scrollNoFollow){
		//创建遮罩
	 		if(!$("#yinkermask").length){$("<div id='yinkermask'></div>").appendTo(document.body);}
	 		maskover();
			
			//弹出层
			$("#"+str).show();
			$("#"+str).animate({opacity:1},200,"linear",function(){});
			if(str=="alertid"){$("#alertmask").show();$("#alertmask").stop().fadeTo(400,0.3,function(){});}
			else {$("#yinkermask").show();$("#yinkermask").stop().fadeTo(400,0.3,function(){});}
			
			$("#"+str).css({
				left	:	($(window).innerWidth() - $("#"+str).outerWidth()) / 2+"px",
				top		:	(($(window).innerHeight() - $("#"+str).outerHeight()) / 2 + $(document).scrollTop())+"px"
			});
			
			//关闭
			if(clickClose)$("body").one('click', closeJWin);
			else{
				if(str=="alertid")$("#alertid").one("click",closeJWin);
				else $("#"+str+" .close").one("click",closeJWin);
			}
			
			if(scrollLock){
				$(window).bind('DOMMouseScroll', preventDefault);
				$(window).bind('mousewheel', preventDefault);
				$(window).bind('mousedown', preventDefault);
				$("body").bind('DOMMouseScroll', preventDefault);
				$("body").bind('mousewheel', preventDefault);
				$("body").bind('mousedown', preventDefault);
				$(window).bind('scroll', function(e){
					//此处添加js控制防滚动
					$("#"+str).css({
						left	:	($(window).innerWidth() - $("#"+str).outerWidth()) / 2+"px",
						top		:	(($(window).innerHeight() -$("#"+str).outerHeight()) / 2 + $(document).scrollTop())+"px"
					});
				});
//				$("body").css("overflow","hidden");
				maskover();
			}
			else
			if(!scrollNoFollow)$(window).bind('scroll', function(){
				$("#"+str).css({
					left	:	($(window).innerWidth() - $("#"+str).outerWidth()) / 2+"px",
					top		:	(($(window).innerHeight() -$("#"+str).outerHeight()) / 2 + $(document).scrollTop())+"px"
				});
			});
			
			$(window).bind('resize', function(){
				$("#"+str).css({
					left	:	($(window).innerWidth() - $("#"+str).outerWidth()) / 2+"px",
					top		:	(($(window).innerHeight() -$("#"+str).outerHeight()) / 2 + $(document).scrollTop())+"px"
				});
				maskover();
			});
			function maskover(){
				$("#yinkermask").css({
					width	:	$(document).outerWidth()+"px",
					height	:	$(document).outerHeight()+"px"
				});
				$("#alertmask").css({
					width	:	$(document).outerWidth()+"px",
					height	:	$(document).outerHeight()+"px"
				});
			}
			
}
 
 function preventDefault(e){
		if(document.all)window.event.returnValue=false;
		e.preventDefault();
		return false;
 }
 
 