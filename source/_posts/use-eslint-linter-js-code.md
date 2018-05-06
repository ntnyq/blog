---
title: use-eslint-linter-js-code
tags: [eslint]
date: 2018-05-05 16:37:27
description: 使用ESlint来检查你的JavaScript代码。
category: 学习

---

本文旨在记录学习配置和使用**ESLint**这款代码检查工具。<!-- more -->

我们都知道，如何与团队其他人高效地进行协作开发是多人团队的一个痛点。

每个人都有独立的编码习惯，虽然团队可以通过制定强制执行的规范来保持大家代码风格的尽量一致。

但是，在实际编码过程中，个人可能会不经意地继续使用着自己的代码风格，而等到发现不一致再解决又未免有点迟。

而**ESLint**正是为解决这类问题而生的。

[**ESLint**](https://eslint.org/)是一款当前应用十分广泛的JavaScript代码检查工具。本文将从零开始，记录如何从下载配置使用ESLint来进行代码检查工作。

## 下载

### 源码下载

> 当前Stable版本是4.19.1，alpha版本5.0.0

[Github Repo](https://github.com/eslint/eslint)

### NPM/Yarn

```bash
# npm
$ npm install eslint -g

# yarn
$ yarn global add eslint
```

> 检测是否下载成功

``` bash
$ eslint -v # v4.19.1
```

## 配置

ESLint的一大优点就是它所提供的**所有代码检查规则都是可配置的**。个人或者团队可以根据需要，切合自身的需求来定制属于自己的代码检查规则。

### 规则配置

ESLint的使用需要通过命令行工具(**Shell**)。

在使用之前，需要先配置好ESLint的代码检查规则**Rules**，否则直接使用ESLint检查代码会抛出一个如下的错误。

``` 
ESLint couldn't find a configuration file. To set up a configuration file for this project, please run:

    eslint --init
```

如果我们要使用ESLint来检查自己的日常JavaScript代码，而并非在项目中使用的话，可以使用`eslint --init`命令来在全局生成一个规则配置文件。

`eslint --init`命令会以命令行选择交互的方式来生成这个规则文件。在输入命令后，会得到如下的结果：

``` bash
? How would you like to configure ESLint? (Use arrow keys)
> Answer questions about your style
  Use a popular style guide
  Inspect your JavaScript file(s)
```

1. Answer questions about your style*  通过回答问题来生成规则文件
2. Use a popular style guide*  使用已经配置好的流行的规则(别人推荐的最佳实践)
3. Inspect your JavaScript file(s)* 检查现有的JavaScript文件来自动生成



选择**选项1**后，ESLint会询问你一系列问题，来自动生成规则文件。问题如下：

1.  Are you using ECMAScript 6 features? (y/N)
2.  Are you using ES6 modules? (y/N)
3.  Where will your code run? (Press <space> to select, <a> to toggle all, <i> to inverse selection)
   - Browser
   -  Node
4.  Do you use CommonJS? (y/N)
5.  Do you use JSX? (y/N)
6.  What style of indentation do you use? (Use arrow keys)
   - Tabs
   - Spaces
7.  What quotes do you use for strings? (Use arrow keys)
   - Double
   - Single
8.  What line endings do you use? (Use arrow keys)
   - Unix
   - Windows
9.  Do you require semicolons? (Y/n)



选择**选项2** 后，会让你选择一个规则来源，默认提供3个，分别是**Google**， **Airbnb**和**Standard**，再次进行选择后，会让你选择规则文件的格式，格式可以为3种，分别为`JavaScript`，`YAML`和`JSON`。

3种文件格式分别为：

``` json
{
    "extends": "airbnb-base"
}
```

``` yaml
extends: google
```

``` js
module.exports = {
    "extends": "standard"
};
```

> 以上3个规则库的具体规则条目，可以查看对应的下载得到的node_modules文件里文件。



选择**选项3**后，会以一些交互式的问题开始，问题包含**选择1**的前面部分，然后可以选择`JavaScript`文件或者目录来进行代码风格检测，再根据检测的结果来生成配置文件(**包含大量规则**)。

通过对我自己的代码风格检测，生成了如下文件：

``` js
module.exports = {
    "env": {
        "browser": true
    },
    "extends": "eslint:recommended",
    "rules": {
        "accessor-pairs": "error",
        "array-bracket-newline": "error",
        "array-bracket-spacing": "error",
        "array-callback-return": "error",
        "array-element-newline": "error",
        "arrow-body-style": "error",
        "arrow-parens": "error",
        "arrow-spacing": "error",
        "block-scoped-var": "error",
        "block-spacing": "error",
        "brace-style": [
            "error",
            "1tbs"
        ],
        "callback-return": "error",
        "camelcase": "error",
        "capitalized-comments": "error",
        "class-methods-use-this": "error",
        "comma-dangle": "error",
        "comma-spacing": [
            "error",
            {
                "after": true,
                "before": false
            }
        ],
        "comma-style": [
            "error",
            "last"
        ],
        "complexity": "error",
        "computed-property-spacing": "error",
        "consistent-return": "error",
        "consistent-this": "error",
        "curly": "error",
        "default-case": "error",
        "dot-location": [
            "error",
            "property"
        ],
        "dot-notation": "error",
        "eol-last": [
            "error",
            "never"
        ],
        "eqeqeq": "error",
        "for-direction": "error",
        "func-call-spacing": "error",
        "func-name-matching": "error",
        "func-names": [
            "error",
            "never"
        ],
        "func-style": [
            "error",
            "expression"
        ],
        "function-paren-newline": "error",
        "generator-star-spacing": "error",
        "getter-return": "error",
        "global-require": "error",
        "guard-for-in": "error",
        "handle-callback-err": "error",
        "id-blacklist": "error",
        "id-length": "error",
        "id-match": "error",
        "implicit-arrow-linebreak": "error",
        "indent": "off",
        "indent-legacy": "off",
        "init-declarations": "error",
        "jsx-quotes": "error",
        "key-spacing": "error",
        "keyword-spacing": [
            "error",
            {
                "after": true,
                "before": true
            }
        ],
        "line-comment-position": "off",
        "linebreak-style": [
            "error",
            "windows"
        ],
        "lines-around-comment": "error",
        "lines-around-directive": "error",
        "lines-between-class-members": "error",
        "max-depth": "error",
        "max-len": "off",
        "max-lines": "error",
        "max-nested-callbacks": "error",
        "max-params": "error",
        "max-statements": "off",
        "max-statements-per-line": "error",
        "multiline-comment-style": [
            "error",
            "starred-block"
        ],
        "multiline-ternary": "error",
        "new-cap": "error",
        "new-parens": "error",
        "newline-after-var": [
            "error",
            "always"
        ],
        "newline-before-return": "error",
        "newline-per-chained-call": "off",
        "no-alert": "error",
        "no-array-constructor": "error",
        "no-await-in-loop": "error",
        "no-bitwise": "error",
        "no-buffer-constructor": "error",
        "no-caller": "error",
        "no-catch-shadow": "error",
        "no-confusing-arrow": "error",
        "no-continue": "error",
        "no-div-regex": "error",
        "no-duplicate-imports": "error",
        "no-else-return": "error",
        "no-empty-function": "error",
        "no-eq-null": "error",
        "no-eval": "error",
        "no-extend-native": "error",
        "no-extra-bind": "error",
        "no-extra-label": "error",
        "no-extra-parens": "error",
        "no-floating-decimal": "error",
        "no-implicit-globals": "off",
        "no-implied-eval": "error",
        "no-inline-comments": "off",
        "no-inner-declarations": [
            "error",
            "functions"
        ],
        "no-invalid-this": "error",
        "no-iterator": "error",
        "no-label-var": "error",
        "no-labels": "error",
        "no-lone-blocks": "error",
        "no-lonely-if": "error",
        "no-loop-func": "error",
        "no-magic-numbers": "off",
        "no-mixed-operators": [
            "error",
            {
                "allowSamePrecedence": true
            }
        ],
        "no-mixed-requires": "error",
        "no-multi-assign": "error",
        "no-multi-spaces": "error",
        "no-multi-str": "error",
        "no-multiple-empty-lines": "error",
        "no-native-reassign": "error",
        "no-negated-condition": "error",
        "no-negated-in-lhs": "error",
        "no-nested-ternary": "error",
        "no-new": "error",
        "no-new-func": "error",
        "no-new-object": "error",
        "no-new-require": "error",
        "no-new-wrappers": "error",
        "no-octal-escape": "error",
        "no-param-reassign": "error",
        "no-path-concat": "error",
        "no-plusplus": "off",
        "no-process-env": "error",
        "no-process-exit": "error",
        "no-proto": "error",
        "no-prototype-builtins": "error",
        "no-restricted-globals": "error",
        "no-restricted-imports": "error",
        "no-restricted-modules": "error",
        "no-restricted-properties": "error",
        "no-restricted-syntax": "error",
        "no-return-assign": "error",
        "no-return-await": "error",
        "no-script-url": "error",
        "no-self-compare": "error",
        "no-sequences": "error",
        "no-shadow": "error",
        "no-shadow-restricted-names": "error",
        "no-spaced-func": "error",
        "no-sync": "error",
        "no-tabs": "error",
        "no-template-curly-in-string": "error",
        "no-ternary": "error",
        "no-throw-literal": "error",
        "no-trailing-spaces": "error",
        "no-undef-init": "error",
        "no-undefined": "error",
        "no-underscore-dangle": "error",
        "no-unmodified-loop-condition": "error",
        "no-unneeded-ternary": "error",
        "no-unused-expressions": "error",
        "no-use-before-define": "error",
        "no-useless-call": "error",
        "no-useless-computed-key": "error",
        "no-useless-concat": "error",
        "no-useless-constructor": "error",
        "no-useless-rename": "error",
        "no-useless-return": "error",
        "no-var": "off",
        "no-void": "error",
        "no-warning-comments": "error",
        "no-whitespace-before-property": "error",
        "no-with": "error",
        "nonblock-statement-body-position": "error",
        "object-curly-newline": "error",
        "object-curly-spacing": "error",
        "object-property-newline": "error",
        "object-shorthand": "off",
        "one-var": "off",
        "one-var-declaration-per-line": "error",
        "operator-assignment": [
            "error",
            "always"
        ],
        "operator-linebreak": "error",
        "padded-blocks": "off",
        "padding-line-between-statements": "error",
        "prefer-arrow-callback": "off",
        "prefer-const": "error",
        "prefer-destructuring": "error",
        "prefer-numeric-literals": "error",
        "prefer-promise-reject-errors": "error",
        "prefer-reflect": "error",
        "prefer-rest-params": "error",
        "prefer-spread": "error",
        "prefer-template": "off",
        "quote-props": "off",
        "quotes": [
            "error",
            "single"
        ],
        "radix": "error",
        "require-await": "error",
        "require-jsdoc": "error",
        "rest-spread-spacing": "error",
        "semi": "error",
        "semi-spacing": "error",
        "semi-style": [
            "error",
            "last"
        ],
        "sort-imports": "error",
        "sort-keys": "error",
        "sort-vars": "off",
        "space-before-blocks": "error",
        "space-before-function-paren": "off",
        "space-in-parens": [
            "error",
            "never"
        ],
        "space-infix-ops": "error",
        "space-unary-ops": "error",
        "spaced-comment": [
            "error",
            "always"
        ],
        "strict": [
            "error",
            "never"
        ],
        "switch-colon-spacing": "error",
        "symbol-description": "error",
        "template-curly-spacing": "error",
        "template-tag-spacing": "error",
        "unicode-bom": [
            "error",
            "never"
        ],
        "valid-jsdoc": "error",
        "vars-on-top": "off",
        "wrap-iife": "error",
        "wrap-regex": "error",
        "yield-star-spacing": "error",
        "yoda": [
            "error",
            "never"
        ]
    }
};
```

### 规则释意

主要观察上面生成的`.eslintrc.js`文件的**rules**部分，它整体是一个json对象。键是规则的名字，值是关于此规则的配置。

关于每条规则名称的具体含义，我们可以通过其中文意思进行理解，或者查看[ESLint官方Rules介绍文档]()。

而配置则都由这些值开始：

- `"off"` 或者`0` - 代表关闭此条规则，即不做关于此规则的检测。
- `"warn"` 或者 `1` - 将此条规则设置为需要进行*warning*警告的规则，eslint程序的返回码不变。
- `"error"` 或者 `2` - 将此条规则设置为需要进行`error`报错的规则，eslint程序的返回码将变为1。

## 使用

在不指定配置文件的情况下，会默认加载运行命令目录下符合配置文件格式(文件名和扩展名符合)的文件。

### 简单使用

> 默认检测结果会输出到命令行工具窗口里。

#### 检测单个文件

``` bash
$ eslint yourfile.js
```

#### 检测多个文件

``` bash
$ eslint foo.js bar.js 
```

#### 检测目录下所有文件

这里可以指定格式，因为ESLint不止可以检查`js`文件。

``` bash
$ eslint your_directory/**.js
```

#### 检测目录

``` ba
$ eslint directory_name [directory_name2]
```

### 复杂使用

首先，ESLint命令支持如下参数：

``` bash
eslint [options] file.js [file.js] [dir]

Basic configuration:
  --no-eslintrc                  Disable use of configuration from .eslintrc.*
  -c, --config path::String      Use this configuration, overriding .eslintrc.* config options if present
  --env [String]                 Specify environments
  --ext [String]                 Specify JavaScript file extensions - default: .js
  --global [String]              Define global variables
  --parser String                Specify the parser to be used
  --parser-options Object        Specify parser options

Specifying rules and plugins:
  --rulesdir [path::String]      Use additional rules from this directory
  --plugin [String]              Specify plugins
  --rule Object                  Specify rules

Fixing problems:
  --fix                          Automatically fix problems
  --fix-dry-run                  Automatically fix problems without saving the changes to the file system

Ignoring files:
  --ignore-path path::String     Specify path of ignore file
  --no-ignore                    Disable use of ignore files and patterns
  --ignore-pattern [String]      Pattern of files to ignore (in addition to those in .eslintignore)

Using stdin:
  --stdin                        Lint code provided on <STDIN> - default: false
  --stdin-filename String        Specify filename to process STDIN as

Handling warnings:
  --quiet                        Report errors only - default: false
  --max-warnings Int             Number of warnings to trigger nonzero exit code - default: -1

Output:
  -o, --output-file path::String  Specify file to write report to
  -f, --format String            Use a specific output format - default: stylish
  --color, --no-color            Force enabling/disabling of color

Inline configuration comments:
  --no-inline-config             Prevent comments from changing config or rules
  --report-unused-disable-directives  Adds reported errors for unused eslint-disable directives

Caching:
  --cache                        Only check changed files - default: false
  --cache-file path::String      Path to the cache file. Deprecated: use --cache-location - default: .eslintcache
  --cache-location path::String  Path to the cache file or directory

Miscellaneous:
  --init                         Run config initialization wizard - default: false
  --debug                        Output debugging information
  -h, --help                     Show help
  -v, --version                  Output the version number
  --print-config path::String    Print the configuration for the given file
```

#### 使用NPM/Yarn命令运行代码检查

在`package.json`文件的`scripts`添加如下字段：

``` json
{
  "scripts": {
    "lint": "eslint file_or_directory_you_wanna_lint"
  }
}
```

运行命令

``` bash
# NPM
npm run lint

# Yarn
yarn lint
```

#### 文件输出结果

可以通过`-o, --output-file`参数来指定以文件的格式输出，通过`-f, --format`参数来指定输出的文件格式。

``` bash
$ eslint -f compact file.js
```

#### 项目代码内局部检查跳过

可以通过以下注释方式来让ESLint跳过检查。

``` js
/*eslint-disable*/  // 以下禁用检查
/*eslint-enable*/ // 以下启用检查
/*global*/ // 全局
/*eslint*/
/*eslint-env*/ // 局部修改环境变量
// eslint-disable-line // 当前行跳过检查
// eslint-disable-next-line // 下一行跳过检查
```

#### 忽略文件

可以在配置文件同级别下创建`.eslintignore`文件来进行忽略代码检查文件的配置，例：

``` bash
node_modules/*
**/vendor/*.js
```

## 常见问题

### ESLint找不到配置的插件

原因：如果使用全局的ESLint来检查代码，那么配置的插件也必须再全局下载。如果在项目内使用ESLint，那么ESLint和对应的插件都必须存在于`package.json`文件的`devDependencies `里作为依赖，并且需要正确被下载。

## 参考资料

[ESLint 官方Docs](https://eslint.org/docs/)





 