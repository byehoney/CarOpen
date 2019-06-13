$(document).ready(function () {
	$(".main_image").height($(".imgheiht").height());
	$dragBln = false;
	$(".main_image").touchSlider({ 
		flexible : true,
		speed : 200,
		btn_prev : $("#btn_prev"),
		btn_next : $("#btn_next"),
		paging : $(".flicking_con a"),
		counter : function (e){$(".flicking_con a").removeClass("on").eq(e.current-1).addClass("on");}
	});
	$(window).resize(function(){$(".main_image").height($(".imgheiht").height());});
	$(".main_image").bind("mousedown", function(){$dragBln = false;});
	$(".main_image").bind("dragstart", function(){$dragBln = true;});
	$(".main_image a").click(function(){if($dragBln) {return false;}});
	timer = setInterval(function() {$(".main_image").height($(".main_image li").height()); $("#btn_next").click();},4000);
	$(".main_visual").hover(function(){clearInterval(timer);}, function() {timer = setInterval(function() { $("#btn_next").click();},4000);});
	$(".main_image").bind("touchstart", function() {clearInterval(timer);}).bind("touchend", function() {timer = setInterval(function() { $("#btn_next").click();},4000);});
    $(".list a").click(function(event){event.stopPropagation();})
});
	
	
