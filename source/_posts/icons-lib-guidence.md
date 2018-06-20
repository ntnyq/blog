---
title: 探究图标库的使用
description: 图标表达的含义比文字更加直观，也更加友好，是现代页面设计不可缺少的一部分。
date: 2017-06-23 21:04:37
tags: [图标, icons]
category: 学习
---

图标表达的含义比文字更加直观，能够丰富页面的内容，在交互方面也更加友好，是现代页面设计不可缺少的一部分。

现有的图标库内容丰富，设计统一，在我们做一些缺少设计的项目时候，使用图标库是个很好的选择。<!-- more -->

## 常用的图标库

1. [Glyphicons](http://v3.bootcss.com/components/#glyphicons-glyphs) Bootstrap的下载包内包含 250个左右
2. [Font-awesome](http://www.fontawesome.com.cn/faicons/) Bootstrap友好图标 比较丰富 可定制大小颜色阴影等CSS样式
3. [Iconfont](http://www.iconfont.cn/collections/index) 阿里矢量图标
4. [Material Design Icons](https://www.materialpalette.com/icons) 点击即可下载svg或者png格式
5. 等等


## Iconfont使用

用户可以在[Iconfont官网](https://iconfont.cn)下载多种格式自定义颜色大小的Icon。

平台也支持创建项目，上传**SVG**图标，生成对应的字体文件和CSS文件。

### 单个使用

单个图标用户可以自行选择下载不同的格式使用，包括`png`,`ai`,`svg`格式。

> 适合用在图标引用特别少，以后也不需要特别维护的场景。

优点:

- 按需引入，无需为使用少量小图标而大量引入文件。
- 使用环境丰富，比如用来做ppt，当图标使用即可。

### 项目使用

#### unicode使用

在图标库内选择需要的图标加入到购物车里，使用微博或者Github授权登录后下载。

下载后得到如下图所示文件。

![iconfont项目图标下载文件夹内容](http://olo2ef5ol.bkt.clouddn.com/TIM%E6%88%AA%E5%9B%BE20170729105741.jpg)

附带所有需要的文件和使用demo。

特点:

- 兼容性最好，支持ie6+，及所有现代浏览器。
- 支持按字体的方式去动态调整图标大小，颜色等等。
- 但是因为是字体，所以不支持多色。只能使用平台里单色的图标，就算项目里有多色图标也会自动去色。

使用步骤:

第一步：拷贝项目下面生成的font-face

``` css
@font-face {
    font-family: "iconfont";
    src: url('iconfont.eot'); /* IE9*/
    src: url('iconfont.eot#iefix') format('embedded-opentype'), /* IE6-IE8 */
    url('iconfont.woff') format('woff'), /* chrome, firefox */
    url('iconfont.ttf') format('truetype'), /* chrome, firefox, opera, Safari, Android, iOS 4.2+*/
    url('iconfont.svg#iconfont') format('svg'); /* iOS 4.1- */
}
```

第二步：定义使用iconfont的样式

``` css
.iconfont {
  font-family:"iconfont" !important;
  font-size:16px;
  font-style:normal;
  -webkit-font-smoothing: antialiased;
  -webkit-text-stroke-width: 0.2px;
  -moz-osx-font-smoothing: grayscale;
}
```

第三步：挑选相应图标并获取字体编码，应用于页面

``` html
<i class="icon iconfont">&#xe600;</i>
```


#### Symbol使用


第一步：引入下载项目生成的js文件

``` html
<script src="./iconfont.js"></script>
```

第二步：加入通用css代码（引入一次就行）

``` css
.icon {
  /* 通过设置 font-size 来改变图标大小 */
  width: 1em; height: 1em;
  /* 图标和文字相邻时，垂直对齐 */
  vertical-align: -0.15em;
  /* 通过设置 color 来改变 SVG 的颜色/fill */
  fill: currentColor;
  /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
     normalize.css 中也包含这行 */
  overflow: hidden;
}
```

第三步：挑选相应图标并获取类名，应用于页面：

``` html
<svg class="icon" aria-hidden="true">
    <use xlink:href="#icon-kefuyouxian"></use>
</svg>
```

#### font-class引用

**推荐的使用方式**

优点：

- 兼容性良好，支持ie8+，及所有现代浏览器。
- 相比于unicode语意明确，书写更直观。可以很容易地通过类名分辨这个icon是什么。
- 要替换图标时，只需要修改class里面的unicode引用。
- 不过因为本质上还是使用的字体，所以多色图标还是不支持的。

第一步：引入项目下面生成的fontclass代码：

``` html
<link rel="stylesheet" type="text/css" href="./iconfont.css">
```

第二步：挑选相应图标并获取类名，应用于页面：

``` html
<i class="iconfont icon-xxx"></i>
```

> "iconfont"是你项目下的font-family。可以通过编辑项目查看和自定义修改，默认是"iconfont"。


### font-awesome使用

用法：

第一步： 引入CSS文件：

```
<link href="your-file-path/font-awesome.min.css" rel="stylesheet">
```

第二步： 在html文件中这样使用

```
<i class="fa fa-home"></i>
```

> 可以通过如`fa-lg`，`fa-2x`，`fa-3x`等来调整图标大小。

可以通过css设置样式，比如颜色等。

## 别的图标库

> 使用方式类似。

这里不再赘述，最建议使用**Iconfont**，因为可以由设计师来将设计好的Icon导出`SVG`再上传。

缺点：

- 不支持图标部分透明。
- 不支持颜色渐变。

对于上述需求，仍然可以通过`PNG Spirits`的形式来使用。