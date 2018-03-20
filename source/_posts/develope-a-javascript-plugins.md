---
title: 如何开发一个前端js插件
tags: [插件]
date: 2018-03-12 23:44:58
description: 如何开发一个前端js插件。
category: 前端
---

从一个插件源码学习，如何开发出一个JavaScript插件。<!-- more -->

## 最近心得

现在是**2018年3月12日**近0点，突然想写一下博客。

感觉自己最近有些浮躁了，也可能是最近工作有点忙吧，想写的几篇博客，一直没有下手去写。

最近工作最大的感受就是，体会到了**面向接口开发**的重要性。

因为我们公司基本都是走的**面向实现**开发的路子，比如前端写一个新闻详情页面，后端传给前端的数据却是新闻编辑们写出来的富文本，HTML标签上都带着行内样式，这时候按着设计图写出来的样式就会被覆盖了。

当然也并不是没有解决的方法，比如可以通过`!important`来增加样式表样式的权值，达到覆盖行内样式的目的。但是，显然这**不符合最佳实践**，应尽量避免使用此法。

首先，编辑的内容编辑的格式应该是固定的，以此来确保输出的富文本格式相同，或者不要让编辑来输出富文本。


这才是更好的实践。

当然，我主要想说的是，接口的提供最好是在我编写页面之前的。而不是写完页面后，再取根据滞后的接口再去调整样式。

## 打算

先前打算阅读完`Underscore`的源码，却没有坚持下来。

不过我并没有打算放弃，只是觉得`Underscore`的源码还是有点复杂的，我应该从点简单的插件入手，慢慢地去提升。

最近遇到了一个插件`headroom.js`，[Github仓库](https://github.com/WickyNilliams/headroom.js)，这个效果先前在很多公司的官网首页看到过，蛮喜欢的。

所以，打算从这个插件开始吧！

## 总览

整个插件被包裹在一个自执行函数内，再根据全局对象的不同，以AMD规范，CommonJs规范或全局函数的方式导出插件。

``` js

(function (root, factory) {
  'use strict';

  if (typeof define === 'function' && define.amd) {
    // AMD规范 注册为的异步模块
    define([], factory);
  }
  else if (typeof exports === 'object') {
    // COMMONJS规范 将插件构造函数挂在到module的exports属性下
    module.exports = factory();
  }
  else {
    // 浏览器环境 将插件构造函数挂到window对象上
    root.Headroom = factory();
  }
}(this, function () {}));

```

## 源码解读

### 开启严格模式

优点：

- 严格模式变量必须先声明再使用
- 严格模式对象不可有重复的键
- 严格模式下函数的参数不能重复
- 严格模式不能显示修改函数的arguments对象

``` js
"use strict"
```

### 能力检测

将能力检测的结果，全部挂在到features对象上。

``` js
var features = {
    bind : !!(function(){}.bind), // 是否支持Function的bind方法
    classList : 'classList' in document.documentElement, // 是否支持classList API
    rAF : !!(window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame) // 是否支持requestAnimationFrame
};
```

### 请求动画帧

检测请求动画帧API的支持情况，并做兼容处理。

``` js
window.requestAnimationFrame = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame;
```

### 函数去抖工具

创建一个**去抖工具**的构造函数，并且在原型上定义其方法。这个构造函数接收一个回调函数作为参数。

``` js
function Debouncer (callback) {} // 构造函数

Debouncer.prototype = { // 去抖工具原型
    constructor: Debouncer, // 维护构造函数指向
    api: function () {}
};

```

### 工具函数

插件内部定义的普通函数，供插件调用。

#### 函数1

``` js
function isDOMElement(obj) {
    return obj && typeof window !== 'undefined' && (obj === window || obj.nodeType);
}
```

判断一个对象是否为DOM节点，返回布尔值。

`typeof window !== 'undefined'`确保当前为浏览器环境。

`obj === window || obj.nodeType`当前对象等于window或者它有`nodeType`属性。

#### 函数2

``` js
function normalizeTolerance (t) {
    return t === Object(t) ? t : { down : t, up : t };
  }
```

用于格式化tolerance值的函数。

若t是对象，则直接返回，若不是，则以对象的格式返回。

#### 函数3

``` js
function extend (object /*, objectN ... */) {
  if(arguments.length <= 0) { // 无参数报错
    throw new Error('Missing arguments in extend function');
  }

  var result = object || {}, // 结果
      key,
      i;

  for (i = 1; i < arguments.length; i++) { // 迭代参数
    var replacement = arguments[i] || {};

    for (key in replacement) {
      // Recurse into object except if the object is a DOM element
      if(typeof result[key] === 'object' && ! isDOMElement(result[key])) {
        result[key] = extend(result[key], replacement[key]); // 递归
      }
      else {
        result[key] = result[key] || replacement[key];
      }
    }
  }

  return result; // 返回最终结果
}
```

合并多个对象的函数。






