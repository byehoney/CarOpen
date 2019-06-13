<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>11.11 狂欢盛典</title>
    <meta name="author" content="m.zhongzairong.cn">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/mui.picker.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/mui-picker-plus.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/mui.poppicker.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/activity/ruffian/address.css${verCode}"/>
    <script>
        var basePath = "<%=request.getContextPath()%>";
    </script>
    <script type="text/javascript">
        var pro="";var city="";var dis="";
        var proId="";var cityId="";var disId="";
        var editable=true;//判断输入框是否能够编辑
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

  <body ontouchstart>
    <div class="main">
      <div class="banner">
          <img src="<%=request.getContextPath()%>/resources/image/activity/ruffian/banner.jpg" alt="">
          <p class="activeDay">2017-11-07 至 2017-11-21</p>
      </div>
      <div class="addTitle">
        收货地址
        <span class="modifyAdd">修改地址</span>
      </div>
      <ul class="addInfo">
        <li>
          <input class="userName" type="text" placeholder="请输入收货人姓名" unselectable="on">
        </li>
        <li>
          <input class="userTel" type="number" pattern="[0-9]*" placeholder="请输入手机号码" oninput="if(value.length>11)value=value.slice(0,11)" required="" unselectable="on">
        </li>
        <li>
          <input id="showCityPicker3" class="userAdd" type="text" placeholder="请选择省、市、区" onfocus="this.blur()" readonly="">
        </li>
        <li>
          <input class="addDetail" type="text" placeholder="详细地址（街道楼道门牌号）">
        </li>
      </ul>
      <ul class="newAddBox clearfix">
        <li class="backAct fl">返回活动</li>
        <li class="saveAdd fr">保存地址</li>
      </ul>
      <div class="modifyBox">
        <div class="modifyBack">
          <a>返回活动</a>
        </div>
      </div>
    </div>
     <!-- toast提示 -->
    <div class="err"></div>
    <input type="hidden" id="userId" value="${userId}">
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/fastclick.js"></script>
    <script type="text/javascript">
       FastClick.attach(document.body);//绑定fastclick
    </script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/mui.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/mui.picker.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/mui.poppicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/activity/ruffian/city_data2.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/activity/ruffian/address.js" type="text/javascript"></script>
    <script>
        (function muiFun(mui){
            mui.init();
            mui.ready(function() {
                //          //级联示例
                var cityPicker3 = new mui.PopPicker({
                    layer: 3
                });
                cityPicker3.setData(cityData3);
                var showCityPickerButton = document.getElementById('showCityPicker3');
                var cityResult3 = document.getElementById('cityResult3');
                showCityPickerButton.addEventListener('tap', function(event) {
                    if(!editable){
                        return;
                    }
                    cityPicker3.show(function(items) {
                        console.log(items)
                        proId=items[0].value;
                        cityId=items[1].value;
                        disId=items[2]?items[2].value:"";
                        console.log(proId,cityId,disId);
                        pro=((items[0] || {}).text?(items[0] || {}).text:"");
                        city=((items[1] || {}).text?(items[1] || {}).text:"");
                        dis=((items[2] || {}).text?(items[2] || {}).text:"");
                        showCityPickerButton.value = pro+" "+city+" "+dis;
                        //返回 false 可以阻止选择框的关闭
                        //return false;
                    });
                }, false);
            });
        })(mui)
    </script>
  </body>
</html>
