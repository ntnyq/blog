---
title: 初试静态站点生成器Vuepress。
tags: [Vue, website]
date: 2018-04-19 23:08:14
description: Evan You新开源的基于Vue的前端站点生成器项目。
category: 学习
---

4月12日，`Vue.js`框架的创始人**尤雨溪**发布了一款新的基于`Vue`的静态网站生成器。本着跟上技术的潮流的想法和对技术的热爱💕，最近两天我利用休息时间踩坑学习，终于在刚才成功运行项目，生成了预期中的页面，顺便写篇博文来记录一下。

<!-- more -->

## 介绍

[Vuepress](https://vuepress.vuejs.org/)是一款基于`Vue.js`的**简洁至上**的**高性能**的静态网站生成器。

它主要拥有以下特性：

1. 开发配置简单，容易上手
2. 支持在Markdown中使用Vue组件
3. 支持使用Vue自定义主题
4. 每个页面运行时都是单页应用
5. 服务端渲染，有利于SEO
6. 使用webpack进行构建打包

> 目前项目的版本是`v0.7.0`，仍然处于一个版本快速更迭的时间段。不过我相信，以`Vuejs`的强大影响力和社区，这个项目很快就会有很多扩展，主题等。

## 静态站点生成器

提到**静态**站点生成器，目前这样的项目不在少数，尤其是在有了**Node**后。前端们用静态站点来做一些文档部署类的工作，这种需求下我们根本不需要一个重量的服务器，更不需要数据库。我们只需要把自己写的文档生成预期中的`HTML`页面即可。

目前比较流行的静态站点生成器，我试用过以下4种。

### Jekyll

[Jekyll官网](https://jekyllrb.com/)

Jekyll是一个简单的静态博客生成器，**需要使用Gem**来进行安装。

同时，它也是**Github**默认支持的`Github-pages`页面的生成工具。

个人觉得，它如果使用的是node进行安装会更受欢迎。

### Hexo

[Hexo](https://hexo.io/)

Hexo是一个快速、简单的强力博客框架，它拥有大量主题和相关功能扩展。

[我的个人博客](https://ntnyq,com)就使用了`Hexo`的`next`主题。

BTW，Hexo是使用Node进行安装的。

### Gatsby

[Gatsby](https://www.gatsbyjs.org/)

Gatsby是一款基于`React.js`的静态网站生成项目。

个人比较喜欢一款名叫[Casper](https://github.com/haysclark/gatsby-starter-casper)的`Starter`。（与别的博客系统的主题有类似，也有区别）

所以构建了一份博客代码放到VPS上去了。

### Docsify

[Docsify](https://github.com/QingWei-Li/docsify)

Docsify主要更适合做简单地文档部署工作，虽然主题配色还可以，但是构建后的页面内容仍略显单调。

不过它配置起来也很简单，只需要在初始化的页码里加上可能需要用到且需要修改的即可。

而大多的比如主题文件，构建需求的配置只组要引入文件即可，

## 踩坑记录

首先，跟着官方文档里介绍的做，全局安装`vuepress`，再创建`README.md`文件，然后执行`vuepress dev`命令。

``` bash
$ npm install vuepress -g

$ echo "# Hello world" > READMD.md

$ vuepress dev .
```
> 注意`dev`后的**.**表示当前路径。这是我写这篇博文的时候才看出来的，先前我一直输入的是`vuepress dev`所以根本无法构建成功。

其次另一个问题，全局安装`vuepress`模块后，再在项目依赖内安装`vuepress`，启动项目会提示一系列错误，具体见[Issue-Module build failed: CssSyntaxError](https://github.com/vuejs/vuepress/issues/33)。Issue下面有人提到了全局和项目内的依赖都安装了`vuepress`会导致构建出错的问题。

在看到这个`Issue`之前，我在`Win`、`Mac`上都做了尝试，分别都使用了`NPM`和`Yarn`来安装依赖，都没能解决问题，反而让我感觉到快要怀疑自己的智商了😂😂😂

在不知道如何去解决的情况下，尝试去`Github`看看`Issue`，想知道是否有人和我一样，也遇到了这种百思不得其解的问题。很幸运地找到了那条`Issue`。

所以，周末可以好好折腾一下`Vuepress`了，试试它的各种配置，和自动化构建部署的流程。

## 结论

敲代码要细心。

学会排查错误和寻找可行答案。

努力争取给开源项目做贡献，


