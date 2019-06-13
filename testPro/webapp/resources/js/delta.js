/**
 * Created by jack on 2015/4/22.
 */



$('#select_icon,#selected').click(function(){
    $('#select_list').toggle();
})
$('#select_list ul li').click(function(){
    var html=$(this).html();
    $('#selected').html(html);
    $('#select_list').hide();
})


function djs_time(sum,id){
	var timer=setInterval(function(){
	    if(sum<=0){
	        clearInterval(timer);
	        $('#'+id).parents(".jd_time").prev().show();
	        $('#'+id).parents(".jd_time").hide();
	    }else{
	        sum--;
	        bj_time(sum,id);
	    }
	},1000)
};
function time(starttime , endtime, id){
	var ts=(endtime-starttime)/1000;
	bj_time(ts,id);
	djs_time(ts,id);
};
function bj_time(ts,id){

    var hh = parseInt(ts /60 / 60, 10);//计算剩余的小时数  
    var mm = parseInt(ts /60 % 60, 10);//计算剩余的分钟数  
    var ss = parseInt(ts % 60, 10);//计算剩余的秒数  
    hh = checkTime(hh);  
    mm = checkTime(mm);  
    ss = checkTime(ss);  
    $('#'+id).html(hh + ":" + mm + ":" + ss);  
};
function checkTime(i)    
{    
   if (i < 10) {    
       i = "0" + i;    
    }    
   return i;    
}