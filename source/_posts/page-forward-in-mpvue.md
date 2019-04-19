---
title: MPVue中的页面转发
tags: [小程序]
date: 2019-04-19 09:20:37
description: MPVue框架中小程序小程序页面和wev-view跳转页面的转发功能实现。
category: 前端
---

MPVue框架中小程序小程序页面和wev-view跳转页面的转发功能实现。

<!-- more -->

## 基础

首先小程序转发，需要使用到 [__onShareAppMessage__](https://developers.weixin.qq.com/miniprogram/dev/reference/api/Page.html#onshareappmessageobject-object) API。

从文档看，它的语法为：

``` js
Page({
  onShareAppMessage (res) {
    const { webViewUrl } = res
    const title = '我的自定义题'
    const path = `/pages/page_name?a=123`
    const imageUrl = 'https://image.url'
    
    return {
      title,
      path,
      imageUrl
    }
  }
})
```

当点击页面内的转发按钮或右上角的转发菜单时，该函数会被调用，读取相关的配置，返回一个对象作为分享内容的配置，参数如下：

- title 转发时显示的标题  默认为小程序名称
- path 转发路径 默认为当前页的path 必须是以/开头的完整路径
- imageUrl 自定义分享图片，支持PNG和JPG格式，显示图片长宽比为5:4  默认使用当前页面截图

该回调函数可接收1个参数，可以从该参数中读取 __web-view__ 页面的url。



## 原生小程序web-view转发

原理：web-view 的 __src__ 属性设置为动态的。在页面载入时获取分享出去的 `path`，读取上面的 `options` 字段，类似 URL 的  `search` 字段，获取需要的参数。再拼接至当前小程序页面的地址后，重置 web-view 的 __src__ 值。

### wxml

``` html
<view class="container">
  <web-view src="{{ webSrc }}"></web-view>
</view>
```

### js

``` js
Page({
  data: {
    webSrc: 'https://ntnyq.com'
  },
  onShareAppMessage (res) {
    const return_url = res.webViewUrl
    const path = `/pages/index/index?return_url=${encodeURIComponent(return_url)}`

    return {
      path,
      success (res) {
        wx.showToast({
          title: '转发成功',
          icon: 'success',
          duration: 200
        })
      }
    }
  },

  onLoad () {
    const pages = getCurrentPages()
    const currentPage = pages.slice(-1)[0]
    const webSrc = decodeURIComponent(
      currentPage.options.return_url || 'https://ntnyq.com'
    )

    this.setData({
      webSrc
    })
  }
})
```

## MPVue中转发

MPVue中转发基本和原生小程序一致。

web-view页面中有如下差异：

1. 小程序通过 `getCurrentPages` 获取应用的页面栈。再获取当前页面和当前页面的查询参数。而MPVue中则使用 `this.$root.$mp.query` 获取查询参数对象。

### 代码示例

``` vue
<template>
  <div class="container">
    <web-view :src="webSrc"></web-view>
  </div>
</template>

<script>
export default {
  config: {
    navigationBarTitleText: '导航栏标题'
  },

  data () {
    return {
      webSrc: 'https://ntnyq.com'
    }
  },

  onShareAppMessage (res) {
    const returnUrl = res.webViewUrl
    const path = `/pages/tab/paper?return_url=${encodeURIComponent(returnUrl)}`

    return {
      path,
      success (res) {
        wx.showToast({
          title: '转发成功',
          icon: 'success',
          duration: 200
        })
      }
    }
  },

  onLoad () {
    const options = this.$root.$mp.query
    const webSrc = decodeURIComponent(
      options.return_url || 'https://ntnyq.com'
    )

    this.webSrc = webSrc
  }
}
</script>
```

## 展望

早上看了下 [Taro](https://taro.js.org/) 的介绍，打算将小程序技术栈，转至 Taro了，还可以顺便学学 React。

## 参考资料

1. [官方文档-getCurrentPages](https://developers.weixin.qq.com/miniprogram/dev/reference/api/getCurrentPages.html)
2. [官方文档-onShareAppMessage](https://developers.weixin.qq.com/miniprogram/dev/reference/api/Page.html#onshareappmessageobject-object)