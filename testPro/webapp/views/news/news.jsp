<%@ page contentType="text/html; charset=UTF-8" language="java"
  import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/views/inc/inc.jsp"%>
<style>
.news_tab {
  height: 42px;
}

.news_tab ul li {
  float: left;
  line-height: 40px;
  width:50%;
  text-align: center;
  font-size: 12px;
  background: #fff;
}

.news_tab ul li span {
  display: block;
  margin: 0 10px;
}

.news_tab ul .li_active span {
  color: #00afeb;
  border-bottom: 2px solid #00afeb;
  display: block;
  margin: 0 10px;
}

.news_list {
  margin: 10px 10px 0;
  background: #fff;
  padding: 5px;
  border-radius: 5px;
  display:none;
}

.news_list ul li {
  margin-bottom: 10px;
}


.news_list ul li .nlist_title {
  font-size: 14px;
  line-height: 25px;
  overflow: hidden;
  display: table;
}


.news_list ul li .nlist_title span {
  display: inline-block;
  width: 80px;
  margin-right: 10px;
  padding:5px
} 

.news_list ul li .nlist_title .gs_name{
	vertical-align: middle;
  display: table-cell;
  width:auto;
}
.news_list ul li .nlist_content {
  font-size: 12px;
  color: #919191;
  line-height: 20px;
  padding:5px;
}

.line {
  height: 1px;
  border: none;
  border-top: 1px solid #e9e9e9
}
</style>
</head>
<body>
  <%@ include file="/views/inc/header.jsp"%>
  <div id="content_height">
    <div class="news_tab">
      <ul>
        <li class="li_active"><span>金融机构</span></li>
        <li><span>服务支持</span></li>
      </ul>
    </div>
    <div class="news_content">
    
    
    	
      <div class="news_list" style="display:block">
        <ul>
          <li>
              <div class="nlist_title ">
                <span><img src="../../resources/image/lef.jpg"></span><span class="gs_name">河北利尔福担保有限公司</span>
              </div> 
              <div class="nlist_content">
                河北利尔福担保有限公司（简称“利尔福”），成立于2008年3月13日，注册资本2亿元，注册地址河北省邯郸市滏东大街。经营贷款担保、票据承兑担保、贸易融资担保、项目融资担保、信用证担保；诉讼保全担保、担标担保、预付款担保、工程履约担保、尾付款如约偿付担保等履约担保业务，以及与担保业务有关的融资咨询、财务顾问等中介服务。利尔福成立以来坚持规范管理、规范经营，2011年通过河北省中小企业局担保处的审批，获得其颁布的《融资性担保机构经营许可证》。并先后与中国建设银行邯郸分行、交通银行邯郸分行签订了合作协议，建立了担保合作关系。
              </div>
          </li>
          <hr class="line"> 
          <li>
              <div class="nlist_title">
                <span><img src="../../resources/image/gdzf.jpg"></span><span class="gs_name">广东招峰资产管理有限公司</span>
              </div>
              <div class="nlist_content">
广东招峰资产管理有限公司是一家信用风险评估与管理、小微借款咨询服务与交易促成、项目投融资等业务于一体的综合性服务企业。其注册资本达一亿元人民币，由业内金融精英组成团队。致力于为客户提供多元化、全生命周期的金融服务，统筹公司总部、办事处，提高核心竞争力和可持续发展能力，成为以资产管理为主导、全价值链的领先金融服务公司。
              </div>
            </li>
          <hr class="line"> 

          <li>
              <div class="nlist_title">
                <span><img src="../../resources/image/jxyb.jpg"></span><span class="gs_name">江西银邦融资担保有限公司</span>
              </div>
              <div class="nlist_content">
            江西银邦融资担保有限公司（简称“银邦担保”），由江西省政府金融办获准成立于2015年3月24日，注册资本5000万元。经营融资性担履约担诉讼保全担保业务，与担保有关的融资性咨财务顾问等中介服务业务、以及按规定以自由资金进行投资。
              </div>
            </li>
        </ul>
      </div>
    
     
    
      <div class="news_list">
          <ul>
          
           <li>
              <div class="nlist_title">
                <span><img src="../../resources/image/lyxh.jpg"></span><span class="gs_name">中国再生资源回收利用协会</span>
              </div>
              <div class="nlist_content">
                                                 中国再生资源回收利用协会，是由全国再生资源回收利用企业、社会团体、科研机构自愿组成的国家一级社团组织，隶属于中华全国供销合作总社。协会现有会员500余家，涵盖全国再生资源行业10,000多家企业；办有《再生资源工作通讯》、《再生资源与循环经济》杂志和“中国再生资源回收利用网”三大信息平台；设有10个专门委员会，由国内外业内30多位顶级专家担任专家委员会委员。
              </div>
            </li>
            <hr class="line">
          	<li>
              <div class="nlist_title">
                <span><img src="../../resources/image/cfca.jpg"></span><span class="gs_name">中国金融认证中心</span>
              </div>
              <div class="nlist_content">
                                                  中国金融认证中心（China Financial Certification hority）（简称“CFCA”）于2000年6月29日挂牌成立，是中国人民银行和国家信息安全管理机构批准成立的国家级威的安全认证机构。中再融荣获CFCA安全认证，此举标着中再融的理财服务得到了更全面的认可与保障，用户与中再融、合作机构以及贷款方签署的四方合同，都将得到“国家级”的全面认证，其认证后的电子印章无法被篡改、伪造，为用户投资再添一把“安全锁”。
              </div>
            </li>
            <hr class="line"> 


            <li>
              <div class="nlist_title">
                <span><img src="../../resources/image/tongsuo.jpg"></span><span class="gs_name">北京同硕律师事务所</span>
              </div>
              <div class="nlist_content"> 
                                                    北京市同硕律师事务所是经北京市司法局批准于2001年成立的一家合伙制律师事务所。本所采用业务由合伙人牵头，主办律师具体承办与团队协同论证的服务方式，切实保证客户得到优质的法律服务。自成立以来，本所律师办理了大量有较大社会影响的诉讼（仲裁）案件，担任多家大型企事业单位、公司、政府机关的常年法律顾问，并与国家司法、行政、国资、金融、工商等部门建立了良好的信息联系和沟通渠道。
              </div>
            </li>
                <hr class="line"> 
              <li>
              <div class="nlist_title">
                <span><img src="../../resources/image/hf.jpg"></span><span class="gs_name">汇付天下有限公司</span>
              </div>
              <div class="nlist_content"> 
汇付天下有限公司（简称“汇付天下”）于2006年7月成立，是国内金融支付领域第一品牌。汇付天下是首批获中国人民银行支付许可证和中国证监会基金支付许可的第三方支付公司，总部设于上海，目前在北京、广州、深圳、成都等全国30多个城市设立分公司，总投资额近10亿元。汇付天下定位于金融支付专家，聚焦于网上支付、基金理财、POS收单、移动支付等全方位支付服务，为行业客户提供定制化综合支付解决方案。经过7年的高速发展，汇付天下品牌已渗透至航空、理财、POS收单等众多支付领域，已覆盖超过300家收单服务商、30万商户、5000家票务代理商及200万投资人。中再融使用国内最先进、最严格的汇付天下“P2P平台金融解决方案”，通过设立专属资金托管账户的方式，实现了投资人和借款人的资金与中再融的隔离，有效杜绝了虚假交易、伪造投资人等违规操作的业务风险，让投资人投入的资金难以被非法挪用，使得投资人的资金安全更有保障，同时大大缩短了提现操作的时间。同时，中再融使用了汇付天下的身份认证系统，核实借款人和投资人身份信息，避免发生洗钱等不法行为。
              </div>
            </li>
                <hr class="line"> 
            <li>
              <div class="nlist_title">
                <span><img src="../../resources/image/lxlh.jpg"></span><span class="gs_name">深圳市联合利丰供应链管理有限公司</span>
              </div> 
              <div class="nlist_content">
              深圳市联合利丰供应链管理有限公司位于深圳市福田区深南中路3018号世纪汇广场办公楼16层，注册资本1亿元人民币，是一家专业的一站式供应链管理服务商，为客户提供代理采购、产品营销支持、进出口通关、供应链信息系统应用等一系列全方位的供应链管理服务。联合利丰致力于金融技术、物流技术、供应链风险控制技术、供应链信息技术的研究与创新，坚持"让生意变得更简单"的服务理念，通过不断强化和提升供应链技术与运作能力，为客户提供集商流、物流、资金流、信息流、工作流为一体的供应链外包方案与运营。
              </div>
            </li>
            <hr class="line"> 
            <li>
              <div class="nlist_title">
                <span><img src="../../resources/image/xdgx.jpg"></span><span class="gs_name">邯郸市供销社</span>
              </div>
              <div class="nlist_content">
                                                      邯郸市供销社是全市供销合作社的联合组织，为市政府领导的事业机构，负责制定全市供销合作社的发展战略和规划，指导全市供销合作社的改革与发展，承担着对重要农业生产资料、农副产品以及食盐、烟花爆竹等专营商品的组织、协调、管理的职能。市供销社辖16个县（市）区供销社，14个直属企业。全系统资产总额62亿元，现有5000多个经营网点，234个市县直属企业，207个基层供销社，62家龙头企业，114个工业厂点。
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  <%@ include file="/views/inc/footer.jsp"%>
  <script>
  $('.news_tab ul li').each(function(){
    $(this).click(function(){
      var i=$(this).index();  
      $('.news_tab ul li').each(function(){
        $(this).removeClass('li_active');
      })
      $('.news_content .news_list').each(function(){
        $(this).css('display','none');
      })
      $(this).addClass('li_active');
      $('.news_content .news_list').eq(i).css('display','block');
    })
  })
  </script>
</body>
</html>