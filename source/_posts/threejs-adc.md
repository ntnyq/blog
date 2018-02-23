---
title: Threejs入门基础。
tags: [Three, WebGl]
date: 2017-12-03 14:08:14
description: 学习Threejs库，实现简单的Web3d效果。
category: 学习
---

**Threejs**是一款`轻量且易用`的`Web3d库`。它将浏览器支持的`WebGl`API封装成简单易用的接口，方便学习和使用。他可以提供`canvas`, `SVG`, `CSS3D`和`WebGl`渲染器。

<!-- more -->

## 背景

我为什么要学习`Threejs`呢？

因为目前公司一部分业务做的**数据可视化大屏**方面，可以参考阿里云的`dataV`。

基本是主要利用图表做出`低交互效果，视觉冲击力强，场景模块化`的数据可视化网页。

关于插件的选择这点，我们主要用的是[Echarts](https://github.com/ecomfe/echarts)，毕竟它使用起来简单，只需要自定义配置项和传入数据就会生成好看的图表。

同时外包给我们公司的项目的那个公司的设计师大多时候也会针对先前实现的效果去做设计。

然而越高度封装的插件，也就会暴露一个问题\-\-定制化麻烦。

比如我用Echarts做出来的地图效果，配色方面就一直被对方的设计和产品吐槽，所以我决定要学习写出更炫酷的效果。

恰好大屏也不需要考虑兼容性，本着炫酷的目的，那么自然就要搞3D了。

而且前两周在商讨的新大屏项目，客户的需求就是\-\-做出类似dataV的效果。

上周五才拿到了第一张设计图，动画效果方面比先前增加了不少，不过暂时还没有出现3D效果。

和设计师沟通了一下，以后可以我能做出什么好的效果，给个Demo让他看看，这样也可以针对我的实现去设计，保证了技术上的可行性。

所以开始了我的**Threejs**踩坑之旅。

## Webgl

[MDN的Webgl文档](https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API)

### 定义

**WebGl**(Web Graphics Library)是一套封装好的JavaScript接口，在任何兼容的`Web浏览器`上都可以无需任何插件地渲染可交互的2D和3D图形。`WebGl`通过引进了一个与`OpenGL ES 2.0`很相近的API来实现此功能。它可以在HTML5的**canvas**标签中使用。

### 兼容性

[Can I Use - WebGl](https://caniuse.com/#search=webgl)

- IE11+
- 标准浏览器

需要注意的是它还需要设备GPU支持，所以在一些老版本的硬件可能无法兼容。

另外它并非是`W3C`的，而是[Khronos Group](https://www.khronos.org/webgl/)的。

## Threejs

有句话说`当我们吃鸡蛋的时候，并不需要关心它是哪只鸡下的`。

同样的虽然有标准提供了原生的API，但是利用原生API去实现功能，锁需要的时间和精力都是巨大的。

幸运的是前人早就帮我们造好了`轮子`，而`Threejs`就是大家广泛使用的轮子之一。

### 下载

首先我们要使用`Threejs`库，那么第一步就是要拿到它的源码了。

[Threejs官方Github仓库](https://github.com/mrdoob/three.js)

> 目前版本: r88

### 引入

以js脚本的方式引入

```
<script src="./your-path-to/three.min.js"></script>
```

## 渲染器

**渲染器(Renderer)**是利用`canvas`元素进行初始化的，它定义了渲染方式和一些渲染参数。它是`Threejs`的核心API之一。

### 创建渲染器

创建渲染器时，可以传入一个对象进行配置。

```
var renderer = new THREE.WebGLRenderer(option);
```

创建渲染器有2种方式：

1. 初始化的时候设置canvas参数在，传入一个canvas节点

```js
var renderer = new THREE.WebGLRenderer({
    canvas: document.querySelector('canvas')
});
```

2. 初始化后将`DOM`节点添加至页面

```js
document.body.appendChild(renderer.domElement);
```

### 常用参数

- antialias 抗锯齿优化 默认为false
- alpha 透明度支持 默认为false
- 等等

### API

常用API

#### 设置渲染器的尺寸

传入2个参数**宽**和**高**。

```js
renderer.setSize(width, height);
```

#### 设置渲染器背景色

传入一个十六进制数

```js
renderer.setClearColor(0x000000);
```

## 场景

**场景**(Scene)定义了承载物体的容器和观察的视口。它是`Threejs`的核心API之一。

### 初始化

```js
var scene = new THREE.Scene();
```

`几何体`，`光照`等元素必须要加入到场景中才能被渲染。

### API

```js
scene.add()
```

## 相机

**相机**(Camera)定义了观察的角度位置和方式。它是`Threejs`的核心API之一。

### 正交相机

正交相机是假定物体处于正交坐标系下，对物体的投影和观察结果。本来平行的线，在正交坐标系中会依然保持平行。但是在景深相机中观测就无法保证。

```js
var camera = new THREE.OrthographicCamera(left, right, top, bottom, near, far);
```

`left right top bottom`代表坐标系距离渲染器4条边缘的偏移量。`near`靠近相机的位置，`far`远离相机的位置。

### 景深相机

景深相机更加符合人们观察物品的实际情景，同样的尺寸，离得近会显得大，离得远的会显得小。

```js
var camere = new THREE.PerspectiveCamera(fov, aspect, near, far);
```

`fov`代表视口张角，`aspect`代表视口比例(通常设置为渲染器的尺寸宽高比)，`near`靠近相机的位置，`far`远离相机的位置。

### 设置相机坐标

```js
camera.position.set(x, y, z);
```

### 设置相机观测目标

```js
camera.lookAt();
```

## 网格

**网格**(Mesh)通过规则的线条或者面来绘制基础的几何体。它是`Threejs`的核心API之一。

```
var mesh = new THREE.Mesh(geometry, material);
```

初始化一个网格，需要指定2个参数`geometry`(几何体)和`material`(材质)。

### 示例

创建一个正方体。

```js
var geometry = new THREE.BoxGeometry(size, size, size),
    material = new THREE.MeshNormalMaterial();

var mesh = new THREE.Mesh(geometry, material);

scene.add(mesh);
```


## 参考资料

[Threejs](https://github.com/mrdoob/three.js)

[Threejs入门指南 - 羡澈](http://www.ituring.com.cn/book/1272)






