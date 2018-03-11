---
title: 拖拽API简单应用
description: H5提供了更简单易用的拖拽API，在现代浏览器也有着比较好的兼容性。
date: 2017-09-28 22:04:37
tags: [h5, 拖拽]
category: 学习
---

拖拽是网页交互的一种更加友好的方式。H5提供了和利用鼠标事件去实现相比更加简单易用的拖拽API，我们可以通过使用它们为用户提供更优秀体验的应用。<!-- more -->

## 拖拽元素

浏览器内默认除了图片以外的元素，基本都是不可拖动的。而如果我们希望任意一个元素可以拖动的话，可以通过给这个元素设置`draggable="true"`属性来实现。

例如我们有一个div元素，我们希望它是可拖动的：

``` html
<div class="aim" id="aim" draggable="true"></div>
```

### 事件

- dragstart 在可拖动元素开始被拖动的时候触发

- drag 在开始拖动和结束之间连续触发，与鼠标移动无关

- dragend 在可拖动元素停止拖动或者放置后触发

## 放置元素

- dragenter 在可拖拽元素一部分进入被放置的元素时候触发

- dragover 在进入目标元素和离开目标元素之间连续触发

- drop 在目标元素上面释放拖动元素的时候触发

- dragleave 在可拖拽元素全部离开被放置的元素时候触发

> 要想元素能够被放置，必须在dragover事件上阻止默认。

## demo

``` html
// html
<div class="aim" id="aim" draggable="true"></div>
<div class="box" id="box"></div>

// css
.aim {
  width: 120px;
  height: 30px;
  border-radius: 3px;
  margin: 50px auto;
  background-color: #005aaa;
}
.box {
  width: 200px;
  height: 200px;
  margin: 100px auto;
  border: 10px solid #999;
}

// js
// 拖拽目标元素
aim.ondragstart = (e) => {
  aim.style.backgroundColor = 'yellow';
  console.log('dragstart触发');
};

aim.ondrag = (e) => {
  aim.style.backgroundColor = 'red';
  console.log('drag触发');
};

aim.ondragend = (e) => {
  aim.style.backgroundColor = 'green';
  console.log('dragend触发');
};

// 放置目标元素
box.ondragenter = (e) => {
  box.style.borderColor = 'red';
  console.log('dragenter触发');
};

box.ondragover = (e) => {
  box.style.borderColor = 'yellow';
  console.log('dragover触发');
  e.preventDefault();
};

box.ondragleave = (e) => {
  box.style.borderColor = 'blue';
  console.log('dragleave触发');
};

box.ondrop = (e) => {
  box.style.borderColor = 'green';
  console.log('drop触发');
};
```

## 浏览器兼容性

关于h5拖拽的兼容性，可以参考[Can I Use?](http://caniuse.com/#search=drag)

可以看出ie6+就部分兼容了h5原生拖拽API。

而现代的PC端标准浏览器对拖拽API有着很好的兼容性。

而移动端因为本来就是支持多点触控的，所以并不需要浏览器去提供支持。

## 高级应用

> 心有多大，应用就有多广泛。

1. 拖动文件上传
2. 购物车等应用
3. 拖动生成页面元素
4. ...

