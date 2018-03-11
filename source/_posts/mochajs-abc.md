---
title: 测试框架Mocha简单入门
description: 学习如何测试自己的代码。
date: 2017-09-16 22:04:37
tags: [测试, Mocha]
category: 学习
---

最近和台湾朋友聊天，跟他讲述了一些最近在做的项目中碰到的难点，询问一下他是如何解决此类问题的。

他给我推荐了一些技术，建议我可以了解一些，还说必须要学习单元测试。

所以趁着周末闲暇之际，学习一下Mocha测试框架。
<!-- more -->

## 起因

咨询的问题主要有如下3个：

1. 如何实现2个不同域名页面的实时通信。`用户要求在后台操纵页面点击列表项，前台页面弹出对应项的新闻`

2. 页面定时器太多，可能存在使用不当的情况，导致内存溢出，页面崩溃。

3. 工作和开发经验心得。

---

关于问题一，我咨询他除了用`websocket`和短时间的定时器去轮询外，是否还有什么更好的方案。

诸如小型的聊天室，百度商桥，商务通类的基于web的即时通信软件，他们是如何实现双向实时通信的。

他给我推荐了一个方案**野狗云**。

>野狗科技(北京)有限公司（简称：野狗）是安全可靠的实时通信云。野狗为企业和开发者提供了可编程的实时数据、音视频通信能力，以及短信服务，可以安全地构建丰富场景化的实时通信业务。

[野狗云文档](https://docs.wilddog.com/auth/Web/quickstart.html)

---

关于问题二，他给我推荐了`Rx.js`，一种响应式编程的方案。

`Rxjs提供了一种处理异步逻辑，数据流， 事件的方案，不过其学习曲线比Promise还要陡峭。`

---

关于问题三，他告诉我需要学习`BDD`(行为驱动开发)和`TDD`(测试驱动开发)，需要在`Ng`,`Vue`和`React`框架里选择一个深入学习，需要能做单元测试，需要了解`记忆体易位`，`设计模式`等。

## Mocha

Mocha是一款特性丰富的JavaScript测试框架，它可以运行在`Node.js`环境和`浏览器`环境中。它可以使得异步测试变得简单有趣。Mocha可以顺序执行测试，输出灵活且精准的报告，同时可以将未捕获的程序异常映射到正确的测试用例上。Mocha托管在Github上。

[Mocha的特性](https://mochajs.org/#features)

[Mocha的Github仓库](https://github.com/mochajs/mocha)


## 下载

Mocha可以通过多种方式下载获得

### npm下载

```
// 全局下载
npm install mocha --global // npm i mocha -g

// 项目依赖
npm install mocha --save-dev // npm i mocha -D
```

### Bower下载

```
bower install mocha
```

### CDN

[CDNjs地址](https://cdnjs.com/libraries/mocha)

## 例子


### 全局安装Mocha

```
npm install mocha -g
```

### 创建项目test

```
mkdir test
```

### 初始化Node项目

```
// 注意test脚本填写mocha
npm init
```

### 本地安装Mocha

```
// 安装为项目依赖
npm install mocha -D
```

### 根目录创建test.js

```
touch test.js
```

### 编写测试用例

```
// test.js

var assert = require('assert');

describe('Array', function (argument) {
  describe('#indexOf', function () {
    it('should return -1 when the value is not present', function () {
      assert.equal(-1, [1, 2, 3].indexOf(4));
    });
  });
});

describe('Math', function () {

  it('should test if 3 * 3 = 9', function () {
    assert.equal(9, 3 * 3);
  });

  it('should test if (3 - 4) * 8 = -8', function () {
    assert.equal(-8, (3 - 4) * 8);
  });

  it('should test if 1 + 2 = 2', function () {
    assert.equal(2, 1 + 2);
  });
});
```

### 运行测试

```
npm test
```

### 结果

```
  Array
    #indexOf
      √ should return -1 when the value is not present

  Math
    √ should test if 3 * 3 = 9
    √ should test if (3 - 4) * 8 = -8
    1) should test if 1 + 2 = 2


  3 passing (27ms)
  1 failing

  1) Math
       should test if 1 + 2 = 2:

      AssertionError [ERR_ASSERTION]: 2 == 3
      + expected - actual

      -2
      +3
```

## 讲解

因为Mocha本身只是测试框架，所以使用它我们还需要引入**断言库**，本利中我们引入了Nodejs的内置断言库`assert`。

我们编写了4个简单的测试用例。用到了Mocha的如下API。

### describe

describe表示测试分组，我们可以根据需求进行有序的分组，方便有组织地查看测试结果。分组可以无限深度地嵌套。

```
describle('GroupName', function () {})
```

### it

it表示一个测试用例，我们可以根据自己的测试需求编写测试用例。最终运行测试脚本会返回测试用例是否通过。在terminal中我们可以根据测试用例前面是否有`√`来判断。如果没有通过，会生成一个未通过测试用例的索引，可以查看下面更详细的关于未通过原因的描述。

```
it('should bla bl abla', function () {})
```


## 断言

**断言**即给与一个布尔值，真或者假，是或者非等。

Mocha可以很方便地与各种断言库进行集成。

常用断言库有：

- **should.js**
- **better-assert**
- **expect.js**
- **unexpected**
- **chai**

## 参考资料

[Mochajs官方文档](https://mochajs.org/)







