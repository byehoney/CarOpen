<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>媒体报道 - 中再融</title>
<meta name="keywords" content="">
<meta name="description" content="">
<%@ include file="/views/inc/inc.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/details.css">
</head>
<body>
<%@ include file="/views/inc/header.jsp"%>
   <div class="wp_newmedia">
      <div class="title">媒体报道</div>
      <c:forEach items="${result.data.newsList}" var="news">
      <div class="mediabox" url="${basePath}/news/detail/${news.id}.do">
         <p class="text">${news.title}</p>
         <p class="data">
            <fmt:formatDate value="${news.createTime}" pattern="yyyy年MM月dd日"/>
         </p>
      </div> 
      </c:forEach>
   </div>
   <div id="more_list">
      <div id="more">查看更多</div>
   </div>
   <%@ include file="/views/inc/footer.jsp"%>
<script type="text/javascript">
$(function(){
   var page = 1;
   $('#more_list').click(function(){
      page++;
        $.ajax({
            type: 'POST',
            url: environment.basePath + "/news/getNewsByPage.do",
            data: {"page":page},
            beforeSend: function(){
                $('#more').hide();
                $('#more_list').addClass('more_jz');
            },
            success: function(json) {
                if(json.code < 0){
                    $("#more").html("没有更多数据了");
                }else{
                    var list = json.data.newsList;
                    if(list.length == 0){
                        $("#more").html("没有更多数据了");
                    }else{
                        for (var i = 0; i < list.length; i++) {
                            var news = list[i];
                            var htmlStr = '';
                            htmlStr += '<div class="mediabox" url="${basePath}/news/detail/'+news.id+'.do">';
                            htmlStr += '<p class="text">'+news.title+'</p>';
                            htmlStr += '<p class="data">'+new Date(news.createTime).Format("yyyy年MM月dd日")+'</p></div>';
                            $('.wp_newmedia').append(htmlStr);
                        }
                    }
                }
            },
            complete:function(){
                $('#more').show();
                $('#more_list').removeClass('more_jz');
                $('.wp_newmedia .mediabox').click(function(){
                    var url=$(this).attr('url');
                    window.location=url; 
                })
            }
        });
   });

   $('.wp_newmedia .mediabox').click(function(){
      var url=$(this).attr('url');
      window.location=url; 
    })
});
</script>
</body>
</html>