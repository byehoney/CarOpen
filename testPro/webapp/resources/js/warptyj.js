$(function(){
	
	$(".tab p span").click(function(){
		var index=$(".tab p span").index(this);
		$(".Invi_list ul").hide().eq(index).show();
		$(".tab p span").removeClass("active").eq(index).addClass("active");
	});	
	
	$(".openguize").click(function(){$(".wx_guize,.marke").show(); $(".wx_guize").removeClass("topgo").addClass("topruning2");})
	$(".wx_guize h3 span").click(function(){ $(".wx_guize").removeClass("topruning2").addClass("topgo"); $(".marke").hide(); });
	
});