$(function () {
	var slogan=['长得帅的，今天都上交国家','我们的征途是，星辰大海','犯我中华者，虽远必诛','不要暴力，要凭气势掌控全场','逢敌必亮剑'];
	var sz=getRandom(0,4);
	
    
    $(".entry_btn").click(function () {
        var armyname=$('#armyname').val();
        if(checkIsEmpty(armyname)){
            infoTips('.errormsg',"请输入您的名字");
            return;
        }
        if(!checkName(armyname)){
            infoTips('.errormsg',"名字输入有误");
            return;
        }
        showOverlay(".overlay");
        $(".loading").show();
        var str='<form id="armyForm" method="post" action="'+basePath+'/armyDay/honor.do" style="display:none"><input type="text" name="armyUserName" value="'+armyname+'"><input type="text" name="randomInstruct" value="'+slogan[sz]+'"></form>';
        $('body').append(str);
        $('#armyForm').submit();
    })
    
    
    function checkName(name){
        var flag=false;
        var reg=/(^[\u4e00-\u9fa5]{2,4}$)|(^[a-zA-Z]{1,8}$)/;
        if(reg.test(name)){
            flag=true;
        }
        return flag;
    }
    function checkIsEmpty(str){
        var flag=true;
        if(str.length>0){
            flag=false;
        }
        return flag;
    }


    function infoTips(obj,tip){
        $(obj).html(tip).show();
        setTimeout(function  () {
            $(obj).hide();
        }, 2000)
    }
    function showOverlay(obj) {
        var pageHeight=$(document).height();
        var pageWidth=$(document).width();
        $(obj).height(pageHeight);
        $(obj).width(pageWidth);
        $(obj).show();
    }

    function getRandom(min,max){
		var num=(Math.random()*(max-min))+min;
		return Math.round(num);
	}
	


})
