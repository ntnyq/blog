---
title: 9月：最近工作总结
description: 到底该不该加班。
date: 2017-09-25 22:04:37
tags: [工作, 总结]
category: 生活
---

半个月多没更新博客了，今天最近在做的项目阶段性验收了，可以短短的休息一下下，总结一下最近的工作生活<!-- more -->

小公司的程序员是什么样儿的？

一个人做一个小项目，每天写上千行代码(`css分行的`)，天天加班到八九点，周末加班(`没有任何加班福利`)，还要帮人事面试前端的应聘者(`还没招到，心累啊`)。

### 项目

最近的工作，一个所谓的大屏项目，大概有10个页面。定制化很高，有着比较炫的设计。主要是做数据展现和图表方面的。

#### 方案

因为设计是`16:9`的页面，而且要求不能出现滚动(`至少在展会时候的16:9屏幕要一屏展现`)。页面炫光类的效果太多，只能切在背景图上面。然后再要求了大屏幕的响应式，在更大分辨率的屏幕上要能保证基本显示正常。

经过思考和实践后，我决定采用rem单位来进行布局，布局方案如下:

``` js
var BASE_FONT_SIZE = 100; // 字体大小基数
var BASE_CLIENT_WIDTH = 1920; // 屏幕尺寸基数
!function (win, doc) {
  var w = win.innerWidth;
  doc.documentElement.style.fontSize = w / BASE_CLIENT_WIDTH * BASE_FONT_SIZE + 'px';
}(window, document);
```

上面这段代码的功能参考了淘宝的[flexible](https://github.com/huainanhai/flexible)。以100像素为`html`元素的字体大小，以`1920px`屏幕为实现基准，再通过rem单位来实现对常用pc端屏幕以及更大屏幕的适配。

设计图给的尺寸是`3200px*1800px`，为了方便样式编写，采用了`less`作为`CSS预处理`预处理器。使用如下`mixin`来编写样式。

``` less
.z(@name, @num) {
  @{name}: @num * (1920 / 3200) / 100rem;
}

// 使用方式
.z(width, 3200); // -> width: 19.2rem;
```

然后直接使用`ps测量的`或者`设计师给出的`尺寸进行样式编写。less会帮我们计算出对应属性在1920px上面对应的以100px为html字体大小的rem值。

#### 需求

项目写的效果很炫，主要用到的插件是echarts。设计师设计的很炫酷，但是在实现的过程中，却遇到了有的不能实现出的效果。

例子：echarts的雷达图里`splitLine`是支持`shadowBlur`的配置的，但是实际生成的雷达图却没有效果。不知道这种情况应该怎么解决。

虽然其实并不影响数据展现的效果。

#### 踩坑

坑真的是太多了。

> 如何在表格里如何实现单行溢出隐藏效果？

原因：td的默认样式是`display: table-cell;`，宽度会进行自动调整。

解决方式：在td里面嵌套一个span元素，然后给span元素设置`display: inline-block;`，再设置单行溢出隐藏的样式。

> 实现渐隐渐现中间更新数据效果，实现逐个展示效果。

渐隐渐现可以使用`jQuery`的`fadeIn, fadeOut, fadeTo, fadeToggle`函数，再配合使用回调函数，`delay`方法来实现。

逐个展示效果。先将数据列表清空，再填充的数据项全部设置为`display: none;`或者`visibility: hidden;`，再用`for循环`配合`setTimeout`来实现。

这里主要注意一个这两者配合的坑。要采用如下的方法实现。

``` js
for (int i = 0, i < n; i++) {
    function(i) {
        setTimeout(function () {
            $items.eq(i).fadeIn();
        }, time * i);
    }(i);
}

// 也可以采用let关键词来实现
```

#### 收获

做好模块化，页面js的编写要实现模块化，要将功能细化为函数，方便互相调用，代码复用以及实现别的功能。

比如 本次项目种要实现的数据列表，自动切换，点击切换等等。

本次项目期间写了一个简单的数字滚动插件，不过存在着一点小bug，连续调用后，生成的滚动间隔竟然是相同的。(`待修复`)

### 工作

最近别的工作使用到的插件

[pdf.js](https://github.com/mozilla/pdf.js)

> PDF预览插件，自带一套不错的UI，功能齐全。

[tagCloud](https://github.com/dynamicguy/tagcloud/blob/develop/src/tagcloud.jquery.js)

> 球状标签云插件，顺便说一下echarts的wordCloud真的是很差。

### 学习

不知道怎么，最近学习感觉进入了一个疲惫期，学习进度明显下降了，收藏了好多文章都没时间学习。可能是最近工作太忙了吧。

还有翻译书的计划，最近给文档接入了`docsify`，不过清楚为什么一直不成功。(`修改中`)

换了电脑后，还一直没有时间安装`wamp`和`mongodb`环境。

安装了`ubuntu`系统后，装搜狗输入法也遇到了问题。

慢慢解决吧。

