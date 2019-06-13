/**
 * Created by hfjk on 2017/12/27.
 */
var resArr = ['该项目首位投资用户投资金额≥5000元时，可获得10元现金奖励',
    '该项目累计投资金额最高的用户，可获得20元现金奖励',
'该项目最后一位满标用户，可获得10元现金奖励'];
$('.invest_list li').click(function(){
    var i = $(this).index();
    $('.bubble').show();
    $('.invest_list li em').hide();
    $(this).find('em').show();
    $('.bubble_count span').html(resArr[i]);
});
$('.close_btn').click(function(){
    $('.bubble,.invest_list li em').hide();
});