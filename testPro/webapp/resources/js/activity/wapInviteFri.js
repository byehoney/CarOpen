$(function () {
	var overFlag=true;
    	
	$('.rulesbtn,.overlay').click(function () {
		$('.act_rules ol').toggle(200);
		if(overFlag){
			showOverlay(".overlay");
			overFlag=false;
		}else{
			$(".overlay").hide();
			overFlag=true;
		}
	});
	$('.tologin,.inviteBtn').click(function(){
		   var _host = basePath , encodeUrl = encodeURIComponent(window.location.href);
			window.location.href = _host+ '/userInfo/nologin.do?refPath=' + encodeUrl;
	})

	if(isUser){
		$.ajax({
			 url:basePath+'/getMyInvitation.do',
			 type:'POST',
			 data:{userId:isUser},
			 success:function(rdata){
				 var data=rdata.data.MyInvitation;
				 if(data){
					 $('.invitationCNT').html(data.invitationCNT);
					 $('.investCNT').html(data.investCNT);
					 $('.redpackageSUM').html(data.redpackageSUM);
				 }else{
					 $('.invitationCNT').html('-');
					 $('.investCNT').html('-');
					 $('.redpackageSUM').html('-');
				 }
			 }
		 })  
	}
	   
	 function showOverlay(obj) {
        var pageHeight=$(document).height();
        var pageWidth=$(document).width();
        $(obj).height(pageHeight);
        $(obj).width(pageWidth);
        $(obj).show();
    }   
	 
})