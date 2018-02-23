---
title: JavaScript面向对象之对象创建
description: 如何使用Javascript语言创建对象，并且介绍面向对象编程方式的特点。
tags: [面向对象, OOP]
category: 学习
---

实例代码使用了ECMAScript2015语法。因为学习ES6很有必要，所以平时应该多抓住机会练习。本文主要整理一下JavaScript中类的创建的相关知识。<!-- more -->

## 面向对象

面向对象(Object-Oriented)是一种抽象编程的模式。

其核心思想是将一切事物都可以抽象地看做是类(JavaScript在ES6前并没有类，但是我们可以通过代码模拟出类的功能)，对象是由类创建出来的实例，然后对象可以拥有创建它的类的构造函数定义的的属性和方法，在代码编写中也就是变量和函数。

面向对象的编程方式可以有效地提高系统的灵活性，代码的复用性和软件的可扩展性。可以使程序更加便于分析、设计和理解。

本文我们将会从对象的创建来开始学习面向对象的编程方式在JavaScript中的实现。


## 创建方式

以下是几种常见的JavaScript中创建对象的方式。

### 简单工厂模式

简单工厂模式的解决方案是创建一个工厂函数，在函数里创建一个Object对象的实例，然后将此工厂函数所有的参数都赋值给创建的对象，最后再将这个对象返回。

```
// 工厂函数
let Person = (name, job, age) => {
  let o = new Object()
  o.name = name
  o.job = job
  o.age = age
  o.intro = () => {
    console.log(`My name is ${name}, my job is a ${job}, and my age is ${age} years old.`)
  }
  return o
}

// 创建对象
let p1 = Person('ntnyq', 'fe', 25)
// 属性查看
console.log(p1.name) // 'ntnyq'
console.log(p1.job) // 'fe'
console.log(p1.age) // 25
// 方法调用
p1.intro() // 'My name is ntnyq, my job is a fe, and my age is 25 years old'
```

### 构造函数模式

使用构造函数创建对象是这样的，先使用new操作符创建出一个对象foo，并且使foo.__proto__ = Foo.prototype，再调用Foo.apply(foo, arguments)。

```
// 构造函数
let Person = function (name, job, age) {
  this.name = name
  this.job = job
  this.age = age
  this.intro = () => {
    console.log(`My name is ${name}, my job is a ${job}, and my age is ${age} years old.`)
  }
}

// 创建对象
let p1 = new Person('ntnyq', 'fe', 25)
// 属性查看
console.log(p1.name) // 'ntnyq'
console.log(p1.job) // 'fe'
console.log(p1.age) // 25
// 方法调用
p1.intro() // 'My name is ntnyq, my job is a fe, and my age is 25 years old'

// 另外创建一个对象
let p2 = new Person('emmet', 'rd', 23)

// 比较2个对象的方法
console.log(p1.intro === p2.intro) // false
```

> 后面暴露出一个问题，就是我们在创建不同的对象的时候，构造函数会给每个对象都生成它各自的方法，这些方法是不同的。这是很耗费性能的。下面的原型模式可以帮助我们解决。

**ES6的箭头函数有着this指向不变的特点，但是在构造函数中要改变this的指向，所以是不能通过箭头函数来定义构造函数的，也不能通过箭头函数来扩展对象的原型方法**

### 原型模式

原型模式上面可以定义创建出的对象所共用的方法，避免同样的方法被多次创建，浪费内存。理解原型模式，需要深刻理解JavaScript中原型链的相关知识。

```
// 定义构造函数
let Person = function () {}
// 在原型上写方法
Person.prototype = {
  constructor: Person,
  name: 'ntnyq',
  job: 'fe',
  age: 25,
  intro () {
    console.log(`My name is ${this.name}, my job is a ${this.job}, and my age is ${this.age} years old.`)
  }
}

// 创建对象
let p1 = new Person()

// 属性查看
console.log(p1.name) // 'ntnyq'
console.log(p1.job) // 'fe'
console.log(p1.age) // 25

// 方法调用
p1.intro() // 'My name is ntnyq, my job is a fe, and my age is 25 years old'

// 另外创建一个对象
let p2 = new Person()

// 比较2个对象的方法
console.log(p1.intro === p2.intro) // true
```

### 混合模式

事实上我们在开发过程中使用的最多的还是混合模式，我们在构造函数内定义实例的属性，在原型上定义公有的属性的方法。这样可以实现每个实例有自己的特征，又大限度的节省了内存。而且这种模式中，还可以向构造函数传递参数来创建实例。

```
// 构造函数
let Person = function (name, job, age) {
  this.name = name
  this.job = job
  this.age = age
}
// 原型
Person.prototype = {
  constructor: Person,
  intro () {
    console.log(`My name is ${this.name}, my job is a ${this.job}, and my age is ${this.age} years old.`)
  }
}

// 通过传入参数创建2个实例
let p1 = new Person('ntnyq', 'fe', 25)
let p2 = new Person('emmet', 'rd', 24)

// 属性查看
console.log(p1.name) // 'ntnyq'
console.log(p1.job) // 'fe'
console.log(p1.age) // 25
console.log(p2.name) // 'emmet'
console.log(p2.job) // 'rd'
console.log(p2.age) // 24
// 方法调用
p1.intro() // 'My name is ntnyq, my job is a fe, and my age is 25 years old'
p2.intro() // 'My name is emmet, my job is a rd, and my age is 24 years old'

console.log(p2.intro === p1.intro) // true
```

### 安全构造函数

我们都知道，用构造函数创建一个实例需要使用new关键字，而在实际的生产中，我们可能会因为一时疏忽忘记写new了，而这样的小bug甚至可能会让我们花大工夫去寻找。

```
let Person = function (name, job, age) {
  this.name = name
  this.job = job
  this.age = age
}

let p1 = Person('ntnyq', 'fe', 25)

// 此种情况 函数会在全局环境中执行 属性会被挂载到全局对象上
// 浏览器中为window node中为global
console.log(p1.name) // undefined
console.log(p1.job) // undefined
console.log(p1.age) // undefined

console.log(window.name) // 'ntnyq'
console.log(window.job) // 'fe'
console.log(window.age) // 25
```

事实上我们可以通过使用安全构造函数来解决这个粗心导致的毛病。当然我们的编码是很严肃的，该有new关键字的地方还是得使用。

```
let Person = function (name, job, age) {
  if (this instanceof Person) { // 检查this指向是否是构造函数的实例
    this.name = name
    this.job = job
    this.age = age
  } else { // 若不是则调用构造函数
    return new Person(name, job, age)
  }
}

let p1 = Person('ntnyq', 'fe', 25) // 没有new关键字

console.log(p1.name) // 'ntnyq'
console.log(p1.job) // 'fe'
console.log(p1.age) // 25
```

## 参考资料

`JavaScript设计模式——张容铭 著`第二章

