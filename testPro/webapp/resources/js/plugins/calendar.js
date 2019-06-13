~function($){
  var pluginName = 'mobileCalendar';
  function mCalendar(element, options){
    var defaults = {
      startDate: null, // 格式：'2015-09-08'
      // minDate: '1900-01-01',
      // maxDate: '2099-12-31',
      startDay: 6, // 星期开始，默认值：6【日~六】；取值：0 || 6
      specialDates: null, // [['2015-09-03', 'special-date'],['2015-09-09', 'special-date']]
      isAllBind: true,
      initCallback: null,
      monthChanged: null,
      onpicked: null,
      titleCallback: null
    };
    this.element = $(element);
    this.ele = null;
    this.currDate = null; // 当前显示的日期
    this.today = null; // 今天
    this.winWidth = $(window).width();
    this.opt = $.extend(defaults, options);
    this.init();
  }
  mCalendar.prototype = {
    init: function(){
      var that = this;
      var newToday = new Date(),
          getFullYear = newToday.getFullYear(),
          getFullMonth = that.formatDateNumber(newToday.getMonth() + 1, true),
          getDate = newToday.getDate(),
          getFullDate = that.formatDateNumber(getDate, true);
      if(!that.opt.startDate){
        that.opt.startDate = getFullYear +'-'+ getFullMonth + '-' + getFullDate;
      }
      that.today = getFullYear +'-'+ getFullMonth +'-'+ getFullDate;
      that.currDate = that.opt.startDate;
      that._showToBrowser(that.currDate);
      that._listenerOrientationChange();
    },
    _listenerOrientationChange: function(){
      var that = this;
      var _event = 'onorientationchange' in window ? 'orientationchange' : 'resize';
      window.addEventListener(_event, function(e){
        setTimeout(function(){
          var winWidth = that.winWidth = $(window).width();
          var tableDom = $('.datesListBox table', that.ele);
          tableDom.width(winWidth);
          $('.datesListBox', that.ele).css({
            'width': (winWidth * 3) + 'px',
            'left': (- winWidth) + 'px'
            // '-webkit-transform': 'translateX('+ (- winWidth) +'px)',
            // 'transform': 'translateX('+ (- winWidth) +'px)'
          });
        }, 300);
      }, false);
    },
    _getStartDay: function(date){ // 获取该月起始星期。date格式：'2015-09-01'
      return new Date(date.replace(/\d{2}$/, '01')).getDay();
    },
    formatDateNumber: function(number, type){ // type: true || false(default); 如： 9 > '09' || '09' > 9
      if(type){
        return number > 9 ? number : '0' + number;
      }else{
        return parseInt(number);
      }
    },
    _getDateNumber: function(date){
      var _format = this.formatDateNumber(date.split('-')[1]);
      var year = date.split('-')[0];
      var _dates;
      if(_format == 2){ // 计算闰年的2月份天数
        ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) ?
        _dates = 29 : 
        _dates = 28;
        return _dates;
      }
      var maxDate = [1, 3, 5, 7, 8, 10, 12];
      maxDate.indexOf(_format) != -1 ? _dates = 31 : _dates = 30;
      return _dates;
    },
    _getStartIndex: function(date){
      var that = this;
      var startDay = that._getStartDay(date);
      return that.opt.startDay == 6 ? startDay : (startDay > 0 ? startDay - 1 : 6);
    },
    _createDom: function(){
      var __day = '<div class="weekend">日</div><div>一</div><div>二</div><div>三</div><div>四</div><div>五</div><div class="weekend">六</div>';
      if(this.opt.startDay == 0){
        __day = '<div>一</div><div>二</div><div>三</div><div>四</div><div>五</div><div class="weekend">六</div><div class="weekend">日</div>';
      }
      return $([
        '<div class="calendarBox">',
          '<div class="calendarHead">',
            '<span class="titleName"></span>',
            '<i class="switchMonthPrev"></i>',
            '<i class="switchMonthNext"></i>',
          '</div>',
          '<div class="calendarListView">',
            '<div class="tableHead">',
              __day,
            '</div>',
            '<div class="datesListBox"></div>',
          '</div>',
        '</div>'
      ].join(''));
    },
    _createTable: function(date){
      var that = this;
      var _format = date.split('-');
      var _table = ['<table cellpadding="0" cellspacing="0"><tbody>'];
      var _days = that._getDateNumber(date);
      var _index = that._getStartIndex(date);
      var k = 1;
      for(var i = 0; i < 6; i++){
        var _tr = ['<tr>'];
        for(var j = 0; j < 7; j++){
          if(i == 0 && j < _index){ // 如果是第一行
            _tr.push('<td><span class="emptyContent" data-date=""></span></td>');
          }else{
            if(k <= _days){
              var __fullDate = k < 10 ? '0' + k : k;
              _tr.push('<td><span data-date="'+ _format[0] +'-'+ _format[1] +'-'+ __fullDate +'">'+ k +'</span></td>');
              k ++;
            }else{
              _tr.push('<td><span class="emptyContent" data-date=""></span></td>');
            }
          }
        }
        _tr.push('</tr>');
        _table.push(_tr.join(''));
      }
      _table.push('</tbody></table>');
      return _table.join('');
    },
    _showToBrowser: function(date){
      var that = this;
      var format = date.split('-'),
          formatYear = parseInt(format[0]),
          formatMonth = that.formatDateNumber(format[1]),
          prevMonth = formatMonth - 1 == 0 ? 12 : formatMonth - 1,
          prevYear = prevMonth == 12 ? formatYear - 1 : formatYear,
          nextMonth = formatMonth + 1 > 12 ? 1 : formatMonth + 1,
          nextYear = nextMonth == 1 ? formatYear + 1 : formatYear;
      var table = [
        that._createTable(prevYear +'-'+ that.formatDateNumber(prevMonth, true) +'-'+ '01'),
        that._createTable(date),
        that._createTable(nextYear +'-'+ that.formatDateNumber(nextMonth, true) +'-'+ '01')
      ].join('');
      that.element.html(that._createDom()).find('.datesListBox').html(table);
      var parentDom = that.ele = $('.calendarBox', that.element);
      // 设置title
      $('.titleName', parentDom).text(formatYear + '年'+ formatMonth +'月');
      var tableDom = $('.datesListBox table', parentDom);
      tableDom.width(that.winWidth);
      $('.datesListBox', parentDom).css({
        'width': (that.winWidth * 3) + 'px',
        'left': (- that.winWidth) + 'px'
        // '-webkit-transform': 'translateX('+ (- that.winWidth) +'px)',
        // 'transform': 'translateX('+ (- that.winWidth) +'px)'
      });
      that._initSet();
      that._eventBind();
      that.opt.initCallback && that.opt.initCallback.call(that);
    },
    _initSet: function(){
      var that = this;
      var parentDom = that.ele;
      var layer = $('.datesListBox', parentDom);
      $('table', layer).each(function(){
        var _this = $(this);
        if(_this.attr('data-init') != 1){
          // 设置周末状态
          if(that.opt.startDay == 6){
            $('tr', _this).each(function(){
              var __this = $(this);
              __this.find('td:first-child span').addClass('weekend');
              __this.find('td:last-child span').addClass('weekend');
            });
          }else{
            $('tr', _this).each(function(){
              var __this = $(this);
              __this.find('td').eq(5).find('span').addClass('weekend');
              __this.find('td').eq(6).find('span').addClass('weekend');
            });
          }
          
          // 设置今天
          _this.find('[data-date="'+ that.today +'"]').text('今').addClass('today');
          _this.attr('data-init', '1')
        }
      });
    },
    setSpecialDate: function(dates){ // [['2015-09-03', 'className'], ['2015-09-09', 'className']]
      var that = this;
      var parentDom = that.ele;
      var layer = $('.datesListBox', parentDom);
      var _dates = dates || that.opt.specialDates || [];
      if(_dates.length > 0){
        $.each(_dates, function(m, n){
          $('[data-date="'+ n[0] +'"]', layer).addClass(n[1]);
        });
        that._eventBindForDate();
      }
      return that;
    },
    _eventBindForDate: function(element){
      var that = this;
      var parentDom = that.ele;
      var layer = $('.datesListBox', parentDom);
      var element = element || layer;
      // 选择某个日期
      function responesEvent(){
        var _this = $(this);
        if(_this.hasClass('activeSelect')){
          return false;
        }
        _this.closest('tbody').find('td span').removeClass('activeSelect');
        _this.addClass('activeSelect');
        that.currDate = _this.attr('data-date');
        that._initSet(); // 设置周末、当天状态
        that.opt.onpicked && that.opt.onpicked.call(that, {
          element: _this,
          date: that.currDate
        });
      }
      var _td = $('tbody td span', element).off();
      that.opt.isAllBind ?
      _td.not('.emptyContent').on('click', responesEvent) : // 全部绑定
      $('.special-date, .today', element).on('click', responesEvent); // 只为特殊日绑定
    },
    _eventBind: function(){
      var that = this;
      var parentDom = that.ele;
      var layer = $('.datesListBox', parentDom);
      that._eventBindForDate(); // 为每日绑定点击事件

      // 为title绑定事件
      $('.titleName', parentDom).on('click', function(){
        that.opt.titleCallback && that.opt.titleCallback(that, that.currDate);
      });

      // 上一月
      function touchPrev(){
        if(layer.hasClass('animated')){
          return false;
        }
        layer.addClass('animated').animate({
          left: 0
          // '-webkit-transform': 'translateX(0)',
          // 'transform': 'translateX(0)'
        }, 500, function(){
          function jisuan(m){
            var currDate = that.currDate.split('-');
            var formatYear = parseInt(currDate[0]);
            var formatMonth = that.formatDateNumber(currDate[1]) - m;
            var jisuan = {};
            jisuan.prevMonth = formatMonth > 0 ? formatMonth : (formatMonth == 0 ? 12 : 11);
            jisuan.prevYear = (jisuan.prevMonth == 12 || (jisuan.prevMonth == 11 && formatMonth < 0)) ?
                              formatYear - 1 : formatYear;
            return jisuan;
          }
          var getJisuan = jisuan(1);
          var getStepJisuan = jisuan(2);
          that.currDate = getJisuan.prevYear +'-'+ that.formatDateNumber(getJisuan.prevMonth, true) +'-'+ '01';
          // 设置title
          $('.titleName', parentDom).text(getJisuan.prevYear + '年'+ getJisuan.prevMonth +'月');
          var __rq = getStepJisuan.prevYear +'-'+ that.formatDateNumber(getStepJisuan.prevMonth, true) +'-'+ '01';
          var newCalendar = $(that._createTable(__rq)); // 创建该月日历
          layer.find('table:first-child').before(newCalendar);
          layer.find('table').width(that.winWidth);
          layer.css({
            left: (- that.winWidth) + 'px'
            // '-webkit-transform': 'translateX('+ (- that.winWidth) +'px)',
            // 'transform': 'translateX('+ (- that.winWidth) +'px)'
          }).find('table:last-child').remove();
          that._eventBindForDate(newCalendar); // 为日绑定点击事件
          that._callForMonthEvent();
          that.opt.monthChanged && that.opt.monthChanged.call(that, {date: that.currDate});
          layer.removeClass('animated'); // 解除频繁划动
        });
      }
      $('.switchMonthPrev', parentDom).on('click', touchPrev);
      //layer.swipeRight(touchPrev);

      // 下一月
      function touchNext(){
        if(layer.hasClass('animated')){
          return false;
        }
        layer.addClass('animated').animate({
          left: (- that.winWidth * 2) + 'px'
          // '-webkit-transform': 'translateX('+ (- that.winWidth * 2) +'px)',
          // 'transform': 'translateX('+ (- that.winWidth * 2) +'px)'
        }, 500, function(){
          function jisuan(m){
            var currDate = that.currDate.split('-');
            var formatYear = parseInt(currDate[0]);
            var formatMonth = that.formatDateNumber(currDate[1]) + m;
            var jisuan = {};
            jisuan.nextMonth = formatMonth == 13 ? 1 : (formatMonth == 14 ? 2 : formatMonth);
            jisuan.nextYear = (jisuan.nextMonth == 1 || formatMonth == 14) ? formatYear + 1 : formatYear;
            return jisuan;
          }
          var getJisuan = jisuan(1);
          var getStepJisuan = jisuan(2);
          that.currDate = getJisuan.nextYear +'-'+ that.formatDateNumber(getJisuan.nextMonth, true) +'-'+ '01';
          // 设置title
          $('.titleName', parentDom).text(getJisuan.nextYear + '年'+ getJisuan.nextMonth +'月');
          var __rq = getStepJisuan.nextYear +'-'+ that.formatDateNumber(getStepJisuan.nextMonth, true) +'-'+ '01';
          var newCalendar = $(that._createTable(__rq)); // 创建该月日历
          layer.append(newCalendar);
          layer.find('table').width(that.winWidth);
          layer.css({
            left: (- that.winWidth) + 'px'
            // '-webkit-transform': 'translateX('+ (- that.winWidth) +'px)',
            // 'transform': 'translateX('+ (- that.winWidth) +'px)'
          }).find('table:first-child').remove();
          that._eventBindForDate(newCalendar); // 为日绑定点击事件
          that._callForMonthEvent();
          that.opt.monthChanged && that.opt.monthChanged.call(that, {date: that.currDate});
          layer.removeClass('animated'); // 解除频繁划动
        });
      }
      $('.switchMonthNext', parentDom).on('click', touchNext)
      //layer.swipeLeft(touchNext);

      // touch events
      /*var startX = moveX = endX = 0;
      layer.on('touchstart', function(e){
        // console.log('start:');
        // console.log(e);
        startX = e.targetTouches[0].pageX;

      });
      layer.on('touchmove', function(e){
        // console.log('move:');
        // console.log(e);
        moveX = e.targetTouches[0].pageX;
        layer.css({
          '-webkit-transform': 'translateX('+ (moveX - startX + (- that.winWidth)) +'px)',
          'transform': 'translateX('+ (moveX - startX + (- that.winWidth)) +'px)'
        });
      });
      layer.on('touchend', function(e){
        // console.log('end:');
        // console.log(e);
        endX = e.changedTouches[0].pageX;
        var rates = that.winWidth * 40 / 100; // 划过比例
        var touchLength = endX - startX;
        if(Math.abs(touchLength) >= rates && !layer.hasClass('animated')){ // 符合翻页条件
          touchLength < 0 ?
          touchNext() :// 下一月
          touchPrev() ;// 上一月
        }else{ // 划过距离太小，不符合翻页条件
          layer.css({
            '-webkit-transform': 'translateX('+ (- that.winWidth) +'px)',
            'transform': 'translateX('+ (- that.winWidth) +'px)',
            '-webkit-transition': 'transform .2s ease-out',
            'transition': 'transform .2s ease-out'
          });
        }
        startX = moveX = endX = 0;
      });*/
    },
    _callForMonthEvent: function(){
      var that = this;
      var parentDom = that.ele;
      var layer = $('.datesListBox', parentDom);
      layer.find('td span').removeClass('activeSelect');
      that._initSet(); // 设置周末、当天状态
      //$('[data-date="'+ that.currDate +'"]', layer).addClass('activeSelect');
    }
  };

  $.fn[pluginName] = $.fn[pluginName] || function(options){
    // this : 调用的节点
    if(options === 'setSpecialDate'){
      var method = options,
          arg = arguments;
      Array.prototype.shift.call(arg);
      return this.each(function () {
        var _plugin = $(this).data('plugin_' + pluginName);
        if (_plugin && _plugin[method]) _plugin[method].apply(_plugin, arg);
      });
    }else{
      return this.each(function () {
        var _plugin = $(this).data('plugin_' + pluginName);
        if (!_plugin) {
          $(this).data('plugin_' + pluginName, new mCalendar(this, options));
        }
      });
    }
  };
}(jQuery);