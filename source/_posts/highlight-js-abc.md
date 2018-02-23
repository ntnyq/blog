---
title: 代码高亮插件highlight.js
description: 如何在博客或者文章中高亮代码。
tags: [代码高亮, 插件]
category: 学习
---

简单学习如何使用代码高亮插件highlight.js。<!-- more -->

## 代码高亮

对文章中插入的代码进行`代码高亮`可以有效避免文章和代码混在一起，使阅读一目了然，更加方便。

## highlight.js

`highlight.js`是一款简单易用的代码高亮插件。

### 优点

1. 支持几乎所有编程语言的代码高亮
2. 支持自动进行语法类型检测
3. 渲染出标准的`<pre><code></code></pre>`页面结构
4. 支持多种高亮色彩主题的配置，可以随心替换，也可简单自定义。

### 缺点

不支持显示行号。

> 为什么我们需要标准的`<pre><code></code></pre>`HTML结构。相信对于markdown大家应该不会陌生。github官方推荐的文档编写语法。同时也是程序员日常快速生成文档的法宝。而一些个人博客、技术网站也都支持markdown格式进行编辑。它渲染成html的结构局势标准的`<pre><code></code></pre>`结构。

## 使用方法

### 下载

点击[highlight.js插件官方](https://highlightjs.org/)下载插件。

[github仓库下载](https://github.com/isagalaev/highlight.js)

官方支持语言自定义选择的插件下载，你可以选择你要高亮的编程语言，然后下载。

### 解压

解压后获取的文件我们要用到的是`highlight.pack.js`和`styles`文件夹中的高亮主题。

### 使用

写html的适合使用`<pre><code></code></pre>`结构，将代码放入。

在`</head>`之前引入选择的样式文件。

在`</body>`之前引入`highlight.pack.js`文件和在其后使用`<script>hljs.initHighlightingOnLoad();</script>`来使用插件。

> 如果不想高亮某段代码，可以给它加`nohighlight`类。


## 推荐

### 配色主题推荐

- `monokai-sublime` sublime用户看习惯了的配色
- `Dracula` 灰色主题
- `Atom One Dark` Atom编辑器深色主题
- 自定义主题 自己喜欢的才是最好的

### 字体推荐

- Roboto
- Consolas
- Source Code Pro

