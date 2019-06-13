$(function(){

	//验证手机号
	$('#phone').on('blur', checked_mobile);
	
	function checked_mobile() {
		var checkExit = false;
		var reg = /^1[3-9]\d{9}$/;
		var phone_val = $('#phone').val();
		if (phone_val == '' || phone_val == '请输入手机号' || phone_val == null) {
			//$('.success_icon').hide();
			$('#mobileWrong').show().find('.wrongText').html('手机号不能为空');
			return false;
		} else if (!reg.test(phone_val)) {
			//$('.success_icon').hide();
			$('#mobileWrong').show().find('.wrongText').html('请输入正确的11位手机号');
			return false;
		} else {
			//$('.success_icon').show();
			$('#mobileWrong').hide();

			checkExit = true;
			
		}
		return checkExit;
	}
	
	$('.gift').on('click',function(){
		var mobileNum = $('#phone').val();
		var loactionUrl = window.location.href;
		var url = environment.basePath + "/register/judgePhone.do";
			if(!checked_mobile()){
			return;
		}
		function searchParse(){ 
			var resultObj = {}; 
			var search = window.location.search; 
			if(search && search.length > 1){ 
				var search = search.substring(1); 
				var items = search.split('&'); 
				for(var index = 0 ; index < items.length ; index++ ){ 
					if(! items[index]){ 
						continue; 
					} 
					var kv = items[index].split('='); 
					resultObj[kv[0]] = typeof kv[1] === "undefined" ? "":kv[1]; 
				} 
			} 
				return resultObj; 
		} 
		var searchJson = searchParse();
		$.post(url, {
			"phone" : mobileNum
		}, function(data, varStatus) {

			if (JSON.parse(data).msg == 0) {
				$('#mobileWrong').show().find('.wrongText').html('手机号已存在');
				return false;
			} else {
				if(searchJson.sr){				
					
					window.location.href = environment.basePath
					+ "/selectPage.do?sr="+searchJson.sr+"&mobile=" + mobileNum;
					
				}else if(searchJson.mmtoken){				
					
					window.location.href = environment.basePath
					+ "/selectPage.do?mobile=" + mobileNum+"&mmtoken=" + searchJson.mmtoken;
					
				}else{
					window.location.href = environment.basePath
					+ "/selectPage.do?mobile=" + mobileNum;
				}
			}
		}, "text");

	});
	
	   function getadd(name)
	   {
	        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	        var r = window.location.search.substr(1).match(reg);
	        if(r!=null)return  unescape(r[2]); return null;
	   }
     if(getadd("sr")=="googlewm"){$(".googlewm").show();}else{$(".googlewm").hide();}
	
});