---
title: 组件开发学习及简单实例
description: 组件开发是协作开发的基础。
date: 2017-05-13 22:04:37
tags: [组件, 前端]
category: 学习
---

组件开发是分组协作开发的实现方式，同时也实现了代码的复用。对前端的优化大有裨益，同时也是面向对象编程的实现，符合开放封闭原则，对代码的重构维护都有极大的优点。<!-- more -->

## 实现步骤

### 第一步 基础

先用假数据做好布局等以及确立好需要创建的元素

### 第二步 构架

将代码放入到如下结构中 防止变量的全局污染
``` js
;(function(win, doc) {
   'use strict'; // 此句可以不加
})(window, document);
```

### 第三步 构造函数
使用以下两种方式创建构造函数

``` js
// 1
function Foo(xx, xx) {

}
// 2
var Bar = function (xx, xx){

}
```

### 第四步 构造函数的原型方法

使用如下方法给构造函数的原型添加方法

``` js
// 1
Foo.prototype.method1 = function () {

};
Foo.prototype.method2 = function () {

};

// 2
Bar.prototype = {
    // constructor: Bar,
    method1: function () {

    },
    method2: function () {

    }
};

// 构造函数原型里 可以通过this对象来引用构造函数的变量
```

### 第五步 创建实例

对象可以通过最后调用函数来创建 也可以通过事件来创建

或者将对象创建的过程 写在init的函数调用中

注意要传递所有的参数 参数是可选的。

### 第六步 将构造函数挂载到全局对象

``` js
win.Foo = Foo;
```

## 注意

> 因为好多元素可能是动态创建的， 所以动态创建的元素要用到事件委托来添加相关的方法
> 给原型绑定事件的时候，因为事件不是发生在原型上 所以要把原型对象存入变量


``` js
var _this = this;

      xxx.onsomething = function (e) {

        _this.method();
      };
```

## 组件开发简单实例

``` js
// js部分

;(function (win, doc) {

  // dom元素
  var $ = function (id) {
    return typeof id === 'string' ? document.getElementById(id) : id;
  };

  // 构造函数
  var Dialog = function (id, str) {

    this.id = id;
    this.str = str;
    this.open = false;
  };

  // 原型方法
  Dialog.prototype = {

    // 初始化
    init: function () {

      this.bindEvent();
    },

    // 展现
    create: function () {
      if (!this.open) {
        var dialog = document.createElement('div'),
            span = document.createElement('span'),
            mask = document.createElement('div');

        span.innerHTML = this.str;
        dialog.id = this.id;
        mask.id = 'mask';

        dialog.appendChild(span);
        document.body.appendChild(dialog);
        document.body.appendChild(mask);

        setTimeout(function () {
          dialog.classList.add('show');
        }, 0);

        this.open = true;
      }
    },

    // 删除
    delete: function () {

      if (this.open) {
        var dialog = $(this.id),
            mask = $('mask');

        setTimeout(function () {
          dialog.classList.remove('show');
        }, 200);


        document.body.removeChild(dialog);
        document.body.removeChild(mask);

        this.open = false;
      }
    },

    // 事件绑定
    bindEvent: function () {

      var _this = this;

      $('open').onclick = function (e) {

        _this.create();
      };

      document.addEventListener('click', function (e) {

        if (e.target && e.target.id === 'mask') {
          _this.delete();
        }
      }, false);
    }
  };

  // 创建实例
  // var createInstance = function () {

  //   var instance;
  //   return instance || new Dialog('dialog', '我是弹窗！');
  // };

  // 操作方法
  // var operate = {

  //   setDialog: null,
  //   open: function () {
  //     this.setDialog = createInstance();
  //     this.setDialog.create();
  //   },
  //   close: function () {
  //     this.setDialog ? this.setDialog.delete() : '';
  //   }
  // };

  // 绑定事件
  // $('open').onclick = function (e) {
  //   operate.open();
  //   e.stopPropagation();
  // };

  // document.body.onclick = function () {
  //   operate.close();
  // };

  win.Dialog = Dialog;

})(window, document);
```

``` html
// html部分
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>对话框组件</title>
  <link rel="stylesheet" href="src/css/style.css" />
</head>
<body>
  <div class="btn-group">
    <button id="open" class="btn btn-primary">弹出</button>
  </div>
  <script src="src/js/main.js"></script>
</body>
</html>
```
```
// css部分
html,
body,
div,
span,
button {
  margin: 0;
  padding: 0;
}
body {
  font-family: "Times New Roman", Times, Baskerville, Georgia, serif;
  font-size: 24px;
}
.btn-group {
  position: absolute;
  bottom: 15%;
  width: 100%;
  text-align: center;
}
.btn {
  display: inline-block;
  padding: 6px 100px;
  border: 1px solid transparent;
  border-radius: 4px;
  line-height: 1.4;
  text-align: center;
  font-weight: 400;
  vertical-align: middle;
  cursor: pointer;
}
.btn-primary {
  background-color: #337ab7;
  border-color: #2e6da4;
  color: #fff;
}
#dialog {
  position: absolute;
  left: 50%;
  top: 10%;
  z-index: 100;
  margin-left: -200px;
  width: 360px;
  height: 260px;
  padding: 20px;
  border: 2px solid #3997ff;
  background-color: #fff;
  box-shadow: 0 5px 15px #999;
  line-height: 1.42;
  text-align: center;
  color: #666;
  transition: all 0.2s ease-in;
  transform: scale(1, 0);
  opacity: 0;
  -webkit-user-select: none;
  cursor: pointer;
}
#dialog.show {
  transform: scale(1);
  opacity: 1;
}
#mask {
  position: fixed;
  z-index: 66;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
}

```



