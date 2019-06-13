//index.js
//获取应用实例
const app = getApp()

Page({
  data: {
    isLoading:false,
    pageSize:3,
    videoList:[],
    total:0,
    curPage:0
  },
  onLoad(){
    this.getData();
  },
  getData(){
    if(this.data.isLoading){
      return
    }
    this.setData({
      isLoading: true,
    });
    wx.showLoading({
      title: '加载中',
      icon: 'loading',
    });
    wx.request({
      url: app.globalData.domain + '/api/info/news/classify/newsList',
      header: {
        'content-type': 'application/json'
      },
      data: {
        "platform": "2",
        "classifyName": '视频',
        "pageNum": this.data.curPage,
        "pageSize": this.data.pageSize
      },
      method: 'POST',
      success: (results) => {
        if (results.data.code == 0) {
          const list = [...this.data.videoList, ...results.data.data.newsEntityList];
          this.setData({
            videoList: list,
            total: results.data.data.totalCount,
            isLoading:false
          });
        }
      },
      fail: (data) => {
       
      },
      complete: (data) => {
        this.setData({
          isLoading: false
        });
        wx.hideLoading();
      }
    })
  },
  onReachBottom() {
    console.log(2)
    let {
      curPage,
      total,
      isLoading,
      pageSize
    } = this.data;
    if(isLoading){
      return;
    }
    if (curPage > (total / pageSize)) {
      // wx.showToast({
      //   title: '到底了...',
      //   icon: 'none'
      // })
      return;
    }

    this.setData({
      curPage: this.data.curPage + 1
    });

    this.getData();
  },
  goPlayer(e){
    let vid = e.currentTarget.dataset.vid;
    let title = e.currentTarget.dataset.title;
    wx.navigateTo({
      url: `/pages/detail/detail?vid=${vid}&title=${title}`,
    })
  }
})
