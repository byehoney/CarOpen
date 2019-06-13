
	var pathUrl = '${pageContext.request.contextPath}';
		;(function(win,doc){
			win.onload=win.onresize=function(){
				var w=doc.documentElement.clientWidth;
					if(w>640){
						w=640;
					}else if(w<320){
						w=320;
					}
			doc.documentElement.style.fontSize=100*w/640+'px'};
		})(window,document);
