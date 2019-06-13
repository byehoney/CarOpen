<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="author" content="m.zhongzairong.cn">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<title>中再融-注册领红包</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/common/jquery.md5.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/alipay.js${verCode }"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/alipay.css${verCode }">
<script>
	var basePath = "<%=request.getContextPath()%>";
</script>
<!--PC百度统计代码-->
<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?455a255e408c3cc82f67b07d05532d54";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
</script>

<!--热力图-->
<script type="text/javascript">
    window._pt_lt = new Date().getTime();
    window._pt_sp_2 = [];
    _pt_sp_2.push('setAccount,392d7037');
    var _protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    (function() {
        var atag = document.createElement('script'); atag.type = 'text/javascript'; atag.async = true;
        atag.src = _protocol + 'js.ptengine.cn/pta.js';
        var stag = document.createElement('script'); stag.type = 'text/javascript'; stag.async = true;
        stag.src = _protocol + 'js.ptengine.cn/pts.js';
        var s = document.getElementsByTagName('script')[0]; 
        s.parentNode.insertBefore(atag, s); s.parentNode.insertBefore(stag, s);
    })();
    
    <%--GA代码 --%>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75483023-2', 'auto');
  ga('send', 'pageview');
</script>
</head>
<body>
 	<div class="alipayPage">
		<div class="banner_t">
			<a class="logo" href="javascript:;"></a>
		</div>
		<div class="banner_b"></div>
		<div class="container">
			<div class="alipayBg ali01">
				<h3><span>注册即送100元投资红包</span></h3>
				<input class="phnum" type="text" placeholder="请输入手机号" maxlength="11">
				<div class="pop_agr clearfix">
					<i class="agree pop_agron"></i>
					<span>同意 <a class="serve_btn">《服务协议》、</a><a class="secret_btn">《隐私条款》</a>
					</span>
				</div>
				<div class="ex_popup"><a id="popup01" href="javascript:;">立即注册</a></div>
				<p class="information">中再融承诺不会在任何情况下泄露您的信息</p>
			</div>
			<div class="alipayBg">
				<h3><span>新手项目</span></h3>
				<div class="treasure">
					<div><span>15</span>%</div>
					<p>预计年化收益率</p>
				</div>
				<div class="plan_cont clearfix">
					<div class="timelimit fl">
						<div><span>30</span> 天</div>
						<p>项目期限</p>
					</div>
					<div class="fl earnings_cont">
						<div><span>10000</span> 元</div>
						<p>每人限投</p>
					</div>
				</div>
			</div>
			<div class="alipayBg">
				<h3><span>关于中再融</span></h3>
				<ul class="picList">
						<li>
							<div class="units_ioc"></div>
							<b></b>
							<div class="copywritingTip">
								<h4>国资背景</h4>
								<p>中再生协会指定唯一互联网金融平台</p>
							</div>
						</li>
						<li>
							<div class="eyes_ioc"></div>
							<b></b>
							<div class="copywritingTip">
								<h4>资金安全</h4>
								<p>贵州银行资金存管，运营至今0坏账</p>
							</div>
						</li>
						<li>
							<div class="flowers_ioc"></div>
							<b></b>
							<div class="copywritingTip">
								<h4>灵活便捷</h4>
								<p>app随时理财，T+1快速提现</p>
							</div>
						</li>
					</ul>
			</div>
			<div class="alipayBg ex_popupTOp">
				<div class="ex_popup"><a class="return_top" href="javascript:;">立即注册</a></div>
				<div class="phone">4001-156-157</div>
				<p>中再融(北京)科技有限公司版权所有京ICP备</p>
				<p>16002418号-1 </p>
				<p>投资有风险，本项目非保本产品，不保证收益</p>
			</div>
		</div>
		
		<div class="verify">
		<div class="closebtn"></div>
			<ul>
				<li>
					<i class="insideIcon"></i>
					<input id="mobile_num" class="txt" type="text" placeholder="请输入手机号码" maxlength="11">
				</li>
				<li>
					<i class="refreshIcon"></i>
					<input id="img_code" class="verificationCode" type="text" placeholder="请输入图形验证码" maxlength="4">
					<img id="img_code_pic" src="<%=request.getContextPath()%>/userInfo/getCode.do" alt="图片验证码">
				</li>
				<li>
					<i class="phoneCode"></i>
					<input id="msg_code" class="verificationCode" type="text" placeholder="请输入短信验证码" maxlength="6">
					<span class="pop_msg_count">发送验证码</span>
				</li>
				<li>
					<i class="passwordIcon"></i>
					<input id="password" class="txt" type="password" placeholder="请输入6-16位字符密码（选填）" maxlength="16">
					<input id="u_id" class="txt" type="hidden" value="${u_id}">
				</li>
			</ul>
			
			<div class="goReg">
				<a id="go_reg" href="javascript:;">注册领取100元红包</a>
			</div>
		</div>
		<div class="overlay" style="display:none;"></div>
		<div class="errormsg"></div>
		<div class="xyjsp serve">
			<div class="closebtn"></div>
			<h3>中再融投资咨询与管理服务电子协议</h3>
			<div class="xycont">
				<p>本网站由中再融（北京）科技有限公司 负责运营（以下本网站均指网站及中再融（北京）科技有限公司）。在您注册成为本网站用户前请务必仔细阅读以下条款。若您一旦注册，则视为您接受本网站的服务并受以下条款的约束。若您不接受以下条款，请停止注册本网站。</p>
				<p>本使用协议内容包括以下条款及已经发布的或将来可能发布的各类规则。所有规则为协议不可分割的一部分，与协议正文具有同等法律效力。本协议是由您与本网站共同签订的，适用于您在本网站的全部活动。在您注册成为用户时，您已经阅读、理解并接受本协议的全部条款及各类规则，并承诺遵守中华人民共和国现行的法律、法规、规章及其他政府规定，如有违反而导致任何法律后果的发生，您将以自己的名义独立承担所有相应的法律责任。</p>
				<p>本网站有权根据需要不时地制定、修改本协议或各类规则，如本协议及规则有任何变更，一切变更以本网站最新公布条例为准。经修订的协议、规则一经在本网站公布，即自动生效或在该等协议、规则指定的时间生效。您应不时地注意本协议及附属规则地变更，若您不同意相关变更，本网站有权不经任何告知终止、中止本协议或者限制您进入本网站的全部或者部分板块且不承担任何法律责任。但该终止、中止或限制行为并不能豁免您在本网站已经进行的交易下所应承担的义务。</p>
				<p>您确认本使用协议后，本使用协议即在您和本网站之间产生法律效力。您只要在“我已阅读并且同意 中再融的使用协议及隐私条款”前的选择框里打钩并按照本网站规定的注册程序成功注册为用户，您的行为既表示同意并签署了本使用协议。本使用协议不涉及您与本网站的其他用户之间因网上交易而产生的法律关系及法律纠纷，但您在此同意将全面接受和履行与本网站其他用户在本网站签订的任何电子法律文本，并承诺按该法律文本享有和/或放弃相应的权利、承担和/或豁免相应的义务。</p>
				<h5>一、使用限制</h5>
				<p>本网站中的全部内容的著作权、版权及其他知识产权均属于本网站所有，该等内容包括但不限于文本、数据、文章、设计、源代码、软件、图片、照片及其他全部信息（以下称“网站内容”）。网站内容受中华人民共和国著作权法及各国际版权公约的保护。未经本网站事先书面同意，您承诺不以任何方式、不以任何形式复制、模仿、传播、出版、公布、展示网站内容，包括但不限于电子的、机械的、复印的、录音录像的方式和形式等。您承认网站内容是属于本网站的财产。未经本网站书面同意，您亦不得将本网站包含的资料等任何内容镜像到任何其他网站或者服务器。任何未经授权对网站内容的使用均属于违法行为，本网站将追究您的法律责任。</p>
				<p>您承诺合法使用本网站提供的服务及网站内容。禁止在本网站从事任何可能违反中华人民共和国现行的法律、法规、规章和政府规范性文件的行为或者任何未经授权使用本网站的行为，如擅自进入本网站的未公开的系统、不正当的使用密码和网站的任何内容、窃取他人的账号和密码、窃取他人的个人隐私信息等。</p>
				<p>本网站只接受持有中国大陆、香港特区、澳门特区及台湾地区等有效身份证的18周岁以上的具有完全民事行为能力的自然人成为网站用户。如您不符合资格，请勿注册，否则本网站保留随时中止或终止您用户资格的权利。您在此向本网站保证，您已符合年龄和国籍条件，如因您向本网站提供虚假信息或承诺而导致本网站或中再融（北京）科技有限公司 蒙受任何损失，您将承担全部责任并赔偿相关损失。</p>
				<p>您注册成功后，不得将本网站的用户名转让给第三方使用。您确认，您用您的用户名和密码登录本网站后在本网站的一切行为均代表您本身作出的行为并由您承担相应的法律后果。任何利用您的用户名以及密码登录本网站并从事交易等行为均将被视为您的行为。因此，您有义务非常谨慎的保管自己的用户名以及密码。本网站对您的用户名和密码的遗失或被盗取所产生的后果不承担任何责任。</p>
				<p>您有义务在注册时提供自己的真实资料，并保证诸如电子邮件地址、联系电话、联系地址、邮政编码等内容的有效性及安全性。如您因网上交易与其他用户产生诉讼的，其他用户有权通过司法部门要求网站提供相关资料。</p>
				<p>经国家生效法律文书或行政处罚决定确认您存在违法行为，或者本网站有足够事实依据可以认定您存在违法或违反本使用协议的行为，或者您借款逾期未还的，本网站有权在本网站及互联网络上公布您的违法、违约行为，并有权将该内容记入任何与您相关的信用资料和档案。</p>
				<h5>二、涉及第三方网站</h5>
				<p>本网站的网站内容可能涉及由第三方所有、控制或者运营的其他网站的内容或链接（以下称“第三方网站”）。本网站不能保证也没有义务保证第三方网站上的信息的真实性和有效性。对于该等内容或链接，您确认按照第三方网站的使用协议确定相关权利义务，而不是按照本协议。第三方网站的内容、产品、广告和其他任何信息均由您自行判断并承担风险，而与本网站无关。</p>
				<h5>三、不保证</h5>
				<p>除非本网站或其合作方在特定投资交易成立后的电子协议书中明示承担责任外，本网站提供的服务中不带有对本网站中的任何用户、任何交易的任何保证，因此本网站及其股东、创建人、高级职员、董事、代理人、关联公司、母公司、子公司和雇员（以下称“本网站方”）不保证由其他用户或机构提供的内容的真实性、充分性、及时性、可靠性、完整性和有效性，并且不承担任何由此引起的法律责任。</p>
				<h5>四、责任限制</h5>
				<p>在任何情况下，本网站方对您使用本网站服务而产生的任何形式的直接或间接损失均不承担法律责任，包括但不限于资金损失、利润损失、营业中断损失等。因为本网站或者涉及的第三方网站的设备、系统问题或者因为计算机病毒造成的损失，本网站均不负责赔偿，您的补救措施只能是与本网站终止本协议并停止使用本网站。但是，中华人民共和国现行法律、法规另有规定的除外。</p>
				<h5>五、网站内容监测</h5>
				<p>本网站没有义务监测网站内容，但是您确认并同意本网站有权不时地根据法律、法规、政府要求透露、修改、屏蔽或者删除必要的、合适的信息，以便更好地运营本网站并保护本网站的用户的合法权益。</p>
				<h5>六、个人信息的使用</h5>
				<p>本网站对于您提供的、自行收集到的、经认证的个人信息将按照本网站的隐私条款予以保护、使用或者披露。</p>
				<h5>七、补偿</h5>
				<p>就任何第三方提出的，由于您违反本协议及纳入本协议的条款和规则或您违反任何法律、法规或侵害第三方的权利而产生或引起的每一种类和性质的任何索赔、要求、诉讼、损失和损害（实际的、特别的及有后果的），无论是已知或未知的，包括合理的律师费，您同意就此对本网站和本网站的母公司、子公司、关联公司、高级职员、董事、代理人和雇员（如适用）进行补偿并使其免受损害。</p>
				<h5>八、服务的中止或终止</h5>
				<p>1、 除非本网站终止本协议或者您申请终止本协议及注销相应用户账户且经本网站同意，否则本协议始终有效。在您违反了本协议、相关规则，或在相关法律法规、政府部门的要求下，本网站有权通过电子邮件告知方式终止本协议、关闭您的账户或者限制您使用本网站。但本网站的终止行为不能免除您根据本使用协议或在本网站生成的其他协议项下的还未履行完毕的义务。</p>
				<p>2、发生下列情形之一的，本网站有权随时中止或终止向用户提供服务：</p>
				<p class="p_second">(1)对于网络设备进行必要的保养及施工时；</p>
				<p class="p_second">(2)出现突发性的网络设备故障时；</p>
				<p class="p_second">(3)本网站所使用的网络通信设备由于不明原因停止，无法提供服务时；</p>
				<p class="p_second">(4)由于不可抗力因素致使本网站无法提供线上服务时；</p>
				<p class="p_second">(5)相关政府机构的要求。</p>
				<p>3、发生下列情形之一的，本网站有权随时中止或终止向用户提供服务而无需通知用户：</p>
				<p class="p_second">(1)用户提供的个人资料不准确，不真实，不合法有效；</p>
				<p class="p_second">(2)用户使用任何第三方程序进行登录或使用服务；</p>
				<p class="p_second">(3)用户滥用所享受的权利；</p>
				<p class="p_second">(4)用户有损害其他用户的行为；</p>
				<p class="p_second">(5)用户有违背社会风俗和社会道德的行为；</p>
				<p class="p_second">(6)用户有违反本协议中相关规定的行为。</p>
				<p>4、如因系统维护或升级的需要而需暂停网络服务，本网站将尽可能事先进行通告。</p>
				<p>5、终止用户服务后，用户使用本网站服务的权利立即终止。从终止用户服务即刻起，本网站不再对用户承担任何责任和义务。</p>
				<h5>九、适用法律和管辖</h5>
				<p>因本网站提供服务所产生的争议均适用中华人民共和国法律，并由中再融（北京）科技有限公司 住所地的人民法院管辖。</p>
				<h5>十、附加条款</h5>
				<p>在本网站的某些部分或页面中、或者您使用本网站相关服务产品的过程中，可能存在除本协议以外的单独的附加服务条款或协议，当这些服务条款或协议与本协议条款及规则存在冲突时，则前述本协议条款和规则以外的服务条款或协议将优先适用。</p>
				<h5>十一、条款的独立性</h5>
				<p>若本协议的部分条款被认定为无效或者无法实施时，本协议中的其他条款仍然有效。</p>
				<h5>十二、对应账户</h5>
				<p>您在本网站注册成功后，将由本网站向您分配一个固定的普通账户并与您的用户名相绑定。该账户将与指定第三方支付机构或银行的，以该支付机构或银行为名义开立的托管账户相对应。您可以通过向托管账户充值的方式，增加本网站普通账户上的余额。与本网站相关的所有资金的往来、划转均实际通过该支付机构或银行进行。您在此特不可撤销地授权本网站按照本协议、附属规则及所有服务产品的具体使用协议及规则管理和划扣您普通账户余额对应于托管账户中的资金。 在用户将资金汇入其在本网站平台上的账户但并未使用之前，本网站对于用户的资金有保管义务，本网站保证用户的资金安全。该普通账户将在您在本网站注册的账户注销后自动关闭，关闭时普通账户余额对应的资金将进行退还。</p>
				<h5>十三、投诉和咨询</h5>
				<p>若您在使用本网站的过程中有任何的疑问、投诉和咨询，可随时致电客服热线或发送电子邮件到本网站指定的电子邮箱：kf@zhongzairong.cn 。</p>
			</div>
		</div>
		<div class="xyjsp secret">
			<div class="closebtn"></div>
			<h3>中再融隐私条款</h3>
			<div class="xycont">
				<p>以下是本网站（www.zhongzairong.cn）及其运营公司中再融（北京）科技有限公司 （以下合称“本网站”）的隐私规则条款。</p>
				<p>您成为本网站用户前务必仔细阅读本隐私条款并同意本隐私条款。作为本网站服务的正常操作程序的一部分，本网站收集、使用并（在一些情况下）向第三方披露有关您的资料。本隐私条款作为本网站服务协议的附件，在您注册成为本网站用户后立即生效，并对您及本网站产生约束力。</p>
				<h5>一、用户身份限制</h5>
				<p>未成年人（年龄18周岁以下人士）、限制行为能力人、中国（包括港澳台地区）以外地区人士及自然人以外的组织无资格注册成为本网站用户并使用本网站的服务，本网站要求未成年人、限制行为能力人、中国（包括港澳台地区）以外地区人士及各类组织不要向本网站提交任何个人资料。</p>
				<h5>二、涉及的个人资料</h5>
				<p>本网站收集个人资料的主要目的在于向您提供一个顺利、有效和度身订造的交易经历。本网站仅收集本网站认为就此目的及达成该目的所必须的关于您的个人资料。</p>
				<p>本网站可能自公开及私人资料来源收集您的额外资料，以更好地了解本网站用户，并为其度身订造本网站服务、解决争议并有助确保在网站进行交易的安全性。</p>
				<p>本网站按照您在本网站网址上的行为自动追踪关于您的某些资料。本网站利用这些资料进行有关本网站之用户的人口统计、兴趣及行为的内部研究，以更好地了解您以便向您和本网站的用户社区提供更好的服务。</p>
				<p>本网站在本网站的某些网页上使用诸如“Cookies”的资料收集装置。“Cookies”是设置在您的硬盘上的小档案，以协助本网站为您提供度身订造的服务。本网站亦提供某些只能通过使用“Cookies”才可得到的功能。本网站还利用“Cookies”使您能够在某段期间内减少输入密码的次数。“Cookies”还可以协助本网站提供专门针对您的兴趣而提供的资料。</p>
				<p>如果您将个人通讯信息（例如：手机短信、电邮或信件）交付给本网站，或如果其他用户或第三方向本网站发出关于您在本网站上的活动或登录事项的通讯信息，本网站可以将这些资料收集在您的专门档案中。</p>
				<h5>三、本网站对您的资料的使用</h5>
				<p>您同意本网站可使用关于您的个人资料（包括但不限于本网站持有的有关您的档案中的资料，及本网站从您目前及以前在本网站上的活动所获取的其他资料）以解决争议、对纠纷进行调停、有助于确保在本网站进行安全交易，并执行本网站的用户协议。本网站有时候可能调查多个用户以识别问题或解决争议，特别是本网站可审查您的资料以区分使用多个用户名或别名的用户。 为限制在网站上的欺诈、非法或其他刑事犯罪活动，使本网站免受其害，您同意本网站可通过人工或自动程序对您的个人资料进行评价。</p>
				<p>您同意本网站可以使用您的个人资料以改进本网站的推广和促销工作、分析网站的使用率、改善本网站的内容和产品推广形式，并使本网站的网站内容、设计和服务更能符合用户的要求。这些使用能改善本网站的网页，以调整本网站的网页使其更能符合您的需求，从而使您在使用本网站服务时得到更为顺利、有效、安全及度身订造的交易体验。</p>
				<p>您同意本网站利用您的资料与您联络并（在某些情况下）向您传递针对您的兴趣而提供的信息，例如：有针对性的广告条、行政管理方面的通知、产品提供以及有关您使用本网站的通讯。您接受服务协议和隐私条款即为明示同意收取这些资料。</p>
				<h5>四、本网站对您的资料的使用</h5>
				<p>您可以授权本网站帮助您修改您在本网站填写的一切个人资料。如您违反服务协议等本网站规则或法律规定，本网站有权经电子邮件告知后在网站数据库中删除您的个人资料、关闭账户或者限制您使用本网站。</p>
				<p>网站有权根据实际审核结果在不通知您的情况下对您所填写的与事实不符的资料进行修正或更改。</p>
				<h5>五、本网站对您的资料的使用</h5>
				<p>本网站采用行业标准惯例以保护您的个人资料，但鉴于技术限制，本网站不能确保您的全部私人通讯及其他个人资料不会通过本隐私条款中未列明的途径泄露出去，对此本网站不承担任何责任。</p>
				<p>本网站有权根据有关法律和监管要求，本网站风险控制要求以及相关协议要求向司法机关等政府部门、社会组织或团体、其他第三方服务或合作机构提供您的个人资料。在您未能按照与本网站签订的服务协议、居间协议或者与本网站企业用户签订的借款（担保）协议的约定履行自己应尽的义务时，本网站有权根据自己的判断或者与该笔交易有关的其他用户的请求披露您的个人资料，并作出评论。</p>
				<h5>六、您对其他用户的资料的使用</h5>
				<p>在本网站提供的交易活动中，您无权要求本网站提供其他用户的个人资料，除非符合以下条件：</p>
				<p>（1）您已向法院起诉其他用户的在本网站活动中的违约行为；</p>
				<p>（2）本网站被吊销营业执照、解散、清算、宣告破产或者其他有碍于您收回借款本息的情形。</p>
				<h5>七、电子邮件</h5>
				<p>您不得使用本网站提供的服务或其他电子邮件转发服务发送垃圾邮件或其他可能影响本网站系统运行或违反本网站的用户协议或隐私条款的内容。</p>
				<p>如果您利用本网站的服务向没有在本网站内注册的电子邮件地址发出电子邮件,本网站除了利用该电子邮件地址发出您的电子邮件之外将不作任何其他用途。本网站不会出租或出售这些电子邮件地址。本网站不会永久储存电子邮件信息或电子邮件地址。</p>
				<h5>八、密码的安全性</h5>
				<p>您须对使用您的用户名和密码所采取的一切行为负责。因此，本网站建议您不要向任何第三方披露您在本网站的用户名和密码。</p>
				<h5>九、规则修改</h5>
				<p>本网站可能不时按照您的意见和本网站的需要修改本隐私条款，以准确地反映本网站的资料收集及披露惯例。本条款的所有修改，在本网站公布有关修改内容后自动生效或在该等条款指定的日期生效。</p>
			</div>
		</div>
	</div>
</body>
</html>