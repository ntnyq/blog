---
title: 深入探究CSS3渐变的那些事儿。
description: 优雅而又强大的API，我们也许现在不能在生产中广泛使用，但是也要深入学习一下。
date: 2017-11-26 22:04:37
tags: [渐变, CSS3]
category: 学习
---

渐变的存在可以实现一些简单的背景图形，避免我们使用图片。虽然早先也有学习过，不过在用的时候却经常写错，或者写不出自己心中想要的效果，所以在此深入整理一下API。<!-- more -->

### 渐变简介

CSS3渐变(gradient)分为线性渐变(linear-gradient)和径向渐变(radial-gradient)两种。

### 线性渐变

线性渐变代表渐变是线性的，也就是方向是一个单一的向量。

#### 兼容写法

因为浏览器内核的不同，我们需要使用浏览器厂商前缀的兼容写法：

``` css
background: linear-gradient([<point> || <angle>] ? <stop>, <stop>[, <stop>]*); // 标准写法
background: -webkit-linear-gradient([<point> || <angle>] ? <stop>, <stop>[, <stop>]*);
background: -moz-linear-gradient([<point> || <angle>] ? <stop>, <stop>[, <stop>]*);
background: -o-linear-gradient([<point> || <angle>] ? <stop>, <stop>[, <stop>]*);
```

#### 参数解析

参数：

- angle 是角度 单位为deg
- point 代表线性渐变的方向 可用关键字包括`left, right, top, bottom, to left, to right, to bottom, to top`等，也可以是例如`to left top`代表从左上到右下，to可省略。
- stop参数代表`color [<length> || <percentage>]` 即颜色 + 长度或者百分比
- color 渐变的起止颜色
- length 长度来指定渐变的起止位置 不可用负数 此参数可选 没有的话按颜色数量平均分配
- percentage 用百分比来指定渐变的起止位置 此参数可选

#### 兼容性

[CSS3渐变浏览器兼容性](http://caniuse.com/#search=linear)：IE10+

#### 例子

``` css
background: linear-gradient(left,red,orange,yellow,green,blue,indigo,violet);
background: -webkit-linear-gradient(left,red,orange,yellow,green,blue,indigo,violet);
background: -moz-linear-gradient(left,red,orange,yellow,green,blue,indigo,violet);
background: -o-linear-gradient(left,red,orange,yellow,green,blue,indigo,violet);
```

#### 角度写法

角度写法可以理解为一个以最高点为0度位置的圆。角度代表的方向就是从圆心到顺时针方向所指向的圆周上的一点，这两点连线的方向。所以0度代表的渐变是从下往上的，90度代表的渐变是从左向右的。

#### 重复的线性渐变

重复的线性渐变创建方法如下：

``` css
background: -webkit-repeating-linear-gradient(red, yellow 10%, green 15%);
background: -o-repeating-linear-gradient(red, yellow 10%, green 15%);
background: -moz-repeating-linear-gradient(red, yellow 10%, green 15%);
background: repeating-linear-gradient(red, yellow 10%, green 15%);
```

### 径向渐变

径向渐变是从中心上圆周发散的渐变形式。

创建一个径向渐变，至少需要定义2种颜色。同时，需要指定渐变的中心，形状(圆形或者椭圆)、大小。默认情况下，渐变的中心是center(就是中心点)，渐变的形状是ellipse(椭圆形)，渐变的大小是farthest-corner(最远的角落)。

#### 语法：

``` css
background: radial-gradient([<position> || <angle>,]? [<shape>] [<size>,]? <color-stop>, <color-stop>[, <color-stop>]*);
```

#### 参数解析

- position 定义径向渐变的圆心位置 默认center 可选`top、left、bottom、right、center、<length>、<percentage>`
- shape 定义渐变形状 2个可选值`circle`和`ellipse`
- size 定义渐变结束形状的大小 可选值
  - closest-side：指定径向渐变的半径长度为从圆心到离圆心最近的边；
  - losest-corner：指定径向渐变的半径长度为从圆心到离圆心最近的角；
  - farthest-side：指定径向渐变的半径长度为从圆心到离圆心最远的边；
  - farthest-corner：指定径向渐变的半径长度为从圆心到离圆心最远的角；
- stop 与线性渐变相同

#### 例子

``` css
background: -webkit-radial-gradient(white, green, orange);
background: -o-radial-gradient(white, green, orange);
background: -moz-radial-gradient(white, green, orange);
background: radial-gradient(white, green, orange);
```


#### 重复的径向渐变

``` css
background: -webkit-repeating-radial-gradient(red, yellow 10%, green 15%);
background: -o-repeating-radial-gradient(red, yellow 10%, green 15%);
background: -moz-repeating-radial-gradient(red, yellow 10%, green 15%);
background: repeating-radial-gradient(red, yellow 10%, green 15%);
```


## 参考资料

[css3 Gradient渐变||TG的博客](http://ghmagical.com/article/page/id/eD82Wc4FtT4h)

## Demo

[待续...]()

