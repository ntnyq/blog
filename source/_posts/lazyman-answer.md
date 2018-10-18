---
title: 解决lazyMan问题
tags: [Js]
date: 2018-08-05 12:15:55
description: 经典面试题
category: 前端
---

> 尝试解决了一下著名的LazyMan问题，虽然可能代码还不够优雅，不过总算是独立做出来了。

## 问题描述

``` js
// 实现一个LazyMan，可以按照以下方式调用:

LazyMan("Hank")

// 输出:
Hi! This is Hank!

LazyMan("Hank").sleep(10).eat("dinner")

// 输出:
Hi! This is Hank!

// 等待10秒..
Wake up after 10
Eat dinner~

LazyMan("Hank").eat("dinner").eat("supper")

// 输出:
Hi This is Hank!
Eat dinner~
Eat supper~

LazyMan("Hank").sleepFirst(5).eat("supper")

// 等待5秒后输出：
Wake up after 5
Hi This is Hank!
Eat supper
```

## 我的答案

``` js
var lazyMan = function (name) {

  var _this = this;

  if (_this instanceof lazyMan) {

    _this.tasks = [];
    _this.greet(name);

    setTimeout(function () {
      _this.run();
    });

    return _this;
  } else {

    return new lazyMan(name);
  }
};

lazyMan.fn = lazyMan.prototype;

lazyMan.fn.run = function () {

  var _this = this,
      tasks = _this.tasks;

  if (tasks.length) {

    var task = tasks.shift();

    setTimeout(function () {

      console.log(task.str);
      _this.run();
    }, task.time * 1000 || 0);
  }
};

lazyMan.fn.greet = function (name) {

  var _this = this;

  _this.tasks.push({ str: 'Hi, this is ' + name });

  return _this;
};

lazyMan.fn.sleep = function (num) {

  var _this = this;

  _this.tasks.push({ str: 'Wake up after ' + num, time: num });

  return _this;
};

lazyMan.fn.eat = function (meal) {

  var _this = this;

  _this.tasks.push({ str: 'Eat ' + meal });

  return _this;
};

lazyMan.fn.sleepFirst = function (num) {

  var _this = this;

  _this.tasks.unshift({ str: 'Wake up after ' + num, time: num });

  return _this;
};

// test
lazyMan('Ntnyq').sleep(3).eat('lunch').sleepFirst(5);
```

### 总结

首先，要实现方法的链式调用，简单来通过面向对象(基于原型)的实现，就是把方法绑定到原型上，再每次调用原型上的方法后把实例(this)又返回。

那么从含义上理解，`sleep`，`eat`，`sleepFirst`都是`lazyMan`的方法，而调用它传入的参数则是一条属性，但同时它也需要函数去返回。

再者，需要依次将所有的方法加入到事件执行的**数组**中，再开始执行这些方法，同时还要将名字也打印出来。
另外，加入事件的顺序和最终事件执行的顺序是不同的，有的事件需要延后执行，有的需要最早执行(优先级)，但总体执行事件是异步的过程，加入事件是同步的。每执行一个事件后，要接着执行下一个事件。

那么，我们需要的逻辑如下：

1. 使用安全的类创建一个对象，并且传入属性`名字`，同时生成一个保存任务的数组。并同时加入一个`say Hello`的事件。再开始异步地去调用触发这些任务的方法。

2. 依照链式顺序执行所有函数，将需要执行输出的文字和时间做为参数放入事件栈中。默认时间为0(其实setTimeout函数因为异步的关系，执行间隔最少也需要几毫秒)，并且在特性的条件下`(sleepFirst)`将任务`unshift`入数组。

3. 链式的方法全部进入数组，异步的方法调用触发，依次从任务数组里拿出任务并执行。

## 大神实现

[lazyman问题\-前端网老姚](https://www.qdfuns.com/article/17398/a59c562b2d09616623015b9df58b067c.html)