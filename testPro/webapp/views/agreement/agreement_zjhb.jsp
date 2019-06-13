<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>中再融债权转让合同 - 中再融</title>
    <%@ include file="/views/inc/inc.jsp"%>
  <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/xieyi.css">
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>

<!--内容-->
<div class="body-content">
	<div class="agreement_sign"></div>
    <div class="content">
    	<div class="tkCont">
			<div class="tkCMain">
			
				<div class="fb_title" style="margin-bottom:65px;">中再融债权转让合同</div>
								
				<p class="sign small">合同编号: 20140807_2_55_1</p>
				<p class="sign small">项目编号: ZYTZ2014080700001QY</p>
				<p class="sign">本债权转让合同（“本合同”）由以下各方于2014-08-07签订：</p>
				
				<div>债权转让人（以下简称转让人）：XXX</div>
				<div>法定代表人/身份证号：张三/510107198511280000</div>
				<div style="margin-top:20px;">债权受让人（以下简称受让人）：</div>
				
				<table width="100%"> 
					<tbody>
						<tr><td width="40%" valign="top" class="tableSection">
						<p align="center"> 中再融用户  </p> </td><td width="20%" valign="top" class="tableSection">
						<p align="center"> 投资金额  </p>
						</td><td width="20%" valign="top" class="tableSection">
						<p align="center">出借时间</p>
						</td><td width="20%" valign="top" class="tableSection">
						<p align="center"> 到期收益  </p> </td> </tr>
						<tr><td><p align="center">lisi<br>姓名:李明<br>身份证:510107198<br>511281111<br></p></td><td>
						<p align="center">10000.00元</p></td><td><p align="center"> 2014-08-07 14:46:32</p></td><td>
						<p align="center">100.00元</p></td></tr> <tr><td><p align="center">wanghua</p></td>
						<td><p align="center">10000.00元</p></td><td><p align="center"> 2014-08-07 14:20:16</p></td>
						<td><p align="center">100.00元</p></td></tr> 
					 </tbody>         
				 </table>
				
				<div style="margin-top:20px;">保证人：XXXXXXXXXXXX</div>
				<div>地址：XXX地区</div>


				<div style="margin-top:20px;">平台方：中再融[中再融(北京)科技有限公司]</div>
				<div>地址：北京市朝阳区左家庄15号院2号楼4层</div>
				
				<div class="chapter">鉴于：</div>
				<p>1. 借款人因资金周转向转让人进行借款，并签订了《借款合同》或《借款抵押合同》，并委托相关担保方为上述借款提供担保，签署相关《保证合同》、《抵押合同》等合法有效的法律文件。</p>
				<p>2. 现转让人拟将上述债权转让给受让人，受让人同意受让本债权。相关各方于线下签署《债权转让合同》或《债权转让及回购合同》（以下简称“主合同”），保证人确认以上债权转让行为合法有效，并签署相关的《保证合同》提供无限连带责任保证担保。</p>
				<p>3. 转让人负责将本债权转让事实通知借款人，由借款人向本合同的债权受让人偿还借款。若借款人未按时足额还款，则转让人承担债务到期时向受让人回购全额债权本息的义务，保证人为以上义务的履行承担无限连带责任保证担保。根据以上情况，转让人、受让人、保证人、平台方四方经过平等协商达成如下约定。</p>

				<div class="chapter">一、债权转让项目详情及还款计划</div>
				
				<p>1.1 项目介绍</p> 
				<table width="100%">
					<tbody>
						<tr>
							<td width="25%" valign="top" class="tableSection">
								<p align="center">项目名称</p>
							</td>
							<td colspan="3">
								<p align="center">
									<span id="toReplaceProjectName">样例项目</span>
								</p>
							</td>
						</tr>
						<tr>
							<td width="25%" valign="top" class="tableSection">
								<p align="center">项目编号</p>
							</td>
							<td colspan="3">
								<p align="center">
									<span id="toReplaceProjectCode">ZYTZ2013111800001QY</span>
								</p>
							</td>
						</tr>
						<tr>
							<td width="25%" valign="top" class="tableSection"><p align="center">线下债权转让合同编号</p></td>
							<td colspan="3"><p align="center"><span id="toReplaceProjectCode">xxhtbh201417_11</span></p></td>
						</tr>
						<tr>
							<td width="25%" valign="top" class="tableSection">
								<p align="center">债权转让</p>
							</td>
							<td colspan="3">
								<p align="center">
									<span id="toReplaceProjectAmount">人民币20,000元（贰万圆整）</span>
								</p>
							</td>
						</tr>
						<tr>
							<td width="25%" valign="top" class="tableSection">
								<p align="center">预期年化收益率</p>
							</td>
							<td width="25%" valign="top">
								<p align="center">
									<span id="toReplaceProjectRate">12%</span>
								</p>
							</td>
							<td width="25%" valign="top" class="tableSection">
								<p align="center">借款期限</p>
							</td>
							<td width="25%" valign="top">
								<p align="center">
									<span id="toReplaceProjectTeamCount">3个月</span>
								</p>
							</td>
						</tr>
						<tr>
							<td width="25%" valign="top" class="tableSection">
								<p align="center">还款方式</p>
							</td>
							<td width="25%" valign="top">
								<p align="center">
									<span id="toReplaceProjectRepayWay">一次性还本付息</span>
								</p>
							</td>
							<td width="25%" valign="top" class="tableSection">
								<p align="center">借款类型</p>
							</td>
							<td width="25%" valign="top">
								<p align="center">
									<span id="toReplaceProjectBorrowerType">抵质押贷款</span>
								</p>
							</td>
						</tr>
						<tr>
							<td width="25%" valign="top" class="tableSection">
								<p align="center">收益期起始</p>
							</td>
							<td width="25%" valign="top">
								<p align="center">
									<span id="toReplaceProjectIncomeStartDate">2014-08-08</span>
								</p>
							</td>
							<td width="25%" valign="top" class="tableSection">
								<p align="center">收益期结束</p>
							</td>
							<td width="25%" valign="top">
								<p align="center">
									<span id="toReplaceProjectIncomeEndDate">2014-11-18</span>
								</p>
							</td>
						</tr>
						<tr>
							<td width="25%" valign="top" class="tableSection">
								<p align="center">担保代偿期限</p>
							</td>
							<td colspan="3">
								<p align="center">
									<span id="toReplaceProjectCode">利息“T+0”当日代偿；本金“T+7”七日内代偿</span>
								</p>
							</td>
						</tr>
						<tr>
							<td width="25%" valign="top" class="tableSection">
								<p align="center">借款用途</p>
							</td>
							<td colspan="3">
								<p align="center">
									<span id="toReplaceProjectCode">资金周转</span>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
				<p>1.2 还款计划 </p>
				<table width="100%">
					<tbody>
						<tr>
							<td width="175" valign="top" class="tableSection">
								<p align="center">还款日期 </p>
							</td>
							<td width="171" valign="top" class="tableSection">
								<p align="center">还款金额</p>
							</td>
							<td width="174" valign="top" class="tableSection">
								<p align="center">累计还款额</p>
							</td>
						</tr>
						<tr>
							<td>
								<p align="center">2014-09-08</p>
							</td>
							<td>
								<p align="center">200.00元</p>
							</td>
							<td>
								<p align="center">200.00元</p>
							</td>
						</tr>
						<tr>
							<td>
								<p align="center">2014-10-08</p>
							</td>
							<td>
								<p align="center">200.00元</p>
							</td>
							<td>
								<p align="center">400.00元</p>
							</td>
						</tr>
						<tr>
							<td>
								<p align="center">2014-11-08</p>
							</td>
							<td>
								<p align="center">20200.00元</p>
							</td>
							<td>
								<p align="center">20600.00元</p>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="chapter">二、债权受让流程</div>
				<p>2.1 申请生成合同：受让人按照平台方的规则，在对转让人发布的借款项目中点击“投资”按钮，并确认订立本合同，然后在第三方支付机构支付系统中确认后，本合同以电子方式生成。</p>
				<p>2.2 投资资金冻结：受让人点击第三方支付机构订单信息页面的“确定”按钮，即视为其已向平台方合作的第三方支付机构发出不可撤销的授权指令，授权第三方支付机构或监管银行冻结受让人其名下账户的确认投资资金。上述冻结将在本合同生效时或本合同确认终止时解除。</p>
				<p>2.3 本合同生效：本合同在转让人发布的具体债权转让需求投资满额，且转让人的融资需求所对应的债权标的受让价款已经全部划转至转让人资金托管账户时立即生效。一个债权有多名受让人投资的，按投资比例共同享有债权权利和权益。 </p>
				<p>2.4 转让价款划转：资金募集成功，转让人即不可撤销地授权平台方委托相应的第三方支付机构及监管银行等合作机构，将金额等同于本合同条款确认的投资金额，由受让人的资金托管账户划转至转让人资金托管账户。受让人投资金额连同该债权标的其他受让人投资金额划入转让人的资金托管账户中，划转完毕即视为债权转让成功。转让人可通过“提现”操作将划转的资金转至其名下的银行账户上。转让人是否执行“提现”操作不影响本合同的效力。</p>
				
				<div class="chapter">三、授权委托</div>
				<p>3.1　受让人保证其所有投资的资金来源合法，受让人是该资金的合法所有或合法使用人。若第三方对资金归属、合法性问题发生争议，则由受让人自行负责解决。若受让人未能解决，则须放弃享有其所投资项目约定的一切收益。如给转让人、保证人和平台方造成损失的，应当赔偿损失。</p>
				<p>3.2 鉴于中再融受让人网络众筹投资模式的特殊需求，为最大限度保障受让人投资利益，实现众多线上受让人在办理签约、担保权设立、贷后管理及债权实现等事项中的便利性，各线上受让人在此不可撤销地选定并授权平台方推荐的人作为其代理人（以下简称“出借受托人），由出借受托人以自身名义办理签署合同手续、贷后管理及催收的全部事项，各线上受让人与出借受托人之间建立间接代理法律关系，借款实体债权及其风险均由各线上受让人按各自实际投资比例享有权利和承担义务。</p>
				<p>3.3各线上受让人授权出借受托人享有第3.4条约定的权利及承担相应义务，出借受托人可以根据本项目的实际运作情况选择行使其中一项或几项权利，以保障本项目的顺利进行。若出借受托人于本项目过程中未全部行使以下权利，并不代表出借受托人放弃相关权利。</p>
				<p>3.4出借受托人享有的权利及承担的义务如下：</p>
				<p class="section">3.4.1出借受托人作为名义受让人与转让人办理债权转让手续及还款手续；</p>
				<p class="section">3.4.2出借受托人有权以自身名义代理受让人签署与债权转让有关的包括但不限于《债权转让合同》、《债权转让及回购合同》、《保证合同》、《质押合同》、《抵押合同》等线下法律文件（以下简称“线下合同”）；</p>
				<p class="section">3.4.3出借受托人签署与本合同相关的一切合同并办理相关公证手续及聘请律师、会计师等第三方服务机构，为本项目借款出具法律意见等。</p>
				<p class="section">3.4.4当借款人违约不按照约定支付利息或偿还本金时，或转让人违约不按照约定回购债权本金或利息时，出借受托人有义务为受让人利益向借款人、转让人、保证人及其他担保方发起代偿请求或其它追偿行动。收回的所有款项按受让人出资比例转付受让人。出借受托人提供以上代理所支出的实际费用（若有）由受让人按实际出资比例承担，出借受托人不额外收取任何费用。</p>
				<p class="section">3.4.5受让人在此不可撤销地委托出借受托人代为处理本合同项下受让人与转让人、担保方、监管方之间的全部争议，出借受托人有权为了维护受让人利益采取一切必要的手段，包括但不限于调解、诉讼等。委托代理权限包括但不限于代为提出、承认、变更、撤回、放弃诉讼请求；代为进行答辩，提出、承认、变更、撤回、放弃诉讼反请求；参加开庭审理、陈述事实及代理意见并参加调查、质证活动；接受调解、和解；代为领取裁判文书及诉讼标的。且受让人同意出借受托人可将前述委托事项转委托给专业机构及人员（如律师事务所、律师等）。</p>
				<p class="section">3.4.6其他一切为完成本项目债权转让而授予出借受托人的权利。</p>
				<p>3.5出借受托人与转让人所签署的线下《债权转让合同》或《债权转让及回购合同》之内容不得实质性违反本合同约定，且为了保障受让人利益，出借受托人可以在线下合同中增加对转让人或/和保证人的约束性内容。</p>
				
				
				<div class="chapter">四、债权转移的生效</div>
				<p>4.1 转让债权于转让人收到全部转让价款之日起归受让人享有和处分。</p>
				<p>4.2 债权转移后，受让人成为转让债权的债权人，依法并按照本合同的约定享有和行使与该债权有关的一切主从权利。</p>
				<p>4.3前款所述主从权利包括但不限于转让债权请求权，与债权有关的担保权益及相应的受偿权、收益权等。</p>
				
				
				<div class="chapter">五、债权转让的通知</div>
				<p>5.1 债权凭证移交之日起3个工作日内，转让人应通过挂号邮寄或当面送达的方式负责将债权转移事宜书面通知借款人。</p>
				<p>5.2 对拒绝签收或地址不详的借款人，转让人应采用公证送达或公告方式通知其债权转移事项。 </p>
				
							
				<div class="chapter">六、本息偿还方式</div>
				<p>6.1 本项目如涉及两人以上借款，任一借款人均应履行本协议项下的义务，对全部借款承担连带清偿责任，受让人有权向任一借款人追索本项目项下全部应付款项，包括不限于本金、利息、逾期罚息、滞纳金及其他费用。如涉及两人以上转让人，任一转让人均应履行本协议项下的义务，对全部转让债权承担回购债权的责任，受让人有权向任一转让人追索本项目项下全部应付款项，包括不限于本金、利息、逾期罚息、滞纳金及其他费用。</p>
				<p>6.2 借款人必须按照借款合同的约定按时、足额偿还对受让人的本金和收益。同时，转让人必须按照《债权转让合同》或《债权转让及回购合同》的约定按时、足额回购对受让人的债权本金和收益。</p>
				<p>6.3 受让人授权平台方可以委托担保人在每个还款日当日（不迟于24:00）或之前代为向受让人收集按期约定的收益，金额等于本合同第一章第二条的还款计划金额。若担保人对平台方支付完成，平台方根据合同约定转交约定金额，视为借款人、转让人已履行完毕本合同项下的义务。 </p>
				<p>6.4 如果还款日遇到法定假日或公休日，还款日期不进行顺延。</p>
				<p>6.5 若由于银行或第三方支付休假原因或系统问题延迟交易，导致还款延期7日以内，则平台方不承担任何责任。</p>
				<p>6.6 如遇到还款当月无还款日对应日的月份，还款日为应还款当月的最后一日。</p>
				<p>6.7 募集期内（受让人资金被冻结的次日至平台方指令向转让人放款的前一日）受让人不享有任何利息。</p>
				
				
				<div class="chapter">七、提前还款</div>
				<p>7.1 借款人可在借款期间的任何时候通过平台方提前偿还剩余本金及利息。受让人也可在债权转让期间的任何时候通过平台方提前回购剩余债权本金及利息。 </p>
				<p>7.2 若借款人提前偿还全部剩余本金及利息或转让人提前回购全部剩余债权本金及利息，需提前7个工作日以书面形式通知平台方，借款人及转让人委托出借受托人代为处理提前结清的相关事项。因提前还款所产生的所有费用由借款人、转让人和平台方另行约定，与受让人无关。</p>
				<p>7.3不允许借款人提前部分还款。也不允许转让人提前部分回购债权。</p>
				
				<div class="chapter">八、逾期还款</div>
				<p>8.1 每个还款日24:00前，借款人未足额支付当月应还款或转让人未足额回购当月应回购债权的，则视为逾期。</p>
				<p>8.2借款人、转让人逾期且担保人未按约定时间履行代偿责任的，借款人、转让人及担保人尚未清偿的全部剩余本金和收益，自逾期之日在借款利率的基础上上浮20%计收逾期罚息给受让人和0.1%/日的利息计算平台违约金给平台方，直至清偿应付本金、收益和逾期罚息。</p>
				<p>8.3 逾期所产生的收益、逾期罚息不计利息。</p>
				
				
				<div class="chapter">九、担保及服务</div>
				<p>9.1 保证人对受让人受让的债权本金及利息承担无限连带保证责任，同时借款人提供的抵质押物办理了抵质押登记手续。 </p>
				<p>9.2 保证人的保证期间为主合同生效之日起至约定的债务履行期限届满之日起二年。若主合同债务履行期限展期的，保证期间至主合同约定的债务履行期限展期届满之日起二年。</p>
				<p>9.3 本合同保证方式为无限连带责任保证担保，若保证人为多方时，保证人为受让人的上述债权共同承担连带责任保证担保，保证顺序不分先后。</p>
				<p>9.4 借款人未能按照主合同约定按期支付借款利息的或转让人未能按期履行债权回购义务的，由保证人与转让人于主合同所约定的利息到期当日向受让人代偿。借款人未能按照主合同约定按期支付借款本金的或转让人未能按期履行债权回购义务的，由保证人于借款合同所约定的本金到期日后7日内向受让人代偿。</p>
				<p>9.5 除延长主合同约定的借款期限、增加主合同约定的借款金额外，受让人与主合同转让人协商变更主合同的其他内容，无须另行通知保证人，保证人在约定变更后的范围内，承担保证担保责任。</p>
				<p>9.6 保证期间，受让人依法将债权转让给第三人的，保证人与转让人在接到受让人的书面通知后在原保证担保的范围内继续承担保证担保责任。</p>
				
				<div class="chapter">十、争议解决</div>
				<p>10.1 若各方在本合同履行期间发生争议，应友好协商解决；若协商不成，则可提交平台方所在地人民法院进行诉讼。 </p>
				<p>10.2 违约一方或对合同争议承担主要责任的一方，应承担对方因诉讼活动而产生的诉讼费、合理律师代理费、鉴定（检验）费、差旅费、评估费、拍卖费和其他相关费用。</p>
				
				
				<div class="chapter">十一、其它</div>
				<p>11.1 若转让人的相应融资需求在7日内未被满足，则自第七日24:00起，本合同自动终止；或转让人与保证人、履行保证责任将本合同规定全部本金、收益、逾期罚息及其他相关费用全部偿还完毕之时，则本合同亦自动终止;</p>
				<p>11.2 在产品上线前转让人需提前向平台方提交债权转让项目主合同，作为本合同的附件，附件与本合同有同等法律效力。</p>
				<p>11.3 本合同的任何修改、补充均须以平台方平台电子文本形式作出。</p>
				<p>11.4 若本合同中有与国家法律法规相冲突的条款，则该条款以国家相关法律法规为准，其它条款不受影响。</p>
				
				<div>担保人 ：XXXXXXXXXXXXXX</div>
				<div>日期 ：2014-08-07</div>
				<div>平台方 ：中再融 [中再融(北京)科技有限公司]</div>
				<div>日期 ：2014-08-07</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/views/inc/footer.jsp"%>
</body>
</html>
