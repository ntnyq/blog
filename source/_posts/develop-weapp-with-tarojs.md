---
title: 使用Tarojs开发微信小程序
tags: [微信小程序]
date: 2019-05-16 23:16:19
description: 使用Tarojs开发微信小程序，一些踩坑记录与小技巧。
category: 前端
---

__Taro__ 是由京东 [02Team](https://github.com/o2team) 推出的一款基于 React 语法的多端开发框架。这里记录一下我使用 __Tarojs__ 开发微信小程序的踩坑记录和查阅资料学到的一些小技巧。

<!-- more -->

## 快速开始

``` bash
// 安装
$ yarn global add taro-cli

// 创建项目
$ taro init <project_name>
```

经过一系列的交互问答后，即可成功创建项目并且会自动下载项目相关依赖。

``` bash
// 进入项目
$ cd <project_name>

// 小程序开发环境
$ yarn dev:weapp

// 打包小程序
$ yarn build:weapp
```

默认情况下，小程序可使用的源码将生成在项目根目录下的 __dist__ 目录，使用微信开发者工具打开此目录即可。

详细安装过程与截图可参考 [Taro官方文档-快速开始](https://nervjs.github.io/taro/docs/GETTING-STARTED.html)

## 项目目录

``` bash
.
├── config
├── dist
└── src
    ├── assets
    │   └── images
    ├── components
    │   └── Select
    ├── pages
    ├── services
    ├── store
    │   ├── actions
    │   ├── constants
    │   └── reducers
    └── styles
        └── core
```



## 相关资料

- [Taro官网](https://taro.aotu.io/)
- [Taro官方仓库](https://github.com/NervJS/taro)
- [Awesome-Taro](https://github.com/NervJS/awesome-taro)