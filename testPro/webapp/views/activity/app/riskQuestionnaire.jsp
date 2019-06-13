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
    <title>出借人风险测评</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/fastclick.js" type='text/javascript' charset="UTF-8"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/app/riskRate.css${verCode }">
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
    <div class="riskBox" style="display: none">
        <div class="askBox">
            <p class="ask">1. 您的年龄是？</p>
            <p class="askPro"><span>1</span>/10 题</p>
        </div>
        <ul class="qBox">
            <li>
                <p class="order fl">A.</p>
                <p class="qText fl">0-20岁</p>
                <p class="qCheck fr"></p>
            </li>
            <li>
                <p class="order fl">B.</p>
                <p class="qText fl">21-30岁</p>
                <p class="qCheck fr"></p>
            </li>
            <li>
                <p class="order fl">C.</p>
                <p class="qText fl">31-40岁</p>
                <p class="qCheck fr"></p>
            </li>
            <li>
                <p class="order fl">D.</p>
                <p class="qText fl">41-50岁</p>
                <p class="qCheck fr"></p>
            </li>
            <li>
                <p class="order fl">E.</p>
                <p class="qText fl">51-60岁</p>
                <p class="qCheck fr"></p>
            </li>
            <li>
                <p class="order fl">F.</p>
                <p class="qText fl">60岁以上</p>
                <p class="qCheck  fr"></p>
            </li>
        </ul>
        <p class="company">中再融(北京)科技有限公司</p>
    </div>
    <div class="riskBox" style="display: none">
        <div class="askBox">
            <p class="ask">2. 您的年收入水平在？</p>
            <p class="askPro"><span>2</span>/10 题</p>
        </div>
        <ul class="qBox">
            <li>
                <p class="order fl">A</p>
                <p class="qText fl">0-5万</p>
                <p class="qCheck fr"></p>
            </li>
            <li>
                <p class="order fl">B</p>
                <p class="qText fl">5-10万</p>
                <p class="qCheck fr"></p>
            </li>
            <li>
                <p class="order fl">C</p>
                <p class="qText fl">15-20万</p>
                <p class="qCheck fr"></p>
            </li>
            <li>
                <p class="order fl">D</p>
                <p class="qText fl">20-50万</p>
                <p class="qCheck fr"></p>
            </li>
            <li>
                <p class="order fl">E</p>
                <p class="qText fl">50万以上</p>
                <p class="qCheck fr"></p>
            </li>
        </ul>
        <div class="btnBox">
            <div class="preBtn">上一题</div>
        </div>
    </div>
    <div class="riskBox" style="display: none">
        <div class="askBox">
            <p class="ask">3. 您的最高学历是？</p>
            <p class="askPro"><span>3</span>/10 题</p>
        </div>
        <ul class="qBox">
            <li>
                <p class="order fl">A</p>
                <p class="qText fl">初中及以下</p>
                <p class="qCheck fr"></p>
            </li>
            <li>
                <p class="order fl">B</p>
                <p class="qText fl">高中/中专</p>
                <p class="qCheck fr"></p>
            </li>
            <li>
                <p class="order fl">C</p>
                <p class="qText fl">大专</p>
                <p class="qCheck fr"></p>
            </li>
            <li>
                <p class="order fl">D</p>
                <p class="qText fl">本科</p>
                <p class="qCheck fr"></p>
            </li>
            <li>
                <p class="order fl">E</p>
                <p class="qText fl">研究生及以上</p>
                <p class="qCheck fr"></p>
            </li>
        </ul>
        <div class="btnBox">
            <div class="preBtn">上一题</div>
        </div>
    </div>
    <div class="riskBox" style="display: none">
        <div class="askBox">
            <p class="ask">4. 您当前的投资资金占您总资产的比例是？</p>
            <p class="askPro"><span>4</span>/10 题</p>
        </div>
        <ul class="qBox">
            <li>
                <p class="order fl">A</p>
                <p class="qText fl">0-20%</p>
                <p class="qCheck fr" data-score="1"></p>
            </li>
            <li>
                <p class="order fl">B</p>
                <p class="qText fl">20-50%</p>
                <p class="qCheck fr" data-score="2"></p>
            </li>
            <li>
                <p class="order fl">C</p>
                <p class="qText fl">50-70%</p>
                <p class="qCheck fr" data-score="3"></p>
            </li>
            <li>
                <p class="order fl">D</p>
                <p class="qText fl">70%以上</p>
                <p class="qCheck fr" data-score="4"></p>
            </li>
        </ul>
        <div class="btnBox">
            <div class="preBtn">上一题</div>
        </div>
    </div>
    <div class="riskBox" style="display: none">
        <div class="askBox">
            <p class="ask">5. 您当前投资理财资金的主要来源是？</p>
            <p class="askPro"><span>5</span>/10 题</p>
        </div>
        <ul class="qBox">
            <li>
                <p class="order fl">A</p>
                <p class="qText fl">存款</p>
                <p class="qCheck fr" data-score="1"></p>
            </li>
            <li>
                <p class="order fl">B</p>
                <p class="qText fl">固定收入</p>
                <p class="qCheck fr" data-score="2"></p>
            </li>
            <li>
                <p class="order fl">C</p>
                <p class="qText fl">其他</p>
                <p class="qCheck fr" data-score="3"></p>
            </li>
        </ul>
        <div class="btnBox">
            <div class="preBtn">上一题</div>
        </div>
    </div>
    <div class="riskBox" style="display: none">
        <div class="askBox">
            <p class="ask">6. 您投资理财的方式包含？</p>
            <p class="askPro"><span>6</span>/10 题</p>
        </div>
        <ul class="qBox">
            <li>
                <p class="order fl">A</p>
                <p class="qText fl">银行理财</p>
                <p class="qCheck fr" data-score="1"></p>
            </li>
            <li>
                <p class="order fl">B</p>
                <p class="qText fl">余额宝/理财通等</p>
                <p class="qCheck fr" data-score="2"></p>
            </li>
            <li>
                <p class="order fl">C</p>
                <p class="qText fl">保险</p>
                <p class="qCheck fr" data-score="3"></p>
            </li>
            <li>
                <p class="order fl">D</p>
                <p class="qText fl">网贷平台</p>
                <p class="qCheck fr" data-score="4"></p>
            </li>
            <li>
                <p class="order fl">E</p>
                <p class="qText fl">股票/期货/贵金属</p>
                <p class="qCheck fr" data-score="5"></p>
            </li>
            <li>
                <p class="order fl">F</p>
                <p class="qText fl">基金/信托等</p>
                <p class="qCheck fr" data-score="6"></p>
            </li>
        </ul>
        <div class="btnBox">
            <div class="preBtn">上一题</div>
        </div>
    </div>
    <div class="riskBox" style="display: none">
        <div class="askBox">
            <p class="ask">7. 您在投资理财时最关注的事情是？</p>
            <p class="askPro"><span>7</span>/10 题</p>
        </div>
        <ul class="qBox">
            <li>
                <p class="order fl">A</p>
                <p class="qText fl">资金安全</p>
                <p class="qCheck fr" data-score="1"></p>
            </li>
            <li>
                <p class="order fl">B</p>
                <p class="qText fl">收益保障</p>
                <p class="qCheck fr" data-score="2"></p>
            </li>
            <li>
                <p class="order fl">C</p>
                <p class="qText fl">理财产品期限</p>
                <p class="qCheck fr" data-score="3"></p>
            </li>
            <li>
                <p class="order fl">D</p>
                <p class="qText fl">理财产品详情</p>
                <p class="qCheck fr" data-score="4"></p>
            </li>
            <li>
                <p class="order fl">E</p>
                <p class="qText fl">风险担保机制</p>
                <p class="qCheck fr" data-score="5"></p>
            </li>
            <li>
                <p class="order fl">F</p>
                <p class="qText fl">红包/抽奖等活动奖励</p>
                <p class="qCheck fr" data-score="6"></p>
            </li>
        </ul>
        <div class="btnBox">
            <div class="preBtn">上一题</div>
        </div>
    </div>
    <div class="riskBox" style="display: none">
        <div class="askBox">
            <p class="ask">8. 在网贷投资中，您更愿意接受的投资期限是多久？</p>
            <p class="askPro"><span>8</span>/10 题</p>
        </div>
        <ul class="qBox">
            <li>
                <p class="order fl">A</p>
                <p class="qText fl">30天以内</p>
                <p class="qCheck fr" data-score="1"></p>
            </li>
            <li>
                <p class="order fl">B</p>
                <p class="qText fl">1个月-3个月</p>
                <p class="qCheck fr" data-score="2"></p>
            </li>
            <li>
                <p class="order fl">C</p>
                <p class="qText fl">4个月-6个月</p>
                <p class="qCheck fr" data-score="3"></p>
            </li>
            <li>
                <p class="order fl">D</p>
                <p class="qText fl">7个月-12个月</p>
                <p class="qCheck fr" data-score="4"></p>
            </li>
            <li>
                <p class="order fl">E</p>
                <p class="qText fl">一年以上</p>
                <p class="qCheck fr" data-score="5"></p>
            </li>
        </ul>
        <div class="btnBox">
            <div class="preBtn">上一题</div>
        </div>
    </div>
    <div class="riskBox" style="display: none">
        <div class="askBox">
            <p class="ask">9. 您在投资基金、股票、外汇、P2P等风险理财产品方面的经验有多长时间？</p>
            <p class="askPro"><span>9</span>/10 题</p>
        </div>
        <ul class="qBox">
            <li>
                <p class="order fl">A</p>
                <p class="qText fl">没有经验</p>
                <p class="qCheck fr" data-score="1"></p>
            </li>
            <li>
                <p class="order fl">B</p>
                <p class="qText fl">2年以内</p>
                <p class="qCheck fr" data-score="2"></p>
            </li>
            <li>
                <p class="order fl">C</p>
                <p class="qText fl">2-5年</p>
                <p class="qCheck fr" data-score="3"></p>
            </li>
            <li>
                <p class="order fl">D</p>
                <p class="qText fl">5年以上</p>
                <p class="qCheck fr" data-score="4"></p>
            </li>
        </ul>
        <div class="btnBox">
            <div class="preBtn">上一题</div>
        </div>
    </div>
    <div class="riskBox" style="display: none">
        <div class="askBox">
            <p class="ask">10. 您进行投资的目的是？</p>
            <p class="askPro"><span>10</span>/10 题</p>
        </div>
        <ul class="qBox">
            <li>
                <p class="order fl">A</p>
                <p class="qText fl">资产保值，希望本金没有任何风险</p>
                <p class="qCheck fr" data-score="1"></p>
            </li>
            <li>
                <p class="order fl">B</p>
                <p class="qText fl">资产保值，获得一些收益，能够承受低风险</p>
                <p class="qCheck fr" data-score="2"></p>
            </li>
            <li>
                <p class="order fl">C</p>
                <p class="qText fl">希望资产增值，获得一些收益，能够承受一定投资风险</p>
                <p class="qCheck fr" data-score="3"></p>
            </li>
            <li>
                <p class="order fl">D</p>
                <p class="qText fl">希望资产增值，获得较高收益，能够接受较大的投资风险</p>
                <p class="qCheck fr" data-score="4"></p>
            </li>
        </ul>
        <div class="btnBox">
            <div class="sendBtn subBtn">提交</div>
            <div class="preBtn">上一题</div>
        </div>
    </div>

    <div class="resultBox">
        <div class="typeBox">
            保守型，踏实理财拒绝高风险
        </div>
        <div class="textBox">
            <p>您是一位偏向保守型的投资者。</p>
            <p>理财过程中，您会更多关注项目的安全性，谨慎进行投资。</p>
        </div>
        <div class="tipBox">
            <h2 class="title"><span></span>小贴士</h2>
            <p class="tipCon">
                建议您多考虑期限在6个月内的短期项目，多尝试投资不同类型的产品，积累更多的投资经验，在资本安全的前提下可以获得多一些的收益。
            </p>
        </div>
        <div class="btnBox">
            <div class="goInvest">去投资</div>
            <div class="reRate">重新测评</div>
        </div>
    </div>
    <div class="resultBox">
        <div class="typeBox">
            稳健型，日积月累让财富持续增长
        </div>
        <div class="textBox">
            <p>您是一位稳健型投资者，在进行投资时，您会综合考虑项目的收益和安全因素，希望在安全的基础上获得一定程度的收益。</p>
        </div>
        <div class="tipBox">
            <h2 class="title"><span></span>小贴士</h2>
            <p class="tipCon">
                建议您多考虑期限在3-6个月的中短期项目，让理财资金分散投资于不同类型的理财产品，选择安全且收益较高的项目，养成每月投资的好习惯，让财富稳健增长吧！
            </p>
        </div>
        <div class="btnBox">
            <div class="goInvest">去投资</div>
            <div class="reRate">重新测评</div>
        </div>
    </div>
    <div class="resultBox">
        <div class="typeBox">
            成熟型，见多识广生财有道
        </div>
        <div class="textBox">
            <p>您是一位成熟型投资者，在进行投资时，您有一定的风险承受能力，有较强的财富增值意愿，希望获得较高的收益。</p>
        </div>
        <div class="tipBox">
            <h2 class="title"><span></span>小贴士</h2>
            <p class="tipCon">
                建议您多考虑期限在6-12个月固定期限的项目，项目期限越长，获得收益也随之越高。另外，定期投资也是财富能够持续增长的重要习惯，给自己定个目标，每月投资固定金额，资产翻倍不再难。
            </p>
        </div>
        <div class="btnBox">
            <div class="goInvest">去投资</div>
            <div class="reRate">重新测评</div>
        </div>
    </div>
</section>
<!-- toast提示 -->
<div class="err"></div>
<input type="hidden" value="${userId}" id="userId">
<input type="hidden" value="${riskType}" id="riskType">
<script>
    FastClick.attach(document.body);//绑定fastclick
</script>
<script src="<%=request.getContextPath()%>/resources/js/activity/app/riskRate.js"></script>
<script>
    function onRiskResultForApp(){
        // 修改页面
        $(".goInvest").off().on("click",function(){
            succeedEvaluating()
        });
    }
    // 评测成功进入投资页面（去投资按钮）
    function succeedEvaluating(){
        anniversary.succeedEvaluating();
    }
</script>
</body>
</html>

