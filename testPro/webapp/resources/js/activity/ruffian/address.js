/**
 * Created by 29059 on 2017/10/28.
 */
$(function(){
    var tipShow=false;//默认错误提示隐藏
    var addressId="";//是否有addressId， 保存过地址则有，否则无
    var type=0;//0  保存  1修改
    var flag=getadd('flag');
    var userId=getadd('userId');
    $.ajax({//请求数据判断该用户是否保存过地址信息
        dataType:'json',
        type:'POST',
        url:basePath+'/userAddress/getUserAddressByUserId.do',
        data:{flag:flag,userId:userId},
        success:function(data){
            console.log(data)
            if(data.code==1){
                if(data.data.userAddress){//如果有保存过地址
                    editable=false;
                    editableFun(editable);
                    $(".newAddBox").hide();
                    $(".modifyBox").show();
                    $(".addTitle .modifyAdd").show();
                    var userInfo=data.data.userAddress;
                    pro=userInfo.provinceText;
                    city=userInfo.cityText;
                    dis=userInfo.districtText;
                    proId=userInfo.provinceId;
                    cityId=userInfo.cityId;
                    disId=userInfo.districtId;
                    addressId=userInfo.addressId;
                    $(".userName").val(userInfo.name);
                    $(".userTel").val(userInfo.moblie);
                    $(".userAdd").val(pro+' '+city+' '+dis);
                    $(".addDetail").val(userInfo.address);
                    addressId=userInfo.addressId;
                    type=1;
                }else{//没有保存过地址
                    editable=true;
                    editableFun(editable)
                    $(".newAddBox").show();
                    $(".modifyBox").hide();
                    $(".addTitle .modifyAdd").hide();
                    type=0;
                }
            }
        }
    });
    // 点击修改地址
    $(".modifyAdd").on("click",function(){
        $(".newAddBox").show();
        $(".modifyBox").hide();
        $(".modifyAdd").hide();
        editable=true;
        editableFun(editable);
    });
    // 点击保存地址时
    $(".saveAdd").on("click",function(){
        var addrUserName=$(".userName").val().trim();
        var addrUserMobile=$(".userTel").val().trim();
        var userAdd=pro+city+dis;
        var address=$(".addDetail").val().trim();
        if(checkInfo(addrUserName,addrUserMobile,userAdd,address)){
            if(type==1){
                var data={
                    flag:flag,
                        userId:userId,
                        addressId:addressId,
                        provinceId:proId,
                        cityId:cityId,
                        districtId:disId,
                        address:address,
                        name:addrUserName,
                        mobile:addrUserMobile
                }
            }else{
                var data={
                    flag:flag,
                        userId:userId,
                        provinceId:proId,
                        cityId:cityId,
                        districtId:disId,
                        address:address,
                        name:addrUserName,
                        mobile:addrUserMobile
                }
            }
            $.ajax({
                type:'POST',
                dataType:'json',
                url:basePath+'/userAddress/addUserAddress.do',
                data:data,
                success:function(data){
                    if(data.code==1){
                        if(!tipShow){
                            errorTip($(".err"),'保存成功',2000);
                        }
                        setTimeout(function(){
                            $(".newAddBox").hide();
                            $(".modifyBox").show();
                            editable=false;
                            editableFun(editable);
                        },2000)
            		}else{
                        if(!tipShow){
                            errorTip($(".err"),data.msg,2000)
                        }
                    }
                    $(".modifyAdd").show();
            	}
            })
        }
    });
    //点击返回活动
    $(".backAct,.modifyBack").on("click",function(){
        var flag=getadd("flag");
        if(flag=="mobile"){
            window.location.href=basePath+'/ruffian/toRuffian.do?flag=mobile&login=1';
        }else{
            window.location.href=basePath+'/ruffian/toRuffian.do?flag=wap';
        }
    });
    //app获取app还是wap
    function getadd(flag){
        var reg = new RegExp("(^|&)"+ flag +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
    // 判断当前输入框以及地址选择框能否编辑
    function editableFun(editable){
        if(!editable){
            $(".userName").attr("readonly",true);
            $(".userTel").attr("readonly",true);
            $(".addDetail").attr("readonly",true);
        }else{
            $(".userName").attr("readonly",false);
            $(".userTel").attr("readonly",false);
            $(".addDetail").attr("readonly",false);
        }
    }
    var Utils = {
        isChinese2 : function(str) {
            var lst = /[\u4e00-\u9fa5]/;
            return lst.test(str);
        },
        getCharLen2 : function(str) {
            var strlength = 0;
            for (var i = 0; i < str.length; i++) {
                if (this.isChinese2(str.charAt(i)) == true)
                    strlength = strlength + 2;
                else
                    strlength = strlength + 1;
            }
            return strlength;
        },
        checkCuMobile : function(num) {
            var mobile = /^(1)\d{10}$/;
            if(!mobile.test(num)){
                return false;
            }else{
                return true;
            }
        }
    };
    function checkInfo(addrUserName,addrUserMobile,userAdd,address){
        if(addrUserName=='' || addrUserName==null){
            if(!tipShow){
                errorTip($(".err"),"请输入收货人姓名",2000);
            }
            return false;
        }

        var regUserName=/^([\u4e00-\u9fa5]+|([a-zA-Z]+\s?)+)$/;

        if(!regUserName.test(addrUserName)){
            if(!tipShow){
                errorTip($(".err"),"收货人姓名非法",2000);
            }
            return false;
        }
        if(addrUserMobile=='' || addrUserMobile==null){
            if(!tipShow){
                errorTip($(".err"),"请输入手机号码",2000);
            }
            return false;
        }

        //var regMobile=/^(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
        var regMobile = /^1[3-9]\d{9}$/;

        if(!regMobile.test(addrUserMobile)){
            if(!tipShow){
                errorTip($(".err"),"手机号非法",2000);
            }
            return false;
        }
        if(userAdd==''||userAdd==null){
            if(!tipShow){
                errorTip($(".err"),"请选择省市区",2000);
            }
            return false;
        }
        if(address==''||address==null){
            if(!tipShow){
                errorTip($(".err"),"请输入详细地址",2000);
            }
            return false;
        }

        var reg=/^(?=.*?[\u4E00-\u9FA5])[\d\u4E00-\u9FA5A-Za-z]+$/;

        if(!reg.test(address)){
            if(!tipShow){
                errorTip($(".err"),"地址含有非法字符",2000);
            }
            return false;
        }

        //判断详细地址的长度,不能超过200,一个汉字长度为2
        if(Utils.getCharLen2(address) > 400){
            if(!tipShow){
                errorTip($(".err"),"长度不要超过200个字符",2000);
            }
            return false;
        }
        return true;
    }
    // 错误提示
    function errorTip(obj,info,dur){
        obj.show().html(info);
        tipShow=true;
        setTimeout(function(){
            tipShow=false;
            obj.html("").hide();
        },dur)
    }
});
