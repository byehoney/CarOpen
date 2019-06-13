<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!doctype html>
<html>
<head>
	<meta name="author" content="m.zhongzairong.cn">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="format-detection" content="telephone=no">
	<meta http-equiv="Expires" content="-1">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Pragma" content="no-cache">
	<title>合规页面</title>
	<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="<%=request.getContextPath()%>/resources/css/common/common.css?v=201601270" type="text/css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/compliance_page.css">
    <script type="text/javascript">
    $(function(){
    	function getadd(name)
    	{
    	     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    	     var r = window.location.search.substr(1).match(reg);
    	     if(r!=null)return  unescape(r[2]); return null;
    	}
    	if(getadd("head")=="0"){$(".hd_logo").hide()}
    })

    </script>
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
<div class="compliance_page">
		<div class="banner_t"></div>
		<div class="bg_content">
			<div class="preface_cont">
				<h2>前言</h2>
				<p>银监会会同工业和信息化部、公安部、国家互联网信息办公室等部门研究起草了《网络借贷信息中介机构业务活动管理暂行办法》（下称办法），该办法标志着P2P网贷行业首部业务规范细则的正式面世。自此，互联网金融行业也将在指导下走向更加合规发展的新阶段。</p>
				<p class="method_title">《办法》公布后，中再融即积极按照各条例进行自查调整，现将整改的项目进度进行公布。</p>
			</div>
		</div>
		<div class="bg_big">
			<table class="table">
				<tbody>
					<tr>
					  <th colspan="4">合规事项</th>
					  <th class="schedule">目前进度</th>
					</tr>
					<tr>
						<td colspan="4" class="mortgage">电信业务经营许可</td>
						<td class="schedule">
							<i class="small_icon complete_icon"></i>
						已完成
						</td>							 
					</tr>
					<tr>
						<td colspan="4" class="mortgage">金融监管部门备案登记</td>
						<td class="schedule gray">
							<i class="small_icon dealt_with_icon"></i>
						办理中
						</td>							 
					</tr>
					<tr>
						<td colspan="4" class="mortgage  business">营业执照的经营范围中实质明确网络借贷信息中介</td>
						<td class="schedule gray">
							<i class="small_icon dealt_with_icon"></i>
						办理中
						</td>							 
					</tr>
					<tr>
						<td colspan="4" class="mortgage business">同一自然人借款余额上线不超过人民币20万元，同一法人/组织借款余额不超过人民币100万元</td>
						<td class="schedule gray">
							<i class="small_icon complete_icon"></i>
							已完成
						</td>							 
					</tr>
					<tr>
						<td colspan="4" class="mortgage">单一项目募集期限不超过20个工作日</td>
						<td class="schedule">
							<i class="small_icon complete_icon"></i>
						已完成
						</td>							 
					</tr>
					<tr>
						<td colspan="4" class="mortgage business">完善网络安全和信息安全，配备完善的网络安全设施和管理制度</td>
						<td class="schedule gray">
							<i class="small_icon dealt_with_icon"></i>
						办理中
						</td>							 
					</tr>
					<tr>
						<td colspan="4" class="mortgage">加强与征信机构的业务合作</td>
						<td class="schedule">
							<i class="small_icon complete_iconn"></i>
						已完成
						</td>							 
					</tr>
					<tr>
						<td colspan="4" class="mortgage business">妥善保存网络借贷业务数据和资料，借贷合同到期后至少保存5年</td>
						<td class="schedule">
							<i class="small_icon complete_icon"></i>
						已完成
						</td>							 
					</tr>
					<tr>
						<td colspan="4" class="mortgage business">以醒目方式提示网络借贷风险，并经出借人确认</td>
						<td class="schedule">
							<i class="small_icon complete_icon"></i>
						已完成
						</td>							 
					</tr>
					<tr>
						<td colspan="4" class="mortgage business">对投资人进行风险评估，实行分级管理，防范非理性投资</td>
						<td class="schedule gray">
							<i class="small_icon dealt_with_icon"></i>
						办理中
						</td>							 
					</tr>
					<tr>
						<td colspan="4" class="mortgage business">充分披露借款人、融资项目信息，风险评估和资金运用情况</td>
						<td class="schedule">
							<i class="small_icon complete_icon"></i>
						已完成
						</td>							 
					</tr>
					<tr>
						<td colspan="4" class="mortgage business">建立信息披露专栏，披露年度报告、法律法规和监管规定</td>
						<td class="schedule gray">
							<i class="small_icon dealt_with_icon"></i>
						办理中
						</td>							 
					</tr>
					<tr>
						<td colspan="4" class="mortgage business">选择银行业金融机构作为资金存管机构</td>
						<td class="schedule gray">
							<i class="small_icon dealt_with_icon"></i>
						办理中
						</td>							 
					</tr>
				</tbody>
			</table>
		</div>										
		<div class="bg_b">
			<div class="date">更新日期：2018年03月05日</div>
		</div>
	</div>
</body>
</html>
