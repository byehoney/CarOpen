<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>媒体报道详情 - 中再融</title>
<meta name="keywords" content="">
<meta name="description" content="">
<%@ include file="/views/inc/inc.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/details.css">
</head> 
<body style="background:#f6f6f6;">
   <%@ include file="/views/inc/header.jsp"%>
   <div class="wp_mediadetail">
      <h2 class="title">${result.data.userNotice.title}</h2> 
      <div class="timer"><fmt:formatDate value="${result.data.userNotice.createTime}" pattern="yyyy年MM月dd日"/></div>
      <div class="conter">
      ${result.data.userNotice.content}
      </div>
   </div>
   <%@ include file="/views/inc/footer.jsp"%>
</body>
</html>
