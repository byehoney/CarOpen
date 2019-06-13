$(function(){
	var tops=-$(".hint_title p").height()/2+"px"
	$(".hint_title p").css("marginTop",tops)
	// swiper初始化
	var mySwiper1 = new Swiper(".swiperOne", {
	    slidesPerView: "auto",
	    spaceBetween:20,
	    centeredSlides: !0,
	    watchSlidesProgress: !0,
	    onProgress: function(a) {
	        var b, c, d;
	        for (b = 0; b < a.slides.length; b++) c = a.slides[b],
	        d = c.progress,
	        scale = 1 - Math.min(Math.abs(.2 * d), 1),
	        es = c.style,
	        //es.opacity = 1 - Math.min(Math.abs(d / 2), 1),
	        es.webkitTransform = es.MsTransform = es.msTransform = es.MozTransform = es.OTransform = es.transform = "translate3d(0px,0," + -Math.abs(150 * d) + "px)"
	    },
	    onSetTransition: function(a, b) {
	        for (var c = 0; c < a.slides.length; c++) es = a.slides[c].style,
	        es.webkitTransitionDuration = es.MsTransitionDuration = es.msTransitionDuration = es.MozTransitionDuration = es.OTransitionDuration = es.transitionDuration = b + "ms"
	    }
	});
	mySwiper1.slideTo(1,10,false);
	var mySwiper2 = new Swiper(".swiperTwo", {
		pagination: '.swiper-pagination',
		autoplay: 3000,
	});
	// // 点击slide对应图片全屏放大显示
	$(".pic_list li").on("click",function(){
		var index=$(this).index();
		$(".popBox").show();
		mySwiper2.update();
		mySwiper2.slideTo(index, 0, false);
		mySwiper2.startAutoplay();
	});
	$(".popBox").on("click",function(){
		$(this).hide();
	})


})
