/**
 * Created by jack on 2015/4/22.
 */

/* 计算内容最小高度 */
var addEvent=(function(){
	var doc=document.documentElement;
	var fn;
	if(doc.addEventListener){
		fn=function addEvent(element,eventName,callback){
			element.addEventListener(eventName,callback,false);
		}
	}else if(doc.attachEvent){
		fn=function addEvent(element,eventName,callback){
			element.attachEvent('on'+eventName,callback,false);
		}
	}else{
		fn=function addevent(element,eventName,callback){
			element['on'+eventName]=callback;
		}
	}
	var addEvent=null;
	return fn;
}())
$(function(){

	// header配置
	~function(){
		if(window.headerConfig !== undefined){
			if(headerConfig.navType === 0){ // 默认：标准；0：简头
				$('.navigation .userlogo, .navigation .menu').remove();
			}
		}
	}();

	var hH=parseInt($('.navigation').height());
	var fH=parseInt($('.footer').height());
	var wH=parseInt($(window).height()); 
	var mH=wH-hH-fH-20;
	$('#content_height').css('minHeight',mH); 

	$('#delta_ok').click(function(){
	    var num=$('#money_num').val().trim();
	    if(num==null || num=='' || num==0 || isNaN(num)){
	        $('#money_wrong').show().html('请输入充值金额');
	        return;
	    }else{ 
	    	$('#money_wrong').hide().html('');
	    	mark(true,'btn');
	    }
	});
	
	$('.delta_gz').click(function(){
		mark(true,'');
	})
	
	//提示弹框
	$('.third_js').live('click',function(){mark(true)});
	$('.forget_pasd').live('click',function(){mark(true)});
	$('#delta_btn').live('click',function(){mark()});
	
	//隐藏提示弹框
	$('#iknow').click(function(){
	    $('.Delta_box').css('display','none');
	    $('.mark_box').css('display','none');
	});
	
	hua_sh('wptis');
})

//function scrollTop(){
//	var sTop=0;
//	addEvent(document,'touchstart',function(event){})
//	addEvent(document,'touchmove',function(event){
//		sTop=$('window').scrollTop();
//		$('.snum').html(sTop);
//		if(sTop>50){
//			$('.back_top').show();
//		}
//		if(sTop<400){
//			$('.back_top').hide();
//		}
//	})
//}

$(window).scroll(function(){  
    //获取滚动条的滑动距离  
    var scroH = $(this).scrollTop(); 
    if(scroH>10){
    	$('.back_top').show();
    }else{
    	$('.back_top').hide();
    }
})

function hua_sh(obj){
	var oDiv=$('body')[0];
	var aDiv=$('.'+obj)[0];
	var sx,ex;
	addEvent(oDiv,'touchstart',function(event){
		var event=event || window.event;
		var touch=event.touches[0];
		sx=touch.pageY;
	})

	addEvent(oDiv,'touchmove',function(event){
		var event=event || window.event;
		var touch=event.touches[0];
		ex=touch.pageY-sx;

		if(ex<0){
			if(aDiv){
				aDiv.style.display='none';
			}
		}else if(ex>0){
			if(aDiv){
				aDiv.style.display='block';
			}
		}
	})
}

	function mark(bool,attr){
		var H=$(document).height();
	    var W=$(document).width();
	    $('.mark_box').css({display:'block'}).height(H+'px');
	    var dH=$('.Delta_box').height();
	    var dW=$('.Delta_box').width();
	    if(bool){  
	    	$('.Delta_box').css({display:'block',top:(H-dH)/2-30}).attr('btn',attr);
//	    	if($('.Delta_con')){
//	    		$('.Delta_con').css({height:H/4*2,overflow:'hidden'});
//	    	}
	    }else{ 
	    	$('.Delta_box').css({display:'block',top:'20px',bottom:'20px',height:H/4*3}).attr('btn',attr);
	    }

	    var t=$('.Delta_box').css('top'),l=$('.Delta_box').css('left');     
	    if($('.closed_btn').length>0){
	    	$('.closed_btn').css('right',l);
	    	$('.closed_btn').css('top',t);  
	    }
	    $('#closed_btn').click(function(){
	    	$('.mark_box').hide();
	    	$('.Delta_box').hide();
	    })
	}
	
	var dilog=function(title,content,bool,fn){
		if($('.ts_box').length==0){
			var html='<div class="ts_box">'+
			'<div class="ts_title">'+title+
			'</div>'+
			'<div class="ts_content">'+content+
			'</div>'+
			'<div class="ts_footer">';
			if(bool){
				html+='<a href="javascript:;" class="b_ts">暂不投资</a>'+
				'<a href="'+environment.basePath+'/recharge/index.session">充值投资</a>'+
				'</div>'+
				'</div>';
			}else{
				html+='<a href="javascript:;" class="a_one">确定</a>'+
				'</div>'+
				'</div>';
			}
		}else{
			$('.ts_box').show();
		}
		var H=$(document).height();
		var wH=$(window).height();
	    var W=$(window).width();
	    $('.mark_box').css({display:'block'}).height(H+'px');
	    var dH=$('.ts_box').height();
	    var dW=$('.ts_box').width();

	    $('body').append(html);
	    
	    $('.ts_box').css({display:'block',top:wH/4+'px'});
	    
	    $('.ts_footer a').live('click',function(){
	    	$('.mark_box').hide();
	    	$('.ts_box').css('display','none');
	    	if(fn){ fn();}
	    })
	}

	function ajax(html,type,url,data,fn){
		$.ajax({
			type:type,
			url:url,
			data:data,
			success:function(){
				if(fn){
					fn();
				}
			}
		})
	}

	//绑定事件
	var addEvent=(function(){
		var doc=document.documentElement;
		var fn;
		if(doc.addEventListener){
			fn=function addEvent(element,eventName,callback){
				element.addEventListener(eventName,callback,false);
			}
		}else if(doc.attachEvent){
			fn=function addEvent(element,eventName,callback){
				element.attachEvent('on'+eventName,callback,false);
			}
		}else{
			fn=function addevent(element,eventName,callback){
				element['on'+eventName]=callback;
			}
		}
		var addEvent=null;
		return fn;
	}())

Date.prototype.Format = function (fmt) { 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

//小数留两位
function fmoney(s, n) { 
	n = n > 0 && n <= 20 ? n : 2; 
	s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + ""; 
	var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1]; 
	t = ""; 
	for (i = 0; i < l.length; i++) { 
	t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : ""); 
	} 
	return t.split("").reverse().join("") + "." + r; 
}

// 简易弹窗控件
/*
  使用方法：
  new DialogSimple(object);
*/
function DialogSimple(para){
    this.options = $.extend({
        title:'信息提示框',
        content:'Hello',
        closeCallback:$.noop
    }, para || {});
    this.init();
}
DialogSimple.prototype.init = function(){
    var that = this;
    that.creatHtml();
    $('.dialog-simple-layer .dialog-simple-title span').html(that.options.title);
    $('.dialog-simple-layer .dialog-simple-content').html(that.options.content);
    $('.dialog-simple-mask').css({
        height: $('body').height() + 'px'
    });
    $('.dialog-simple-layer').css({
        top: Number($(window).scrollTop() || $('html, body').scrollTop()) + 30 + 'px'
    });
    $('.dialog-simple-mask, .dialog-simple-layer').show();
    that.event();
};
DialogSimple.prototype.creatHtml = function(){
    if($('.dialog-simple-mask').length == 0){
        var style = [
            '<style id="dialog-simple-stylesheet">',
            '.dialog-simple-mask{width:100%;background:rgba(0, 0, 0, .5);position:absolute;left:0;top:0;z-index:101;display:none;}',
            '.dialog-simple-layer{position:absolute;left:0;width:90%;margin:0 5%;z-index:102;background-color:#fff;display:none;}',
            '.dialog-simple-layer .dialog-simple-title{padding-left:10px;border-bottom:1px #e0e0e0 solid;font-size:14px;position:relative;height:36px;line-height:36px;}',
            '.dialog-simple-layer .dialog-simple-title > a{position:absolute;top:0;right:0;width:36px;height:36px;text-align:center;}',
            '.dialog-simple-layer .dialog-simple-title > a:active{background-color:#f0f0f0;}',
            '.dialog-simple-layer .dialog-simple-title > a i:first-child{display:inline-block;width:15px;height:1px;background-color:#d1d0d0;position:absolute;left:50%;top:50%;margin-left:-7px;-webkit-transform:rotate(45deg);transform:rotate(45deg);}',
            '.dialog-simple-layer .dialog-simple-title > a i:last-child{display:inline-block;height:15px;width:1px;background-color:#d1d0d0;position:absolute;left:50%;top:50%;margin-top:-7px;-webkit-transform:rotate(45deg);transform:rotate(45deg);}',
            '.dialog-simple-layer .dialog-simple-content{font-size:12px;}',
            '</style>'
        ].join('');
        var layerBox = [
            '<div class="dialog-simple-mask"></div>',
            '<div class="dialog-simple-layer">',
                '<div class="dialog-simple-title">',
                    '<span></span>',
                    '<a href="javascript:;" class="dialog-simple-close"><i></i><i></i></a>',
                '</div>',
                '<div class="dialog-simple-content"></div>',
            '</div>'
        ].join('');
        $('head').append(style);
        $('body').append(layerBox);
    }
};
DialogSimple.prototype.event = function(){
    var that = this;
    $('.dialog-simple-layer .dialog-simple-close').off().on('click', function(){
        that.close();
    });
};
DialogSimple.prototype.close = function(){
    var that = this;
    $('.dialog-simple-mask, .dialog-simple-layer').fadeOut(200);
    that.options.closeCallback && that.options.closeCallback.call(that);
};
