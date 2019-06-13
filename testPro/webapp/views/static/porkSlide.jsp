<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册中再融</title> 
<%@ include file="/views/inc/inc.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${basePath}/resources/css/present/porkSlide.css">
</head>
<body>
	<%@ include file="/views/inc/header.jsp"%>
	<section class="main">
        <div class="firstBox">
            <div class="contBox">
                <img class="aniImg" src="${basePath}/resources/image/static/present/pork_banner_t.png"/>
                <div class="childBack"><img src="${basePath}/resources/image/static/present/child_back.png"/></div>
                <div class="ctrlBox tc">
                    <div class="phoneBox">
                        <p class="phoneTip tl clearfx" id="mobileWrong">
                            <i class="wrongIcon back fl"></i>
                            <span class="wrongText fl"></span>
                        </p>
                        <p class="phoneLine clearfx">
                            <i class="phoneIcon back fl"></i>
                            <input id="phone" class="fl phoneInp" type="text" placeholder="请输入手机号" maxlength="11" />
                        </p>
                    </div>
                    <img class="regBtn gift" alt="" title="" src="${basePath}/resources/image/static/present/regBtn.png" />
                    <i class="back arrow"></i>
                    <p class="tc smallLine">平台提醒：投资有风险 &nbsp;本项目非保本产品 &nbsp;不保证收益</p>
                    <p class="textLine tc">中再融不会在任何情况下泄露您的手机号码</p>
                </div>
            </div>      
        </div>
        <div class="secendBox">
            <div class="textTip tc">
                <div class="dotCir">
                    <div class="solCir"></div>
                </div>
                <div class="textBox">
                    <p>最高12%年化收益率</p>
                    <p>约4倍余额宝同期收益</p>
                </div>
            </div>
            <div class="elephant"><img alt="" title="" src="${basePath}/resources/image/static/present/ele.png" /></div>
        </div>

        <div class="thirdBox">
            <div class="tBox">
                <div class="textBox tc">
                    <p>我们是中国再生资源回收利用协会</p>
                    <p class="marB10">副会长单位</p>
                    <p>我们与汇付天下合作进行资金托管</p>
                    <p>保证资金安全</p>
                </div>
            </div>
            <img class="buildImg" alt="" title="" src="${basePath}/resources/image/static/present/pictures_ioc.png" />
            <div class="bBox">
                <img class="regBtn" id="toTop" alt="" title="" src="${basePath}/resources/image/static/present/regBtn.png" />
                <p class="tc smallLine" style="padding-top:.1rem">平台提醒：投资有风险 &nbsp;本项目非保本产品 &nbsp;不保证收益</p>
            </div>
            
        </div>
    </section>
	<%@ include file="/views/inc/footer.jsp"%>
	<script type="text/javascript"
		src="${basePath}/resources/js/common/jquery.md5.js"></script>
	<script type="text/javascript" 
		src="${basePath}/resources/js/present/porkSlide.js"></script>	
</body>
</html>
