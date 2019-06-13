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
	<title>携手太平洋保险，又添安全屏障</title>
	<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
	<link href="<%=request.getContextPath()%>/resources/css/common/common.css?v=201601270" type="text/css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/static/tpyCpic.css">
     <script type="text/javascript">
    $(function(){
    	function getadd(name)
    	{
    	     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    	     var r = window.location.search.substr(1).match(reg);
    	     if(r!=null)return  unescape(r[2]); return null;
    	}
    	if(getadd("flag")=="app"){$(".hd_logo").hide()}
    })

    </script>
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
<div class="pacificPage">
		<div class="banner_t"></div>
		<div class="banner_b"></div>
		<div class="container">
			<p class="SafetyTips">携手太平洋保险</p>
			<p class="SafetyTips">中再融又添安全屏障</p>
			<div class="SecurityUpdates">				
			</div>
			<h3>01</h3> 
			<p>网络安全保险</p>
			<p class="thread">中再融”网络安全保险“正式上线</p>
			<b></b>
			<div class="operator_t"></div>
			<div class="operator_b"></div>
			<p class="opinion">随着《关于促进互联网金融健康发展的指导意见》的出台，政策明确指出鼓励保险公司与互联网金融合作，提升平台的安全性及抗风险能力。“互联网金融+保险”模式已成为互联网金融领域发展新趋势。  </p>
			<p class="opinion">中再融始终秉承安全、透明、合规的理念，并一直走在践行监管、合规发展的前沿。日前正式与太平洋保险公司双方达成战略合作， 中再融平台所涉及到的数据安全、数据责任等由太平洋保险承保。这也意味着，中再融的用户信息及资金安全将进一步得到保证，不断形成健康的金融生态链条。 </p>
			<h3>02</h3> 
			<p>实力承保</p>
			<p class="thread">太平洋保险公司—实力承保方</p>
			<b></b>
			<div class="insured_t"></div>
			<div class="insured_b"></div>
			<p class="opinion">太平洋保险公司是国内领先的综合性上市保险集团，同时也是中国保险行业中唯一在“金贝奖”获得“最佳综合实力保险公司”殊荣的公司，连续六年入选《财富》世界500强，其强悍的资产管理能力及风控能力无不成为中再融寻求保险合作的首选。此次太平洋保险公司选择和中再融合作，也是对平台整体实力的肯定。</p>
			<h3>03</h3> 
			<p>不忘初心</p>
			<p class="thread">一路前行，不忘初心，方得始终。</p>
			<b></b>
			<div class="environment_t"></div>
			<div class="environment_b"></div>
			<p class="opinion">中再融一直坚持以服务为本，加强风险防范，努力为用户提供安全、便捷、透明的投资环境。</p>
			<p class="opinion">随着“互联网金融+保险“模式的逐步深入，中再融会继续和保险公司进行更精细化、更深层次的合作，为维护用户的基本利益以及资金安全提供更有力的保障， 并一如既往的为广大用户提供安全、稳健的收益。</p>
			<p class="opinion">我们深知唯有爱与用户不可辜负，一路前行，不忘初心，方得始终。</p>
		</div>
		
	</div>
	
</body>
</html>
