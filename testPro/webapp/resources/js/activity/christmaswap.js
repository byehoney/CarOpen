$(function () {
	$('.lis_item01').on('click', function() {
		$('body,html').animate({scrollTop: ($('.table_tit01').offset().top-20)},
			500);
	});
	$('.lis_item02').on('click', function() {
		$('body,html').animate({scrollTop: ($('.table_tit02').offset().top-20)},
			500);
	});
	$('.lis_item03').on('click', function() {
		$('body,html').animate({scrollTop: ($('.white_table03').offset().top-20)},
			500);
	});

})