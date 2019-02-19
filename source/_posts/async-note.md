---
title: AsyncFunction学习笔记
tags: [async]
date: 2019-02-19 09:04:34
description: Async学习笔记。
category: 前端
---

异步解决方案 **AsyncFunction** 学习笔记。

<!-- more -->

## webpack

未使用到的变量和函数，不会出现到编译后的文件里。(`tree shaking`)

## Babel

> 关于`babel`如何编译`async`函数的记录

### 只有`@babel/preset-env`

编译成功，会将`async`函数编译为`Promise`，但同时会报错`regeneratorRuntime is undefined`，

函数无法运行。

### 再含有`@babel/plugin-transfrom-runtime`

编译失败，会提示缺少`@babel/runtime/helpers/asyncToGenerator`和`@babel/runtime/regenerator`。

### 再含有`@babel/runtime`

此依赖需要安装为项目依赖。

```bash
$ yarn add @babel/runtime
```

编译成功，且函数运行成功。

### `@babel/polyfill`的使用

#### 安装

```bash
$ yarn add @babel/polyfill
```

#### 全部引入

可以直接在项目入口导入，或者在webpack的`entry`中。

```js
// webpack.config.js

module.exports = {
  entry: ['@babel/polyfill', `${__dirname}/src/main.js`]
}

```

#### 非webpack全部引入

在js文件顶部使用`require`或者`import`引入

```
// main.js
import '@babel/polyfill'

// or 

require('@babel/polyfill')

// other code
```

配置`.babelrc`，将`@babel/preset-nev`的`useBuiltIns`字段设置为`entry`

```js
// .babelrc.js

module.exports = {
  presets: [
    ['@babel/preset-env', {
      targets: {
        node: true, // config your env
        esModules: true
      }
      modules: 'auto',
      useBuiltIns: 'entry'
    }]
  ]
}
```

#### 按需引入

无需引入`@babel/polyfill`，但仍需安装

```js
// .babelrc.js

module.exports = {
  presets: [
    ['@babel/preset-env', {
      modules: false,
      useBuiltIns: 'usage'
    }]
  ]
}
```

## Async

> **async function**声明用于定义一个返回`AsyncFunction`对象的**异步函数**。

> 异步函数指通过事件循环异步执行的函数，它会通过一个隐式的`Promise`返回其结果。

> 这个异步函数的语法和结构像是标准的同步函数。

> `async`/`await`可用于简化多个promise异步调用的操作。

### 基础用法

```js
function resolveAfter2Seconds () {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('resolved!')
    }, 2e3);
  })
}

async function asyncCall () {
  console.log('Calling start')
  const result = await resolveAfter2Seconds()
  console.log(result)
  console.log('Calling end')
  
  // 以下2种操作会被catch捕获
  // throw new Error('async throw error')
  // console.log(notExistVar)
  
  return 'This string returned by async function'
}

asyncCall()
  .then(str => {
    console.log(str)
  })
  .catch(err => {
  	consoe.log(err)
	})
/*
output
-> Calling start
2s later
-> resolved!
-> Calling end
-> This string returned by async function
*/
```

- 使用`async function`声明来定义一个**AsyncFunction**。
- 使用`await`关键字来处理异步函数，将会使此**AsyncFunction**暂停执行，等待**Promise**的结果出来，再恢复**AsyncFunction**的执行。
- **AsyncFunction**中使用`return`关键字返回的值，会被隐式的`Promise`进行**resolve**。
- **AsyncFunction**中使用`throw`关键字抛出的错误或者调用该函数时内部的错误，会被隐式的`Promise`进行**reject**。

> **await**关键字只能在**AsyncFunction**内部使用，否则会报错`SyntaxError`

### Promise VS Async/Await

[MDN示例](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/async_function#%E7%A4%BA%E4%BE%8B)

#### AsyncFunction改写Promise链

```js
function getProcessedData (url) {
  return donwloadData(url)
    .then(v => {
      return processDataInWorker(v)
    })
    .catch(err => {
      console.log(err)
      return downloadFallbackData(url)
    })
}

async function getProcessedData (url) {
  let v

  try {
    v = await donwloadData(url)
  } catch (err) {
    console.log(err)
    v = await downloadFallbackData(url)
  }

  return processDataInWorker(v)
}

```

## 浏览器兼容性

[MDN - BCD](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/async_function#%E6%B5%8F%E8%A7%88%E5%99%A8%E5%85%BC%E5%AE%B9%E6%80%A7)

[Can I Use](https://caniuse.com/#search=async)

- 非IE浏览器/QQ浏览器
- 其他高版本浏览器

需要`babel`来提供回退到 **Promise** + **Promise Polyfill**

## 参考资料

[MDN - async function](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/async_function)