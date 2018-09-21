---
title: 页面事件和锚点问题
tags: [Events]
date: 2018-09-21 12:57:15
description:
category: 前端
---

公司最近安排的一个小工作，解决两个页面上的小问题。问题1，带`hash`的链接跳转至目标页面后会发生抖动；问题2，IOS Safari浏览器回退后`tab`页效果失效。<!-- more -->

## 情景描述

>  详细阐述问题。

### 问题1

假设有2个页面，一个新闻列表页面，一个是将列表中的所有新闻聚合在一起的一个新闻详情页面。

新闻列表点击通过链接跳转至详情页，同时通过`hash`来定位跳转后的位置。伪代码如下：

``` html
<!-- page1 -->
<a href="page2.html#foo">foo</a>
<a href="page2.html#bar">bar</a>

<!-- page2 --> 
<a name="foo">foo</a>
<a name="bar">bar</a>
```

实际情境是详情页新闻特别多，上百条，是通过服务器渲染的数据。但是在跳转至详情页后，会发生页面先展示最顶端，然后再定位至应该定位的位置的情况。

起初我以为是因为内容太多，导致解析速度降低。

我写了简单的`demo`，生成了`10000`个链接。实际使用在跳转定位时候并没有发生**抖动**的问题。只是有可能因为DOM节点太多引起浏览器崩溃 - -！。

顺便搜索了一下资料，学习了些关于`hash`的知识，整理如下：

- URL中的**#**字符代表页面上的**位置**，是**指定位置标识符**，取`id`的意思。
- **#**可以定位到2种位置，1是有对应`name`属性的位置，2是有对应**id**属性的位置。使用`name`属性只能使用`a`标签。
- **#**符号**只供浏览器**定位使用，在和服务器的`HTTP`交互中，`hash`字段内容并不会被发送。
- 改变**#**符号后的内容**不会**引起浏览器页面的重载，只会让页面跳转至对应的位置。
- 改变**#**符号后的内容会改变浏览器的历史记录。会在**history API**中新增内容，并且可以使用浏览器的**回退**按钮进行回退操作。（不包括IE6和IE7） **Vue Router**的`hash`模式就是基于这一特性的。
- 通过`window.location.hash`可以读取`hash`值，**IE8+**存在`hashchange`事件可检测此变动。
- 谷歌默认不抓取**#**部分的内容，但是可以使用**#!**将其后面的内容转成查询字符串_escaped_fragment_的值 。
- 在页面按下**F5**后，即使**url**后面跟随有锚点，页面不会重新进行定位。这被称为**锚点失效**问题。

### 问题2

问题2描述很简单，就是简单的浏览器发生回退后`tab`效果失效了，但是页面简单地发生滚动就会重新生效。

感觉是页面暂时处于后台了，在一个未被激活的状态，所以它的事件失效了。

查询了一下页面隐藏显示切换的**API**，有两种事件`pageshow/pagehide`和`visibilitychange`。

并且同时知道了如果`a`标签上面有`target=_blank`属性，点击后用新的标签页打开页面后，是不会有`history`记录的，也就是这时浏览器的回退是无效的。只有在同个页面内的跳转才会被`history API`记录。

而`visibilitychange`事件监听的是这种标签处于**前后台**切换的事件。

`pageshow`和`pagehide`则可以监听到浏览器的**前进和回退**，这种历史记录的事件。

两种事件的绑定方式也存在不同，方法如下：

``` js
// 绑定在document上
document.addEventListener('visibilitychange', e => {}, !1);

// 绑定在window上
window.addEventListener('pageshow', e => {}, !1);
```

## 兼容性

`pageshow`事件的兼容性为**IE11+**，详见：

[CanIUse-pageshow](https://caniuse.com/#search=pageshow)

`visibilitychange`事件的兼容性为**IE10+**，详见：

[CanIUse-visibilitychange](https://caniuse.com/#search=visibilitychange)

## 参考资料

[阮一峰-URL的井号](http://www.ruanyifeng.com/blog/2011/03/url_hash.html)

[MDN-pageshow](https://developer.mozilla.org/en-US/docs/Web/Events/pageshow)

[MDN-visibilitychange](https://developer.mozilla.org/en-US/docs/Web/Events/visibilitychange)