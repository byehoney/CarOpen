$(function(){
	$('.en_btn').click(function(){
		var msg = $('.idnum').val().trim();
		var mobile = getUrlParams('mobile');
		var mobExist = getUrlParams('mobExist');
		var reg = /^[0-9]*$/;
		if(msg==''){
			infoTips('请输入ID账号');
			$('.idnum').focus();
		}else if(!reg.test(msg)){
			infoTips('<p>您输入的ID有误,</p><p>请检查后再次输入哦</p>');
			$('.idnum').focus();
		}else{
			var url = environment.basePath + "/newwolfdone.do";
			$.ajax({
	            type : "POST",
	            url : url,
	            async : false,
	            cache : false,
	            data : {
	            	"mobile" : mobile,
	                "werwolfKillId" : msg,
					"checkIsExistStatuas":mobExist
	            },
	            success : function(data) {
	               if(data.code == 1){//未注册未绑定
	            	    window.location.href=environment.basePath+'/toNewwerwolfdone.do';           
	            	}else if(data.code == 2){//已注册未绑定
	            		window.location.href=environment.basePath+'/toNewwolfband.do';  
	               }
	            }
	        });
		}
	})
	function infoTips(tip){
        $(".error_msg").html(tip).show();
        setTimeout(function  () {
            $(".error_msg").hide();
        }, 1500)
    }
    function getUrlParams(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
})