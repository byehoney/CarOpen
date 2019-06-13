<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>《中再融借款合同》中再融（优信睿达版）</title>
    <%@ include file="/views/inc/inc.jsp"%>
    <style>
 .fb_title {text-align: center;font-size:16px; line-height:25px;}
.body-content{background:#fff;position:relative;}
.content{ 
	overflow: hidden;
    margin:0 10px;
}
.tkCMain {
    color: #333333;
}
.tkCMain p { 
	font-size:12px;
    line-height: 20px;
	margin:5px auto;
}
.tkCMain div {
	font-size:12px;
    line-height: 20px;
	margin:3px auto;
}

.tkCMain .title{
	text-align:center;
	font-weight:bold;
	font-size:20px; 
}
.tkCMain .chapter{
	color:#000;
	font-size:14px;
	margin:15px 0px 10px;
	display:block;
}
.tkCMain .section{
	text-indent: 3.5em;
}
.tkCMain .sign{
	text-align:right;
}
.tkCMain .small{
	font-size:12px;
	line-height:normal;
}


table{
	border-collapse: collapse;
	border: none;
	width: 100%;
	margin:27px auto;
}
td,th{
	border: solid 1px #d8d8d8;
	padding:10px 0px;
	line-height:27px;
	text-align:center;
}
th{
	font-size:14px;
	font-weight:normal;
	background:#f2f2f2;
}
td{
	font-size:12px;
}

.tableSection {
background: #f6f6f6;
}

.blankStyle span{display:inline-block;float:left}
.blankStyle .span1{padding:16px 20px 20px 0;border-right:1px solid #d8d8d8}
.blankStyle .span2{margin-top:30px}.blankStyle .span3{margin-top:16px}
td.noPadding{padding:0}td.noPadding p{margin:0}p.one{border-bottom:1px solid #d8d8d8}
.tkCMain p.left{text-align:left;padding-left:131px}
    </style>
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
	<!--内容-->
<div class="body-content">
	<div class="agreement_sign"></div>
    <div class="content">
    	<div class="tkCont">
			<div class="tkCMain">		
<div class="fb_title" style="margin-bottom:65px;">中再融借款协议(范本)</div>		
<p class="sign small">合同编号: 20131118_11_88_1</p>
<p class="sign small">项目编号: DEMO2013111800001QY</p>
<p class="sign">本借款协议（“本协议”）由以下各方于 2013-11-18签订：</p>
<div>借款人（质押人）：xxxx公司 </div>
<div>法定代表人：李磊</div>
<div style="margin-top:20px;">出借人（质押权人）：</div>
<table>
	<tbody><tr>
		<th>中再融用户 </th><th>投资金额</th><th>出借时间</th><th>到期收益</th>
	</tr>
	<tr>
		<td>lisi<br>姓名:李明<br>身份证:510107198511281111</td><td>10000.00元</td><td>2013-11-18 14:46:32</td><td>100.00元</td>
	</tr>
	<tr>
		<td>wanghua</td><td>10000.00元</td><td>2013-11-18 14:20:16</td><td>100.00元</td>
	</tr>
</tbody></table>

<div style="margin-top:20px;">监管方：XXXXX公司</div>
<div>地址：XXXXX地区</div>

<div style="margin-top:20px;">平台方：中再融[中再融(北京)科技有限公司]</div>
<div>地址：北京市朝阳区左家庄15号院2号楼4层</div>

<div class="chapter">一、出借项目详情及还款计划</div>

<p>1.1 项目介绍</p> 
<table>
	<tbody><tr>
		<th>项目名称 </th><td colspan="3">样例项目</td>
	</tr>
	<tr>
		<th>项目编号</th><td colspan="3">DEMO2013111800001QY</td>
	</tr>
	<tr>
		<th>线下借款合同编号</th><td colspan="3">xxhtbh201417_11</td>
	</tr>
	<tr>
		<th>借款总额</th><td colspan="3">人民币20,000元（贰万圆整）</td>
	</tr>
	<tr>
		<th>预期年化收益率</th><td>12%</td><th>借款期限</th><td>3个月</td>
	</tr>
	<tr>
		<th>还款方式 </th><td>按月付息、到期还本</td><th>借款类型 </th><td>抵质押贷款</td>
	</tr>
	<tr>
		<th>收益期起始</th><td>2013-11-18</td><th>收益期结束</th><td>2014-02-18</td>
	</tr>
	<tr>
		<th>借款用途 </th><td colspan="3">资金周转</td>
	</tr>
</tbody></table>
<p>1.2 还款计划 </p>
<table>
	<tbody><tr>
		<th>还款日期</th><th>还款金额</th><th>累计还款额</th>
	</tr>
	<tr>
		<td>2013-12-18</td><td>200.00元</td><td>200.00元</td>
	</tr>
	<tr>
		<td>2014-01-18</td><td>200.00元</td><td>400.00元</td>
	</tr>
	<tr>
		<td>2014-02-18</td><td>20200.00元</td><td>20600.00元</td>
	</tr>
</tbody></table>

<div class="chapter">二、借款流程</div>


<p>2.1 申请生成协议：出借人按照平台方的规则，在对借款人发布的借款项目中点击“投资”按钮，并确认订立本合同，然后在第三方支付机构支付系统中确认后，本合同以电子方式生成。 </p>

<p>2.2 出借资金冻结：出借人点击第三方支付机构订单信息页面的“确定”按钮，即视为其已经向平台方合作的第三方支付机构发出不可撤销的授权指令，授权第三方支付机构或监管银行冻结出借人其名下账户的确认出借资金，冻结的出借资金等同于本协议条款1.1中所列的“借款总额”的资金。上述冻结将在本协议生效时或本协议确认解除时解除。 </p>

<p>2.3 本协议生效：本协议在借款人发布的借款需求全部得到满足且借款人借款需求所对应的资金已经全部划转至借款人第三方支付机构账户时立即生效。</p>

<p>2.4 出借资金划转：本协议生效的同时，借款人即不可撤销地授权平台方委托相应的第三方支付机构及监管银行等合作机构，将金额等同于本协议条款1.1所列的“借款总额”的资金，由出借人的第三方支付机构账户划转至借款人的第三方支付机构账户中，划转完毕即视为借款发放成功。</p> 

<p>2.5 借款发放成功为出借人履行资金出借义务完毕的标志。 借款发放成功后，借款人可通过“提现”操作将划转的资金转至其名下的银行账户上。借款人是否执行“提现”操作不影响本协议的效力。</p>

<div class="chapter">三、授权委托</div>
<p>3.1 出借人保证其所有出借的资金来源合法，出借人是该资金的合法所有或合法使用人。若第三方对资金归属、合法性问题发生争议，则由出借人自行负责解决。若出借人未能解决，则须放弃享有其所借贷项目约定的一切收益。如给借款人、保证人和平台方造成损失的，应当赔偿损失。</p>
<p>3.2 鉴于中再融出借人网络众筹投资模式的特殊需求，为最大限度保障出借人投资利益，实现众多线上出借人在办理签约、担保权设立、贷后管理及债权实现等事项中的便利性，各线上出借人在此不可撤销地选定并授权平台方推荐的人作为其代理人（以下简称“出借受托人），由出借受托人以自身名义办理签署合同手续、贷后管理及催收的全部事项，各线上出借人与出借受托人之间建立间接代理法律关系，借款实体债权及其风险均由各线上出借人按各自实际投资比例享有权利和承担义务。</p>
<p>3.3各线上出借人授权出借受托人享有第3.4条约定的权利及承担相应义务，出借受托人可以根据本项目的实际运作情况选择行使其中一项或几项权利，以保障本项目的顺利进行。若出借受托人于本项目过程中未全部行使以下权利，并不代表出借受托人放弃相关权利。</p>
<p>3.4出借受托人享有的权利及承担的义务如下：</p>
<p>3.4.1出借受托人作为名义出借人与借款人办理资金出借手续及还款手续；</p>
<p>3.4.2出借受托人有权以自身名义代理出借人签署和履行与借款有关的包括但不限于《借款合同》、《保证合同》、《质押合同》等线下法律文件（以下简称“线下合同”）；</p>
<p>3.4.3出借受托人签署与本协议相关的一切合同并办理相关公证手续及聘请律师、会计师等第三方服务机构，为本项目借款出具法律意见等。 </p>
<p>3.4.4当借款人违约不按照约定支付利息或偿还本金时，出借受托人有义务为出借人利益向借款人、担保人及其他担保方发起代偿请求或其它追偿行动。收回的所有款项按出借人出资比例转付出借人。出借受托人提供以上代理所支出的实际费用（若有）由出借人按实际出资比例承担，出借受托人不额外收取任何费用。</p>
<p>3.4.5出借人在此不可撤销地委托出借受托人代为处理本协议项下出借人与借款人、担保方、监管方之间的全部争议，出借受托人有权为了维护出借人利益采取一切必要的手段，包括但不限于调解、诉讼等。委托代理权限包括但不限于代为提出、承认、变更、撤回、放弃诉讼请求；代为进行答辩，提出、承认、变更、撤回、放弃诉讼反请求；参加开庭审理、陈述事实及代理意见并参加调查、质证活动；接受调解、和解；代为领取裁判文书及诉讼标的。且出借人同意出借受托人可将前述委托事项转委托给专业机构及人员（如律师事务所、律师等）。</p>
<p>3.4.6其他一切为完成本项目借款而授予出借受托人的权利。</p>
<p>3.5出借受托人与借款人所签署的线下《借款合同》之内容不得实质性违反本协议约定，且为了保障出借人利益，出借受托人可以在线下合同中增加对借款人或/和担保人的约束性内容。</p>


<div class="chapter">四、本息偿还方式</div>

<p>4.1 本项目如涉及两人以上借款人，任一借款人均应履行本协议项下的义务，对全部借款承担连带清偿责任，出借人有权向任一借款人追索本项目项下全部应付款项，包括不限于本金、利息、逾期罚息、违约金、滞纳金及其他费用。 </p>

<p>4.2 借款人必须按照借款合同的约定按时、足额偿还出借人的本金和收益。 </p>

<p>4.3 借款人必须在每个还款日当日（不迟于16:00时）之前向出借人偿还，否则构成违约。如还款日遇法定节假日或公休日，还款日不进行顺延，借款人需提前到上一个工作日还款；如遇还款月无对应的还款日，还款日为还款月的最后一日。</p>

<p>4.4 若由于银行或第三方支付休假原因或系统问题延迟交易，导致还款延期，平台方不承担任何责任。 </p>

<p>4.5 募集期内（出借人资金被冻结的次日至平台方指令向借款人放款的前一日）出借人不享有任何利息。 </p>



<div class="chapter">五、提前还款与逾期还款</div>

<p>5.1 借款人可在借款期内的任何时间通过平台方提前偿还剩余本金，但不允许借款人部分提前还款。 </p>

<p>5.2  若借款人提前偿还全部剩余本金，需提前7个工作日以书面形式通知平台方，借款人及出借人委托出借受托人代为处理提前结清的相关事项。因提前还款所产生的所有费用由借款人和平台方另行约定，与出借人无关。</p>

<p>5.3 每个还款日16:00时前，借款人未足额支付当月应还款的，则视为逾期。 </p>

<p>5.4借款人逾期且担保人未按约定时间履行代偿责任的，借款人及担保人尚未清偿的全部剩余本金和收益，自逾期之日在借款利率的基础上上浮20%计收逾期罚息给出借人和0.1%/日的利息计算平台违约金给平台方，直至清偿应付本金、收益和逾期罚息。 逾期所产生的收益，逾期罚息不计利息。</p>


<div class="chapter">六、质押担保</div>

<p>6.1 担保人自愿为本协议的借款向出借人提供质押担保，质押担保的范围为本合同项下的本金、收益、逾期罚息和违约金，以及借款人根据协议或适用的中国法律应支付的其他赔偿金和出借人与出借受托人实现债权的费用，包括但不仅限于保全费、诉讼费、律师费、差旅费等。 </p>

<p>6.2 质押权人质押权的效力及于质押物产生的孳息、质押物的从物、从权利、附属物、添加物，以及因质押物的毁损、灭失或被征收、被征用等而产生的保险金、赔偿金、补偿金或其他形式的替代物。</p>

<p>6.3 在本合同履行期间，质押人的行为足以使质押物价值减少的，应立即停止其行为；造成质押物价值减少时，质押人应及时恢复质押物的价值，或提供与减少的价值相当的担保。如因市场价格变动，在质押物总值低于监管最低限额时，质押权人有权要求质押人补足质押物，否则，质押权人可授权监管方对质押人的质押物按法律程序进行变卖或拍卖，所得价款优先用于向质押权人还款。</p>

<p>6.4 质押人所获得的质押物的赔偿金、补偿金，保险金以及处分质押物所得收益，质押权人有权选择下列方式进行处理：</p>

<p class="section">A、提存或提前清偿借款人在本合同项下的债务； </p>

<p class="section">B、存入质押权人指定帐户，以担保借款人债务的履行； </p>

<p class="section">C、双方约定的其他方式。</p>

<p>6.5 发生下列情形之一，构成借款人违约，出借人有权自行或委托平台方提前终止本合同并要求借款人立即偿还所有应付本金、收益和违约金；在违约期间借款人除需按本合同约定继续支付借款利息外，根据违约天数，借款人需向出借人支付借款总额每日千分之一的违约金。如借款人在出借人或平台方提出要求后3日内未提前偿还，出借人有权委托监管方将质押物评估、拍卖或变卖，以所得价款优先受偿或按第6.4条约定的其他方式处理；或经与质押人协商将质押物折价以抵偿借款人所欠债务；同时保留将借款人违约失信的相关信息在平台或其它媒体披露的权利。 </p>

<p class="section">A、借款人未按本合同约定用途使用借款的，或在贷后回访中未能提供资金流向的相关凭证的； </p>

<p class="section">B、借款人出现一次（包含一次）以上的还息逾期，或未经出借人同意擅自转让本合同项下的还款义务； </p>

<p class="section">C、借款人、担保人提供虚假资料或者故意隐瞒事实； </p>

<p class="section">D、借款人、担保人发生任何财产遭受没收、征用、查封、扣押、冻结等可能影响其履约能力的不利事件； </p>

<p class="section">E、借款人、担保人的财务状况出现影响其履约能力的不利变化，不能在10日内提供有效补救措施； </p>

<p class="section">F、出借人受托人或平台方在10日内经过五次以上电话联系借款人，借款人电话一直处于无人接听或关机状态； </p>

<p class="section">G、在出借人的贷后回访中，借款人不按出借人的要求提供财务资料、合同资料、工商变更文件、涉诉文件等，或不配合出借人对厂房、生产设备、库存、质押物情况等的检查； </p>

<p class="section">H、借款人违反本合同约定或法律规定的其他情形。</p>

<p>6.6 如出借受托人通过人民法院或当地金融监管部门向借款人发起追偿行为，发起行为的一切费用由出借受托人先行垫付，出借受托人有权向借款人追偿因追偿行为所产生、引起或发生的一切费用。</p>

<p>6.7 平台方有权就为本协议借款所提供的服务向借款人收取服务费，上述费用的收取方式由借款人和平台方另行约定。</p>

<div class="chapter">七、质押物监管</div>

<p>7.1质押人、质押权人、监管方三方均同意由监管方对质押人提供的质押物进行监管。质押人需保证质押物为合法渠道购入的商品，所有权没有任何权利瑕疵，不存在任何权属争议；保证商品质量符合国家相关法律法规规定的产品质量标准，否则由此产生争议与纠纷由质押人承担全部责任。 </p>

<p>7.2 监管方应对质押人的质押物根据增值税发票进行核对，以进货发票价格及相关市场的公开报价作为质押物总值计算的基本依据，无发票的库存商品不列入质押范围。监管方需针对监管的质押物进行评估，并向出借人提供评估报告。监管方可以根据市场价格对质押物的总值进行合理调整，且无需经过质押人的同意，但应及时书面通知质押权人和质押人。</p> 

<p>7.3 在质押物金额高于监管最低限额时，质押人经监管方书面同意，可就超出监管最低限额部分的质押物进行流通使用，如质押物金额低于监管最低限额时，监管方有权停止质押人质押物出库，并要求质押人限期补足质押物，同时将前述情形书面告知质押权人。</p>

<p>7.4 监管方每月一次向质押权人提交有关质押物金额、库存结构、库龄及库存监管情况的报表及报告，并积极配合质押权人就质押物及监管方监管情况进行得核查，提供质押权人要求的资料。</p>

<p>7.5 在监管期间，若由于监管方原因未按本协议和监管方案的要求履行监管义务造成质押物损失的，由监管方按照监管最低限额与质押物实际金额间的差额，向质押权人承担赔偿责任。 </p>

<p>7.6 由于监管方未尽到监管义务造成质押物损毁灭失，导致质押权人发生实际损失的，监管方需根据质押物损毁灭失或质押权落空的价值在实际损失范围内对质押权人承担赔偿责任。</p>

<p>7.7 质押人串通监管方损害出借人利益的，由质押人和监管方对本合同项下的借款本息、费用承担连带赔偿责任。 </p>

<p>7.8 在借款人未按照本合同约定期限按时足额还款时，质押权人可授权监管方对质押人的质押物按法律程序进行变卖或拍卖，质押权人有权从所得价款中优先受偿。 </p>

<p>7.9 发生下列事项时，质押权人、监管方不承担相应责任，应由借款人承担相应责任与损失： </p>

<p class="section">a)因货物的自然性质、内在质量瑕疵或缺陷、合理损耗而造成的损失。 </p>

<p class="section">b)外包装完整，封闭无异状而内件短少、毁损或与标记不一致的。 </p>

<p class="section">c) 因不可归责于质押权人、监管方的事故或事件，造成货物的损坏、毁灭、短缺或迟延交货的。 </p>


<div class="chapter">八、转让</div>

<p>8.1 未经出借人书面同意，借款人不得将本合同项下的任何权利义务转让给任何第三方。 </p>

<p>8.2 借款人若因发生本章第一条情形而违约，出借人有权自行或委托平台方提前终止本合同并要求借款人立即偿还所有应付本金、收益和逾期罚息，同时保留将借款人违约失信的相关信息在平台或其它媒体披露及录入国家征信系统的权利。 </p>

<p>8.3 出借人在平台方通过交易获得的债权受平台方承认，出借人将获得债权人对债权的一切法律权利。</p>

<p>8.4 出借人可以按照平台方的规定，与其他出借人签署《债权转让协议》进行债权转让，新的出借人享有和承担原出借人的全部权利及义务，并应遵守本协议的相关规定。</p>

<p>质押人同意为新出借人承担原有范围的担保责任。</p>




<div class="chapter">九、公证</div>

<p>9.1 本合同各方共同确认：本合同需办理具有强制执行效力的债权文书公证；且各方根据有关法律规定已经对强制执行公证的含义、内容、程序、效力等完全明确了解。 </p>

<p>9.2 本合同各方自本合同签订之日起自愿向公证机关申请办理本合同公证并申请赋予其强制执行效力。 </p>

<p>9.3 借款人（担保人）确认：合同各方同意对本合同进行强制执行公证，本合同经公证后具有强制执行效力，可以依法向有管辖权的人民法院申请执行,而无需经过诉讼程序。 </p>

<p>9.4 借款人（担保人）自愿接受上述强制执行并自愿放弃对上述强制执行的抗辩权。</p>

<p>9.5 本条款关于强制执行效力的债权文书公证的约定优先于本合同第十条关于诉讼管辖的约定执行。</p>

<div class="chapter">十、争议解决</div>

<p>10.1 若各方在本合同履行期间发生争议，应友好协商解决；若协商不成，则可提交平台方所在地人民法院进行诉讼。</p>

<p>10.2 违约一方或对合同争议承担主要责任的一方，应承担对方因诉讼活动而产生的诉讼费、合理律师代理费、鉴定（检验）费、差旅费、评估费、拍卖费和其他相关费用。 </p>


<div class="chapter">十一、其它</div>

<p>11.1出借人在资金出借、债权转让过程产生的相关税收缴纳义务，应由出借人根据中国法律的规定自行向其主管税务机关申报、缴纳，平台方不承担任何代扣代缴的义务及责任，出借人违反上述规定导致平台方承担的任何损失应由出借人负责全额赔偿。</p>

<p>11.2 若借款人的相应借款需求在平台方上线后7日内未被满足，则自第七日24:00时起，本合同自动终止；或借款人将本合同规定全部本金、收益、逾期罚息及其他相关费用全部偿还完毕之时，则本合同亦自动终止； </p>

<p>11.3 若本合同中有与国家法律法规相冲突的条款，则该条款以国家相关法律法规为准，其它条款不受影响。 </p>

<p>11.4 本合同的任何修改、补充均须需经本合同相关各方确认同意，并以平台方电子文本形式作出。 </p>

<div style="margin-top:30px;">监管方 ：XXXXX公司</div>
<div>地址 ：XXXXX地区</div>
<div style="margin-top:30px;">平台方 ：中再融 [中再融(北京)科技有限公司]</div>
<div>地址 ：北京市朝阳区左家庄15号院2号楼4层</div>

			</div>
		</div>
	</div>
</div>
<%@ include file="/views/inc/footer.jsp"%>
</body>
</html>