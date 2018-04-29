---
title: CSS小技巧
description: 能用CSS实现的，就用CSS来实现。
date: 2017-07-12 22:04:37
tags: [CSS, 前端]
category: 学习
---

日常常用css效果收集，持续更新。方便自己查阅。<!-- more -->

## 单行多行文本溢出隐藏

``` css
// 仅支持PC端webkit内核浏览器和移动端
// less mixin写法 需要给出宽度

.ellipsis-x (){
   white-space:nowrap;
   text-overflow:ellipsis;
   overflow:hidden;
}

.ellipsis-y () {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
}
```


## 滚动条美化

``` css
// 常用属性 前3个
// 全局修改所有的滚动条样式 也可以写在选择器后局部修改

::-webkit-scrollbar // 滚动条整体
::-webkit-scrollbar-thumb // 滑块样式
::-webkit-scrollbar-track // 轨道样式
::-webkit-scrollbar-button // 轨道两端
::-webkit-scrollbar-track-piece // 轨道内层
::-webkit-scrollbar-corner // 滚动条交汇处
::-webkit-resizer // 交汇处 控制元素尺寸控件
```

## placeholder样式修改

``` css
/* 兼容 修改 placeholder默认颜色 */
::-webkit-input-placeholder {
  /* WebKit browsers */
  color: #666;
}
:-moz-placeholder {
  /* Mozilla Firefox 4 to 18 */
  color: #666;
  opacity: 1;
}
::-moz-placeholder {
  /* Mozilla Firefox 19+ */
  color: #666;
  opacity: 1;
}
:-ms-input-placeholder {
  /* Internet Explorer 10+ */
  color: #666;
}
```

## 多行文本末行自定义对齐方式

> 做类似互发消息的需求时候可以用的到的属性。因为有消息的发送者和接受者，如果发送消息特别短，那么就应该是两端对齐的，而如果发送多行消息。末行就会向两端对齐，不符合人的阅读规律，可以使用此属性来修复。

``` css
text-align-last // 设置或检索一个块内的最后一行的对齐方式

可选值
auto：无特殊对齐方式。
left：内容左对齐。
center：内容居中对齐。
right：内容右对齐。
justify：内容两端对齐。
start：内容对齐开始边界。
end：内容对齐结束边界。
```

**IE浏览器下，要使用此属性，要先设置`text-align: justify;`**

## 巧用定位定义出获取剩余高度的区域

假如我们需要页面有60像素的页头，60像素的页脚。然后主体占所有的页面剩余高度，但是总高度不允许超过页面高度的100%。

解决这个问题有以下方法：

```css
// 公共样式
html,
body {
  width: 100%;
  height: 100%;
  overflow: hidden;
}

// flex布局法
body {
  display: flex;
  flex-direction: column;
}
.header,
.footer {
  flex: 0 0 60px;
}
.content {
  flex: 1;
}


// css3的calc函数法
.header,
.footer {
  height: 60px;
}
.content {
  height: calc(100% - 120px);
}

// 绝对定位法 避免api的浏览器兼容性问题
.header,
.footer {
  height: 60px;
}
.content {
  position: absolute;
  left: 0;
  top: 60px;
  bottom: 60px;
}
```

## 移动端元素横向排列溢出滚动

今天工作中遇到的一个问题，在SF上找到的解决方案，据说苹果官网移动端有类似效果。

``` html
// html
<div class="nav">
  <div class="list">
    <a class="item">Lorem ipsum.</a>
    <a class="item">Lorem ipsum.</a>
    <a class="item">Lorem ipsum.</a>
    <a class="item">Lorem ipsum.</a>
    <a class="item">Lorem ipsum.</a>
    <a class="item">Lorem ipsum.</a>
    <a class="item">Lorem ipsum.</a>
  </div>
</div>

// css
.nav {
  width: 100%;
  height: 55px;
  padding-bottom: 20px;
  white-space: nowrap; // 关键属性
  overflow: hidden;
  overflow-x: scroll; // 关键属性
  text-align: justify;
  -webkit-overflow-scrolling: touch; // 优化属性
  -webkit-perspective: 1000;
  -webkit-backface-visibility: hidden;
}
.nav::-webkit-scrollbar { // 优化显示
  display: none;
  width: 10px;
}
.item {
  display: inline-block;
  height: 50px;
  line-height: 50px;
  font-size: 30px;
  padding: 10px 30px;
  border: 1px solid red;
  text-align: center;
}
```
