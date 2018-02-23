---
title: 面向对象三大特征之JavaScript版
description: 面向对象三大特性继承、封装和多态在JavaScript中的实现。
tags: [oop, 面向对象]
category: 学习
---

最近在看《JavaScript设计模式》这本书，学习如何用最佳实践去组织代码。这本书的第二章简单讲了一下面向对象的实现，所以再深入学习一下，本文主要讲述面向对象的三大特性在JavaScript中的实现。<!-- more -->

## 三大特性

面向对象编程(OOP)有着三大特性，分别是**继承**、**封装**和**多态**。

### 继承

继承指的是一个类可以拥有另一个类的属性和方法，并且可以对其方法进行重写。这样的类的关系在传统的面向对象语言中，我们称其为父类和子类。而JavaScript在ES6以前并没有严格的类的定义，不过我们可以通过JS语法的特点模拟出继承的特性，而且更加灵活。

#### 类式继承

**类式继承的方法是将父类的实例赋值给子类的原型**。

```
// 父类
function SuperClass () {
  this.superValue = true
}
// 添加方法
SuperClass.prototype.getSuperValue = function () {
  return this.superValue
}
// 子类
function SubClass () {
  this.subValue = false
}
// 继承父类
SubClass.prototype = new SuperClass()
// 为子类添加方法
SubClass.prototype.getSubValue = function () {
  return this.subValue
}
// 用子类实例化对象
let s = new SubClass()
// 调用父类方法
console.log(s.getSuperValue())
// 调用子类方法
console.log(s.getSubValue())

// 检查实例
console.log(s instanceof SuperClass) // true
console.log(s instanceof SubClass) // true
console.log(SubClass instanceof SuperClass) // false // 只检验是否实例 不检验继承关系
console.log(SubClass.prototype instanceof SuperClass) // true
console.log(s instanceof Object) // true Object是所有对象的祖先
```

缺点：

1. 若父类的共有属性中有引用类型，那么此属性会在类的所有实例中共用。一个实例更改了此引用类型后会影响别的实例的此属性。
2. 因为类式继承依靠的是子类的原型指向实例化的父类对象，但是在实例化的过程是无法传递参数的，因此也就无法对父类的属性进行初始化。

```
// 父类
function SuperClass () {
  this.books = ['js', 'jq', 'bs']
}
// 子类
function SubClass () {}
// 继承父类
SubClass.prototype = new SuperClass()

let s1 = new SubClass()
let s2 = new SubClass()

console.log(s2.books) // ['js', 'jq', 'bs']
s1.books.push('vue')
console.log(s1.books) // ['js', 'jq', 'bs', 'vue']
console.log(s2.books) // ['js', 'jq', 'bs', 'vue']
```

#### 构造函数继承

构造函数继承解决了上面的引用类型属性共用问题。

`SuperClass.call(this, id)`这句代码把子类中的变量在父类中执行了一遍，而且将属性方法绑定在了this上。

因为这种继承方法并没有涉及原型，所以父类原型上的方法不会被子类继承。

而如果想要被子类继承，就需要把这个方法放在父类的构造函数里，但是这样创建出来的实例会每个都有单独的此方法不能共用，违背了代码的复用原则。

```
// 父类
function SuperClass (id) {
  this.books = ['js', 'jq', 'bs']
  this.id = id
}
// 父类原型方法
SuperClass.prototype.showBooks = function () {
  console.log(this.books)
}
// 子类
function SubClass (id) {
  // 继承父类
  SuperClass.call(this, id)
}

let s1 = new SubClass(10)
let s2 = new SubClass(11)

console.log(s2.books) // ['js', 'jq', 'bs']
console.log(s1.id) // 10
console.log(s2.id) // 11
s1.books.push('vue')
console.log(s1.books) // ['js', 'jq', 'bs', 'vue']
console.log(s2.books) // ['js', 'jq', 'bs']
// 不能继承父类原型上的方法
s1.showBooks() // s1.showBooks is not a function
```

#### 组合继承

组合继承结合了类式继承和构造函数继承2者的优点，又解决了2者的问题。

```
// 父类
function SuperClass (name) {
  this.books = ['js', 'jq', 'bs']
  this.name = name
}
SuperClass.prototype.getName = function () {
  console.log(this.name)
}
// 子类
function SubClass (name, time) {
  // 继承父类
  SuperClass.call(this, name)
  this.time = time
}
// 类式继承 子类原型继承父类原型
SubClass.prototype = new SuperClass()
SubClass.prototype.getTime = function () {
  console.log(this.time)
}

let s1 = new SubClass('ng', 2015)
let s2 = new SubClass('react', 2016)

s1.books.push('node')
console.log(s1.books) // [ 'js', 'jq', 'bs', 'node' ]
s1.getName() // 'ng'
s1.getTime() // 2015

console.log(s2.books) // [ 'js', 'jq', 'bs' ]
s2.getName() // 'react'
s2.getTime() // 2016
```

小缺点：使用构造函数继承父类时候执行了一遍父类函数，实现子类原型式继承的时候又执行了一次父类函数。

#### 原型式继承

原型式继承是对类式继承的一个封装，其中的过渡对象相当于类式继承里的子类，不过它的目的是为了创建将要返回的新的实例化对象。

但是它创建的继承关系仍然存在着类式继承的缺点。后期类似地发展为了Object.create()方法。

```
// 原型式继承
function inheritObject (o) {
  // 声明一个过渡函数对象
  function F () {}
  // 过渡对象的原型继承父对象
  F.prototype = o
  // 返回一个过渡对象的实例，该实例的原型继承了父对象
  return new F()
}

// 使用方式
var book = {
    name: 'js',
    alikeBook: ['html', 'css']
}
var o = inheritObject(book)
console.log(o.name) // 'js'
console.log(o.alikeBook) // ['html', 'css']
```

#### 寄生式继承

### 封装

封装指的是类对其拥有的属性或者方法的暴露和隐藏。通过封装可以实现类的属性或者方法的私有化，避免被访问或者修改。

在JavaScript中，作用域是由函数来分割的，声明在函数内部的变量和方法在函数外部是无法访问到的。我们可以通过这一语言特性来创建类的**私有方法**和**私有属性**。

在函数的内部，通过this创建的变量和函数，在类创建对象的时候，每个对象都会自动生成一份并且可以在外部访问和修改。因此通过this创建的方法和属性可以看做是对象的**公有方法**和**公有属性**。

并且通过this创建的方法，不仅可以访问this创建的公有属性和公有方法，还能访问到类创建时或者对象自身的私有属性和私有方法。由于这些方法的权力较大，我们讲其称为**特权方法**

在对象创建的过程中，通过使用这些方法，我们可以实例化对象的一些属性。因此，这些在创建对象时候调用的方法还可以看做是类的**构造器**。

在类的外面通过点语法创建的属性和方法可以通过类来使用，它们被称为是类的静态共有属性和静态共有方法。

通过`prototype`创建的属性和方法在类实例的对象中是可以通过this来访问到的。它们被称为是**共有属性**和**共有方法**。

```
let Book = function (id, name, price) {
  // 私有属性
  let num = 17
  // 私有方法
  let checkId = () => {
    console.log('checkId')
  }
  // 特权方法
  this.getName = () => {}
  this.getPrice = () => {}
  this.setName = () => {}
  this.setPrice = () => {}
  // 公有属性
  this.id = id
  // 对象公有方法
  this.copy = () => {}
  // 构造器调用
  this.setName(name)
  this.setPrice(price)
}

// 类静态公有属性(对象无法访问)
Book.isChinese = true
// 类静态公有方法(对象无法访问)
Book.resetTime = () => {
  console.log('New Time!')
}
// 公有属性和公有方法
Book.prototype = {
  isJSBook: false,
  display: () => {
    console.log('Display!')
  }
};

// 创建对象
let book = new Book(123, 'JavaScript设计模式', 50)

// 私有属性和方法
console.log(book.num) // undefied
book.checkId() // book.checkId is not a function
// 原型上的属性和方法
console.log(book.isJSBook) // false
book.display() // 'Display!'
// 类的对象公有属性
console.log(book.id) // 123
// 类静态公有属性和方法
console.log(book.isChinese) // undefied
console.log(Book.isChinese) // true
Book.resetTime() // 'New Time!'
```

总结 我们通过类创建对象：

1. 类里面新声明的属性和方法是**对象**无法访问的(私有属性和方法)
2. 挂载在this上方法可以访问私有属性和方法，还可以访问原型上的属性和方法(特权方法)
3. 原型上的方法，不可以调用类里面的方法，因为要遵循原型链的规定。
4. 类自身上还可以挂载其他的方法和属性，但是必须通过类名去访问。(静态属性和方法)

#### 闭包实现封装

```
// 创建闭包
let Book = (function (newId, newName, newPrice) {
  // 静态私有变量
  let bookNum = 0
  // 静态私有方法
  let checkBook = (name) => {}
  // 创建类
  function _book (newId, newName, newPrice) {
    // 私有变量和方法
    var name, price
    function checkId () {}
    // 特权方法
    this.setName = (n) => {
      name = n
    }
    this.setPrice = (p) => {
      price = p
    }
    // 读取私有变量
    this.getName = () => {
      console.log(name)
    }
    this.getPrice = () => {
      console.log(price)
    }
    // 公有属性
    this.id = newId
    // 公有方法
    this.copy = () => {}
    bookNum++
    if (bookNum > 100) {
      throw new Error('我们仅出版100本书')
    }
    // 构造器 // 设置私有变量
    this.setName(newName)
    this.setPrice(newPrice)
  }
  // 构建原型
  _book.prototype = {
    // 静态公有属性
    isJSBook: false,
    // 静态公有方法
    display: ()=> {}
  }

  return _book // 返回对象
})() // 闭包结束

// 实例化对象
let book = new Book(123, 'ntnyq的博客', 232)

// 通过特权方法成功读取了私有变量
book.getName() // 'ntnyq的博客'
book.getPrice() // 232
```

闭包实现的封装里的思想是，通过new来将实例化的对象的this指向了闭包返回的对象。而闭包返回的是一个函数，这个函数通过自执行创建内部实例化的对象。函数内部因为作用域链的关系，还可以访问类的属性和方法。

### 多态