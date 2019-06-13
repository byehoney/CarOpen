$(function(){

  // 项目评级
/*  ~function(){
    var grade = $('.project-grade .grade-letter');
    $.ajax({
      type: 'POST',
      url: environment.basePath + "/loan/projectdetailGrade.do",
      data: {"loanId":$CONFIG.loanId},
      dataType:'json',
      async:false,
      success: function(data) {
        if(data.code == 1){
          if(null != data.data.wubian.loanCategory) {
            if(data.data.wubian.loanCategory == 1 || data.data.wubian.loanCategory == 2) {
              var _grade = {
                1:'A+',
                2:'A',
                3:'B+',
                4:'B',
                5:'C'
              };
              grade.data('data-detaile', data).html(_grade[data.data.wubian.pingji]);
            }
          }else{
            $('.sjlist').css('margin-right', 0);
            $('.project-grade').hide();
          }
        }else {
        	$('.sjlist').css('margin-right', 0);
            $('.project-grade').hide();
        }
      }
    });
    $('.project-grade .grade-letter').on('click', function(){
      var _data = $(this).data('data-detaile').data;
  	  var str = [
        '<style>',
          '.view-grade{font-size: 12px;background-color: #fff;padding-top: 15px;}',
          '.view-grade table{width: 90%;margin:0 auto 10px;}',
          '.view-grade table td{padding:5px 0;}',
          '.view-grade table td.text-right{text-align: right;}',
          '.view-grade table td label{color: #999;}',
          '.view-grade table td em{display: block;height: 12px;background-color: #e5f8fe;}',
          '.view-grade table td em i{display: block;height: 12px;background-color: #25b6e4;width: 14%;}',
          '.view-grade .sum-score{width: 90%;margin: 0 auto;border-top: 1px #f6f6f6 solid;padding:15px 0;overflow: hidden;}',
          '.view-grade .sum-score label{width: 70px;line-height: 30px;color: #999;float: left;}',
          '.view-grade .sum-score span{float: left;width: 28px;height: 28px;line-height: 28px;text-align: center;font-size: 16px;color: #b5e4f6;background-color: #e5f8fe;border:1px #d1ebf4 solid;margin-right: 3.5%;border-radius: 50%;}',
          '.view-grade .sum-score span:last-child{margin-right: 0;}',
          '.view-grade .sum-score span.active{color: #fff;background-color: #25b6e4;border:1px #25b6e4 solid;}',
          '.view-grade .guandian{background-color: #f8f8f8;padding:20px 5%;line-height:1.7em;}',
          '.view-grade .guandian:after{content: "";display: block;overflow: hidden;clear: both;visibility: hidden;}',
          '.view-grade .guandian dt{color: #999;float: left;width: 70px;}',
          '.view-grade .guandian dd{color: #666;margin-left: 70px;}',
        '</style>',
        '<div class="view-grade">',
          '<table cellspacing="0" cellpadding="0">',
            '<tr>',
              '<td width="70"><label>'+_data.wubian.gd1+'：</label></td>',
              '<td width=""><em><i style="width:'+ 100 * _data.wubian.cwzk / 5 +'%;"></i></em></td>',
              '<td width="35" class="text-right">'+_data.wubian.cwzk+'分</td>',
            '</tr>',
            '<tr>',
              '<td><label>'+_data.wubian.gd2+'：</label></td>',
              '<td><em><i style="width:'+ 100 * _data.wubian.zxzk / 5 +'%;"></i></em></td>',
              '<td class="text-right">'+_data.wubian.zxzk+'分</td>',
            '</tr>',
            '<tr>',
              '<td><label>'+_data.wubian.gd3+'：</label></td>',
              '<td><em><i style="width:'+ 100 * _data.wubian.bzcs / 5 +'%;"></i></em></td>',
              '<td class="text-right">'+_data.wubian.bzcs+'分</td>',
            '</tr>',
            '<tr>',
              '<td><label>'+_data.wubian.gd4+'：</label></td>',
              '<td><em><i style="width:'+ 100 * _data.wubian.bzfsl / 5 +'%;"></i></em></td>',
              '<td class="text-right">'+_data.wubian.bzfsl+'分</td>',
            '</tr>',
            '<tr>',
              '<td><label>'+_data.wubian.gd5+'：</label></td>',
              '<td><em><i style="width:'+ 100 * _data.wubian.sshy / 5 +'%;"></i></em></td>',
              '<td class="text-right">'+_data.wubian.sshy+'分</td>',
            '</tr>',
          '</table>',
          '<div class="sum-score">',
            '<label>综合得分：</label>',
            '<span>A+</span>',
            '<span>A</span>',
            '<span>B+</span>',
            '<span>B</span>',
            '<span>C</span>',
          '</div>'
      ].join('');
      if(_data.wubian.yinkerViewpoint == null || $.trim(_data.wubian.yinkerViewpoint) == ''){
        str += '</div>';
      }else{
        str += [
          '<dl class="guandian">',
            '<dt>中再融观点：</dt>',
            '<dd>'+_data.wubian.yinkerViewpoint+'</dd>',
          '</dl>',
        '</div>'
        ].join('');
      }
      new DialogSimple({
        title:'项目评级',
        content:str
      });
      $('.view-grade .sum-score span:eq('+ (_data.wubian.pingji - 1) +')').addClass('active');
    });
  }();*/
  
});
