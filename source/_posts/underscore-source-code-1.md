---
title: Underscore源码阅读[1]
description: 编程的最佳实践经验的获得就是阅读优秀的代码。
date: 2017-12-25 21:19:52
tags: [underscore]
category: 学习
---

![underscore](http://www.bootcss.com/p/underscore/docs/images/underscore.png)
为了提高自己的`JavaScript`姿势水平，也是在很多人的推荐下，决定阅读**Underscore**源码。
<!-- more -->

## 结构

> 阅读的源码版本为v1.8.2

[Underscore.js 中文文档](http://www.bootcss.com/p/underscore/)

### 代码分析

``` js
(function () {
    // details here
}.call(this));
```

> 整个库被写在一个闭包里面，以免受到别的全局变量的影响。


``` js
var root = this;
```

> 创建root变量 保存this对象 在浏览器中使用时为window对象 在服务器为exports对象

``` js
var previousUnderscore = root._;
```

> 如果root对象下的_变量有值，那么将其存起来

``` js
var ArrayProto = Array.prototype,
    ObjProto = Object.prototype,
    FuncProto = Function.prototype;
```

> 将以上对象的原型保存到变量中，方便后期进行uglify生成minified版本

``` js
var push = ArrayProto.push,
    slice = ArrayProto.slice,
    toString = ObjProto.toString,
    hasOwnProperty = ObjProto.hasOwnProperty;
```

> 创建参考，方便直接使用对象的原型方法

``` js
var nativeIsArray = Array.isArray,
    nativeKeys = Object.keys,
    nativeBind = FuncProto.bind,
    nativeCreate = Object.create;
```

> 声明将要用到的ES5原生方法


``` js
var Ctor = function () {};
```

> 可复用的构造函数用来设置原型

``` js
var _ = function (obj) {
    if (obj instanceof _) return obj;
    if (!(this.instanceof _)) return new _(obj);
    this._wrapped = obj;
}
```

> 创建_变量来作为underscore对象的引用

``` js
  if (typeof exports !== 'undefined') {
    if (typeof module !== 'undefined' && module.exports) {
      exports = module.exports = _;
    }
    exports._ = _;
  } else {
    root._ = _;
  }
```

> 在nodejs环境下用module.exports导出underscore对象 同时还向后兼容require()方法，如果是浏览器环境，则将_作为一个全局变量。

``` js
_.VERSION = 'x.x.x'
```

> 保存版本信息

## 参考资料

[underscore库源码解析](http://www.qdfuns.com/notes/17398/bdfe661cd09171a456fef0a71f785cd7.html)