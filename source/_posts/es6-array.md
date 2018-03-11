---
title: ES6数组方法及应用介绍
description: ES6非常优雅，我们应该学习并且将它用到工作实践中。
date: 2017-05-03 22:04:37
tags: [ES6, javascript]
category: 学习
---

ES6推出了许多新的语言特性和API，它们使得javascript变得更加强大，更富表现力。
学好ES6可以帮助我们更加优雅搞笑地写代码。本文主要讲解ES6数组方法和应用。<!-- more -->

## ES6数组API

- Array.from（obj）方法，把类数组对象转换成真正的数组，比如set类型
  > 任何拥有length属性的对象都可以用这个方法转为真正的数组，但是对象的key必须是0开始时的数字
- [...类数组]，这是一个扩展方法，可以把类数组转化成真正的数组



## 优雅使用

### 数组去重

``` js
// ES5数组去重
Array.prototype.unique = function(){
  return this.filter(function(value, index, array) {
    return array.indexOf(value) == index;
  });
};
// 调用
var arr = [1,3,5,3,1,6,6,7];
console.log(arr.unique());

```

``` js
// ES6数组去重
Array.prototype.unique = function(){
  return Array.from(new Set(this));
};

// 调用
var arr = [1, 1, 1, 2, 1, 2, 3, 1, '1', '3', true];
console.log(arr.unique());
```

### 数组乱序

[ES6数组乱序](http://www.qdfuns.com/notes/35320/be376f860af8d2b5aace2957a2bed282.html)

``` js
// ES6数组乱序
let random = (max) => Math.floor(Math.random() * max)

let shuffle = (arr) => {
  let len = arr.length,
      result = []
  Array.from(new Array(len)).forEach(() => {
    let num = arr.splice(random(len), 1)
    result.push(...num)
    len--
  })
  return result
}

// 调用
console.log(shuffle([1, 2, 3, 4, 5, 6, 7, 8, 9]))
```

