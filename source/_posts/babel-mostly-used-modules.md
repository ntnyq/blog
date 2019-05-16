---
title: Babel常用模块说明
tags: [Babel]
date: 2019-03-07 11:02:17
description: Babel常用模块说明
category: 前端
---

## @babel/preset-env

__preset__ 的实质是特定 __plugins__ 的集合。(目前30个左右。)

`preset-env` 不包含 `stage-x` 提案，所以无法进行对其转译工作。

```.babelrc.js
module.exports = {
  presets: [
    [
      '@babel/preset-env',
      {
        modules: false,
        useBuiltIns: 'entry' // false, entry, usage
      }
    ]
  ]
}
```

## @babel/polyfill

让新版浏览器 API 可以在老版本浏览器上得到支持。

比如新的数据类型，__实例方法__ 等。

非模块化环境下使用：

```htm
<script src="@babel/polyfill/dist/polyfill.js"></script
```

## @babel/runtime

__@babel/runtime__ 源码依赖并直接导出了 `regenerator-runtime`。

需配合  __@babel/plugin-transform-runtime__ 使用。

作用：

将编译过程中使用到的某些辅助函数，复用起来，在转译后的结果头部引入。

例：

若不使用，多个文件内都包含 `class` 声明，则编译后，每个文件的 `class` 声明都会生成一个对应的 `_classCallCheck` 函数，同个文件内则通用一个 `_classCallCheck` 函数。

假设我们使用 `optimization.splitChunks` 做了代码分割，做了如下配置：

```js
optimization: {
  splitChunks: {
    cacheGroups: {
      commons: {
        test: /node_modules/,
        name: 'vendors',
        chunks: 'initial',
        priority: 10,
        enforce: true
      }
    }
  },
  runtimeChunk: {
    name: 'manifest'
  }
}
```

将所有的来自 `node_modules` 目录下的代码，全部打包入 `vendors` 文件内。

如果我们使用了 `@babel/-plugin-transform-runtime` ，这时 `_classCallCheck` 将不会再被打包入 `main.js` 而是会被打包入 `vendors.js` 内。其他模块，再对它进行复用。

## @babel/-plugin-transform-runtime

若使用了插件，未下载 `@babel/runtime` 则编译时会报错，找不到需要的模块。

默认配置：

```js
module.exports = {
  plugins: [
    [
      '@babel/plugin-transform-runtime'，
      {
         corejs: false, // true, false, 2
         helpers: true, // helper函数，如classCallCheck typeof等
      	 regenerator: true, // 不污染全局变量
      	 useESModules: false
    	}
  	]
  ]
}
```

## @babel/register

让非 __EsModule__ 环境支持使用 __import__ 和 __export__ 等关键字进行模块导入导出。

```js
// main.js
require('@babel/register')
```

## 扩展阅读

[一口（很长的）气了解 babel](https://zhuanlan.zhihu.com/p/43249121)

