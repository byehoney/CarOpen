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
    <script src="<%=request.getContextPath()%>/resources/js/plugins/fastclick.js" type='text/javascript' charset="UTF-8"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/app/helpCenter.css${verCode }">
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
<section class="main">
    <div class="content">
        <ul class="contList clearfix">
            <li class="marginB select">
                <div class="icons aboutIcon"></div>
                <p>关于中再融</p>
            </li>
            <li class="marginB">
                <div class="icons loginIcon"></div>
                <p>注册与登录</p>
            </li>
            <li class="marginB ">
                <div class="icons chargeIcon"></div>
                <p>充值与提现</p>
            </li>
            <li class="marginB ">
                <div class="icons investIcon"></div>
                <p>投资与回款</p>
            </li>
            <li class="marginB ">
                <div class="icons safeIcon"></div>
                <p>账户与安全</p>
            </li>
            <li class="marginB ">
                <div class="icons redIcon"></div>
                <p>红包使用规则</p>
            </li>
            <li >
                <div class="icons broowIcon"></div>
                <p>关于借款业务</p>
            </li>
        </ul>
    </div>
    <h3 class="title">关于中再融</h3>
    <div class="helpBox aboutZzr" >
        <div class="questionArea">
            <ul class="questionList">
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">1.中再融是做什么的？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            中再融（zhongzairong.cn）全称“中再融（北京）科技有限公司”，服务于中国再生资源回收利用协会会员单位。中国再生资源回收利用协会，隶属于中华全国供销合作总社。协会现有会员500余家，涵盖全国再生资源行业10,000多家企业。中再融面向广大有财富增长需求、投资风格稳健、缺乏投资渠道的广大人群，提供安全、有保障、高收益的固定收益互联网理财服务。我们会在官网首页发布项目，展示借款企业借款需求，投资人进行投资后获得利息收益。
                        </p>

                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">2.什么是P2P网络借贷？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            P2P网络借贷平台借助当今的互联网渠道，为有资金理财需求的个人搭建了一个透明、公平的网络借贷交易平台。P2P是 peer-to-peer 或 person-to-person 的简写。借款者可自行发布借款信息，包括金额、利息、还款方式和时间，实现自助式借款;借出者根据借款人发布的信息，自行决定借出金额，实现自助式借贷。平台负责对借款方的信用背景和还款能力进行详细考察。
                        </p>

                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">3.中再融是如何帮我理财的？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            中再融服务于中华全国供销合作总社及中国再生资源回收利用协会，立足于再生资源产业，搭建了连接理财投资者、非银行金融机构、中小企业借款者间的最短桥梁。使投资人能最方便快捷安全地投资固定收益理财产品。用户把自己的闲余资金通过中再融出借给信用良好、由经严格审核非银行金融机构审核并拥有提供担保的中小企业主。在较低的风险下获得了良好的投资回报。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">4.在中再融投资有什么优势？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>中再融的创新型互联网理财服务的优势有以下几个方面：</p>
                        <p><span class="numBox">1、</span><span class="wordBox">国资背景：服务于中华全国供销合作总社及中国再生资源回收利用协会；</span></p>
                        <p><span class="numBox">2、</span><span class="wordBox">高收益：年化收益6.5%-11%，相比传统理财渠道收益更可观；</span></p>
                        <p><span class="numBox">3、</span><span class="wordBox">安全透明：独立的第三方平台，客观中立、数据透明，降低了道德风险；</span></p>
                        <p><span class="numBox">4、</span><span class="wordBox">风控审核：项目审核按三级风控标准执行，并实施异地交叉风控审核；</span></p>
                        <p><span class="numBox">5、</span><span class="wordBox">投资保障：合作方及借款人共同为项目提供投资保障；</span></p>
                        <p><span class="numBox">6、</span><span class="wordBox">技术保障：专业IT团队随时待命，确保资金、个人隐私和信息安全；</span></p>
                        <p><span class="numBox">7、</span><span class="wordBox">第三方资金托管：行业领先的第三方资金托管，平台不碰本金，杜绝资金违规挪用；</span></p>
                        <p><span class="numBox">8、</span><span class="wordBox">投资零费用：充值、投资、提现全免费。</span></p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">5.我在中再融的资金安全吗？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            中再融使用国内最先进、严格的汇付天下“P2P平台金融解决方案”。 委托国内最大的第三方金融支付机构汇付天下对用户账户进行资金管理。实现了投资人和借款人的资金与中再融的隔离，从而有效杜绝了虚假交易、伪造投资人等违规操作的业务风险，让投资人投入的资金难以被非法挪用，使得投资人的资金安全更有保障。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">6.在中再融上投资安全吗？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            中再融服务于中华全国供销合作总社及中国再生资源回收利用协会，是一家国资系的互联网金融平台。在于通过严密的业务流程和制度设计，帮助用户降低风险，增加政府及行业背书相关项目拥有完备的保障措施，确保投资人的利益。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">7.中再融是如何保护用户隐私和资料安全的？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            中再融真正关注用户个人隐私和数据安全，我们采取国际标准的SSL安全加密技术保障数据传输安全。保护用户的隐私和数据安全是我们最重要的责任之一，中再融会严格按照隐私条款保护全部注册用户的信息。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">8.中再融的理财收益如何？有什么门槛？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            中再融提供的理财产品的到期收益率约为 6.5%~11%，高于大多数银行理财产品，数倍于银行定期存款。最低门槛仅为人民币50元，递增金额为50元。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">9.怎样的机构才能入驻中再融？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            中再融负责审核入驻金融机构的资质、监督入驻金融机构的经营是否合法合规。入驻中再融的金融机构必须有一定的规模和成熟的业务能力。目前，中再融的准入门槛是：
                        </p>
                        <p><span class="numBox">1、</span><span class="wordBox">注册资金至少5000万人民币；</span></p>
                        <p><span class="numBox">2、</span><span class="wordBox">有一定的经营时间和业务体系；</span></p>
                        <p><span class="numBox">3、</span><span class="wordBox">业务范围包括：协会成员单位、融资担保公司、小额贷款公司、典当行、资产管理公司、电商平台等；</span></p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">10.中再融的理财产品有合同吗？合同有效吗？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            中再融会为每个理财产品生成一份 PDF 格式的电子合同。电子合同会在项目成立的时候生成，并发放到理财产品各方（理财投资人、借款人、金融机构、中再融）的电子邮箱，您也可以在中再融点击我的账户，在投资记录中随时下载合同。 1999年10月1日起实施的《合同法》第十一条规定: 书面形式合同是指合同书、信件和数据电文（包括电报、电传、传真、电子数据交换和电子邮件）等可以有形地表现所载内容的形式。因此电子合同属于书面形式的合同一种，是受到法律保护的。中再融中的合同文本都由经济法律师起草，确保通过中再融的所有交易都具备法律效力。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">11.中再融平台靠什么盈利？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            中再融坚持落实“普惠金融”理念，以互联网金融助力再生资源产业升级，核心为促进中国绿色经济的发展。中再融收取项目信息服务费保持微利运营。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">12.什么是绿色金融服务中心？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            绿色金融服务中心于2017年12月成立，由中国再生资源回收利用协会发起，联合中再融、中民国信、招商证券、国开证券等金融机构共同成立，中再融作为该中心的运营单位，拟打造一站式绿色金融服务平台，为再生行业中小微企业提供贷款、股权投资、信托、资金撮合、IPO策划与辅导、企业财务顾问等金融服务以及大数据信息服务。绿色金融服务中心定位于再生资源垂直领域，针对再生企业的金融产品与业务发展的问题，有效落实中央提出的普惠金融和精准扶贫的政策，为地方实体企业和个人提供金融需求解决方案，解决融资难、融资慢、融资贵问题。
                        </p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="helpBox loginZzr hide" >
        <div class="questionArea" >
            <ul class="questionList">
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">1.如何开始我在中再融的第一笔投资？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            首先，请注册您的中再融账户。注册过程中，需要您创建第三方支付“汇付天下”的中再融专属账号。同时按照法律规定，需要验证您的一系列个人信息，包括姓名、身份账号、用于提取现金的银行卡号等，接下来请充值。充值完毕，即可开始投资。相关承诺，请参考中再融的隐私保护政策。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">2.使用护照号、军官证号等是否可以认证？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            目前系统只支持第二代中华人民共和国居民身份证进行认证，在中再融进行认证的用户年龄应满18岁。
                        </p>

                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">3.我的姓名中有符号或是英文是否可以认证？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            目前对于身份信息的要求是在公安系统登记且可查询到的。对于姓名中出现的符号，请使用英文半角格式输入。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">4.注册后是否能修改用户名？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>用户完成注册之后，用户名不能修改。用户名将会被用于合同等处，请谨慎选择。</p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">5.设置密码有什么要求吗？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            密码必须包含数字和英文字母（区分大小写），至少6位字符，不超过16位字符。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">6.如何增加密码的安全性？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            请仔细阅读以下常见的安全措施：
                        </p>
                        <p><span class="numBox">1、</span><span class="wordBox">密码要保密，且定期更改；</span></p>
                        <p><span class="numBox">2、</span><span class="wordBox">请使用较长、复杂的字母数字组合以提高密码强度，不要用生日等容易被别人猜中的密码；</span></p>
                        <p><span class="numBox">3、</span><span class="wordBox">如果使用了密码找回功能，请您及时删除我们发送给您的找回密码的邮件；</span></p>
                        <p><span class="numBox">4、</span><span class="wordBox">请记住不要与任何人共享您的密码。如果您已经与他人共享了密码，我们强烈建议您尽快更改；</span></p>
                        <p><span class="numBox">5、</span><span class="wordBox">您可能在不经意间使计算机受到病毒、木马、间谍软件、广告软件的感染，这些软件也可能记录并盗走您的密码！所以，请安装和使用杀毒软件。</span></p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">7.我认证成功后，是否可以更改证件号码？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            不可以，证件号码和中再融用户名是唯一绑定的，会记录在合同中，所以无法更改。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">8.如何更换已经注册的手机号？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p><span class="numBox">1、</span><span class="wordBox">请登录中再融，点击我的账户—个人资料，通过旧手机号码输入验证码修改。</span></p>
                        <p><span class="numBox">2、</span><span class="wordBox">如果旧手机无法收到验证码，请致电客服4001-156-157，验证身份后通过电话修改。</span></p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">9.我忘了用户名怎么办？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            为了账户安全，请您用中再融账户注册的手机拨打客服电话找回用户名。如有需要，客服人员会与您核对相关信息。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">10.为什么会登录失败？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            请您核对以下几点，这些可能是导致您登录失败的原因：
                        </p>
                        <p><span class="numBox">1、</span><span class="wordBox">请您确认输入的用户名是否正确。</span></p>
                        <p><span class="numBox">2、</span><span class="wordBox">请您确认输入的密码是否正确。如果忘记密码，您可以点击右侧【忘记密码】重新设置。</span></p>
                        <p><span class="numBox">3、</span><span class="wordBox">请您确认输入的验证码是否正确。如果看不清楚，可以点击【换一张】重新获取。</span></p>
                        <p><span class="numBox">4、</span><span class="wordBox">网络问题也会造成登录失败，如果提示网页有错误，建议您稍后尝试。</span></p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="helpBox chargeDiv hide" >
        <div class="questionArea">
            <ul class="questionList">
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">1.为什么充值时开户不成功？应该如何解决？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            根据汇付天下的反馈，验证不成功，通常有三种情况：
                        </p>
                        <p><span class="numBox">1、</span><span class="wordBox">更改过姓名；</span></p>
                        <p><span class="numBox">2、</span><span class="wordBox">更改过户籍所在地； </span></p>
                        <p><span class="numBox">3、</span><span class="wordBox">现役军人。</span></p>
                        <p>解决办法： </p>
                        <p><span class="numBox">1、</span><span class="wordBox">如果是前两种情况，建议您可以到派出所进行“网络身份信息”查询、更改；或者使用亲友身份证及银行卡进行注册、开户；</span></p>
                        <p><span class="numBox">2、</span><span class="wordBox">如果您是现役军人、或者仅有护照号，则无法完成开户，建议您使用亲友身份证及银行卡进行注册、开户。</span></p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl longeWith">2.为什么网上银行充值成功，但是中再融帐号里面的余额却没有增加？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            由于在同一时间使用同一个第三方充值账户端口充值的人可能非常多，在某些时候会造成网银显示与中再融账号金额不同步的情况。如果遇到这种情况请您将网银付款成功的页面截图，然后刷新中再融账号页面。如果刷新未能解决问题，请您致电客服4001-156-157，客服会协助您处理问题。
                        </p>

                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">3.可以用信用卡进行充值吗？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            中再融严禁信用卡充值、套现等行为，一经发现将予以处罚，包括但不限于：限制收款、冻结账户、永久停止服务，并会影响银行征信记录。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">4.为什么无法使用网上银行充值？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>因为受银行系统兼容性的限制，某些银行的充值只能在 Windows 操作系统上进行，建议使用特定版本的IE浏览器（一般是IE6以上、IE10以下）尝试一下。同时，请留意银行网上银行页面的提示，如确定充值数额是否超过银行卡的转账额度限制等。</p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">5.我如何提现？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            您可以通过“我的账户“页面上的“提现”按钮进行提现。首次提现时，网站会提示您绑定银行卡（详见下一个问题）。如果您已经绑定了银行卡，则只需输入要提现的金额即可完成提现请求。由系统即时审核，一般第二个工作日到账。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl longeWith">6.什么是绑定银行卡？我什么时候需要绑定银行卡？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            绑定银行卡是指在“中再融”上保存您的银行卡信息，方便您之后提现操作。在第一次提现之前需要绑定一张银行卡，绑定银行卡的操作非常简单，您只需提供您的银行卡号、开户银行及开户支行（可根据支行地址的关键字模糊查询）。请注意，您绑定的银行卡的持卡人需与您之前认证的姓名、身份证信息相符，否则将不能进行银行卡绑定。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl longeWith">7.为什么在汇付绑定银行卡时长时间显示验证中或绑定失败？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            出现此现象的原因可能有以下几种：
                        </p>
                        <p><span class="numBox">1、</span><span class="wordBox">中再融账号未通过实名认证； </span></p>
                        <p><span class="numBox">2、</span><span class="wordBox">银行开户行信息错误；</span></p>
                        <p><span class="numBox">3、</span><span class="wordBox">银行预留信息与汇付天下开户信息不一致。例如：（姓名、身份证号、手机号）；</span></p>
                        <p><span class="numBox">4、</span><span class="wordBox">银行卡账户冻结或正在办理挂失；</span></p>
                        <p><span class="numBox">5、</span><span class="wordBox">您的姓名中有生僻字，需要联系中再融客服，提供相关信息后交给汇付天下手动绑定银行卡。</span></p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">8.充值和提现需要费用吗？提现需要多久到账？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            对于中再融的理财投资人，充值（将理财本金汇入中再融账户）手续费由中再融垫付，因此充值免费；提现（将理财本金和收益汇出到银行卡）手续费同样由中再融垫付，投资人提现是免费的，但是每日仅可提现1次。用户发起、并在平台审核之后，可在T+1即第二个工作日(节假日顺延)到达用户指定银行卡账户。
                        </p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="helpBox investDiv hide">
        <div class="questionArea">
            <ul class="questionList">
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">1.请问我如何进行投资？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            您可以先浏览网站展示的项目，了解项目信息，如果比较感兴趣，请您在“首页”进行注册，点击“充值”后开通汇付天下的账户并且充值，在项目上线“正在募集”时，您点击进入项目详情，输入投资金额，即可参与投资。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">2.借款企业会提前还款吗？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            借款人可在借款期间的任何时候通过平台方提前偿还剩余本金。若借款人提前偿还全部剩余本金，借款人及出借人委托平台方代为处理提前结清的相关事项，并且借款人应向出借人支付提前还款违约金，违约金的数额根据项目的合同签订的内容而定。
                        </p>

                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">3.如何获得投资收益？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            投资到期时，本金和利息收入将会自动记入投资者的账户，可以随时再投资或者支取。根据投资产品还款方式的不同（等额本息、按月付息等等），投资收益按不同方式还给投资人，请留意短信和电子邮件提醒。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">4.收到还款以后，可以马上再投资吗？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>可以，而且我们建议投资人在收到还款后及时地进行再次投资，确保收益的最大化。</p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">5.我是否可以取消某笔投资？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            为了保护所有投资人和借款人的利益，在投资项目的招标期内，已投资的资金将会被冻结，不允许取消。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">6.募集方式是怎样的？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            中再融项目每日23点系统将会根据当日已募集实际金额自动成立项目，成功募集资金将于次日开始计息。未足额募集部分于次日0点自动生成下一期募集项目，待上线后继续募集。 例如：2016年8月31日上线总融资额为100万的项目，如截至2016年8月31日23点已募集70万，系统将于2016年8月31日23点修改当前项目状态为募集成功，并自动成立且于次日开始计息。募集未足额部分30万则自动生成新项目待次日募集。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">7.投资金额有限制吗？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            为了更好的贯彻“普惠金融”理念，进一步降低投资门槛，中再融项目起投金额定为50元，以50元为一个单位。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">8.利息从何时起开始计算？何时取得本息？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            利息从项目标注的“起息日”开始计算，即项目款项划转给借款人之后开始计息。不同项目类型有不同的还款方式，比如“按天计息，按月付息，到期还本”、“等额本息”、“到期一次性还本付息”的还款方式。项目成立后，投资人将按照“还款计划”收到回款利息和本金。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">9.投资后有什么证明或合同吗？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            中再融会为每个项目生成一份PDF格式的电子合同，该合同是由中国金融认证中心CFCA权威认证的电子合同，具有法律效力。
                            投资后，当项目募集成功，在项目状态变成“正在回款”时，合同生成。在“我的账户——投资记录——查看”中可以下载查看。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">10.中再融项目的收益怎么样？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            不同项目，期限不同，收益是不一样的。根据项目期限的长短，预期年化收益率在6.5%—11%之间。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">11.请问在中再融投资会收取哪些费用？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            中再融的投资人在充值、投资、回款、提现等过程是没有费用的，也没有利息管理费等杂费。相关所有费用目前均由中再融垫付，让投资人真正享受投资理财“零费用”。
                        </p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="helpBox safeDiv hide">
        <div class="questionArea">
            <ul class="questionList">
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">1.什么是账户交易密码？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            账户交易密码是您投资和提现时需要输入的密码。您注册之后，进入“我的账户”-“我的主页”-“汇付天下账户”-“点击开户”，即可设置账户交易密码。 账户交易密码是不同于登录密码的资金安全保护机制，是特别用来保护您的资金安全的交易密码。即使您的账户登录密码处于异常状态，有账户交易密码保护就可以确保您的账户资金不被他人挪用。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">2.我忘记了账户交易密码怎么办？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            登录“我的账户”-“汇付天下账户”-“汇付登录”-“设置”-“找回交易密码”中，根据绑定的手机号码，找回交易密码。
                        </p>

                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">3.账户交易密码被锁定，如何解锁？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            如果您多次输错密码，账户会被暂时锁定，一般在当日24点后会自动解锁。如果您需要立即解锁可以通过“我的账户”-登录“汇付天下账户”-“密码找回”的方式重新设定新的密码，设定成功后，密码会立即解锁。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">4.为什么要进行实名认证？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>实名认证的目的是为了确认投资人的身份以及保证投资借款合同的有效性与合法性。同时我们也会通过实名认证验证您设置的提现银行账户是否属于您本人。为了确保您的资金安全，您需要在首次投资前进行实名认证。实名认证仅需您输入您的身份证号及姓名，全过程仅需10秒钟，非常简单。 中再融对于所有用户资料将严格保密。</p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">5.为什么要进行手机验证？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            通过手机认证，用户可以提高账户的安全级别，及时得到在中再融进行操作和资金变化的信息，随时掌控账户动态。 中再融对于所有用户资料将严格保密。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">6.如何解绑银行卡？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>

                            如果您的银行卡已经注销不使用、想更换其他银行卡或因银行支付问题导致不支持绑定的银行卡需要进行解绑，您需要登录汇付天下官网进行操作解绑，登录账户后，点击“网贷账户查询”-“我的银行卡-快捷银行卡”，操作解绑即可。
                        </p>
                        <p>注： </p>
                        <p><span class="numBox">1、</span><span class="wordBox">如您在登录汇付账户时提示密码错误，请您点击“忘记密码”找回“登录密码”再进行登录。</span></p>
                        <p><span class="numBox">2、</span><span class="wordBox">如您在汇付账户已经解绑银行卡，但中再融账户依旧显示银行卡，请您致电客服热线 4001-156-157，客服会协助您处理。</span></p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">7.如何注销中再融账户？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            您好，注销账户请您使用pc端登录中再融官网，将页面拉至最底部，选择“帮助中心”板块 — “账户与安全”里面查看注销流程（该功能仅对注册未投资用户开放）。
                        </p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="helpBox redDiv hide">
        <div class="questionArea">
            <ul class="questionList">
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">1.新手红包使用规则？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            新手红包是新手注册成功后，获得的999元红包大礼，具体使用条件如下：
                        </p>
                        <table>
                            <tr>
                                <th>红包金额</th>
                                <th>项目期限</th>
                                <th>投资金额</th>
                            </tr>
                            <tr>
                                <td>19元红包</td>
                                <td>任意期限</td>
                                <td>2000</td>
                            </tr>
                            <tr>
                                <td>50元红包</td>
                                <td>≥50天项目</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>250元红包</td>
                                <td>≥50天项目</td>
                                <td>50000</td>
                            </tr>
                            <tr>
                                <td>30元红包</td>
                                <td>≥80天项目</td>
                                <td>2000</td>
                            </tr>
                            <tr>
                                <td>100元红包</td>
                                <td>≥80天项目</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>550元红包</td>
                                <td>≥80天项目</td>
                                <td>50000</td>
                            </tr>
                        </table>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">2.现金红包如何使用?</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            现金红包是需要您在账户中进行兑换，兑换成功后操作提现即可。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">3.返现红包如何使用?</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            返现红包是平台活动福利的其中一种形式，例如新手红包大礼，属于投资返现红包，需要您在投资时勾选相对应的红包，待您投资成功后勾选的红包会返还到您账户中，您操作提现即可。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">4.加息券如何使用?</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            加息券是您在投资时需要进行勾选，待投资成功后投资项目进行加息。
                        </p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="helpBox aboutBroow hide">
        <div class="questionArea">
            <ul class="questionList">
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">1.借款年化利率是多少？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            非固定费率，需根据借款人的借款金额、期限以及借款人的资信情况等确定。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">2.借款服务费如何收取的？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            非固定费率，具体标准需根据借款人的借款金额、期限来确定。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">3.借款要求什么材料？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            包括但不限于身份证、户口本、房产证、车辆登记证书、营业执照等，<br/>
                            注：具体情况您可以登录中再融官网-点击“我要借款”，选择“微信提交借款申请”或者“网页提交借款申请”，以对接人发送邮件中的材料清单为准。https://www.zhongzairong.cn/crra/toLoanTopicPage.shtml
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">4.起息日期、还款日？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            自借款金额实际到账日开始计息，固定还款日为每月10日或21日。
                        </p>
                    </div>
                </li>
                <li>
                    <div class="questionDiv clearfix">
                        <p class="fl">5.贷款的金额多久筹集完毕？</p>
                        <i class="arrow fr"></i>
                    </div>
                    <div class="contentDiv" style="display: none">
                        <p>
                            借款申请通过审核后，金额将会在借款项目募满后T+1个工作日到账，审核时间长短受提交的申请材料完备程度影响。
                        </p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</section>
<script>
    $(function () {
        FastClick.attach(document.body);//绑定fastclick
        $('.contList li').on('click',function () {
            var index=$(this).index(),txt=$(this).find('p').text();
            $(this).addClass('select').siblings().removeClass('select');
            $('.helpBox').eq(index).removeClass('hide').siblings('.helpBox').addClass('hide');
            $('.title').text(txt);
            $('.questionList li').find('.arrow ').removeClass('arrowDown');
            $('.questionList li').find('.contentDiv').hide();
        })
        $('.questionList li').click(function () {
            if(!$(this).find('.arrow ').hasClass('arrowDown')){
                $(this).find('.arrow ').addClass('arrowDown');
                $(this).siblings().find('.arrow').removeClass('arrowDown');
                $(this).find('.contentDiv').show();
                $(this).siblings().find('.contentDiv').hide();
            }else {
                $(this).find('.arrow ').removeClass('arrowDown');
                $(this).find('.contentDiv').hide();
            }
        })
    })
</script>
</body>
</html>
