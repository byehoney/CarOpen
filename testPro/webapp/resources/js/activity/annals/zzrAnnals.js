$(function(){
    //父级
    var mySwiper = new Swiper('.swiperOne', {
        direction : 'vertical',
        threshold : 80,
        resistanceRatio:0
    });
    //致用户
    var textSwiper = new Swiper('.textSwiper', {
        nested : true,
        direction : 'vertical',
        slidesPerView: 'auto',
        freeMode: true,
        scrollbar: '.two .swiper-scrollbar',
        freeModeMomentumBounceRatio : 0,
        resistanceRatio : 0
    });

//星座swiper
    var starSwiper = new Swiper('.starSwiper', {
        slidesPerView: 4.5,
        spaceBetween:.06,
        freeMode: true,
    })
    // 荣誉资质 swiper
    var presentSwiper = new Swiper('.presentSwiper', {
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        autoplayDisableOnInteraction : false,
        autoplay:2000,
        loop:true,
        // observer: true, //修改swiper自己或子元素时，自动初始化swiper，主要是这两行
        // observeParents: true //修改swiper的父元素时，自动初始化swiper
    });
    $('.fourteen .prev').click(function(){
        presentSwiper.slidePrev();
    })
    $('.fourteen .next').click(function(){
        presentSwiper.slideNext();
    })
    //合规实录
    var threeSwiper = new Swiper('.three .swiper-container', {
        nested : true,
        direction: 'vertical',
        slidesPerView: 'auto',
        freeMode: true,
        scrollbar:'.three .swiper-scrollbar',
        freeModeMomentumBounceRatio : 0,
        resistanceRatio : 0
    });

})
