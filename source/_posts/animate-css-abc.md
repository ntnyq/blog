---
title: Animate.css简单学习。
description: H5的时代了，前端不会点动画怎么行。不会设计没关系，animate内置多种动画形式，方便你的使用。
tags: [CSS3, 动画]
category: 学习
---

H5的时代了，前端不会点动画怎么行。不会设计没关系，animate内置多种动画形式，方便你的使用。<!-- more -->

## 介绍

animate.css是一款有趣的跨浏览器动画库，支持多种常见的动画形式，简单易上手，兼容性可以达到IE9+。

## 使用

### 下载

[github地址](https://daneden.github.io/animate.css/)

### 引入

在head元素中，用link标签引入animate.css文件

```
<link rel="stylesheet" href="animate.css" />
```

### 使用

#### 直接使用

在你想要让其有动画的元素上加上animated和动画名字2个类，如下所示：

```
<div class="box animated swing" id="box"></div>
```

默认动画只一次，如果需要无限次可以加上infinite类。

如果需要固定次数或者修改别的动画属性，可以重新定义覆盖掉那些属性：

```
.box {
    animate-duration: 3s;    //动画持续时间
    animate-delay: 1s;    //动画延迟时间
    animate-iteration-count: 4;    //动画执行次数
}
```

#### 动态使用

```
// jquery
$('#box').addClass('animated swing');

// js
document.querySelector('#box').classList.add('animated swing');
```

### 动画结束

可以通过监听动画结束的回调来在动画结束做别的动作

```
$('#box').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', funtion () {
    // doSomething
    })
```


