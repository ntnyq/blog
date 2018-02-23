---
title: 如何在一个网页中显示外部页面?
tags: [前端]
date: 2018-01-30 10:37:05
description: 如何在一个网页中显示多个外部页面。
category: 学习
---

如果是你碰到这样的需求，你会如何去解决？
<!-- more -->

今天在[Segment Fault](https://segmentfault.com/q/1010000013037588)看到的这个问题。我的第一反应就是使用**Iframe**来实现。

但是题主明确说明了，需要**非Iframe**的实现方式。因为`iframe`会导致**内存泄漏**。

**Iframe会导致内存泄漏？**

我还没有接触过这类问题，正好学习一下。

查了一下资料，发现Iframe已经是一个过时的技术了，已被新的技术所取代。现在更推荐使用**Embed**标签来进行页面和资源的嵌入，它定义了一个外部应用程序的容器。

而**Iframe**则存在着以下几个坑点：

1. Iframe相当于打开一个网页，同时会请求嵌入页面资源，但是又无法释放内存。
2. Iframe会阻塞主页面的`onload`事件，必须在页面嵌入结束才触发。
3. Iframe和主页面共享连接池，浏览器对同个域的连接有限制，会影响页面对资源的并行下载。
4. Iframe在移动端的支持并不好。
5. Iframe对统计代码不友好。
6. Iframe的尺寸自适应问题是个坑。

参考: [为什么前端尽量少用iframe？](https://www.zhihu.com/question/23683645)

## 实现

那么除了**Iframe**，我们可以如何去实现上述需求呢。

### Object标签

object 标签 它定义了HTML文档中的嵌入对象。可用于HTML文件和多媒体内容，如音频，视频，小程序，ActiveX，PDF和Flash或其他插件）。

``` html
<object data="http://stackoverflow.com" width="400" height="300" type="text/html">
    Alternative Content
</object>
```

### Embed标签

embed 嵌入标签。它定义了一个外部应用程序的容器，例如一个插件，也可以用于显示一个HTML页面。

``` html
<Embed src="http://stackoverflow.com" width="400" height="300" />
```

## 参考资料

[How to Show External website inside another page without iFrame?](https://stackoverflow.com/questions/39102215/how-to-show-external-website-inside-another-page-without-iframe#)