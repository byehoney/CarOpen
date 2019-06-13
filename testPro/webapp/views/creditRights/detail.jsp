<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,com.mapper.User" errorPage="" %>
<%
//当前用户
User user = null;
Object obj = request.getSession().getAttribute("userObj");
Integer userId = null;
String mobile = "";
if(obj != null)
{
	 user = (User) obj;
	 userId = user.getUserId();
	 mobile = user.getMobile();
}
boolean userStatus = false;
String pnrUserCustId = "";
if(null != user){
	 userStatus = true;
	 pnrUserCustId= user.getPnrUserCustId();
}

boolean isopenpnr = false;
if(pnrUserCustId != null && pnrUserCustId != "null" && pnrUserCustId != ""){
	isopenpnr = true;
}
%>
<!DOCTYPE html>
<html>
<head>
<title>我要投资 - 中再融</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="wuyongjun_app">
<%@ include file="/views/inc/inc.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/details.css">
<link type="text/css" rel="stylesheet" href="${basePath}/resources/css/items.css">
<script type="text/javascript" src="${basePath}/resources/js/fancyBox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
<script type="text/javascript" src="${basePath}/resources/js/fancyBox/source/jquery.fancybox.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/resources/js/fancyBox/source/jquery.fancybox.css?v=2.1.5" media="screen" />
<style>
.hd{margin:0 10px; padding:0 10px; float: left; height:20px; border-radius:15px; text-align:center; background-color:rgba(0,0,0,0.2); font-size:12px; color:#fff330; line-height:20px;}
</style>
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>

<div id="content_height">
<%@ include file="/views/inc/xm_tab.jsp"%>
<div 
<c:if test='${result.data.creditRightsMap.creditRightsInfo.status eq 310}'>class="wp_details k_xq"</c:if>
<c:if test='${result.data.creditRightsMap.creditRightsInfo.status eq 510}'>class="wp_details o_xq"</c:if>> 
   <div class="top">
      <div class="project clearfx">
         <div class="title">${result.data.creditRightsMap.loan.title}</div>
         <div class="xieyi">
         	<div class="img_icon"></div>
         	<a href="${basePath}/yinkerDebtContractMouldInfo.do?loanId=${result.data.creditRightsMap.loan.loanId}">投资协议范本</a>
         </div>
      </div>
      <c:forEach items="${result.data.creditRightsMap.loanWelfare}" var="welfare">
      <div class="hd">
      ${welfare.campaignSetName}
      </div>
      </c:forEach>
      <div class="yield clearfx">
         <div class="sy">
            <p><span><fmt:formatNumber   pattern="${aunualInterestRateExp}" type="currency" value="${result.data.creditRightsMap.creditRightsInfo.toBeCollectedInterest }"/><em>%</em></span>
            <div>年化收益率</div>
         </div>
         <div class="date">
            <p>${result.data.creditRightsMap.creditRightsInfo.loanHaveCount }<span>天</span></p>
            <div>项目周期</div>
         </div>
      </div>
   </div>
   <div class="bottom">
      <div class="sjlist">
        <p>还款方式：<c:if test="${result.data.creditRightsMap.loan.repayType==1 }">等额本息 </c:if>
              <c:if test="${result.data.creditRightsMap.loan.repayType==5 }">按月计息，到期还本  </c:if>
              <c:if test="${result.data.creditRightsMap.loan.repayType==10 }">先息后本</c:if>
              <c:if test="${result.data.creditRightsMap.loan.repayType==15 }">一次性还本付息  </c:if>
          </p>
         <p>挂牌截止：<fmt:formatDate value="${result.data.creditRightsMap.creditRightsInfo.transPreEndDate }" pattern="yyyy.MM.dd" /></p>
         <p>项目结束：<fmt:formatDate value="${result.data.creditRightsMap.loan.endTime }" pattern="yyyy.MM.dd" /></p>
         <p>保障方式：<c:if test="${result.data.creditRightsMap.loanProduct.id==6}">
                由${result.data.creditRightsMap.bills}<c:if test="${fn:length(result.data.creditRightsMap.loan.securityMode)> 12}">${fn:substring(result.data.creditRightsMap.loan.securityMode, 0, 10)}...</c:if><c:if test="${fn:length(result.data.creditRightsMap.loan.securityMode)<= 12}">${result.data.creditRightsMap.loan.securityMode}</c:if>
              </c:if>
              <c:if test="${result.data.creditRightsMap.loanProduct.id!=6}">
              由${result.data.creditRightsMap.company.companyName }提供
              <c:if test="${fn:length(result.data.creditRightsMap.loan.securityMode)> 12}">${fn:substring(result.data.creditRightsMap.loan.securityMode, 0, 10)}...</c:if><c:if test="${fn:length(result.data.creditRightsMap.loan.securityMode)<= 12}">${result.data.creditRightsMap.loan.securityMode}</c:if>
              </c:if>
          </p>
      </div>
      <div class="project-grade">
        <div class="grade-letter"></div>
        <p>项目评级</p>
      </div>
   </div>
   
   <div class="conter">
       <div class="tz_xq">
         <ul class="clearfx">
            <li>
              <p>${result.data.creditRightsMap.creditRightsInfo.prjLoad}%</p>
              <div>募集进度</div>
            </li>
            <li>
              <p>${result.data.creditRightsMap.creditRightsInfo.investCount}<span>人</span></p>
              <div>已投人数</div>
            </li>
            <li>
              <p>
                <c:if test="${result.data.creditRightsMap.loan.repayType!=1 }">
                <fmt:formatNumber pattern="#,##0" type="currency"
                  value="${(result.data.creditRightsMap.creditRightsInfo.transAmount)/result.data.creditRightsMap.creditRightsInfo.minInvestUnit}" />
                </c:if>
                <c:if test="${result.data.creditRightsMap.loan.repayType==1 }">
                1
                </c:if>
                <span>份</span></p>
              <div>转让份额</div>
            </li>
         </ul>
       </div>
       <p class="safe">
       		
       		资金安全由<img src="<%=request.getContextPath()%>/resources/image/baozhang_logo.png">承保
       </p>
   </div>
   <div class="bg10"></div>
   <div class="conter2">
	   <div class="tablist">
	      <ul class="clearfx">
	         <li id="detail"><p class="active">项目详情</p></li>
           <%-- <c:if test="${result.data.creditRightsMap.loan.loanId > 270}">
           <li id="riskControl"><p>风险控制</p></li>
            </c:if>
            <c:if test="${result.data.creditRightsMap.loan.loanId < 270}">
           <li id="riskControl"><p>产品简述</p></li>
            </c:if> --%>
	         <li id="investRecord"><p>投资记录</p></li>
	         <li id="loanPhase"><p>回款计划</p></li>
	      </ul>
	   </div>
     <div class="tab_content">
      <c:if test="${result.data.creditRightsMap.loan.loanId > 270}">
      <div class="tz_list_box" style="display:block;">
        <c:if test="${result.data.creditRightsMap.type==1 || result.data.creditRightsMap.type==3 || result.data.creditRightsMap.loan.productfulId==26 || result.data.creditRightsMap.loan.productfulId==27 || result.data.creditRightsMap.loan.productfulId==28}">
                <c:if test="${result.data.creditRightsMap.loan.productfulId!=26 && result.data.creditRightsMap.loan.productfulId!=27 && result.data.creditRightsMap.loan.productfulId!=28}">
                  <div class="yktitle1"><span>借款人</span></div>
                </c:if>
                <c:if test="${result.data.creditRightsMap.loan.productfulId==26 || result.data.creditRightsMap.loan.productfulId==27 || result.data.creditRightsMap.loan.productfulId==28}">
                  <div class="yktitle1"><span>债务人认证</span></div>
                </c:if>
              </c:if>
              <c:if test="${result.data.creditRightsMap.type==2 || result.data.creditRightsMap.type==4}">
                <c:if test="${result.data.creditRightsMap.loan.productfulId==null}">
                  <div class="yktitle1"><span>借款企业</span></div>
                </c:if>
                <c:if test="${result.data.creditRightsMap.loan.productfulId!=null}">
                  <c:if test="${result.data.creditRightsMap.loan.productfulId==12 ||result.data.creditRightsMap.loan.productfulId==25}">
                    <div class="yktitle1"><span>债务人认证</span></div>
                  </c:if>
                  
                  <c:if test="${result.data.creditRightsMap.loan.productfulId!=12 && result.data.creditRightsMap.loan.productfulId!=25}">
                   <!--2015-01-05 xusong  产品类型为21  汇贝专属_消费金融_企业协议模板 不显示 -->
                    <c:if test="${result.data.creditRightsMap.loan.productfulId!=21 }">
                      <c:if test="${result.data.creditRightsMap.loan.repayType!=15}">
                        <div class="yktitle1"><span>借款企业</span></div>
                      </c:if>
                    </c:if>
                  </c:if>
                </c:if>
              </c:if>
              <div id="detailTable"></div>
      </div>
      </c:if>
      <c:if test="${result.data.creditRightsMap.loan.loanId < 270}">
      <div class="tz_list_box" id="detailTable" style="display:block; margin-top:10px;"></div>
      </c:if>
      <!-- <div class="tz_list_box" id="riskControlTable"></div> -->
      <div class="tz_list_box" id="investRecordTable"></div>
      <div class="tz_list_box" id="loanPhaseTable"></div>
   </div>
      
</div>
  <c:if test="${result.data.creditRightsMap.creditRightsInfo.status eq 510}">
      <p class="tz_btn o_color"><a href="javascript:;">转让完毕</a></p>
  </c:if>
  <c:if test="${result.data.creditRightsMap.creditRightsInfo.status eq 310}">
      <p class="tz_btn"><a href="${basePath}/invest/creditRightsDetail.session?debtId=${result.data.creditRightsMap.creditRightsInfo.ID}">立即投资</a></p>
  </c:if>
</div>

<div class="back_top"></div>
<%@ include file="/views/inc/footer.jsp"%>



<script type="text/javascript" src="${basePath}/resources/js/project.detail.js?v=2.1.5"></script>
<script type="text/javascript">
var $CONFIG = {
	loanId:'${result.data.creditRightsMap.loan.loanId}'
};
$(function () {
  getLoanDetail(1);
  
  $('.fancybox').fancybox();
  $('.tz_list_box ').each(function(){

          $(this).find('.title').live('click',function(){
            var next=$(this).next();
            console.log(next);
            if(next.css('display')=='block'){
              next.css('display','none');
            }else{
              next.css('display','block');
            }
          })

        });

  $('.tablist li').each(function(){
      $(this).click(function(){
        $('.tablist li p').removeClass("active");
        var i=$(this).index();
        var id=$(this).attr('id');
        $('.tab_content .tz_list_box').each(function(){
          $(this).hide();
        });
        $(this).find("p").addClass("active");
        $('.tab_content .tz_list_box').eq(i).show();
        if(id == 'detail'){
          getLoanDetail(1);
        }
        /**
        else if(id == 'riskControl'){
          getLoanDetail(2);
        }
        */
        else if(id == 'investRecord'){
          getLoanDetail(3);
        }else{
          getLoanDetail(4);
        }
      })
    });

});

/*项目详情*/
function getLoanDetail(index){
  $.ajax({
    type: 'POST',
    url: environment.basePath + "/loan/loanDetail.do",
    data: {"index":index,"loanId":'${result.data.creditRightsMap.loan.loanId}',"debtId":'${result.data.creditRightsMap.creditRightsInfo.ID}'},
    beforeSend: function(){},
    success: function(data) {
      if(data.code < 0){
        dilog("提醒",data.msg,false);
        return;
      }else{
        var htmlStr = "";
        if(index == 1){
        	var riskControl = data.data.riskControl;
        	var riskControlHtml = "";
            if(Number('${result.data.creditRightsMap.loan.loanId}')> 270){
              if(riskControl != null && riskControl != ''){
            	  riskControlHtml += riskControl;
              }else{
                riskControlHtml += '<div class="no_data no_tz"></div>';
              }
            }else{
              var loan = '${result.data.creditRightsMap.loan}';
              riskControlHtml += '<div class="itproject_etc clearfx prod_resume">';
              if(loan.companyid == 13){
                riskControlHtml += '<div class="cont">'
                        + '<p><font>“茶语茗香”</font>产品由中再融联合专业的茶叶垂直电商平台“醉品商城”推出的互联网金融理财产品。由醉品商城向中再融推荐优质借款人（醉品商城的供货商），借款人以茶叶等实物质押作为反担保条件，醉品商城为借款项目提供连带责任担保，并受中再融委托监管质押物。醉品商城负责质押物评估、质押物出入库、借款资金使用、借款人回款的全程跟踪，切实保障投资项目的安全性。</p>'
                        + '<h4 style="color:#2ea4d2;font-size:16px;font-weight:bold;margin:30px 0px 10px;">风险控制</h4>'
                        + '<p>本产品由厦门醉品春秋网络科技有限公司提供本息担保，借款人提供动产（茶叶）质押。若借款人未能按时全额履行还款责任，由厦门醉品春秋网络科技有限公司无条件对借款人的本息承担代偿责任。</p>'
                        + '<p>本产品风险控制措施主要包括：</p>'
                        + '<p>醉品商城为中再融提供借款人最近12个月交易数据</p>'
                        + '<p>醉品商城专业评估团队评估入库醉品的质押物价值</p>'
                        + '<p>中再融风控人员实地考察借款人资信、声誉与经营状况</p>'
                        + '<p>中再融通过银行等支付结算数据交叉验证借款人还款能力</p>'
                        + '<p>醉品商城定期向中再融呈现其经营数据</p>'
                        + '<p>醉品商城仓储中心向中再融提交质押物出入库信息</p>'
                        + '<p>中再融动态跟踪质押物市场波动情况</p>'
                        + '<p>醉品商城及中再融不定期对借款人进行贷后巡查</p></div>';
              }
              if(loan.companyid != 13){
                if(riskControl != null && riskControl != ''){
                  riskControlHtml += '<div class="cont">'
                          + '<p><font>“小镇瑰宝”</font>是云南省芒市海华开发有限公司旗下芒市海华小额贷款有限公司（以下简称“海华小贷公司”）面向个人借款者和个人投资者推出的个人借贷产品。结合芒市<a href="http://www.zhubaotown.com/" target="_blank" class="font_skyblue">珠宝小镇</a>的产业链优势，海华小额贷款公司优选出小镇内的优质商家，为投资人和商家（借款人）提供互联网投融资服务，让投资人在帮助中小微商家经营的同时，得到合理的回报，实现财富共赢。中再融全程监管海华小贷公司在“小镇瑰宝”个人借贷产品服务过程中的业务开展、保证行为和借款资金划拨，同时对借贷双方网上交易进行技术支持，并给予法律保障，确保将投资人资金直接投向借款人，双方通过平台签订电子借贷协议，明确双方债务与债权关系，保障借贷双方的法律权益。</p>'
                          + '<h4 style="color:#2ea4d2;font-size:16px;font-weight:bold;margin:10px 0px 10px;">风险揭示</h4>'
                          + '<p><font>“小镇瑰宝”</font>产品由海华小贷公司承担全额担保代偿责任。若借款人未能按时全额履行还款责任，海华小贷公司将对借款人的本息承担全额担保代偿责任。</p>';
                          + '</div>';
                }else{
                  riskControlHtml += '<div style="margin:30px auto;">'
                          + '<p style="text-indent:2em;">本理财产品由与中再融合作的线下融资性担保机构推介，经中再融联合专业第三方资信机构二次审核通过后在线发布，供中再融注册投资者投资。中再融全程监管担保机构在服务过程中的业务开展、保证行为和借款资金划拨，同时对借贷双方网上交易进行技术支持，全程给予法律保障，确保投资人资金直接投向借款人，双方通过平台签订电子借贷协议，明确债务与债权关系，保障借贷双方的法律权益。担保机构对于推荐的项目全程进行跟踪，随时考察借款人动态，监督借款人对资金的使用，保障投资人资金用到实处。</p>'
                          + '<p style="color:#2ea4d2;font-size:16px;font-weight:bold;margin:30px 0px 10px;">【风险控制】</p>'
                          + '<p>本产品由合作担保机构提供本息担保，借款人提供资产抵质押。若借款人未能按时全额履行还款责任，担保机构无条件对借款人的本息承担代偿责任。</p>'
                          + '<p style="color:#2ea4d2;font-size:16px;font-weight:bold;margin:30px 0px 10px;">【借款成本】</p>'
                          + '<p>借款人借款利率：8%-14.5%</p>'
                          + '<p>担保费率：2%-3%</p>'
                          + '<p>第三方支付费率：0.6%</p>'
                          + '<p>中再融服务费率：0.2%/月</p>'
                          + '<p>[1]本借贷产品借款利率低于央行同期贷款利率的4倍，符合中华人民共和国相关法律规定，投资人收益受到法律保护。</p>'
                          + '<p>[2]本借贷产品第三方支付费率为投资人与借款人充值手续费之和。</p>'
                          + '</div>';
                }
              }
              riskControlHtml += '</div>';
            }
            
            var userStatus = "<%=userStatus%>";
            var isopenpnr = "<%=isopenpnr%>";
        	
          // console.log(data.data.loanDetail);
          var loanDetail = data.data.loanDetail;
          var detailTable = $('#detailTable');
          detailTable.html("");
          if(Number('${result.data.creditRightsMap.loan.loanId}')> 270){
            //新项目
            /** 删除认证信息
            var detailHeadHtml = loanDetail.detailHead;
            if(detailHeadHtml == null || detailHeadHtml == undefined){
              detailHeadHtml = "";
            }
            */
            var xmxqhtml = loanDetail.xiangqing;
            if(loanDetail.loanType==1){
            htmlStr += '<div class="loanCompany"><div class="clearfix"><label>姓名：</label><span class="w190">'+ loanDetail.xingming +'</span>';
            htmlStr += '<label>性别：</label><span class="w190">'+ loanDetail.sex +'</span></div>';
            htmlStr += '<div class="clearfix"><label>年龄：</label><span class="w190">'+ loanDetail.year +'</span>';
            htmlStr += '<label>在读院校：</label><span class="w190">'+ loanDetail.topEduSchool +'</span></div>';
            htmlStr += '<div class="clearfix"><label>专业：</label><span class="w190">'+ loanDetail.department +'</span>';
            htmlStr += '<label>户籍：</label><span class="w190">'+ loanDetail.homeTownAddr +'</span></div>';
            
         	// 判断用户是否登录
            if (userStatus == 'true') {
            	//if(isopenpnr == 'true'){
            		htmlStr += '<div class="clearfix"><label><a href="javascript:;" class="wblue bluemore">查看更多</a></label></div></div>';
            	//} else {
            	//	htmlStr += '<div class="clearfix"><label><a href="javascript:;" class="wblue bluelookmore">查看更多</a></label></div></div>';
            	//}
            } else {
            	htmlStr += '<div class="clearfix"><label><a href="javascript:toLogin();" class="wblue">登录</a>后查看更多</label></div></div>';
            }
            }
            if(loanDetail.loanType==2){
            htmlStr += '<div class="loanCompany"><div class="clearfix"><label>姓名：</label><span class="w190">'+ loanDetail.xingming +'</span>';
            htmlStr += '<label>性别：</label><span class="w190">'+ loanDetail.sex +'</span></div>';
            htmlStr += '<div class="clearfix"><label>年龄：</label><span class="w190">'+ loanDetail.age +'</span>';
            htmlStr += '<label>婚姻：</label><span class="w190">'+ loanDetail.hunyinStr +'</span></div>';
            
         	// 判断用户是否登录
            if (userStatus == 'true') {
            	//if(isopenpnr == 'true'){
            		htmlStr += '<div class="clearfix"><label><a href="javascript:;" class="wblue bluemore">查看更多</a></label></div></div>';
            	//} else {
            	//	htmlStr += '<div class="clearfix"><label><a href="javascript:;" class="wblue bluelookmore">查看更多</a></label></div></div>';
            	//}
            } else {
            	htmlStr += '<div class="clearfix"><label><a href="javascript:toLogin();" class="wblue">登录</a>后查看更多</label></div></div>';
            }
            }
            if(loanDetail.loanType==3){
            htmlStr += '<div class="loanCompany"><div class="clearfix"><label>成立时间：</label><span class="w190">'+ loanDetail.clsj +'</span>';
            if(loanDetail.zczj){
              htmlStr += '<label>注册资金：</label><span class="w190">'+ loanDetail.zczj +'</span>';
            }
            htmlStr+='</div>';
            htmlStr += '<div class="clearfix"><label>公司地址：</label><span class="w190">'+ loanDetail.gsdz +'</span>';
            htmlStr += '<label>所属行业：</label><span class="w190">'+ loanDetail.sshy +'</span></div>';
            
         	// 判断用户是否登录
            if (userStatus == 'true') {
            	//if(isopenpnr == 'true'){
            		htmlStr += '<div class="clearfix"><label><a href="javascript:;" class="wblue bluemore">查看更多</a></label></div></div>';
            	//} else {
            	//	htmlStr += '<div class="clearfix"><label><a href="javascript:;" class="wblue bluelookmore">查看更多</a></label></div></div>';
            	//}
            } else {
            	htmlStr += '<div class="clearfix"><label><a href="javascript:toLogin();" class="wblue">登录</a>后查看更多</label></div></div>';
            }
            }
            
            detailTable.append(htmlStr);

            if(xmxqhtml== null){
              //detailTable.append(detailHeadHtml);
            	detailTable.append(riskControlHtml);
            }else{
              //detailTable.append(detailHeadHtml+xmxqhtml);
            	detailTable.append(xmxqhtml + riskControlHtml);
            }
          }else{
            //老项目
            htmlStr += '<div class="title clearfx">';
            htmlStr += '<h3>项目描述</h3><span><img src="${basePath}/resources/image/description_up.png" /></span></div>';
            htmlStr += '<div class="conaboat"> <div class="list_text"><h4>项目介绍</h4><img src="${basePath}/resources/image/description_list.png" width="8" height="30" />';
            htmlStr += '<p>'+loanDetail.loan.description+'</p></div>';
            htmlStr += '<div class="list_text"><h4>资金用途</h4><img src="${basePath}/resources/image/description_list.png" width="8" height="30" />';
            htmlStr += '<p>'+loanDetail.loan.capitalPurpose+'</p></div>';
            htmlStr += '<div class="list_text"><h4>还款来源</h4><img src="${basePath}/resources/image/description_list.png" width="8" height="30" />';
            htmlStr += '<p>'+loanDetail.loan.repaymentSource+'</p></div></div> ';
            htmlStr += '<div class="title clearfx"><h3>安全保障</h3><span><img src="${basePath}/resources/image/description_up.png" /></span></div>';
            htmlStr += '<div class="conaboat" ><div class="list_text"><h4>担保机构</h4><img src="${basePath}/resources/image/description_list.png" width="8" height="30" />';
            htmlStr += '<p>${result.data.loanMap.company.companyFullName}</p></div>';
            htmlStr += '<div class="list_text"><h4>抵押物</h4><img src="${basePath}/resources/image/description_list.png" width="8" height="30" />';
            htmlStr += '<p>'+loanDetail.loan.mortgage+'</p></div>';
            htmlStr += '<div class="list_text"><h4>担保意见</h4><img src="${basePath}/resources/image/description_list.png" width="8" height="30" />';
            htmlStr += '<p>'+loanDetail.loan.guarantymemo+'</p></div></div>';
            htmlStr += '<div class="title clearfx"><h3>借款人</h3><span><img src="${basePath}/resources/image/description_up.png" /></span></div>';
            htmlStr += '<div class="conaboat"><ul class="clearfx info">';
            htmlStr += '<li class="no1"><span>用户名:'+loanDetail.borrowerNickName+'</span></li>';
            if(loanDetail.personinfo == null || loanDetail.personinfo == undefined){
            	htmlStr += '<li><span>性别:</span></li>';
            }else{
            	if(loanDetail.personinfo.gender){
	              htmlStr += '<li><span>性别:男</span></li>';
	            }else{
	              htmlStr += '<li><span>性别:女</span></li>';
	            }
            }
            htmlStr += '<li class="no1"><span>年龄:'+loanDetail.age+'岁</span></li>';
            var education = '';
            if(loanDetail.personinfo == null || loanDetail.personinfo == undefined){
            	education = '';
            }else{
            	if(loanDetail.personinfo.topEducation==10){
	              education = '小学';
	            }else if(loanDetail.personinfo.topEducation==20){
	              education = '初中';
	            }else if(loanDetail.personinfo.topEducation==30){
	              education = '中专';
	            }else if(loanDetail.personinfo.topEducation==40){
	              education = '高中';
	            }else if(loanDetail.personinfo.topEducation==50){
	              education = '大专';
	            }else if(loanDetail.personinfo.topEducation==60){
	              education = '本科';
	            }else if(loanDetail.personinfo.topEducation==70){
	              education = '硕士';
	            }else if(loanDetail.personinfo.topEducation==80){
	              education = '博士';
	            }else if(loanDetail.personinfo.topEducation==90){
	              education = '其他';
	            }
            }
            
            htmlStr += '<li><span>学历:'+education+'</span></li>';
            if(loanDetail.personinfo == null || loanDetail.personinfo == undefined){
            	htmlStr += '<li class="no1"><span>婚姻:</span></li>';
            }else{
            	if(loanDetail.personinfo.hasMarried){
	              htmlStr += '<li class="no1"><span>婚姻:已婚</span></li>';
	            }else{
	              htmlStr += '<li class="no1"><span>婚姻:未婚</span></li>';
	            }
            }
            var homeProvinceName = '',homeCity='';
            if(loanDetail.homeProvinceName == null || loanDetail.homeProvinceName == undefined){
              homeProvinceName = '';
            }else{
              homeProvinceName = loanDetail.homeProvinceName;
            }
            if(loanDetail.homeCity == null || loanDetail.homeCity == undefined){
              homeCity = '';
            }else{
              homeCity = '-'+ loanDetail.homeCity;
            }
            htmlStr += '<li><span>户籍:'+homeProvinceName+homeCity+'</span></li>';
            htmlStr += '</ul></div>';
            htmlStr += '<div class="title clearfx"><h3>银客个人认证</h3><span><img src="${basePath}/resources/image/description_up.png" /></span></div>';
            htmlStr += '<div class="conaboat"><ul class="clearfx pic_approve">';
            if(loanDetail.sfz == 1){
              htmlStr += '<li  class="m1"><span><img src="${basePath}/resources/image/approve_1_1.png" /></span><p>身份证</p></li>';
            }else{
              htmlStr += '<li  class="m1"><span><img src="${basePath}/resources/image/approve_1.png" /></span><p>身份证</p></li>';
            }
            if(loanDetail.jhz == 1){
              htmlStr += '<li><span><img src="${basePath}/resources/image/approve_2_2.png" /></span><p>结婚证</p></li>';
            }else{
              htmlStr += '<li><span><img src="${basePath}/resources/image/approve_2.png" /></span><p>结婚证</p></li>';
            }
            if(loanDetail.fcz == 1){
              htmlStr += '<li  class="m2"><span><img src="${basePath}/resources/image/approve_3_3.png" /></span><p>房产证</p></li>';
            }else{
              htmlStr += '<li  class="m2"><span><img src="${basePath}/resources/image/approve_3.png" /></span><p>房产证</p></li>';
            }
            if(loanDetail.dbht == 1){
              htmlStr += '<li><span><img src="${basePath}/resources/image/approve_4_4.png" /></span><p>担保合同</p></li>';
            }else{
              htmlStr += '<li><span><img src="${basePath}/resources/image/approve_4.png" /></span><p>担保合同</p></li>';
            }
            if(loanDetail.hkb == 1){
              htmlStr += '<li  class="m1"><span><img src="${basePath}/resources/image/approve_5_5.png" /></span><p>户口本</p></li>';
            }else{
              htmlStr += '<li  class="m1"><span><img src="${basePath}/resources/image/approve_5.png" /></span><p>户口本</p></li>';
            }
            if(loanDetail.zxbg == 1){
              htmlStr += '<li><span><img src="${basePath}/resources/image/approve_6_6.png" /></span><p>征信报告</p></li>';
            }else{
              htmlStr += '<li><span><img src="${basePath}/resources/image/approve_6.png" /></span><p>征信报告</p></li>';
            }
            if(loanDetail.xsz == 1){
              htmlStr += '<li  class="m1"><span><img src="${basePath}/resources/image/approve_7_7.png" /></span><p>行驶证</p></li>';
            }else{
              htmlStr += '<li  class="m1"><span><img src="${basePath}/resources/image/approve_7.png" /></span><p>行驶证</p></li>';
            }
            if(loanDetail.fdbht == 1){
              htmlStr += '<li><span><img src="${basePath}/resources/image/approve_8_8.png" /></span><p>反担保合同</p></li>';
            }else{
              htmlStr += '<li><span><img src="${basePath}/resources/image/approve_8.png" /></span><p>反担保合同</p></li>';
            }
            htmlStr += '</ul></div>';
            htmlStr += '<div class="title clearfx"><h3>银客企业认证</h3><span><img src="${basePath}/resources/image/description_up.png" /></span></div>';
            htmlStr += '<div class="conaboat"><ul class="clearfx certification">';
            if(loanDetail.yyzz == 1){
              htmlStr += '<li><span>营</span></span><p>营业执照</p></li>';
            }else{
              htmlStr += '<li><span class="not">营</span></span><p>营业执照</p></li>';
            }
            if(loanDetail.xwdjz == 1){
              htmlStr += '<li class="r"><span>税</span><p>税务登记证</p></li>';
            }else{
              htmlStr += '<li class="r" class="not"><span>税</span><p>税务登记证</p></li>';
            }
            if(loanDetail.yhkhxkz == 1){
              htmlStr += '<li ><span>银</span><p>银行开户许可证</p></li>';
            }else{
              htmlStr += '<li ><span  class="not">银</span><p>银行开户许可证</p></li>';
            }
            if(loanDetail.zzjgdmz == 1){
              htmlStr += '<li class="r"><span>组</span><p>组织机构代码证</p></li>';
            }else{
              htmlStr += '<li class="r" class="not"><span>组</span><p>组织机构代码证</p></li>';
            }
            if(loanDetail.qyzc == 1){
              htmlStr += '<li><span>企</span><p>企业章程</p></li>';
            }else{
              htmlStr += '<li><span class="not">企</span><p>企业章程</p></li>';
            }
            if(loanDetail.sdrz == 1){
              htmlStr += '<li class="r"><span >实</span><p>实地认证</p></li>';
            }else{
              htmlStr += '<li class="r"><span class="not">实</span><p>实地认证</p></li>';
            }
            htmlStr += '</ul></div>';
            htmlStr += '<div class="title clearfx"><h3>补充材料</h3><span><img src="<%=request.getContextPath()%>/resources/image/description_up.png" /></span></div>';
            htmlStr += '<div class="conaboat"><ul class="clearfx certification">';
            if(loanDetail.materialList != null && loanDetail.materialList.length > 0){
              for (var i = 0; i < loanDetail.materialList.length; i++) {
                var material = loanDetail.materialList[i];
                htmlStr += '<li><a href="http://www.yinker.com/'+material.materialFullPath+'" class="fancybox" data-fancybox-group="material"><image src="http://www.yinker.com/'+material.materialPath+'"></a></li>';
              };
            }
            htmlStr += '</ul></div>';
            detailTable.append(htmlStr + riskControlHtml);
          }
        }
        /**
        else if(index == 2){
          var riskControl = data.data.riskControl;
          var riskControlTable = $('#riskControlTable');
          riskControlTable.html("");
          if(Number('${result.data.creditRightsMap.loan.loanId}')> 270){
            if(riskControl != null && riskControl != ''){
              riskControlTable.append(riskControl);
            }else{
              htmlStr += '<div class="no_data no_tz">暂无数据</div>';
            }
          }else{
            var loan = '${result.data.creditRightsMap.loan}';
            htmlStr += '<div class="itproject_etc clearfx prod_resume">';
            if(loan.companyid == 13){
              htmlStr += '<div class="cont">'
                      + '<p><font>“茶语茗香”</font>产品由中再融联合专业的茶叶垂直电商平台“醉品商城”推出的互联网金融理财产品。由醉品商城向中再融推荐优质借款人（醉品商城的供货商），借款人以茶叶等实物质押作为反担保条件，醉品商城为借款项目提供连带责任担保，并受中再融委托监管质押物。醉品商城负责质押物评估、质押物出入库、借款资金使用、借款人回款的全程跟踪，切实保障投资项目的安全性。</p>'
                      + '<h4 style="color:#2ea4d2;font-size:16px;font-weight:bold;margin:30px 0px 10px;">风险控制</h4>'
                      + '<p>本产品由厦门醉品春秋网络科技有限公司提供本息担保，借款人提供动产（茶叶）质押。若借款人未能按时全额履行还款责任，由厦门醉品春秋网络科技有限公司无条件对借款人的本息承担代偿责任。</p>'
                      + '<p>本产品风险控制措施主要包括：</p>'
                      + '<p>醉品商城为中再融提供借款人最近12个月交易数据</p>'
                      + '<p>醉品商城专业评估团队评估入库醉品的质押物价值</p>'
                      + '<p>中再融风控人员实地考察借款人资信、声誉与经营状况</p>'
                      + '<p>中再融通过银行等支付结算数据交叉验证借款人还款能力</p>'
                      + '<p>醉品商城定期向中再融呈现其经营数据</p>'
                      + '<p>醉品商城仓储中心向中再融提交质押物出入库信息</p>'
                      + '<p>中再融动态跟踪质押物市场波动情况</p>'
                      + '<p>醉品商城及中再融不定期对借款人进行贷后巡查</p></div>';
            }
            if(loan.companyid != 13){
              if(riskControl != null && riskControl != ''){
                htmlStr += '<div class="cont">'
                        + '<p><font>“小镇瑰宝”</font>是云南省芒市海华开发有限公司旗下芒市海华小额贷款有限公司（以下简称“海华小贷公司”）面向个人借款者和个人投资者推出的个人借贷产品。结合芒市<a href="http://www.zhubaotown.com/" target="_blank" class="font_skyblue">珠宝小镇</a>的产业链优势，海华小额贷款公司优选出小镇内的优质商家，为投资人和商家（借款人）提供互联网投融资服务，让投资人在帮助中小微商家经营的同时，得到合理的回报，实现财富共赢。中再融全程监管海华小贷公司在“小镇瑰宝”个人借贷产品服务过程中的业务开展、保证行为和借款资金划拨，同时对借贷双方网上交易进行技术支持，并给予法律保障，确保将投资人资金直接投向借款人，双方通过平台签订电子借贷协议，明确双方债务与债权关系，保障借贷双方的法律权益。</p>'
                        + '<h4 style="color:#2ea4d2;font-size:16px;font-weight:bold;margin:10px 0px 10px;">风险揭示</h4>'
                        + '<p><font>“小镇瑰宝”</font>产品由海华小贷公司承担全额担保代偿责任。若借款人未能按时全额履行还款责任，海华小贷公司将对借款人的本息承担全额担保代偿责任。</p>';
                        + '</div>';
              }else{
                htmlStr += '<div style="margin:30px auto;">'
                        + '<p style="text-indent:2em;">本理财产品由与中再融合作的线下融资性担保机构推介，经中再融联合专业第三方资信机构二次审核通过后在线发布，供中再融注册投资者投资。中再融全程监管担保机构在服务过程中的业务开展、保证行为和借款资金划拨，同时对借贷双方网上交易进行技术支持，全程给予法律保障，确保投资人资金直接投向借款人，双方通过平台签订电子借贷协议，明确债务与债权关系，保障借贷双方的法律权益。担保机构对于推荐的项目全程进行跟踪，随时考察借款人动态，监督借款人对资金的使用，保障投资人资金用到实处。</p>'
                        + '<p style="color:#2ea4d2;font-size:16px;font-weight:bold;margin:30px 0px 10px;">【风险控制】</p>'
                        + '<p>本产品由合作担保机构提供本息担保，借款人提供资产抵质押。若借款人未能按时全额履行还款责任，担保机构无条件对借款人的本息承担代偿责任。</p>'
                        + '<p style="color:#2ea4d2;font-size:16px;font-weight:bold;margin:30px 0px 10px;">【借款成本】</p>'
                        + '<p>借款人借款利率：8%-14.5%</p>'
                        + '<p>担保费率：2%-3%</p>'
                        + '<p>第三方支付费率：0.6%</p>'
                        + '<p>中再融服务费率：0.2%/月</p>'
                        + '<p>[1]本借贷产品借款利率低于央行同期贷款利率的4倍，符合中华人民共和国相关法律规定，投资人收益受到法律保护。</p>'
                        + '<p>[2]本借贷产品第三方支付费率为投资人与借款人充值手续费之和。</p>'
                        + '</div>';
              }
            }
            htmlStr += '</div>';
          }
          riskControlTable.append(htmlStr);
        }
        */
        else if(index == 3){
          var investRecordList = data.data.investRecordList;
          var investRecordTable = $("#investRecordTable");
          investRecordTable.html("");
          htmlStr += '<table class="list" cellpadding="0" width="100%" align="center" cellspacing="0">';
            htmlStr += '<thead><tr>';
            htmlStr += '<td width="20%" class="bg_line">投资人</td>';
            htmlStr += '<td width="50%" class="bg_line"><p>投资时间</p></td>';
            htmlStr += '<td width="30%" class="bg_line">投资金额(元)</td>';
            htmlStr += '</tr></thead><tbody>';
          if(investRecordList!=null && investRecordList!= '' && investRecordList.length > 0){
            for (var i = 0; i < investRecordList.length; i++) {
              var investRecord = investRecordList[i];
              htmlStr += '<tr>';
              htmlStr += '<td><div>'+investRecord.name+'</div></td>';
              htmlStr += '<td><p class="re_time">'+investRecord.time+'</p></td>';
              htmlStr += '<td><div class="tz_money">￥<span>'+fmoney(investRecord.amount)+'</span></div></td>';
              htmlStr += '</tr>';
            }
            htmlStr += '</tbody></table>';
          }else{
            htmlStr += '</tbody></table>';
            htmlStr += '<div class="no_data no_tz">暂无记录</div>';
          }
          investRecordTable.append(htmlStr);
        }else{
          var loanPhaseList = data.data.loanPhaseList;
          var loanPhaseTable = $("#loanPhaseTable");
          loanPhaseTable.html("");
          htmlStr += '<table class="list" cellpadding="0" width="100%" align="center" cellspacing="0">';
            htmlStr += '<thead><tr>';
            htmlStr += '<td width="20%" class="bg_line">期数</td>';
            htmlStr += '<td width="50%" class="bg_line"><p>还款时间</p></td>';
            htmlStr += '<td width="30%" class="bg_line">应还本息(元)</td>';
            htmlStr += '</tr></thead><tbody>';
          if(loanPhaseList!=null && loanPhaseList!= '' && loanPhaseList.length > 0){
            for (var i = 0; i < loanPhaseList.length; i++) {
              var loanPhase = loanPhaseList[i];
              htmlStr += '<tr>';
              htmlStr += '<td><div>'+(i+1)+'</div></td>';
              htmlStr += '<td><p class="re_time">'+new Date(loanPhase.dueDate).Format("yyyy-MM-dd")+'</p></td>';
              htmlStr += '<td><div class="tz_money">￥<span>'+fmoney(loanPhase.plannedTermAmount)+'</span></div></td>';
              htmlStr += '</tr>';
            }
            htmlStr += '</tbody></table>';
          }else{
            htmlStr += '</tbody></table>';
            htmlStr += '<div class="no_data no_tz">暂无记录</div>';
          }
          loanPhaseTable.append(htmlStr);
        }
      }
    },
    complete:function(){
    	$('.fancybox').fancybox();
    }
  });
}


function toLogin()
{
	window.location.href="${basePath}/userInfo/nologin.do?refPath="+encodeURIComponent(window.location.href);
}

function numberFormat(num){
    return Number(num).toFixed(2).replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
};

function borrowdetail(){
	  $.ajax({
		  type: 'POST',
		  url: environment.basePath + "/loan/getLoanDetailBody.do",
	      data : {loanId:'${result.data.creditRightsMap.loan.loanId}'},
	      dataType : 'json',
	      cache : false,
	      async : true,
	      success : function(data) {
	     	var detailHeadHtml = data.attributes.detailHead;
	  		//新信息html
	  		var detailMessageHtml = '';
	
	  		if(data.attributes.loanType==1){
	  			detailMessageHtml += '<div class="loanCompany"><div class="clearfix"><label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label><span class="w190">'+ data.attributes.xingming +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="w190">'+ data.attributes.sex +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</label><span class="w190">'+ data.attributes.year +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>婚&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姻：</label><span class="w190">'+ hunyinStr +'</span></div>';
          detailMessageHtml += '<div class="clearfix fenline"></div>';
          detailMessageHtml += '<div class="clearfix"><label>房&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产：</label><span class="w190">'+ data.attributes.house_property +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产：</label><span class="w190">'+ data.attributes.car_property +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>其&nbsp;他&nbsp;财&nbsp;产：</label><span class="w190">'+ data.attributes.other_property +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>年&nbsp;&nbsp;&nbsp;&nbsp;收&nbsp;&nbsp;&nbsp;入：</label><span class="w190">'+ data.attributes.annual_income +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>信用卡额度：</label><span class="w190">'+ numberFormat(data.attributes.creditCard_limit) +'元</span></div>';
          detailMessageHtml += '<div class="clearfix fenline"></div>';
          detailMessageHtml += '<div class="clearfix"><label>借&nbsp;款&nbsp;用&nbsp;途：</label><span class="w190">'+ data.attributes.capitalPurpose +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>还&nbsp;款&nbsp;来&nbsp;源：</label><span class="w190">'+ data.attributes.repaymentSource +'</span></div>';
	  			
	  		}
	  		if(data.attributes.loanType==2){
	  			
	  			detailMessageHtml += '<div class="loanCompany"><div class="clearfix"><label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label><span class="w190">'+ data.attributes.xingming +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="w190">'+ data.attributes.sex +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</label><span class="w190">'+ data.attributes.age +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>婚&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姻：</label><span class="w190">'+ data.attributes.hunyinStr +'</span></div>';
          detailMessageHtml += '<div class="clearfix fenline"></div>';
          detailMessageHtml += '<div class="clearfix"><label>房&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产：</label><span class="w190">'+ data.attributes.house_property +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产：</label><span class="w190">'+ data.attributes.car_property +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>其&nbsp;他&nbsp;财&nbsp;产：</label><span class="w190">'+ data.attributes.other_property +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>年&nbsp;&nbsp;&nbsp;&nbsp;收&nbsp;&nbsp;&nbsp;入：</label><span class="w190">'+ data.attributes.annual_income +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>信用卡额度：</label><span class="w190">'+ numberFormat(data.attributes.creditCard_limit) +'元</span></div>';
          detailMessageHtml += '<div class="clearfix fenline"></div>';
          detailMessageHtml += '<div class="clearfix"><label>借&nbsp;款&nbsp;用&nbsp;途：</label><span class="w190">'+ data.attributes.capitalPurpose +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label>还&nbsp;款&nbsp;来&nbsp;源：</label><span class="w190">'+ data.attributes.repaymentSource +'</span></div>';
	  		}
	  		if(data.attributes.loanType==3){
	  			detailMessageHtml += '<div class="loanCompany"><div class="clearfix"><label class="com85">成&nbsp;&nbsp;立&nbsp;&nbsp;时&nbsp;&nbsp;间：</label><span class="w190">'+ data.attributes.clsj +'</span></div>';
          if(data.attributes.zczj)detailMessageHtml += '<div class="clearfix"><label class="com85">注&nbsp;&nbsp;册&nbsp;&nbsp;资&nbsp;&nbsp;金：</label><span class="w190">'+ data.attributes.zczj +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label class="com85">公&nbsp;&nbsp;司&nbsp;&nbsp;地&nbsp;&nbsp;址：</label><span class="w190">'+ data.attributes.gsdz +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label class="com85">所&nbsp;&nbsp;属&nbsp;&nbsp;行&nbsp;&nbsp;业：</label><span class="w190">'+ data.attributes.sshy +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label class="com85">法人征信记录：</label><span class="w190">良好</span></div>';
          detailMessageHtml += '<div class="clearfix"><label class="com85">被&nbsp;执&nbsp;行&nbsp;记录：</label><span class="w190">无</span></div>';
          detailMessageHtml += '<div class="clearfix fenline"></div>';
          detailMessageHtml += '<div class="clearfix"><label class="com85">借&nbsp;&nbsp;款&nbsp;&nbsp;用&nbsp;&nbsp;途：</label><span class="w190">'+ data.attributes.capitalPurpose +'</span></div>';
          detailMessageHtml += '<div class="clearfix"><label class="com85">还&nbsp;&nbsp;款&nbsp;&nbsp;来&nbsp;&nbsp;源：</label><span class="w190">'+ data.attributes.repaymentSource +'</span></div></div>';
	  		}
	  		
	  		var infotitle=$("#detailMessageHtml").find(".yktitle1").text();
	  		if(infotitle!=null&&infotitle!=""){
	  			$("#userinfoid").html(infotitle+"及认证信息");
	  		}
	  		
	  		$('#detailMessageHtml').append(detailMessageHtml);
        $('#detailHeadHtml').append(detailHeadHtml);
	      }
	  });
}
borrowdetail();

$(function () {
    // 项目详情弹层
  $('.bluemore').live('click',function(){
    var docH = $(document).height();
    var winH = $(window).scrollTop();
    $('.promark').height(docH).show();
    $('.proinfo').css('top',winH).show();
    
  });

  $('.proclose').live('click',function(){
    $('.promark').hide();
    $('.proinfo').hide();
  });
  
   $('.bluelookmore').live('click',function(){
      var docH = $(document).height();
      var winH = $(window).scrollTop();
      $('.promark').height(docH).show();
      $('.gorzinfo').css('top',winH + 150).show();
    });
    $('.closerz').live('click',function(){
      $('.promark').hide();
      $('.gorzinfo').hide();
    });

  $('.back_top').click(function(){
    $(window).scrollTop('0');
    $(this).hide();
  });
});

function openAccount(){
	$.ajax({
		type: 'POST',
		url: environment.basePath + "/doOpenAccount.session",
		data: {"openUserFlag":"QOU","mobile":"<%=mobile%>","userId":"<%=userId%>","authenType":"1","debtId":"${result.data.creditRightsMap.creditRightsInfo.ID}"},
		beforeSend: function(){},
		success: function(json) {
			if(json.code < 0){
				dilog("提醒",json.msg,false);
				return;
			}else{
				var openAccountForm = json.data.openAccountForm;
				$('#openAccount').html(openAccountForm);
				var form = $('#postPnrForm');
				form.submit();
			}
		},
		complete:function(){}
	});
}

function topenpnr(){
	$('#div1').show();
}
topenpnr();
</script>
<div class="promark"></div>
<div class="proinfo">
  <div class="title_1">
       <span id="userinfoid">借款人及认证信息</span>
       <p class="proclose"></p>
  </div>
  <div id="detailMessageHtml">
      <c:if test="${result.data.creditRightsMap.type==1 || result.data.creditRightsMap.type==3 || result.data.creditRightsMap.loan.productfulId==26 || result.data.creditRightsMap.loan.productfulId==27 || result.data.creditRightsMap.loan.productfulId==28}">
        <c:if test="${result.data.creditRightsMap.loan.productfulId!=26 && result.data.creditRightsMap.loan.productfulId!=27 && result.data.creditRightsMap.loan.productfulId!=28}">
          <div class="yktitle1"><span>借款人</span></div>
        </c:if>
        <c:if test="${result.data.creditRightsMap.loan.productfulId==26 || result.data.creditRightsMap.loan.productfulId==27 || result.data.creditRightsMap.loan.productfulId==28}">
          <div class="yktitle1"><span>债务人认证</span></div>
        </c:if>
      </c:if>
      <c:if test="${result.data.creditRightsMap.type==2 || result.data.creditRightsMap.type==4}">
        <c:if test="${result.data.creditRightsMap.loan.productfulId==null}">
          <div class="yktitle1"><span>借款企业</span></div>
        </c:if>
        <c:if test="${result.data.creditRightsMap.loan.productfulId!=null}">
          <c:if test="${result.data.creditRightsMap.loan.productfulId==12 ||result.data.creditRightsMap.loan.productfulId==25}">
            <div class="yktitle1"><span>债务人认证</span></div>
          </c:if>
          
          <c:if test="${result.data.creditRightsMap.loan.productfulId!=12 && result.data.creditRightsMap.loan.productfulId!=25}">
           <!--2015-01-05 xusong  产品类型为21  汇贝专属_消费金融_企业协议模板 不显示 -->
            <c:if test="${result.data.creditRightsMap.loan.productfulId!=21 }">
              <c:if test="${result.data.creditRightsMap.loan.repayType!=15}">
                <div class="yktitle1"><span>借款企业</span></div>
              </c:if>
            </c:if>
          </c:if>
        </c:if>
      </c:if>
  </div>
    <div id="detailHeadHtml">
      <div class="yktitle1"><span>认证信息</span></div>
    </div>
    <%-- <div class="persondec">
      <h3>隐私保护声明：</h3>
      <p>为保障借款人隐私，此处不展示借款人原始资料，该信息已上传到央行征信系统进行备案：http://www.pbccrc.org.cn/</p>
    </div> --%>
</div> 

<div class="gorzinfo">
  <div class="title_1">
       <span id="userinfoid">温馨提示</span>
  </div>
  <p>根据P2P行业监管办法，须实名认证后查看更多信息。</p>
  <div class="gorzbtn clearfx">
      <a href="javascript:;" class="closerz">取消</a>
      <a href="javascript:openAccount();" class="gorz">去认证</a>
  </div>
</div>
<div id="openAccount"></div>
</body>
</html>