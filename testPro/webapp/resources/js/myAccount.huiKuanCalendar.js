$(function(){
  var formatDateNumber = function(number, type){ // type: true || false(default); 如： 9 > '09' || '09' > 9
    if(type){
      return number > 9 ? number : '0' + number;
    }else{
      return parseInt(number);
    }
  };
  // 数据格式化为千分位
  var numberFormat = function(num){
    return Number(num).toFixed(2).replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
  }
  var _currNewDate = new Date(),
      _currYear = _currNewDate.getFullYear(),
      _currMonth = _currNewDate.getMonth() + 1,
      _currDate = _currNewDate.getDate(),
      _currFullMonth = formatDateNumber(_currMonth, true),
      _currFullDate = formatDateNumber(_currDate, true);
  var getDataDate = _currYear + '-' + _currFullMonth + '-' + _currFullDate;

  // 加载日历
  $('.calendar-box').mobileCalendar({
    startDay: 0,
    isAllBind: false,
    startDate: getDataDate,
    initCallback: function(){

    },
    onpicked: function(data){
      //console.log(data);
      if(getDataDate == data.date){ // 禁止重复请求
        return false;
      }
      getDataDate = data.date;
      createResultDom(); // 创建搜索结果
    },
    monthChanged: function(data){
      //console.log(data);
      getDataDate = data.date.substr(0,7);
      getMonthData();
    },
    titleCallback: function(data){
      //console.log(data);
      var _subDate = data.currDate.substr(0,7);
      if(getDataDate == _subDate){ // 禁止重复请求
        return false;
      }
      getDataDate = _subDate;
      getMonthData();
    }
  });
  var getDetailProject = function(date, callback){
    $.ajax({
      url: environment.basePath + '/myAccount/getPhaseByPage.session',
      type: 'post',
      data: {
        date: date
      },
      dataType: 'json',
      success: function(data){
        if(data.code == 1){
          callback && callback.call(this, data.data.phaseList);
        }
      }
    });
  };
  var createResultDom = function(data){
    var dl = $('[data-selector="searchResult"] dl');
    if(data && data.length == 0){
      dl.html('<dd data-date="'+ getDataDate +'"><p class="empty-content muted">亲，您本月木有还款，去选择其它月份的吧！</p></dd>');
      return false;
    }
    var resultHtml = ['<dt data-date="'+ getDataDate +'"><i></i><span class="muted">还款日期：</span>'+ getDataDate +'</dt>'];
    if(getDataDate.length == 7){
      resultHtml = [];
      $.each(data, function(_index, _val){
        resultHtml.push([
          '<dt data-date="'+ _val[1] +'"><i></i><span class="muted">回款日期：</span>'+ _val[1] +'</dt>'
        ].join(''));
      });
    }
    dl.html(resultHtml.join(''));
    function creatListDetailHtml(data){
      var _str = [];
      if(data.length > 0){
        _str.push('<dd data-date="'+ data[0].phaseDate +'"><ul>');
        $.each(data, function(_index, _val){
          _str.push([
            '<li>',
              '<p class="secondary">'+ _val.loanTitle +'</p>',
              '<p>￥'+ _val.totalAmount +'</p>',
              '<p><span class="secondary">期次：</span>'+ _val.phaseNum +'/'+ _val.phaseCount +'</p>',
              (_val.status == 100 ? '<em class="corner-warning">待收</em>' : '<em class="corner-success">已收</em>'),
            '</li>'
          ].join(''));
        });
        _str.push('</ul>');
        if(data.length > 3){
          _str.push('<p class="view-more"><span>查看更多</span><i></i></p>');
        }
      }else{
        _str.push('<dd data-date="'+ getDataDate +'"><p class="empty-content muted">亲，您今天木有回款，去看看其他日期吧!</p>');
      }
      _str.push('<i class="point-top"></i></dd>');
      return $(_str.join('')).hide();
    }
    var firstDt = dl.find('dt:eq(0)');
    getDetailProject(firstDt.attr('data-date'), function(data){
      firstDt.attr('data-load', '1').addClass('slid-up').after(creatListDetailHtml(data));
      firstDt.next().slideDown(100);
      dl.find('dd[data-date="'+ firstDt.attr('data-date') +'"] li:gt(2)').hide();
    });
    dl.on('click', '.view-more', function(){
      $(this).hide().siblings('ul').find('li').show();
    });
    dl.find('dt').on('click', function(){
      var _this = $(this);
      if(_this.attr('data-load') === '1'){
        var nextDd = _this.next();
        if(nextDd.is(':hidden')){
          nextDd.slideDown(100);
          _this.addClass('slid-up');
        }else{
          nextDd.slideUp(100);
          _this.removeClass('slid-up');
        }
      }else{
        getDetailProject(_this.attr('data-date'), function(data){
          _this.attr('data-load', '1').after(creatListDetailHtml(data));
          _this.next().slideDown(100);
          _this.addClass('slid-up');
          dl.find('dd[data-date="'+ _this.attr('data-date') +'"] li:gt(2)').hide();
        });
      }
    });
  };

  function getMonthData(){
    $.ajax({
      url: environment.basePath + '/myAccount/getHuiKuanCalendar.session',
      type: 'post',
      data: {
        date: getDataDate
      },
      dataType: 'json',
      success: function(data){
        //console.log(data);
        if(data.code == 1){
          var _data = data.data;
          // 设置特殊日期
          var specialDates = [];
          $.each(_data.dates, function(_index, _val){
            specialDates.push([_val[1], 'special-date']);
          });
          $('.calendar-box').mobileCalendar('setSpecialDate', specialDates);
          $('.total-count [data-selector="totalAmount"]').text('￥' + numberFormat(_data.totalAmount));
          $('.total-count [data-selector="totalHasAmount"]').text('￥' + numberFormat(_data.totalHasAmount));
          $('.total-count [data-selector="totalTobeAmount"]').text('￥' + numberFormat(_data.totalTobeAmount));
          createResultDom(_data.dates); // 创建搜索结果
        }
      }
    });
  }
  getMonthData();
});