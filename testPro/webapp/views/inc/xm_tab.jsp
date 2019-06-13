<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%--<div  class="items_nav <c:if test='${not empty isNovice && !isNovice}'>no_newuser</c:if>" id="items_nav">
    <ul>
    	<c:if test="${empty isNovice || isNovice}">
        <li ><span <c:if test="${flag == 1}">class="span_acitve"</c:if>><a href="${basePath}/loan/rookie.do">新手专享</a></span></li>
    	</c:if>
        <!-- <li><span <c:if test="${flag == 2}">class="span_acitve"</c:if>><a href="${basePath}/ykb/list.do">银客宝</a></span></li> -->
        <li ><span <c:if test="${flag == 3}">class="span_acitve"</c:if>><a href="${basePath}/loan/list.do">投资区</a></span></li>
        <li style="display:none;"><span <c:if test="${flag == 4}">class="span_acitve"</c:if>><a href="${basePath}/creditRights/list.do">转让区</a></span></li>
    </ul>
</div>--%>

<div  class="items_nav <c:if test='${not empty isNovice && !isNovice}'>no_newuser</c:if>" id="items_nav2" style=" position:fixed; top:0px;">
    <ul>
    	<c:if test="${empty isNovice || isNovice}">
        <li ><span <c:if test="${flag == 1}">class="span_acitve"</c:if>><a href="${basePath}/index.do">新手专享</a></span></li>
    	</c:if>
        <!-- <li><span <c:if test="${flag == 2}">class="span_acitve"</c:if>><a href="${basePath}/ykb/list.do">银客宝</a></span></li> -->
        <li ><span <c:if test="${flag == 3}">class="span_acitve"</c:if>><a href="${basePath}/loan/list.do">投资区</a></span></li>
        <li style="display:none;"><span <c:if test="${flag == 4}">class="span_acitve"</c:if>><a href="${basePath}/creditRights/list.do">转让区</a></span></li>
    </ul>
</div>
<!--  <div class="zzr_prlist">优选项目</div> -->
<script>/*var addEvent=(function(){
	var doc=document.documentElement;
	var fn;
	if(doc.addEventListener){
		fn=function addEvent(element,eventName,callback){
			element.addEventListener(eventName,callback,false);
		}
	}else if(doc.attachEvent){
		fn=function addEvent(element,eventName,callback){
			element.attachEvent('on'+eventName,callback,false);
		}
	}else{
		fn=function addevent(element,eventName,callback){
			element['on'+eventName]=callback;
		}
	}
	var addEvent=null;
	return fn;
}())
 var oTab=document.getElementById('items_nav');
addEvent(window,'touchstart',function(event){})*/
/*addEvent(window,'touchmove',function(event){
gl()
})*/
/*$(window).scroll(function()
{
	gl()
});*/

/*function gl(){
	sTop=$('body').scrollTop();
	if(sTop<=96){
		$('#items_nav').css('display','block');
		$('#items_nav2').css('display','none');
		
	}else{
		$('#items_nav2').css('display','block');
		$('#items_nav').css('display','none');
	}
}
addEvent(window,"touchend",function(event){
	sTop=$('body').scrollTop();
	if(sTop<=96){
		$('#items_nav2').hide(10);
	}
}) */


</script>