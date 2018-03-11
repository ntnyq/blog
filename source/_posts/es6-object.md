---
title: ES6对象扩展方法学习。
description: ES6是开发的一种趋势，虽然仍然存在有兼容性问题，但我们可以通过工具将其编译成ES5来使用，而ES6带来的开发效率提升是显著的。
date: 2017-05-09 22:04:37
tags: [ES6, Object]
category: 学习
---

ES6是当前web前端开发的一种趋势，虽然仍然存在有兼容性问题，但我们可以通过工具将其编译成ES5来使用，而ES6带来的开发效率提升是显著的。<!-- more -->

本文是对阮一峰老师的[ECMAScript 6入门](https://github.com/ruanyf/es6tutorial/blob/gh-pages/docs/object.md)中对象扩展一章的学习笔记。

## ES6对象扩展

### 属性的简洁写法

ES6规定了以字面量的形式创建对象时的简洁写法。

- 直接写入一个变量，后面加逗号，则会以变量名做为对象的属性名，以变量值做为对应的属性值。
- 直接写一个变量做为方法名，后面跟括号写入方法参数，接着在大括号里写上函数的内容。

``` js
let name = 'ntnyq';

let user = {
    name,
    sayName () {
        console.log(`My name is ${this.name}!`);
    }
};

console.log(user.name) // ntnyq
user.sayName() // My name is ntnyq!

// 传统写法
var user = {
    name: name,
    sayName: function () {
        console.log('My name is' + this.name + '!');
    }
};
```

### Object.is()

Object.is()方法用于进行`同值相等`的比较，为了解决传统的`===`操作符下，NaN与NaN不相等的情况。

使用方式就是直接传入2个要比较的字面量或者值，然后得到一个布尔值。

它的运算规则，与`===`的效果基本相同。

**不同之处只有两个：一是+0不等于-0，二是NaN等于自身。**

``` js
+0 === -0 // true
NaN === NaN // false

Object.is(+0, -0); // false
Object.is(NaN, NaN); // true
```

### Object.assign()

Object.assign()方法，用于将至少1个对象的可枚举属性合并到目标对象上。

语法

``` js
Object.assign(target, source1, source2, ...);

Object.assign({a: 1}, {b: 2}, {c: 3}); // {a: 1, b: 2, c: 3}
```

**若目标对象与源对象有同名属性，则后面的属性会覆盖前面的**

- 如果参数只有一个对象，那么会直接返回这个对象

- 如果参数不是对象，则会将其转为对象，再返回。

> `undefined`与`null`无法被转换成对象，所以会报错。

- 如果非对象参数没有出现在源对象的位置，这时候如果无法转换为对象，则会跳过这个属性。

> Object.assign拷贝的属性是有限制的，只拷贝源对象的自身属性（不拷贝继承属性），也不拷贝不可枚举的属性。

> Object.assign的拷贝是进行的浅拷贝，数组与对象得到的将会是它们的引用，并且无法拷贝继承得到的属性。

用途：

1. 为对象添加属性
2. 为对象添加方法
3. 克隆对象
4. 合并多个对象
5. 设置默认属性

### Object.keys()

ES5引入了`Object.keys()`方法，返回一个数组，成员是参数对象自身的（不含继承的）所有可遍历（enumerable）属性的键名。

ES6引入了`Object.values()`与`Object.entries()`来返回对象的键值和名与值组成的数组。

``` js
let {keys, values, entries} = Object // 对象的结构赋值

let obj = { a: 1, b: 2, c: 3 };

for (let key of keys(obj)) {
    console.log(key); // ['a', 'b', 'c']
}

for (let key of values(obj)) {
    console.log(values); // [1, 2, 3]
}

for (let key of entries(obj)) {
    console.log(entries); // [['a', 1], ['b', 2], ['c', 3]]
}
```


### 解构赋值

对象的解构赋值用于从一个对象取值，相当于将所有可遍历的、但尚未被读取的属性，分配到指定的对象上面。所有的键和它们的值，都会拷贝到新对象上面。

解构赋值要求等号两边都必须为对象，所以右边如果是`undefined`或者`null`会报错。

解构赋值的`spread`操作符和其后的变量必须处在最后一位，否则会报错。

**解构赋值是浅拷贝**

``` js
let obj = { a: 1, b: 2, c: 3, d: 4};

let { a, b, ...c } = obj

console.log(a) // 1
console.log(b) // 2
console.log(c) // { c: 3, d: 4}
```

