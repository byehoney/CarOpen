<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,java.util.*,com.kunpeng.zzr.entity.UserMain,com.kunpeng.zzr.entity.Loan,com.kunpeng.zzr.entity.UserAccount" errorPage="" %>
<%
//当前用户
UserMain user = null;
UserAccount userAccount = null;
Object obj = request.getSession().getAttribute("userObj");
Object userObj = request.getSession().getAttribute("userAccount");
Integer userId = null;
String mobile = "";
if(obj != null)
{
	 user = (UserMain) obj;
     userAccount = (UserAccount) userObj;
	 userId = user.getUserId();
	 mobile = user.getMobile();
}
boolean userStatus = false;
String pnrUserCustId = "";
if(null != user && null !=userAccount){
	 userStatus = true;
	 pnrUserCustId= userAccount.getPnrUserCustId();
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
<link type="text/css" rel="stylesheet" href="${basePath}/resources/css/details.css">
<link type="text/css" rel="stylesheet" href="${basePath}/resources/css/items.css">
<script type="text/javascript" src="${basePath}/resources/js/fancyBox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
<script type="text/javascript" src="${basePath}/resources/js/fancyBox/source/jquery.fancybox.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/resources/js/fancyBox/source/jquery.fancybox.css?v=2.1.5" media="screen" />
    <link rel="stylesheet" type="text/css" href="${basePath}/resources/css/investPsq.css"  />
<style>
.hd{margin:0 10px; padding:0 10px; float: left; height:20px; border-radius:15px; text-align:center; background-color:rgba(0,0,0,0.2); font-size:12px; color:#fff330; line-height:20px;}
</style>
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
 <div id="content_height">
    <%@ include file="/views/inc/xm_tab.jsp"%>
<div <c:if test='${result.data.loanMap.loan.status eq 300}'>class="wp_details k_xq"</c:if>
<c:if test='${result.data.loanMap.loan.status eq 100 || result.data.loanMap.loan.status eq 200}'>class="wp_details w_xq"</c:if>
<c:if test='${result.data.loanMap.loan.status eq 400 || result.data.loanMap.loan.status eq 500}'>class="wp_details h_xq"</c:if>
<c:if test='${result.data.loanMap.loan.status >= 600}'>class="wp_details o_xq"</c:if>>
<c:if test="${not empty result.data.loanMap.rookie && result.data.loanMap.rookie == 1}">
	<div class="new_user">
		新手专享项目，仅限未投资过的新用户投资，每人限投一次，上限10000元。
	</div><%--标记--%>
</c:if>
   <div class="top">
      <div class="project clearfx">
         <div class="title">${result.data.loanMap.loan.title}</div>
         <div class="xieyi">
<%--          	<img class="logo" src="${basePath}/resources/image/details/xy_logo.png" /> --%>
		 <div class="img_icon">
        </div>
         <a href="${basePath}/yinkerInvestorContractMouldInfo.do?companyId=${result.data.loanMap.loan.companyid}&loanId=${result.data.loanMap.loan.loanId }&productType=${result.data.loanMap.loanProduct.id }&type=${result.data.loanMap.loan.loanPortraitId }">投资协议范文</a>
        </div>
      </div>
      <c:forEach items="${result.data.loanMap.loanWelfare}" var="welfare">
      <div class="hd">
      ${welfare.campaignSetName}
      </div>
      </c:forEach>
      <div class="yield clearfx">
         <div class="sy">
            <c:if test="${result.data.loanMap.infoMap.platAddInterest<=0}">
            <p><span><fmt:formatNumber   pattern="#,##0.0" type="currency" value="${result.data.loanMap.infoMap.aunualInterestRate }"/></span><em>%</em></p>
            </c:if>
            <c:if test="${result.data.loanMap.infoMap.platAddInterest>0}">
            <p><span><fmt:formatNumber value="${result.data.loanMap.infoMap.borrowerInterest }" pattern="#,##0.0" type="currency"/></span><em>+<fmt:formatNumber value="${result.data.loanMap.infoMap.platAddInterest }" pattern="#,##0.0" type="currency"/>%</em></p>
            </c:if>
            <div>年化收益率</div>
         </div>
         <div class="date">
            <c:if test="${result.data.loanMap.qfqDays!=null }"><p>${result.data.loanMap.qfqDays }<span>天</span></p></c:if>
              <c:if test="${result.data.loanMap.qfqDays==null }">
                <c:if test="${result.data.loanMap.infoMap.termUnit==1 }"><p>${result.data.loanMap.infoMap.termCount }<span>天</span></p></c:if>
                <c:if test="${result.data.loanMap.infoMap.termUnit!=1 }"><p>${result.data.loanMap.infoMap.termCount }<span>月</span></p></c:if>
            </c:if>
            <div>项目周期</div>
         </div>
      </div>
   </div>
   <div class="bottom">
      <div class="sjlist">
         <p>保障方式：长城计划
		 <%--<c:if test="${result.data.loanMap.loan.companyid==49}">
                100%适用昆仑计划
				</c:if>
		 <c:if test="${result.data.loanMap.loanProduct.id==6 && result.data.loanMap.loan.companyid!=49}">
                由${result.data.loanMap.bills}<c:if test="${fn:length(result.data.loanMap.loan.securityMode)> 12}">${fn:substring(result.data.loanMap.loan.securityMode, 0, 10)}...</c:if><c:if test="${fn:length(result.data.loanMap.loan.securityMode)<= 12}">${result.data.loanMap.loan.securityMode}</c:if>
              </c:if>
              <c:if test="${result.data.loanMap.loanProduct.id!=6 && result.data.loanMap.loan.companyid!=49}">
              由${result.data.loanMap.company.companyName }提供
              <c:if test="${fn:length(result.data.loanMap.loan.securityMode)> 12}">${fn:substring(result.data.loanMap.loan.securityMode, 0, 10)}...</c:if><c:if test="${fn:length(result.data.loanMap.loan.securityMode)<= 12}">${result.data.loanMap.loan.securityMode}</c:if>
              </c:if>--%>
          </p>
         <p><span>起息日：</span><fmt:formatDate value="${result.data.loanMap.loan.releaseTime }" pattern="yyyy.MM.dd" /></p>
         <p><span>结束日：</span><fmt:formatDate value="${result.data.loanMap.loan.endTime }" pattern="yyyy.MM.dd" /></p>
         <p>还款方式：<c:if test="${result.data.loanMap.loan.repayType==1 }">等额本息 </c:if>
              <c:if test="${result.data.loanMap.loan.repayType==5 }">按月计息，到期还本  </c:if>
              <c:if test="${result.data.loanMap.loan.repayType==10 }">先息后本</c:if>
              <c:if test="${result.data.loanMap.loan.repayType==15 }">一次性还本付息  </c:if>
          </p>
      </div>
      <div class="project-grade" style="display: none">
        <div class="grade-letter"></div>
      </div>
   </div>
    <%--拼手速赢现金 start by hfjk--%>
    <c:if test="${result.data.isPinShou==1}">
        <div class="invest_count">
            <ul class="invest_list clearfix">
                <li>
                    <div class="substance">
                        <div class="thumb"><em></em></div>
                        <h3>一马当先</h3>
                        <p>${result.data.ymdx.mobile}</p>
                    </div>
                </li>
                <li>
                    <div class="substance">
                        <div class="crown"><em></em></div>
                        <h3>一鸣惊人</h3>
                        <p>${result.data.ymjr.mobile}</p>
                    </div>
                </li>
                <li>
                    <div class="substance">
                        <div class="hammer"><em></em></div>
                        <h3>一锤定音</h3>
                        <p>${result.data.ycdy.mobile}</p>
                    </div>
                </li>
                <div class="bubble">
                    <div class="close_btn"></div>
                    <div class="bubble_count">
                        <span>该项目首位投资用户投资金额≥5000元时，可获得10元现金奖励</span>
                    </div>
                </div>
            </ul>
        </div>
    </c:if>
    <%--拼手速赢现金 end--%>
   <div class="conter">
       <div class="tz_xq">
         <ul class="clearfx">
            <li>
              <p>
                <fmt:formatNumber  pattern="#,##0.00#" type="currency"  value="${result.data.loanMap.infoMap.amount/10000}"/><span>万</span>
                </p>
              <div>项目总额</div>
            </li>
            <li>
              <p>
                <c:if test="${(result.data.loanMap.infoMap.amount-result.data.loanMap.infoMap.biddingAmount) >= 10000}">
                <fmt:formatNumber  value="${(result.data.loanMap.infoMap.amount-result.data.loanMap.infoMap.biddingAmount)/10000}"  pattern="#,##0.00#"/><span>万</span>
                </c:if>
                <c:if test="${(result.data.loanMap.infoMap.amount-result.data.loanMap.infoMap.biddingAmount) < 10000}">
                <fmt:formatNumber  value="${result.data.loanMap.infoMap.amount-result.data.loanMap.infoMap.biddingAmount}"  pattern="#,##0.00#"/><span>元</span>
                </c:if>
              </p>
              <div>可投金额</div>
            </li>
            <li>
              <p>${result.data.loanMap.peopleCount}<span>人</span></p>
              <div>投资人数</div>
            </li>
         </ul>
       </div>
<%--        <p class="safe">
      		 资金安全由<img src="<%=request.getContextPath()%>/resources/image/baozhang_logo.png">承保
       </p> --%>
   </div>
   <div class="bg10"></div>
   <div class="conter2">
	   <div class="tablist">
	      <ul class="clearfx">
              <%--new--%>
              <c:if test="${result.data.loanMap.infoMap.loanid > '10442'}">
                  <li id="detail"><p class="active">项目详情</p></li>
                  <li id="investRecord"><p>投资记录</p></li>
                  <c:if test="${result.data.loanMap.infoMap.loanProductId != 7 }">
                      <li id="loanPhase"><p style="border-right:none">还款计划</p></li>
                  </c:if>
              </c:if>
                  <%--old --%>
              <c:if test="${result.data.loanMap.infoMap.loanid <= '10442'}">
                  <li id="investRecord" style="width:50%;"><p class="active">投资记录</p></li>
                  <c:if test="${result.data.loanMap.infoMap.loanProductId != 7 }">
                      <li id="loanPhase" style="width:50%;"><p style="border-right:none">还款计划</p></li>
                  </c:if>
              </c:if>

	      </ul>
	   </div>
	   <div class="tab_content">
         <c:if test="${result.data.loanMap.infoMap.loanid > '10442' && result.data.loanMap.infoMap.loanProductId != 7}">
      <div class="tz_list_box" style="display:block;">
          <a href="${basePath}/views/static/download.jsp" style="text-align: center;display: block; font-size: 14px; margin-top: 10px;padding-bottom:30px;text-decoration: underline;color: #666;">下载APP查看项目详情</a>
      </div>
      </c:if>
      <%--<c:if test="${result.data.loanMap.infoMap.loanid < 270 && result.data.loanMap.infoMap.loanProductId != 7}">
      <div class="tz_list_box" style="display:block; margin-top:10px;" id="detailTable">
          <a href="${basePath}/views/static/download.jsp" style="text-align: center;display: block; font-size: .24rem; margin-top: 1rem;text-decoration: underline;color: #666;">下载APP查看项目详情</a>
      </div>
      </c:if>--%>
	   	<!-- <div class="tz_list_box" id="riskControlTable"></div> -->
	   	<div class="tz_list_box" id="investRecordTable" style="display:block;"></div>
        <c:if test="${result.data.loanMap.infoMap.loanProductId != 7 }">
			<div class="tz_list_box" id="loanPhaseTable"></div>
	   </c:if>
   </div>
   </div>

   <c:if test="${result.data.loanMap.loan.status eq 300}">
      <p class="tz_btn"><a href="${basePath}/invest/projectDetail.session?loanId=${result.data.loanMap.infoMap.loanid}">立即加入</a></p>
   </c:if>
   <c:if test="${result.data.loanMap.loan.status eq 100 || result.data.loanMap.loan.status eq 200}">
      <p class="tz_btn w_color"><a href="javascript:;">
          <span class="time_icon">&nbsp;</span>预计上线时间 <span class="start_time">
          <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${result.data.loanMap.infoMap.onlineTime}"></fmt:formatDate></span>
       </a></p>
      </c:if>

      <c:if test="${result.data.loanMap.loan.status eq 400}">
      <p class="tz_btn"><a href="javascript:;">已售罄</a></p>
      </c:if>
      <c:if test="${result.data.loanMap.loan.status eq 500}">
      <p class="tz_btn"><a href="javascript:;">还款中</a></p>
      </c:if>

      <c:if test="${result.data.loanMap.loan.status eq 600}">
      <p class="tz_btn"><a href="javascript:;">已完成</a></p>
      </c:if>
</div> 

<div class="back_top"></div>
<%@ include file="/views/inc/footer.jsp"%>


<script type="text/javascript">
var $CONFIG = {
  loanId:'${result.data.loanMap.infoMap.loanid}'
};
$(function () {
	var pingjiLoanId = '${result.data.loanMap.infoMap.loanid}';
  $('.fancybox').fancybox();
  if(pingjiLoanId<='10442'){//old
      getLoanDetail(3);
  }

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
            //
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
    data: {"index":index,"loanId":'${result.data.loanMap.infoMap.loanid}'},
    beforeSend: function(){},
    success: function(data) {
      if(data.code < 0){
        dilog("提醒",data.msg,false);
        return;
      }else{
        var htmlStr = "";
        if(index == 1) {

        }else if(index == 3){
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
              htmlStr += '<td><div>'+loanPhase.phaseNumber+'</div></td>';
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
		data: {"openUserFlag":"QOU","mobile":"<%=mobile%>","userId":"<%=userId%>","authenType":"1","loanId":"${result.data.loanMap.infoMap.loanid}"},
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

</script>
<script type="text/javascript" src="${basePath}/resources/js/project.detail.js?v=2.1.5"></script>
<div class="promark"></div>
<div class="proinfo">
  <div class="title_1">
       <span id="userinfoid">借款人及认证信息</span>
       <p class="proclose"></p>
  </div>
    <div id="detailMessageHtml">
      <c:if test="${result.data.loanMap.type==1 || result.data.loanMap.type==3 || result.data.loanMap.loan.productfulId==26 || result.data.loanMap.loan.productfulId==27 || result.data.loanMap.loanMaploan.productfulId==28}">
        <c:if test="${result.data.loanMap.loan.productfulId!=26 && result.data.loanMap.loan.productfulId!=27 && result.data.loanMap.loan.productfulId!=28}">
          <div class="yktitle1"><span>借款人</span></div>
        </c:if>
        <c:if test="${result.data.loanMap.loan.productfulId==26 || result.data.loanMap.loan.productfulId==27 || result.data.loanMap.loan.productfulId==28}">
          <div class="yktitle1"><span>债务人认证</span></div>
        </c:if>
      </c:if>
      <c:if test="${result.data.loanMap.type==2 || result.data.loanMap.type==4}">
        <c:if test="${result.data.loanMap.loan.productfulId==null}">
          <div class="yktitle1"><span>借款企业</span></div>
        </c:if>
        <c:if test="${result.data.loanMap.loan.productfulId!=null}">
          <c:if test="${result.data.loanMap.loan.productfulId==12 ||result.data.loanMap.loan.productfulId==25}">
            <div class="yktitle1"><span>债务人认证</span></div>
          </c:if>
          
          <c:if test="${result.data.loanMap.loan.productfulId!=12 && result.data.loanMap.loan.productfulId!=25}">
           <!--2015-01-05 xusong  产品类型为21  汇贝专属_消费金融_企业协议模板 不显示 -->
            <c:if test="${result.data.loanMap.loan.productfulId!=21 }">
              <c:if test="${result.data.loanMap.loan.repayType!=15}">
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
<%--拼手速Js--%>
<script src="${basePath}/resources/js/pinshousu.js"></script>
</html>
