// pages/detail/detail.js
const app = getApp()
var WxParse = require('../../utils/wxParse/wxParse.js')
Page({
  data: {
    src:'',
    vid:'',
    title:''
  },
  onLoad: function (options) {
    console.log(options)
    this.setData({
      vid:options.vid,
      title:options.title
    })
    this.getArtileDetail();
  },
  getArtileDetail() {
    wx.showLoading({
      title: '加载中...',
    })
    wx.request({
      url: app.globalData.domain + '/api/info/news/newsDetail',
      method: 'post',
      data: {
        id: this.data.vid,
        category: '视频'
      },
      complete: () => {
        wx.hideLoading()
      },
      success: res => {
        var that = this;
        if (res.data.code == 0) {
          console.log(res)
          this.setData({
            content: res.data.data.newsDetail.content
          })
          var videoReg = /<video.*?(?:>|\/>)/gi;
          var srcReg = /src=[\'\"]?([^\'\"]*)[\'\"]?/i;
          var arr = this.data.content.match(videoReg); 
          let src = arr[0].match(srcReg)[1]
          this.setData({
            src:src
          })
        }
      },
      fail: () => {
        wx.showToast({
          title: '加载失败，请稍候再试...',
          icon: 'none',
        })
      }
    })
  },
  onShareAppMessage: function () {

  }
})