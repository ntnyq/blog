---
title: Element-UI库定制样式
tags: [Vue]
date: 2018-01-30 10:37:05
description: 探索如何全局修改Element-UI库的样式。
category: 学习
---

探索如何全局修改Element-UI库的样式。
<!-- more -->

## 默认

> 默认样式下，Element-UI的主题色为**鲜艳的蓝色**，在没有定制样式的情况下使用还是不错的。

默认情况下，我们执行`yarn add element-ui`会得到一个同名的依赖，其样式文件存在于`element-ui/lib/theme-chalk`目录下。

所以不管我们是将组件库全局引入，或者按需引入，都需要指定使用的CSS位于这里。

具体配置方式请查看[官方文档-快速开始](http://element-cn.eleme.io/#/zh-CN/component/quickstart)。

## 修改局部样式

在使用到这个局部样式的**组件文件**中以**高权值覆盖**的形式来修改，若此样式在多个地方被使用，则可以通过给组件添加类的方式，再到通用的样式文件中修改覆盖。

## 修改主题颜色

编写一个保存自定义样式的文件，例如`src/element-variables.scss`，在其中以变量的形式来覆盖`element-ui`中的变量。最后再在`main.js`中导入这个文件。

``` scss
// element-variables.scss

@charset "utf-8";

/* 改变主题色变量 */
$--color-primary: indigo;

/* 改变 icon 字体路径变量，必需 */
$--font-path: '~element-ui/lib/theme-chalk/fonts';

@import "~element-ui/packages/theme-chalk/src/index"; # 引入样式文件 注意这里是package index是所有样式scss文件的集合。这里通过传入变量，实现样式重置。
```

``` js
import '@/element-variables.scss';
```

## 修改部分样式

## 修改全部样式

> 建议下载使用官方提供的CLI工具。

``` bash
# 安装后获得et命令
$ sudo yarn global add element-theme

# 查看参数配置
$ et -h

Usage: et [options]

Options:
  -V, --version           output the version number
  -i --init [filePath]    init variables file
  -w --watch              watch variable changes then build
  -o --out [outPath]      output path
  -m --minimize           compressed file
  -c --config [filePath]  variables file
  -b --browsers <items>   set browsers
  -h, --help              output usage information
```

需要用到的命令:

- `et` 修改配置后打包，生成主题文件夹
-  `et -i` 生成`element-variables.scss`文件，包括所有需要用到的**变量**。

### 使用过程

下载`element-theme-chalk`为开发依赖。

``` bash
$ yarn add element-theme-chalk -D
```

使用`et -i`生成`element-variables.scss`文件，修改需要修改的变量后保存，执行`et`。

就会看到在根目录下生成了一个**`theme`**文件夹。

然后可以将`theme/index.css`在`main.js`来导入定制后全部的`Element-UI`库样式，或者在`babel`配置文件中，指定`babel-plugin-component`的`styleLibrary`为`~theme`来供组件按需使用的样式导入。

## 参考资料

[官方文档-自定义主题](http://element-cn.eleme.io/#/zh-CN/component/custom-theme)