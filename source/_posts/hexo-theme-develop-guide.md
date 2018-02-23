---
title: Hexo博客主题开发小记
tags: [Hexo, Theme]
date: 2017-12-24 21:16:02
description: 学习开发自己的Hexo博客主题，记录一下学习过程。
category: 学习
---

![hexo博客](http://olo2ef5ol.bkt.clouddn.com/hexo)
打算自己写一个Hexo博客主题。
<!-- more -->

## 目标

我用Hexo博客系统，在Github上面搭建了一个[静态博客](https://ntnyq.com/)，记录自己前端学习历程。

主题先前使用的是Material Design风格的[indigo](https://github.com/yscoder/hexo-theme-indigo)主题，换了电脑后，我把博客仓库迁移到新电脑，同时把主题也换成了简约的[Next](https://github.com/iissnan/hexo-theme-next)。

最近工作上页面设计问题一直没有定下来，所以比较闲。简单了解了如何用`Travis CI`去做自动部署，同时也兴起了一个念头\-\-自己写一个**Hexo博客主题**。

想想也是，自己身为一个前端Coder，博客却用着别人的`Theme`是有点蛮丢份的。

不过前端的工作又对设计蛮依赖的，所以我不能保证自己写的很会美观。

当然也不至于太难看。虽然没有什么设计能力，但是审美能力自认为还是有的。

所以打算先把页面结构搭起来，再把页面完成，后期可以考虑自己找点漂亮的站点设计，来写一个能看的过去主题。

自己的主题。

## 技术选择

- 页面 Ejs
- 样式 Less
- 效果 原生JS + CSS3动画
- 图标 Font-awesome

## 目录结构

主题目录如下：

``` bash
├─languages
├─layout
│  └─_partial
│      ├─plugins
│      └─post
├─scripts
└─source
    ├─css
    │  └─_partial
    ├─fonts
    ├─img
    └─js
```

- languages
- layout
- scripts
- source
    - css
        - _partial_
    - fonts
    - img
    - js
