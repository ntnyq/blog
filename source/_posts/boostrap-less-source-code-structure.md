---
title: Bootstrap的LESS源码阅读学习。
description: 阅读学习Bootstrap源码库。
tags: [源码, less, 前端]
category: 学习
---

Bootstrap是一个开发相应损失布局，移动端优先的CSS+javascript库。我想前端估计最让人熟悉的就是bootstrap和jquery。两者都是很基础的东西，但是非常值得去学习的东西。<!-- more -->

## less源码

有阅读bootstrap源码的打算已经蛮久了，不过一直没抽出什么合适的时间，因为阅读源码是需要用心去融入的。

记得前久在qdfuns看了老姚的一篇文章，一个简单的栅格系统的打造，基本上只牵扯到了几个boostrap的几个类，container，row, col-xx-x等，然后还解决了列的排序问题，列的推拉效果，行的嵌套问题等，那时候才现在这里面还有这样的学问，而且实现的很优雅。比如容器有内填充，然后行通过负的外边距来抵消掉这个内填充，列有内填充，两个列之间的内填充形成了gutter。总之觉得蛮优雅的。

看别个说，要真正理解一个框架，那么阅读它的源码就算是必须的。老姚就一直在写系列的文章介绍zepto里的各种方法是如何封装的，感觉上虽然只是个小小的库，但是函数方法的封装蕴含了极大的学问，认真阅读以下，是可以学到好多东西的。

之所以看less版本的源码，是因为前段时间在做vue项目的时候开始学习了gulp和less，真的自动化加上预处理，特别方便。而且我们又有成熟的工具去打包，去load这些代码，而less又有着许多比传统的css更加强大的特性，比如mixin，比如变量，在加上样式写法上的嵌套，个人觉得这种方式写出的代码更加有层次性。有种面向对象的感觉，每个模块相当于拥有一个自身的命名空间。那么对于多人协同开发是有极大的帮助的。

而选择器的嵌套特性是我特别喜欢的一点，让选择变的简单，不用重复去复制粘贴代码。写起来非常节省时间，时间可就是生产力啊。

而boostrap的源码作为一个less项目的样式实例，无疑是非常值得学习的。让我们看看人家大牛是如何使用less的。

## less目录结构

- mixins
  - alerts.less
  - background-variant.less
  - border.radius.lesss
  - button.less
  - center-block.less
  - clearfix.lesss
  - forms.less
  - gradient.less
  - grid-framework.less
  - grid.less
  - hide-text.less
  - image.less
  - labels.less
  - lsit-group.less
  - nav-divider.less
  - nav-vertical-align.less
  - opacity.less
  - pagination.less
  - panels.less
  - progress-bar.less
  - reset-filter.less
  - reset-text.less
  - resize.lesss
  - responssive-visibility.less
  - size.less
  - tab-focus.lesss
  - table-row.less
  - text.emphasis.less
  - text-overflow.less
  - vender-prefix.less
- alerts.less
- badges.less
- bootstrap.less
- breadcrumbs.less
- button-group.less
- button.less
- carousel.less
- close.less
- code.less
- component-animation.less
- dropdowns.less
- forms.less
- glyphicons.less
- grid.less
- input-group.less
- jumbotron.kess
- labels.less
- list-group.less
- media.less
- mixins.less
- modals.less
- navbar.less
- navs.less
- normalize.less
- pager.less
- pagination.less
- panels.less
- popover.less
- print.less
- progress-bar.less
- responsive-embed.less
- responsive-utilities.less
- scaffolding.less
- tables.less
- theme.less
- thumbnails.less
- tooltip.less
- type.less
- unitilies.less
- variables.less
- wells.less


## 具体详解

**alerts.less**

- 说明: 警告框组件
- 作用：警告框组件通过提供一些灵活的预定义消息，为常见的用户动作提供反馈消息。
- 基础类: .alert
- 相关的类:

```
  - .alert-success .alert-info .alert-danger .alert-warning // 警告框背景
  - .alert-dismissible // 警告框可关闭 (依赖js)
  - .alert-link // 警告框中的链接
```


**badges.less**

- 说明：徽章组件
- 作用：给链接、导航等元素嵌套 <span class="badge"> 元素，可以很醒目的展示新的或未读的信息条目。
- 基础类：.badge 放在span中 内容为数字


**bootstrap.less**

-- 说明 编译入门 导入其余所有的less文件


**breadcrumbs.less**

- 说明：面包屑导航/路径导航
- 作用：在一个带有层次的导航结构中标明当前页面的位置。
- 基础类：.breadcrumb 放在列表中ol/ul，内容是li


**button-groups.less**

- 说明：按钮组
- 作用：通过按钮组容器把一组按钮放在同一行里。通过与按钮插件联合使用，可以设置为单选框或多选框的样式和行为。
- 基础类：.btn-group
- 对于按钮组合，应该是 role="group"，对于toolbar（工具栏）应该是 role="toolbar"。


**buttons.less**

- 说明：按钮组件
- 作用：可作为按钮使用的标签或元素。
- 基础类：.btn  为 <a>、<button> 或 <input> 元素添加按钮类（button class）即可使用 Bootstrap 提供的样式。
- 相关类 .btn-default btn-lg/md/sm/xs  // 默认样式和尺寸
- .btn-block // 此类将button的宽度延伸为父级的100%, 但是响应的，按钮会变成**块级元素**。

.active 加身上此类后 表示按钮处于激活状态


**carousel.less**

- 轮播图组件 需要jquery。
- 作用：可作为按钮使用的标签或元素。
- 基础类：轮播主体.carousel .carousel-inner
- 相关类 .carousel-indicators是轮播指示器 .carousel-control是轮播控制器
- 可以加carousel-caption来包含轮播信息。
.active 加身上此类后 表示指示器处于激活状态


**close.less**

- 关闭按钮


**code.less**

- 代码块标签高亮语法 比如kdb, code, pre。


**components-animate.less**

- 组件常用动画封装
- 动画类别有 fade collapse


**dropdowns.less**

- 下拉菜单组件
- 基础类.dropdown
- 相关类caret下拉按钮 dropdown-menu下拉列表
- 需要jquery配合使用 有data-toggle语法 和data-target



**forms.less**

- 表单美化封装
