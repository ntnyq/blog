---
title: Vue项目中使用Mockjs
tags: [Mockjs]
date: 2018-10-22 21:44:07
description: 如何在Vue项目中使用Mockjs。
category: 前端
---

如何在Vue项目中使用Mockjs。
<!-- more -->

## 背景

开发过程中，我们经常会遇到后端接口提供不及时，无数据测试无法提前进行测试拖长项目工期，或者需要写无服务的静态页面展现数据DEMO的囧境。没有供展现的数据，手写数据费时且太死板，缺乏灵魂，常遇到需求简单修改，就要给一个列表都加上字段，实在是非常糟糕的开发体验。

针对这一开发痛点，有人开发出了一款名为**Mockjs**的模拟数据神器。它用法简单，方便扩展，支持**种类丰富的随机数据**，足以满足日常开发需求。并且对开发无侵入，不需要对系统代码进行修改，通过**拦截Ajax请求**，返回模拟数据以供开发测试使用。

这里主要谈一下如何在Vue项目中组织和使用`mockjs`进行数据模拟。

## 安装

使用包管理器，将`mockjs`安装到项目中

``` js
yarn add mockjs
```

## 使用

在`src`目录下，创建`index.js`文件，作为mock各个模块的导出点，供`src/main.js`使用。
在`src/mock/modules`目录下，创建`table.js`规则，模拟表格数据，供`mock`使用。

``` js
// src/mock/index.js

import { mockjs } from ‘mockjs’

import TableApi from ‘./modules/table.js’

const { mock } = mockjs // Mock函数

// 使用拦截规则拦截命中的请求
mock(/\api\/getTableData/, ‘get’, TableApi.getTableData)

export default mockjs

```

``` js
// table.js

import { Random } from ‘mockjs’ // 导出随机函数

const code = 200 // 状态码 项目同一

export default = {
    getTableData () {
        let data = []
        Array.apply(null, { length: 10 }).forEach(_ => {
            data.push({
                name: Random.cname(), // 随机汉语名
                title: Random.csentence(8, 16), // 随机中文字符串
                date: Random.date() // 随机日期
            })
        })
        return {
            code,
            data
        }
    }
}
```

``` js
// src/main.js

import ‘./mock’ // 手动引入 不需要时需要注释代码或者删除

process.env.NODE_ENV === ‘development’ && require(‘./mock’) // 打包时忽略
```

## Api

[Mockjs API 文档](https://github.com/nuysoft/Mock/wiki/Basic)

> 内含各种内置的API，和使用方法示例。主要包括以下几类：

- 基础数据类型 (Basic)
- 日期时间 (Date)
- 占位图片 (Image)
- 颜色 (Color)
- 文本 (Text)
- 姓名 (Name)
- 网络相关 (Web)
- 地址 (Address)
- 工具函数 (Helper)
- 等等

并且它易于扩展，可接受请求参数，根据参数定制数据。

## 注意

1. Mockjs依赖中保存着大量用于伪造假数据的静态数据，引入的时候打包得到的文件体积会明显增大，这是正常的。
2. Mockjs模拟数据后，会将**命中**配置规则(正则表达式)的请求拦截，这时候在浏览器的`Network`面板是无法看到数据返回的，可以通过打印数据的方式观察。


