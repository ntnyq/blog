---
title: 使用webpack打包你的代码
tags: [Webpack]
date: 2018-05-06 22:36:03
description: Webpack是目前最流行的代码打包工具，大部分命令行打包工具都有借鉴Webpack的设计思想，三大框架都选用Webpack作为推荐的打包工具，大量开源项目也使用它来进行打包，所以学会如何使用它很有必要。
category: 前端
---

[**Webpack**](https://github.com/webpack/webpack)是目前最流行的代码打包工具，大部分命令行打包工具都有借鉴Webpack的设计思想，三大框架都选用Webpack作为推荐的打包工具，大量开源项目也使用它来进行打包，所以学会如何使用它很有必要。

<!-- more -->

## 背景

本篇博文是承接先前的一篇博文[webpack入门学习-基础篇](http://ntnyq.github.io/webpack-abc/)的入门到进阶层次的文章。文章的核心还是关于如何配置和使用Webpack。并未涵盖Webpack的大部分高级特性。

目前 **Webpack**的最新版本为`v4.7.0。`

不过从`4.x.x`版本开始，为了改善大型项目Webpack配置困难的痛点，**Webpack**开始走部分技术推崇的*约定大于配置*的路线，而现有的比如`Vue`之类项目脚手架的webpack工具，仍然依赖的是`3.x.x`的版本。

所以本篇文章使用的webpack版本为`3.6.0`。

## 下载

可以通过如下的方式来下载Webpack作为项目**开发**依赖：

> 开发依赖的包的信息，会保存在`package.json`文件的`devDependencies`字段里。

``` bash
# NPM
$ npm install webpack@^3.6.0 --save--dev  # npm i webpack@^3.6.0 -D

# Yarn
$ yarn add webpack@^3.6.0 --dev
```

查看当前Webpack依赖版本

``` bash
$  .\node_modules\.bin\webpack -v

# Output
3.6.0 # 正确输出了版本
```



- Webpack Github Repo](https://github.com/webpack/webpack)  Webpack Github仓库
- [Webpack Official Website](https://webpack.js.org/) Webpack官方网站


## 使用

> Webpack需要通过命令行工具(**Shell**)来进行使用。

### 查看webpack命令行参数

可以看到webpack支持的参数十分丰富，具体参数用法可以参考[官方文档](https://webpack.js.org/concepts/)。

``` bash
$ .\node_modules\.bim\webpack --help

# 输出结果
Hash: 91e97ca469d808640ddb
Version: webpack 3.6.0
Time: 52ms
    Asset     Size  Chunks             Chunk Names
bundle.js  2.57 kB       0  [emitted]  main
   [0] ./src/js/main.js 101 bytes {0} [built]
PS C:\Users\M S I\Desktop\webpack-demo> .\node_modules\.bin\webpack
No configuration file found and no output filename configured via CLI option.
A configuration file could be named 'webpack.config.js' in the current directory.
Use --help to display the CLI options.
PS C:\Users\M S I\Desktop\webpack-demo> .\node_modules\.bin\webpack --help
webpack 3.6.0
Usage: https://webpack.js.org/api/cli/
Usage without config file: webpack <entry> [<entry>] <output>
Usage with config file: webpack

Config options:
  --config       Path to the config file
                         [string] [default: webpack.config.js or webpackfile.js]
  --config-name  Name of the config to use                              [string]
  --env          Environment passed to the config, when it is a function

Basic options:
  --context    The root directory for resolving entry point and stats
                                       [string] [default: The current directory]
  --entry      The entry point                                          [string]
  --watch, -w  Watch the filesystem for changes                        [boolean]
  --debug      Switch loaders to debug mode                            [boolean]
  --devtool    Enable devtool for better debugging experience (Example:
               --devtool eval-cheap-module-source-map)                  [string]
  -d           shortcut for --debug --devtool eval-cheap-module-source-map
               --output-pathinfo                                       [boolean]
  -p           shortcut for --optimize-minimize --define
               process.env.NODE_ENV="production"                       [boolean]
  --progress   Print compilation progress in percentage                [boolean]

Module options:
  --module-bind       Bind an extension to a loader                     [string]
  --module-bind-post                                                    [string]
  --module-bind-pre                                                     [string]

Output options:
  --output-path                 The output path for compilation assets
                                       [string] [default: The current directory]
  --output-filename             The output filename of the bundle
                                                   [string] [default: [name].js]
  --output-chunk-filename       The output filename for additional chunks
       [string] [default: filename with [id] instead of [name] or [id] prefixed]
  --output-source-map-filename  The output filename for the SourceMap   [string]
  --output-public-path          The public path for the assets          [string]
  --output-jsonp-function       The name of the jsonp function used for chunk
                                loading                                 [string]
  --output-pathinfo             Include a comment with the request for every
                                dependency (require, import, etc.)     [boolean]
  --output-library              Expose the exports of the entry point as library
                                                                        [string]
  --output-library-target       The type for exposing the exports of the entry
                                point as library                        [string]

Advanced options:
  --records-input-path       Path to the records file (reading)         [string]
  --records-output-path      Path to the records file (writing)         [string]
  --records-path             Path to the records file                   [string]
  --define                   Define any free var in the bundle          [string]
  --target                   The targeted execution environment         [string]
  --cache                    Enable in memory caching
                      [boolean] [default: It's enabled by default when watching]
  --watch-stdin, --stdin     Exit the process when stdin is closed     [boolean]
  --watch-aggregate-timeout  Timeout for gathering changes while watching
  --watch-poll               The polling interval for watching (also enable
                             polling)                                   [string]
  --hot                      Enables Hot Module Replacement            [boolean]
  --prefetch                 Prefetch this request (Example: --prefetch
                             ./file.js)                                 [string]
  --provide                  Provide these modules as free vars in all modules
                             (Example: --provide jQuery=jquery)         [string]
  --labeled-modules          Enables labeled modules                   [boolean]
  --plugin                   Load this plugin                           [string]
  --bail                     Abort the compilation on first error
                                                       [boolean] [default: null]
  --profile                  Profile the compilation and include information in
                             stats                     [boolean] [default: null]

Resolving options:
  --resolve-alias         Setup a module alias for resolving (Example:
                          jquery-plugin=jquery.plugin)                  [string]
  --resolve-extensions    Setup extensions that should be used to resolve
                          modules (Example: --resolve-extensions .es6,.js)
                                                                         [array]
  --resolve-loader-alias  Setup a loader alias for resolving            [string]

Optimizing options:
  --optimize-max-chunks      Try to keep the chunk count below a limit
  --optimize-min-chunk-size  Try to keep the chunk size above a limit
  --optimize-minimize        Minimize javascript and switches loaders to
                             minimizing                                [boolean]

Stats options:
  --color, --colors               Enables/Disables colors on the console
                                           [boolean] [default: (supports-color)]
  --sort-modules-by               Sorts the modules list by property in module
                                                                        [string]
  --sort-chunks-by                Sorts the chunks list by property in chunk
                                                                        [string]
  --sort-assets-by                Sorts the assets list by property in asset
                                                                        [string]
  --hide-modules                  Hides info about modules             [boolean]
  --display-exclude               Exclude modules in the output         [string]
  --display-modules               Display even excluded modules in the output
                                                                       [boolean]
  --display-max-modules           Sets the maximum number of visible modules in
                                  output                                [number]
  --display-chunks                Display chunks in the output         [boolean]
  --display-entrypoints           Display entry points in the output   [boolean]
  --display-origins               Display origins of chunks in the output
                                                                       [boolean]
  --display-cached                Display also cached modules in the output
                                                                       [boolean]
  --display-cached-assets         Display also cached assets in the output
                                                                       [boolean]
  --display-reasons               Display reasons about module inclusion in the
                                  output                               [boolean]
  --display-depth                 Display distance from entry point for each
                                  module                               [boolean]
  --display-used-exports          Display information about used exports in
                                  modules (Tree Shaking)               [boolean]
  --display-provided-exports      Display information about exports provided
                                  from modules                         [boolean]
  --display-optimization-bailout  Display information about why optimization
                                  bailed out for modules               [boolean]
  --display-error-details         Display details about errors         [boolean]
  --display                       Select display preset (verbose, detailed,
                                  normal, minimal, errors-only, none)   [string]
  --verbose                       Show more details                    [boolean]

Options:
  --help, -h     Show help                                             [boolean]
  --version, -v  Show version number                                   [boolean]
  --json, -j     Prints the result as JSON.                            [boolean]

```

### 打包生成信息

每次打包结束后，命令行就会输出如下信息：

``` bash
Hash: 91e97ca469d808640ddb # 此次打包文件(main.js)的哈希值
Version: webpack 3.6.0 # 当前webpack的版本
Time: 53ms # 打包耗时
    Asset     Size  Chunks             Chunk Names
bundle.js  2.57 kB       0  [emitted]  main # 打包生成文件名 大小等
   [0] ./src/js/main.js 101 bytes {0} [built] # 打包生成的文件目录 及打包成功提示
```

> 每次执行打包命令时，如果文件未发生变化，那么打包文件的哈希值是不变的。

### 命令行工具使用

#### 简单打包单个文件

``` bash
$  .\node_modules\.bin\webpack .\src\js\main.js ./dist/bundle.js
```

- **执行程序**  .\node_modules\.bin\webpack 因为是在命令行执行所以需要加上路径
- **入口文件**  指定一个入口文件，作为要打包的所有资源的注入点。
- **生成文件** 打包生成的最终文件，内部已经实现模块化，可为1个或者多个。

####  命令行监控文件并打包

此种打包模式可以通过在打包命令后添加`--watch`来实现，避免每次修改源文件后都需要手动执行打包命令。

通过此种方式运行命令后，命令行程序不会主动退出，每次修改源码后，命令行会显示新的打包结果相关信息。

``` bash
$  .\node_modules\.bin\webpack .\src\js\main.js ./dist/bundle.js --watch
```

### NPM Scripts使用

`package.json`关键部分如下：

``` bash
{
  "scripts": {
    "build": "webpack src/js/main.js dist/bundle.js", 
    "watch": "webpack src/js/main.js dist/bundle.js --watch"
  }
}
```

要在`watch`的时候**复用**`build`的命令，可以这样实现`npm run build -- --watch`

###  项目中使用

项目中使用推荐通过编写`webpack.config.js`的方式与`NPM Scripts`结合使用。

Webpack会自动尝试加载项目根目录下的`webpack.config.js`文件，并导入其内配置好的所有配置，来执行打包。

当然我们可以通过`--config`参数来提供一个别的名字的配置文件。

接下来就记录一下如何进行简单且常用的webpack配置。

## 配置Webpack

> 在项目根目录下创建`webapck.config.js`文件。

`webpack.config.js`文件需要通过**Commonjs**规范导出一个`JavaScript`对象，这个对象将成为webpack的打包配置。

这个对象主要包括了如下字段：

### Entry

文件打包的入口，所有的文件都要直接或间接地在这里产生依赖，才能被webpack程序运行时识别到。

配置示例：

``` js
module.exports = {
  entry: './path_to_file/entry_name.js'
};
```

上面的配置会被webpack转化成如下的形式：

``` js
module.exports = {
  entry: {
    main: './path_to_file/entry_name.js'
  }
};
```

最终生成的文件名[**chunkName**]为`main`

通常我们会将`entry`配置写为如下的形式:

``` js
module.exports = {
  entry: {
    app: './path_to_file/entry_name.js',
    vendors: ['module1', 'module2', 'module3']
  }
};
```

- `app`用来打包页面的主js文件，它可能会随着产品的迭代经常更改。
- `vendors`用来打包项目依赖，`dependencies`字段中一些可能长期不变的文件。

> 优点：可以方便利用文件的强制缓存，加快页面的加载速度，提升用户体验。

### Output

**Output**用于告知`webpack`打包后生成文件的目录，注意只能指定一个输出配置。

要使用此配置，最少需要配置2个属性。

1. 提供一个打包后生成的文件名格式。
2. 提供一个文件生成的**绝对路径**。

使用如下：

``` js
const path = require('path');

module.exports = {
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, './dist')
  }
};
```





## 

