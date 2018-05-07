---
title: webpack入门学习-基础篇
description: webpack是目前很流行的打包工具，但是它的高度配置特性可以使得它有替代自动化构建工具的能力，而且vue-cli本身也是集成webpack的，作为vue的学习者了解它是很有必要的。
date: 2018-01-22 11:36:37
tags: [webpack, 自动化]
category: 学习
---

webpack是目前很流行的打包工具，但是它的高度配置特性可以使得它有替代自动化构建工具的能力，而且vue-cli本身也是集成webpack的，作为vue的学习者了解它是很有必要的。<!-- more -->

### 介绍

webpack是一个现代的`javascript`应用程序的`模块打包器`。

当webpack处理应用程序时，它会递归地构建一个`依赖关系图`，其中包含应用程序所需要的每个模块，然后将这些所有的模块打包成少量的`bundle`，通常只有一个，以方便浏览器去加载。

### 特性

webpack是**高度可配置**的

首先要理解它的四个概念：

- 入口(entry)
- 输出(output)
- loader
- 插件(plugins)

### 入口

webpack创建应用程序所有依赖的关系图，图的起点被称为入口起点。入口起点告诉webpack从哪里开始，并根据依赖关系图确定需要打包的内容。可以将应用程序的入口起点看作是`根上下文`或者`app的第一个启动文件`。

在webpack中，我们通过使用**webpack配置对象**中的`entry`属性来定义入口。

```
// webpack.config.js

module.exports = {
    entry: './path/to/my/entry/file.js'
};
```

### 出口

将所有需要的资源归拢在一起后，还需要告诉webpack**在哪里**打包应用程序。webpack的`output`属性描述了`如何处理归拢在一起的代码`。

```
// webpack.config.js

const path = require('path'); // 引用path模块

module.exports = {
    entry: './path/to/my/entry/file.js',
    output: {
        path: path.resolve(__dirname, 'dist'), // 只能使用绝对路径
        filename: 'first_webpack.bundle.js'
    }
};
```

通过`output.path`和`output.filename`属性，指定了webpack bundle的生成地址和是生成(emit)的文件名。

> 项目生成(emitted或emit)是贯穿webpack的核心，表示生产或者排放。

### loader

webpack的目标是，让webpack聚焦于项目中的所有资源(assets)，而浏览器不需要关注考虑这些(但是这不以为着所有的资源都必须打包到一起)。

webpack把`每个文件(.css, .html, .scss, .jpg, etc)`都作为**模块**来处理。然而webpack自身**只理解Javascript**。

webpack loader在文件被添加到依赖图中时，将其转换为模块。

在更高层面，webpack中配置loader有两个目标。

1. 识别(identify)出应该被对应的loader进行`转换(transform)`的那些文件。(**test**属性)
2. 转换这些文件，从而使其能够被添加到依赖图中(并且最终添加到bundle中)(**use**属性)

```
// webpack.config.js

const path = require('path');

module.exports = {
    entry: './path/to/my/entry/file.js',
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'my-first-webpack.bundle.js'
    },
    module: {
        rules: [ // 使用规则
            {
                test: /.txt$/, // 匹配文件 正则语法
                use: 'raw-loader' // 使用loader
            }
        ]
    }
}
```

以上配置中，对一个单独的module对象定义了`rules`属性，里面包含2个必须的属性：`test`和`use`。这告诉webpack编译器(compiler)如下信息：

> webpack编译器，在碰到require或者import语句中被解析为'.txt'后缀的路径时，在对其打包之前，先使用raw-loader处理一下。

注意在webpack中定义loader的时候，要定义在`module.rules`中，而不是`rules`。否则webpack会给出严重的警告。

### plugins

由于loader仅在每个文件的基础上进行转换，而`plugins(插件)`更常用于(但不限于)在打包的`compliation`和`chunk`生命周期执行操作和自定义功能。webpack的插件系统`极其强大和可定制化`。

想使用一个插件，你只需要`require()`它，然后把它添加到`plugins数组`中，多数插件可以通过`选项(option)`自定义。你也可以在一个配置文件中因为不同目的而多次使用同一个插件，这时需要通过使用`new`来创建它的一个实例。

```
// webpack.config.js

const HtmlWebpackPlugin = require('html-webpack-plugin'); // install via npm
const webpack = require('webpack')； // to access built-in plugins
const path = require('path');

const config = {
    entry: './path/to/my/entry/file.js',
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'my-first-bundle.js'
    },
    module: {
        rules: [
            {
                test: /\.txt$/,
                use: 'raw-loader'
            }
        ]
    },
    plugins: [
        new webpack.optmize.UglifyJsPlugin(),
        new HtmlWebpackPlugin({
            template: './src/index.html'
        })
    ]
}
```

webpack包含了一些`内建(built-in)`的插件。[插件列表](https://doc.webpack-china.org/plugins/)


## 参考资料

[webpack官方docs](https://doc.webpack-china.org/concepts/)

[入门Webpack，看这篇就够了](http://www.jianshu.com/p/42e11515c10f)