<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>还款日历 - 中再融</title>
    <%@ include file="/views/inc/inc.jsp"%>
    <script src="${basePath}/resources/js/plugins/calendar.js?v=2015115"></script>
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/plugins/calendar.css?v=20151105" />
    <link type="text/css" rel="stylesheet" href="${basePath}/resources/css/myAccount.huiKuanCalendar.css?v=20151105" />
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
    <section class="calendar-box"></section>
    <section class="total-count">
        <dl>
            <dt><span class="muted">本月还款总额</span><span class="number" data-selector="totalAmount"></span></dt>
            <dd>
                <p><span class="muted">已收</span><span class="number" data-selector="totalHasAmount"></span></p>
                <p><span class="muted">待收</span><span class="number" data-selector="totalTobeAmount"></span></p>
            </dd>
        </dl>
    </section>
    <section class="search-result" data-selector="searchResult">
        <dl></dl>
    </section>
<%@ include file="/views/inc/footer.jsp"%>
<script src="${basePath}/resources/js/myAccount.huiKuanCalendar.js?v=20151105"></script>
</body>
</html>