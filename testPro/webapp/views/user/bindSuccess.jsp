<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>绑定成功 - 中再融</title>
    <%@ include file="/views/inc/inc.jsp"%>
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/wxBind.css" />
    <script type="text/javascript">
        var headerConfig = {
            navType: 0
        };
    </script>
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
    <section class="main-body">
    <div class="body-img"><img src="${basePath}/resources/image/bind_success.png" /></div>
    <p>绑定成功</p>
  </section>
  <section class="button-box">
    <a href="${basePath }/wxBind/toInvestLoan.do">开始投资</a>
  </section>
</body>
</html>