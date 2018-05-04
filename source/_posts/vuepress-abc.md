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

Docsify主要更适合做简单地文档不熟工作，虽然主题配色还可以，但是构建后的页面内容仍略显单调。

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

## 配置

> 无配置情况下，`vuepress`会默认打开一个只有顶部标题搜索框和页面主体的页面

而有关于vuepress配置的定制，官方规定全部放置于文档目录下的`.vuepress`目录内。在`.vuepress目录中`创建`config.js`文件，vuepress会自动加载其中的配置。(当然，也可以使用YAML文件等)

该文件需要以`Commonjs`规范向外导出配置，主要配置项如下：

```js
module.exports = {
  title: '程序员不好吃',
  description: '未来的不可知，是我们前进的原动力',
  // base: '/vuepress-demo/'
  themeConfig: {
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Guide', link: '/guide/' },
      { text: 'External', link: 'https://ntnyq.com' },
      {
        text: 'Languages',
        items: [
          { text: 'Chinese', link: '/language/chinese' },
          { text: 'Japanese', link: '/language/japanese' }
        ]
      }
    ],
    sidebar: [
      '/',
      '/home/'
    ],
    repo: 'ntnyq/vuepress-demo',
    repoLabel: 'Github',
    editLinks: true,
    // 默认为 "Edit this page"
    editLinkText: '帮助我们改善此页面！'
  }
};
```

### 标题Title

**页面主标题**  渲染在页面顶部左侧 并且指向站点根目录。

### 描述Description

**页面描述**  以`meta`标签的形式渲染在head标签内部，用于SEO。

### base

**站点路径** 用于部署到自定义域名，或者非`username.github.io`时启用。

### 主题配置项

> 主题配置项时基于主题的，vuepress官方提供了一套默认主题。它的可用配置如下：

#### 导航Nav

**顶部导航**  对象数组 每一项的格式 { text: 'nav_item_name', link: '/your_link/' }

若使用items，且为数组，则会将此导航项渲染为下拉列表的格式。

#### 侧栏sidebar

**侧栏导航**  数组格式 填写导航目标的路径。

#### 仓库Repo

**Github仓库**  点击可以跳转至对应的Github仓库

#### 仓库名RepoLabel

**点击跳转仓库名称**  文本

#### editeLinks

**是否展现编辑文档链接**  布尔值

#### editLinkText

**编辑链接文本**  用于提示 默认为`Edit this page`

### 更多配置

 更多配置请查看[官方配置文档](https://vuepress.vuejs.org/zh/default-theme-config/)

## 样式覆盖

### 简单样式覆盖

需要覆盖默认主题的样式，仅需在`.vuepress`目录下新建`override.styl`

文件，再编写`stylus`文件来覆盖默认样式，如下：

```scss
// showing default values
$accentColor = #3f51b4
$textColor = #2c3e50
$borderColor = #eaecef
$codeBgColor = #282c34
```

### 自定义页面类

通过自定义页面类可以让某个页面拥有独特的样式，要使用这一特性，需要通过如下的方式

首先，在页面的`YAML front matter`中声明一个 **pageClasss**。如下:

```yaml
---
pageClass: custom-page-class
---
```

然后就可以对这个页面进行自定义样式了。

```css
/* .vuepress/override.styl */

.theme-container.custom-page-class {
  /* 特定页面的 CSS */
}
```

## 页面自定义布局

首先在`YAML front matter`中指定布局组件。

```yaml
---
layout: SpecialLayout
---
```

然后，在`.vuepress/components/SpecialLayout.vue`中编写对应布局。

## 自定义主题

在`.vuepress/theme` 文件夹中，创建一个 `Layout.vue` 文件，使用`vuejs`的语法进行开发。

站点和页面的**元数据**可以通过`this.$page`和`this.$site`来获取。

## 结论

敲代码要细心。

学会排查错误和寻找可行答案。

努力争取给开源项目做贡献。


