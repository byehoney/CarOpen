$(function(){
	$(".openguize").click(function(){$(".wx_guize,.marke").show(); $(".wx_guize").removeClass("topgo").addClass("topruning2");})
	$(".wx_guize h3 span").click(function(){ $(".wx_guize").removeClass("topruning2").addClass("topgo"); $(".marke").hide(); });
    $(".shafebtn").click(function(){$(".fx_shafe,.marke2").fadeIn();});
    $(".marke2").click(function(){$(".fx_shafe,.marke2").fadeOut();});
    $(".red_btn img").click(function(){$(".fx_shafe,.marke2").fadeIn();});
    $(".con_btn img").click(function(){$(".fx_shafe,.marke2").fadeIn();});
});