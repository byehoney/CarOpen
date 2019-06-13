<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
    request.setAttribute("verCode", "?r=Version2017030824");
%>
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
    <title>中再融</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/css_reset.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/borrow/borrow.css${verCode}">
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
<section class="credit_page">
    <div class="header">
        <img src="<%=request.getContextPath()%>/resources/image/borrow/hd_logo.png" alt="">
        <h3>再生资源企业调查表</h3>
    </div>
    <div class="credit_cont">
        <div class="leave">
            请详细填写本表，3个工作日内会有专人与您电话联系，如有任何疑问可随时在微信后台留言
        </div>
        <div class="user_info">
            <div class="userName  user">
                <p>姓名</p>
                <input class="txt" type="text" placeholder="请输入姓名" maxlength="">
            </div>
            <div class="userName tel">
                <p>手机号码</p>
                <input class="txt" type="text" placeholder="请输入手机号码" maxlength="11">
            </div>
            <div class="property member">
                <p>是否为中再生协会会员</p>
                <div class="Choice">
                    <i data-isMember="1"></i>是
                </div>
                <div class="Choice">
                    <i data-isMember="0"></i>否
                </div>
            </div>
            <div class="property cType">
                <p>所属再生种类</p>
                <div class="Choice">
                    <i></i>
                    <span>废纸</span>
                </div>
                <div class="Choice">
                    <i></i>
                    <span>废塑料</span>
                </div>
                <div class="Choice">
                    <i></i>
                    <span>废纺</span>
                </div>
                <div class="Choice">
                    <i></i>
                    <span>废钢</span>
                </div>
                <div class="Choice">
                    <i></i>
                    <span>其他</span>
                </div>
            </div>
            <div class="specific">
                <p>您所在的地区是</p>
                <select  id="province" name="">

                </select>
                <select disabled="disabled" id="city" name="">
                    <option value="-1" selected="selected">请选择市</option>
                </select>
                <select disabled="disabled" id="dis" name="">
                    <option value="-1" selected="selected">请选择区/县</option>
                </select>
            </div>
            <p class="err">手机号格式错误，请重新输入</p>
            <div class="submit_btn">提交</div>
        </div>
    </div>
</section>
<!--弹窗-->
<div class="overlay"></div>
<div class="popup">
    <div class="closebtn"></div>
    <div class="refer_cont">
        <p>您的信息<br/>已提交成功！</p>
        <div class="relation">请勿重复提交</br>3个工作日内，我们会与您联系</div>
    </div>
    <div class="succeed_cont">
        <div class="succeed_icon"></div>
        <p>信息提交成功！</p>
        <div class="relation">3个工作日内，我们会与您联系</div>
    </div>
</div>
<script src="<%=request.getContextPath()%>/resources/js/common/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/activity/annals/fastclick.js" type="text/javascript"></script>
<script type="text/javascript">
    FastClick.attach(document.body);//绑定fastclick
</script>
<script>
    $(function(){
        var tipShow=false;
        var timer=null;
        // 单选效果
        $(".Choice").on("click",function(){
            $(this).siblings().find("i").removeClass("on");
            $(this).find("i").addClass("on");
        });
        $('.closebtn').click(function(){
            $('.popup').hide();
            $('.overlay').hide();
        });
        $(".overlay,.popup").on("touchmove",function(e){
            e.preventDefault();
            return false;
        })
        //            获取焦点，勾选，下拉选择时移除错误信息和红色框
        $(".user_info").on("focus",'.red_border .txt',function(){
            $(".err").html("&nbsp;&nbsp;").css("visibility",'hidden');
            tipShow=false;
            $(".red_border").each(function(i,n){
                $(n).removeClass("red_border");
            });
            clearTimeout(timer)
        });
        $(".user_info").on("click",'.red_border .Choice',function(){
            $(".err").html("&nbsp;&nbsp;").css("visibility",'hidden');
            tipShow=false;
            $(".red_border").each(function(i,n){
                $(n).removeClass("red_border");
            });
            clearTimeout(timer)
        });
        $("#province,#city,#dis").on("change",function(){
            $(".err").html("&nbsp;&nbsp;").css("visibility",'hidden');
            tipShow=false;
            $(".red_border").each(function(i,n){
                $(n).removeClass("red_border");
            });
            clearTimeout(timer)
        });
        //            获取省
        getOrigionArea(1,"#province");
        //            选择市
        $("#province").on("change",function(){
            var pid=$(this).val();
            if(pid!=-1){
                $("#city").removeAttr("disabled");
            }else{
                $("#city").attr("disabled","disabled");
                $("#dis").attr("disabled","disabled");
            }
            loadOption(pid,'#city');
        });
//            选择区县
        $("#city").on("change",function(){
            var pid=$(this).val();
            if(pid!=-1){
                $("#dis").removeAttr("disabled");
            }else{
                $("#dis").attr("disabled","disabled");
            }
            loadOption(pid,'#dis');
        });
        $(".submit_btn").on("click",function(){
            var userName=$(".user .txt").val();
            var telNum=$(".tel .txt").val();
            var member=$(".member .on").attr("data-isMember");
            var cType=$(".cType .on").siblings("span").html();
            var pro=$("#province option:selected").val()==-1?-1:$("#province option:selected").html();
            var city=$("#city option:selected").val()==-1?-1:$("#city option:selected").html();
            var dis=$("#dis option:selected").val()==-1?-1:$("#dis option:selected").html();
            console.log("userName"+userName);
            console.log("telNum"+telNum);
            console.log("member"+member);
            console.log("cType"+cType);
            console.log("pro"+pro);
            console.log("city"+city);
            console.log("dis"+dis);
            if(checkInfo(userName,telNum,member,pro,city,dis,cType)){
                $.ajax({
                    type:"POST",
                    dataType:"json",
                    async:false,
                    url:basePath+'/borrow/borrowSubmit.do',
                    data:{
                        realName:userName,
                        mobile:telNum,
                        ifMember:member,
                        regeneratedType:cType,
                        province:pro,
                        city:city,
                        area:dis,
                        source:'微信公众号'
                    },
                    success:function(res){
                        if(res.data.resultMap.code==1){
                            $(".overlay").show();
                            $(".popup").show();
                            $(".succeed_cont").show();
                            $(".refer_cont").hide();
                        }else if(res.data.resultMap.code==-3){
                            $(".overlay").show();
                            $(".popup").show();
                            $(".succeed_cont").hide();
                            $(".refer_cont").show();
                        }else{
                            alert(res.data.resultMap.msg)
                        }
                        reset();
                    }

                })
            }
        });

        function getOrigionArea(parentId,el){
            $.ajax({
                url:basePath+"/userAddress/getRegion.do",
                type:"post",
                dataType:"text",
                async:false,
                data:{
                    parentId:parentId
                },
                success:function(res) {
                    var data=$.parseJSON(res);
                    var oStr='<option value="-1" selected="selected">请选择省份</option>';
                    if(data.data.regionList.length){
                        $(data.data.regionList).each(function(i,n){
                            oStr+='<option value="'+n.id+'">'+n.name+'</option>';
                        });
                        $(el).html(oStr)
                    }
                },
                error:function(){
                    alert("系统错误");
                }
            })
        }
        function loadOption(parentId, el){
            $.ajax({
                url:basePath+"/userAddress/getRegion.do",
                type:"post",
                dataType:"text",
                async:false,
                data:{
                    parentId:parentId
                },
                success:function(responseText){
                    //清空要追加的select

                    if(el == "#city"){
                        //如果是选择其中一个省，加载该省下的所有的option时既要清空城市的option也要清空区县
                        $(el).empty();
                        $("#dis").empty();
                        //把城市和区县的请选择的option给加回来
                        $(el).append("<option value='-1'>请选择市</option>");
                        $("#dis").append("<option value='-1'>请选择区/县</option>");
                    }else{
                        //如果是选择城市，加载城市下的区县，只清区县下的option即可
                        $(el).empty();
                        $(el).append("<option value='-1'>请选择区/县</option>");
                    }

                    var jsonObj = $.parseJSON(responseText);
                    for(var i = 0; i < jsonObj.data.regionList.length; i++){
                        var opt = $("<option value='"+jsonObj.data.regionList[i].id+"'>"+jsonObj.data.regionList[i].name+"</option>");
                        //追加option
                        $(el).append(opt);
                    }
                },
                error:function(){
                    alert("系统错误");
                }
            })
        }
        function checkInfo(userName,telNum,member,pro,city,dis,ctype){
            var regMobile = /^1[3-9]\d{9}$/;
            if(userName==""){
                errTip("请把信息填写完整");
                $(".user").addClass("red_border");
                return false;
            }

            if(telNum==""){
                errTip("请把信息填写完整");
                $(".tel").addClass("red_border");
                return false;
            }else if(!regMobile.test(telNum)){
                errTip("手机号格式错误，请重新输入");
                $(".tel").addClass("red_border");
                return false;
            }

            if(member==""||member==undefined){
                errTip("请把信息填写完整");
                $(".member").addClass("red_border");
                return false;
            }
            if(ctype==""||ctype==undefined){
                errTip("请把信息填写完整");
                $(".cType").addClass("red_border");
                return false;
            }
            if (pro==-1) {
                errTip("请把信息填写完整");
                $(".specific").addClass("red_border");
                return false;
            }else if(city==-1){
                errTip("请把信息填写完整");
                $(".specific").addClass("red_border");
                return false;
            }else if(dis==-1){
                errTip("请把信息填写完整");
                $(".specific").addClass("red_border");
                return false;
            }


            return true;
        }
        function errTip(info){
            if(!tipShow){
                tipShow=true;
                $(".err").html(info).css("visibility",'visible');
                timer=setTimeout(function(){
                    $(".err").html("&nbsp;&nbsp;").css("visibility",'hidden');
                    tipShow=false;
                    $(".red_border").each(function(i,n){
                        $(n).removeClass("red_border");
                    })
                },3000)
            }
        }
        function reset(){
            $(".txt").val("");
            $(".Choice i").removeClass("on");
            $("#province").val(-1);
            $("#city").html('<option value="-1" selected="selected">请选市</option>').attr("disabled","disabled");
            $("#dis").html('<option value="-1" selected="selected">请选区/县</option>').attr("disabled","disabled");
        }
    })
</script>
</body>
</html>

