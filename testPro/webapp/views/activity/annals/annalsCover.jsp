<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="author" content="m.zhongzairong.cn">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <title>融布斯 2017 年度人物全记录</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/activity/annals/annalsCover.css${verCode}"/>
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/js/common/setHtmlFontsize.js"></script>
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
    <script>
//      设置HTML的fontSize
        var defaultFontSize = adapt(750, 100);
        $('html').css('fontSize',defaultFontSize);
    </script>
</head>
<body>
<%--<div class="docWrapper">--%>
    <div class="annalPage">
            <%--<img class="shineBg" src="<%=request.getContextPath()%>/resources/image/activity/annals/goldBg.png">--%>
            <img class="topImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/trImg.png">
            <div class="prevSection">
                <div id="showPicBox" class="previewImg">
                    <img id="prevImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/example0_4.png" width="100%">
                </div>
                <div id="preUploadBox" class="previewImg" style="display: none;position:fixed;">
                    <img src="<%=request.getContextPath()%>/resources/image/activity/annals/exampleCover.png" width="100%">
                    <div class="preCont">
                        <h3>新晋富豪榜候选人</h3>
                        <div class="uploadBox">
                            <img id="myImg">
                        </div>
                    </div>
                </div>
                <img class="prevTit" src="<%=request.getContextPath()%>/resources/image/activity/annals/prevTit.png">
                <div class="annalHeader">
                    <img class="logo" src="<%=request.getContextPath()%>/resources/image/activity/annals/logo.png">
                </div>
                <div class="annalCont">
                    <img class="conLeft" src="<%=request.getContextPath()%>/resources/image/activity/annals/conLeft.png">
                    <img class="conRight" src="<%=request.getContextPath()%>/resources/image/activity/annals/conLeft.png">
                </div>
                <div class="annalFooter">
                    <c:if test="${flag == 'mobile'}">
                        <div class="litWord changeBtn">更换封面图</div>
                    </c:if>
                    <c:if test="${flag == 'wx'}">
                        <div class="litWord">* 点击图片，长按保存</div>
                        <div class="wx_clickBtn">更换封面图</div>
                    </c:if>
                    <c:if test="${flag == 'mobile'}">
                        <div class="app_clickBtn clearfix">
                            <div class="saveBtn fl">保存图片</div>
                            <div class="shareBtn fr">分享出去</div>
                            <img class="shareTips" src="<%=request.getContextPath()%>/resources/image/activity/annals/shareTips.png">
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="choseImg" style="display: none;">
                <div class="closeBtn"></div>
                <div class="posTop">
                    <div class="picItems clearfix">
                        <div class="fl">
                            <div class="example" data-num="example1">
                                <img class="topImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/s_example1.png">
                            </div>
                            <p>示例1</p>
                        </div>
                        <div class="fr">
                            <div class="example" data-num="example2">
                                <img class="topImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/s_example2.png">
                            </div>
                            <p>示例2</p>
                        </div>
                    </div>
                    <div class="picItems clearfix">
                        <div class="fl">
                            <div class="example">
                                <img id="defImg" class="topImg" src="<%=request.getContextPath()%>/resources/image/activity/annals/s_example0_4.png">
                            </div>
                            <p>默认封面</p>
                        </div>
                        <div class="fr">
                            <div class="example border">
                                <h4>本地相册</h4>
                                <input id="uploadFile" class="localPic opacity" type="file" accept="image/*">
                                <img class="imgTips" src="<%=request.getContextPath()%>/resources/image/activity/annals/imgTips.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <div class="bigPreimg" >
                    <img src="<%=request.getContextPath()%>/resources/image/activity/annals/example0.png">
                </div>
            <div class="overlay"></div>
        </div>
    <%--</div>--%>
    <input id="userId" type="hidden" value="${userId}">
    <input id="flag" type="hidden" value="${flag}">
<script src="<%=request.getContextPath()%>/resources/js/activity/annals/fastclick.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/annals/exif.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/annals/html2canvas.js" type="text/javascript"></script>
    <script>
        FastClick.attach(document.body);//绑定fastclick
        var userId=$('#userId').val();
        var fadeFlag = true;
        var rank=getUrlParams ('rank');
        var rankName='新晋富豪榜候选人';
        var rankSrc='';
        var s_rankSrc='';
        var rankNum='';

        if(rank == '-1'){
            rankName='新晋富豪榜候选人';
            rankSrc='/resources/image/activity/annals/example0_4.png';
            s_rankSrc='/resources/image/activity/annals/s_example0_4.png';
            rankNum='example0_4';
        }else if(rank == '0'){
            rankName='最具影响力富豪';
            rankSrc='/resources/image/activity/annals/example0_2.png';
            s_rankSrc='/resources/image/activity/annals/s_example0_2.png';
            rankNum='example0_2';
        }else if(rank == '1'){
            rankName='富豪榜Top100';
            rankSrc='/resources/image/activity/annals/example0.png';
            s_rankSrc='/resources/image/activity/annals/s_example0.png';
            rankNum='example0';
        }else if(rank == '2'){
            rankName='最具竞争力富豪';
            rankSrc='/resources/image/activity/annals/example0_1.png';
            s_rankSrc='/resources/image/activity/annals/s_example0_1.png';
            rankNum='example0_1';
        }else if(rank == '3'){
            rankName='最具影响力富豪';
            rankSrc='/resources/image/activity/annals/example0_2.png';
            s_rankSrc='/resources/image/activity/annals/s_example0_2.png';
            rankNum='example0_2';
        }else if(rank == '4'){
            rankName='新晋潜力富豪';
            rankSrc='/resources/image/activity/annals/example0_3.png';
            s_rankSrc='/resources/image/activity/annals/s_example0_3.png';
            rankNum='example0_3';
        }
        var imageUrl = 'https://m.zhongzairong.cn'+rankSrc;
        var imageType = '2';
        //首页默认图
        $('#prevImg').attr('src',basePath+rankSrc);
//默认示例图
       $('#defImg').attr('src',basePath+s_rankSrc).parent().data('num',rankNum);
        $('.preCont h3').html(rankName);
        $('.closeBtn').click(function () {
            $('.prevSection').show();
            $('.choseImg').hide();
            $('#showPicBox').show();
            $('#preUploadBox').hide();
        })
        $(function () {
            var outTimer = setTimeout(function () {
                $('.app_clickBtn .shareTips').fadeOut(500)
            },2000);
            $('.app_clickBtn .shareTips').click(function () {
                clearTimeout(outTimer)
                $(this).fadeOut();
            })
        })

        $('.changeBtn,.wx_clickBtn').click(function () {
            if(fadeFlag==true){
                $('.prevSection').hide();
                $('.choseImg').show();
                $('#showPicBox').hide();
                $('#preUploadBox').fadeIn(1000);
            }

        })
        $('.posTop .picItems').eq(0).find('.example').click(function () {
            var src=$(this).data('num');
            $('.bigPreimg img').attr('src',basePath+'/resources/image/activity/annals/'+src+'.png');
            $('.overlay,.bigPreimg').show();
        })
        $('.posTop .picItems').eq(1).find('.example').not('.border').click(function () {
            $('#preUploadBox').hide();
            $('#showPicBox').show();
            $('#showPicBox img').attr('src',basePath+'/resources/image/activity/annals/'+$(this).data('num')+'.png');
            $('.choseImg').hide();
            $('.prevSection').show();
            imageUrl = 'https://m.zhongzairong.cn/resources/image/activity/annals/'+$(this).data('num')+'.png';
            imageType = '2';
        })
        $('.bigPreimg').click(function () {
            $('.overlay,.bigPreimg').hide();
        })
        //发放加息券
        function giveReward(userId) {
            $.ajax({
                url:basePath+'/annals/giveReward.do',
                type:'POST',
                dataType:'json',
                data:{
                    userId:userId
                },
                success:function (data) {

                }
            })
        }

        var Orientation=null;
        var rotateFlag=false;
        $("#uploadFile").on("change",function(event){
            fadeFlag = false;
            var reader = new FileReader();
            var file = event.target.files[0] || event.dataTransfer.files[0];
            if(!/.(gif|jpg|jpeg|png|GIF|JPG|bmp)$/.test(file.type)){
                infoTips('.errormsg',"文件格式不正确");
                return false;
            }
            EXIF.getData(file, function() {
                EXIF.getAllTags(this);
                Orientation = EXIF.getTag(this, 'Orientation');
                //修复ios
//                if (navigator.userAgent.match(/iphone/i)) {
                    rotateFlag=false;
                    //如果方向角不为1，都需要进行旋转 added by lzk
                    if(Orientation != "" && Orientation != 1){
                        switch(Orientation){
                            case 6://需要顺时针（向左）90度旋转
                                rotateFlag=true;
                                break;
                            case 8://需要逆时针（向右）90度旋转
                                rotateFlag=true;
                                break;
                        }
                    }
//                }

            });
            reader.readAsDataURL(file);
            reader.onload = function(e) {
                var base64 = e.target.result;
                if (base64.length > 1024 * 1024 * 5 ) {
                    alert('图片尺寸请小于5M');
                    return;
                } else {
                    $('#myImg').attr('src',base64);
                    if(rotateFlag){
                        var mycanvas = document.createElement('canvas');
                        var context = mycanvas.getContext("2d");
                        var scaleBy = getPixelRatio(context);  //获取像素密度的方法 (也可以采用自定义缩放比例)

                        var bw = $('#preUploadBox .preCont').outerWidth();
                        var bh = $('#preUploadBox .uploadBox').outerHeight();
                        $('#myImg').css('width',bw);
                        mycanvas.width = bw * scaleBy;   //这里 由于绘制的dom 为固定宽度，居中，所以没有偏移
                        mycanvas.height = bh * scaleBy;  // 注意高度问题，由于顶部有个距离所以要加上顶部的距离，解决图像高度偏移问题
                        context.scale(scaleBy, scaleBy);
                            var imgUpload = new Image();
                            imgUpload.onload = function () {
                                // 绘制
                                context.save();//保存状态
                                context.translate(bw/2,bh/2);//设置画布上的(0,0)位置，也就是旋转的中心点
                                context.rotate(90*Math.PI/180);
                                context.drawImage(imgUpload,-bh/2,-bw/2,bh,bw);//把图片绘制在旋转的中心点，
                                context.restore();//恢复状态
                                // 回调
                                callback(mycanvas.toDataURL('image/png'));
                            };
                            imgUpload.src = base64;

                        $('#myImg').load(function(){
                            $('.choseImg').fadeOut(500);
                            $('.prevSection').fadeIn(4000,function () {
                                fadeFlag = true;
                            });
                        });
                    }else{
                        $('#myImg').load(function(){
                            // 加载完成
                            var bw = $('#preUploadBox .preCont').outerWidth();
                            var bh = $('#preUploadBox .uploadBox').outerHeight();
                            AutoSize($('#myImg')[0], bw, bh)
                            $('.choseImg').fadeOut(500);
                            $('.prevSection').fadeIn(4000,function () {
                                fadeFlag = true;
                            });
                        });
                    }
                    $('#preUploadBox').css('top','0')
                    setTimeout(function () {
                        html2Canvas();
                        $('#uploadFile').val('');
                        $('#preUploadBox').hide().css('top','13%');
                    },300)
                }

            }
        })
        function callback(base64) {
            $('#myImg').attr('src',base64);
        }

        function getPixelRatio(context){
            var backingStore = context.backingStorePixelRatio ||
                context.webkitBackingStorePixelRatio ||
                context.mozBackingStorePixelRatio ||
                context.msBackingStorePixelRatio ||
                context.oBackingStorePixelRatio ||
                context.backingStorePixelRatio || 1;
            return (window.devicePixelRatio || 1) / backingStore;
        }

        function  html2Canvas() {
            var shareContent =document.getElementById("preUploadBox");// 需要绘制的部分的 (原生）dom 对象 ，注意容器的宽度不要使用百分比，使用固定宽度，避免缩放问题
            var width = shareContent.offsetWidth;  // 获取(原生）dom 宽度
            var height = shareContent.offsetHeight; // 获取(原生）dom 高
            var offsetTop = shareContent.offsetTop;  //元素距离顶部的偏移量

            var canvas = document.createElement('canvas');  //创建canvas 对象
            var context = canvas.getContext('2d');
            var scaleBy = getPixelRatio(context);  //获取像素密度的方法 (也可以采用自定义缩放比例)
            canvas.width = width * scaleBy;   //这里 由于绘制的dom 为固定宽度，居中，所以没有偏移
            canvas.height = (height + offsetTop) * scaleBy;  // 注意高度问题，由于顶部有个距离所以要加上顶部的距离，解决图像高度偏移问题
            context.scale(scaleBy, scaleBy);

            var opts = {
                allowTaint:true,//允许加载跨域的图片
                tainttest:true, //检测每张图片都已经加载完成
                scale:scaleBy, // 添加的scale 参数
                canvas:canvas, //自定义 canvas
                logging: false, //日志开关，发布的时候记得改成false
                width:width, //dom 原始宽度
                height:height //dom 原始高度
            };
            html2canvas(shareContent, opts).then(function (canvas) {
                src=canvas.toDataURL('image/png');
            $("#prevImg").attr("src",src);
                imageType = '3';
                imageUrl = src;
                $('#showPicBox').fadeIn(1000);
            });
        }
        function AutoSize(Img, maxWidth, maxHeight) {
            var image = new Image();
            //原图片原始地址（用于获取原图片的真实宽高，当<img>标签指定了宽、高时不受影响）
            image.src = Img.src;
            // 当图片比图片框小时不做任何改变
            if (image.width < maxWidth&& image.height < maxHeight) {
                Img.width = image.width;
                Img.height = image.height;
            }
            else //原图片宽高比例 大于 图片框宽高比例,则以框的宽为标准缩放，反之以框的高为标准缩放[javascript] view plain copy
            {
                Img.width = maxWidth;   //以框的宽度为标准
                Img.height = maxWidth* (image.height / image.width);
            }
        }
        var shareFlag=true;
        var saveFlag=true;
        function changeForApp() {
            $('.saveBtn').unbind('click').click(function () {
                if(saveFlag){
                    saveFlag=false;
                    saveImageWithImageMessage(imageType,imageUrl);
                    setTimeout(function () {
                        saveFlag=true;
                    },2000)
                }
            });
            $('.shareBtn').unbind('click').click(function(){
                if(shareFlag){
                    shareFlag=false;
                    giveReward(userId);
                    shareImageToSinglePlat(imageType,imageUrl);
                    setTimeout(function () {
                        shareFlag=true;
                    },2000)
                }
            });
        }
        //保存图片
        function saveImageWithImageMessage(imageType,imageStr){
//imageType: 0 屏幕截图 1 屏幕长截图 2 url 图片 3 base64 图片 imageStr: 图片url 或者 base64图片字符串
            var imageMsg = JSON.stringify({
                "imageType": imageType, "imageStr": imageStr
            });
            anniversary.saveImageWithImageMessage(imageMsg)
        }

        // 分享到单个平台
        function shareImageToSinglePlat(imageType,imageStr){
//imageType: 0 屏幕截图 1 屏幕长截图 2 url 图片 3 base64 图片； imageStr: 图片url 或者 base64图片字符串。
// plat 单个平台
            var imageMsg = JSON.stringify({
                "imageType": imageType, "imageStr": imageUrl,"plat": "WechatTimeLine"
            });
            anniversary.shareImageToSinglePlat(imageMsg)
        }
        function getUrlParams (flag){
            var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if(r!=null)return  unescape(r[2]); return null;
        }
    </script>
</body>
</html>
