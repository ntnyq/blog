---
title: 初试Mockjs与模拟数据
description: 学习如何使用mockjs生成假数据来做前端开发中的数据请求。
tags: [数据, 前端, mockjs]
category: 学习
---

Mock.js是一款模拟数据生成器，旨在帮助前端攻城师独立于后端进行开发，帮助编写单元测试。<!-- more -->

## 简介

Mock.js是一款模拟数据生成器，旨在帮助前端攻城师独立于后端进行开发，帮助编写单元测试。

## 功能

mockjs主要提供了以下模拟功能：

1. 根据数据模板生成模拟数据
2. 模拟 Ajax 请求，生成并返回模拟数据
3. 基于 HTML 模板生成模拟数据

## 下载

[mockjs官网](http://mockjs.com/dist/mock.js)下载，直接以js文件引入

```
// node下载
npm install mockjs
```

其余下载方式这里不做介绍，可以参考官网文档。

## 语法规则

Mock.js 的语法规范包括两部分：

1. 数据模板定义（Data Temaplte Definition，DTD）
2. 数据占位符定义（Data Placeholder Definition，DPD）

### 数据模板定义 DTD

数据模板中的每个属性由 3 部分构成：属性名、生成规则、属性值：

  ```
// 属性名   name
// 生成规则 rule
// 属性值   value

'name|rule': value
  ```

**注意**：

- 属性名 和 生成规则 之间用 | 分隔。
- 生成规则 是可选的。
- 生成规则 有 7 种格式：
  - 'name|min-max': value
  - 'name|count': value
  - 'name|min-max.dmin-dmax': value
  - 'name|min-max.dcount': value
  - 'name|count.dmin-dmax': value
  - 'name|count.dcount': value
  - 'name|+step': value
- 生成规则 的 含义 需要依赖 属性值 才能确定。
- 属性值 中可以含有 @占位符。
- 属性值 还指定了最终值的初始值和类型。

#### 生成规则和示例

1. 属性值是字符串 **String**

  1. 'name|min-max': 'value' 通过重复 'value' 生成一个字符串，重复次数大于等于 min，小于等于 max。
  2. 'name|count': 'value' 通过重复 'value' 生成一个字符串，重复次数等于 count。

2. 属性值是数字 **Number**

  1. 'name|+1': 100 属性值自动加 1，初始值为 100
  2. 'name|1-100': 100 生成一个大于等于 1、小于等于 100 的整数，属性值 100 只用来确定类型。
  3. 'name|1-100.1-10': 100 生成一个浮点数，整数部分大于等于 1、小于等于 100，小数部分保留 1 到 10 位。

```
{
    'number1|1-100.1-10': 1,
    'number2|123.1-10': 1,
    'number3|123.3': 1,
    'number4|123.10': 1.123
}
// =>
{
    "number1": 12.92,
    "number2": 123.51,
    "number3": 123.777,
    "number4": 123.1231091814
}
```

3. 属性值是布尔型 **Boolean**

  1. 'name|1': value 随机生成一个布尔值，值为 true 的概率是 1/2，值为 false 的概率是 1/2。
  2. 'name|min-max': value 随机生成一个布尔值，值为 value 的概率是 min / (min + max)，值为 !value 的概率是 max / (min + max)。

4. 属性值是对象 **Object**

  1. 'name|min-max': {} 从属性值 {} 中随机选取 min 到 max 个属性。
  2. 'name|count': {} 从属性值 {} 中随机选取 count 个属性。

5. 属性值是数组 **Array**

  1. 'name|1': [{}, {} ...] 从属性值 [{}, {} ...] 中随机选取 1 个元素，作为最终值。
  2. 'name|min-max': [{}, {} ...] 通过重复属性值 [{}, {} ...] 生成一个新数组，重复次数大于等于 min，小于等于 max。
  3. 'name|count': [{}, {} ...] 通过重复属性值 [{}, {} ...] 生成一个新数组，重复次数为 count。
6. 属性值是数组 **Function**

'name': function(){} 执行函数 function(){}，取其返回值作为最终的属性值，上下文为 'name' 所在的对象。

### 数据占位符定义 DPD

占位符 只是在属性值字符串中占个位置，并不出现在最终的属性值中。占位符 的格式为：

```
@占位符
@占位符(参数 [, 参数])
```

**注意**：

1. 用 @ 来标识其后的字符串是 占位符。
2. 占位符 引用的是 Mock.Random 中的方法。
3. 通过 Mock.Random.extend() 来扩展自定义占位符。
4. 占位符 也可以引用 数据模板 中的属性。
5. 占位符 会优先引用 数据模板 中的属性。

```
{
    name: {
        first: '@FIRST',
        middle: '@FIRST',
        last: '@LAST',
        full: '@first @middle @last'
    }
}
// =>
{
    "name": {
        "first": "Charles",
        "middle": "Brenda",
        "last": "Lopez",
        "full": "Charles Brenda Lopez"
    }
}
```


Type | Method
--- | --------------------------------
Basics | boolean, natural, integer, float, character, string, range, date, time, datetime, now
Image | image, dataImage
Color | color
Text | paragraph, sentence, word, title
Name | first, last, name
Web | url, domain, email, ip, tld
Address | area, region
Helpers | capitalize, upper, lower, pick, shuffle
Miscellaneous | guid, id

## Mock APIs