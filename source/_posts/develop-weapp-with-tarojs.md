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
├── config # 配置
├── dist # 生产环境代码
└── src
    ├── assets # 静态资源
    │   └── images
    ├── components # 全局组件
    │   └── Select
    ├── pages	# 页面
    ├── services # 接口封装
    ├── store # 状态管理
    │   ├── actions 
    │   ├── constants
    │   └── reducers
    └── styles # 全局样式
        └── core # scss变量，mixin
```

## 配置Webpack Alias

修改 `config/index.js` 文件 的 __alias__ 即可。

``` js
const { resolve } = require('path')

const config = {
  alias: {
    '@actions': resolve(__dirname, '..', 'src/store/actions'),
    '@constants': resolve(__dirname, '..', 'src/store/constants'),
    '@reducers': resolve(__dirname, '..', 'src/store/reducers'),
    '@store': resolve(__dirname, '..', 'src/store'),
    '@assets': resolve(__dirname, '..', 'src/assets'),
    '@config': resolve(__dirname, '..', 'src/config'),
    '@components': resolve(__dirname, '..', 'src/components'),
    '@styles': resolve(__dirname, '..', 'src/styles'),
    '@utils': resolve(__dirname, '..', 'src/utils')
  }
}
```

[参考-官方文档-alias](https://nervjs.github.io/taro/docs/config-detail.html#alias)

## 全局SCSS变量混入

修改 `config/index.js` 文件的 `plugins.sass.resource` 即可。

```js
const { resolve } = require('path')

const config = {
  plugins: {
    sass: {
      // 在此文件中导入全局变量和mixins
      resource: resolve(__dirname, '..', 'src/styles/core/style.scss')
    }
  }
}
```

[参考-官方文档-plugins.sass](https://nervjs.github.io/taro/docs/config-detail.html#pluginssass)

## SCSS中导入样式

修改  `config/index.js` 文件的 `plugins.sass.projectDirectory` 与 `plugins.sass.importer` 即可。

``` js
const { resolve } = require('path')

const sassImporter = function (url) {
  if (url[0] === '~' && url[1] !== '/') {
    return {
      file: resolve(__dirname, '..', 'node_modules', url.substr(1))
    }
  }

  const reg = /^@styles\/(.*)/
  return {
    file: reg.test(url) ? resolve(__dirname, '..', 'src/styles', url.match(reg)[1]) : url
  }
}

const config = {
  plugins: {
    sass: {
      projectDirectory: resolve(__dirname, '..'),
      importer: sassImporter
    }
  }
}
```

## 全局变量注入

默认情况下，__Taro__ 提供了开发和构建两种环境。

在这两种环境下，和通用配置文件中，都可以根据需要去修改，注入一些全局变量(如接口请求地址等。)

如有需要更多的环境，可引入 `cross-env` 库，在 `config/dev.js` 和 `config/prod.js` 中根据某个约定的环境变量去为全局注入某些常量。

## 关闭默认的ES6模块化导入导出

__Taro__ 默认情况下，要求用户以 __ES6__ 规范的 `import` 和 `export default` 导入导出数据。

在很多情景下，都为用户造成了不变。比如同个文件要导出多个对象的情况下或者工具函数库中。

可通过配置 `EsLint` 关闭此检查。

``` 
{
  "extends": [
    "taro"
  ],
  "rules": {
    "no-unused-vars": [
      "error",
      {
        "varsIgnorePattern": "Taro"
      }
    ],
    "react/jsx-filename-extension": [
      1,
      {
        "extensions": [
          ".js",
          ".jsx",
          ".tsx"
        ]
      }
    ],
    "import/prefer-default-export": "off"
  },
  "parser": "babel-eslint"
}

```

## 接口请求封装

> 下面代码中的 API_HOST 为全局注入的常量。关闭了 EsLint 对它的检查。

```js
import Taro from '@tarojs/taro'
import HTTPS_STATUS from '@config/http-status'

/* eslint-disable-next-line no-undef */
export const apiHost = API_HOST

const api = {
  baseOptions (params, method = 'POST') {
    const { url, data, contentType = 'application/x-www-form-urlencoded' } = params
    const options = {
      url: url.includes('http') ? url : `${apiHost}${url}`,
      data,
      method,
      header: {
        'content-type': contentType
      }
    }

    return Taro.request(options)
      .then(res => {
        const { statusCode, errMsg } = res

        if (statusCode === 200) {
          const resData = res.data
          const { code, msg } = resData

          if (code === HTTPS_STATUS.SUCCESS) {
            return resData.data
          } else {
            Taro.showToast({
              title: msg || '接口返回数据出错',
              icon: 'none'
            })

            return Promise.reject({ message: msg, ...res })
          }
        } else {
          Taro.showToast({
            title: errMsg || '小程序数据请求成功，但状态码非200',
            icon: 'none'
          })

          return Promise.reject({ message: errMsg, ...res })
        }
      })
      .catch(err => {
        const message = '小程序数据请求失败'
        Taro.showToast({
          title: err && err.errorMsg || message,
          icon: 'none'
        })

        return Promise.reject({ message, ...err })
      })
  },

  get (url, data = {}) {
    const option = { url, data }

    return this.baseOptions(option, 'GET')
  },

  post (url, data = {}, contentType) {
    const option = { url, data, contentType }

    return this.baseOptions(option)
  },

  put (url, data = {}) {
    const option = { url, data }

    return this.baseOptions(option, 'PUT')
  },

  delete (url, data = {}) {
    const option = { url, data }

    return this.baseOptions(option, 'DELETE')
  }
}

export default api

```

## 相关资料

- [Taro官网](https://taro.aotu.io/)
- [Taro官方仓库](https://github.com/NervJS/taro)
- [Awesome-Taro](https://github.com/NervJS/awesome-taro)