---
title: 工作中的Vuejs项目开发实践
tags: [Vuejs]
date: 2018-05-20 01:01:58
description: 最近的工作是利用Vuejs开发一个新闻大数据的后台系统的项目，好久没有碰过Vuejs了，所以边做边思考，在这里做一下记录。
category: 学习
---

记录一下对最近正在做的Vuejs框架的项目的思考、实践过程中踩的坑和学习到的东西。<!-- more -->

## 背景

上周起，公司开启了一个新的项目。

将早先使用传统的基于**jQuery**的多页面架构的一个演示系统利用**Vuejs**框架以**SPA**的架构来进行重构（重写？）。

整个系统利用**jQuery**实现时大概有近30个页面，不过页面主要以数据展现为主，只有少部分页面才有着交互功能。

因为公司目前从事前端工作的就我一个人，所以这个项目暂定由我一个人来完成前端方面的工作。

后端API方面，因为系统使用的是第三方提供的数据API，所以只是由公司的`PHP`和`JAVA`后端同事对三方API进行封装和简单加工，比如排序、过滤、适配数据格式和计算出前端能直接展现的数据，方便我这边调用。

项目上面，别人先提供了一个早先完成了一小部分的项目模板，可以复用一部分通用组件和项目架构，不过同时也限制了一些项目依赖的版本。

毕竟我并没有过使用Vue进行工作中的项目开发的经验，提供的模板也在一定程度上给我提供了一个项目架构，否则的话我只能去**Github**上面**Down**一个来参考着开发了。

不过在实际使用中，我也根据自己的需求和社区推荐的**最佳实践**来对早先的项目模板进行了重构，来适应自己的开发习惯。

工期暂定为65天左右（不包括周末），目前已经过去了一周。

我个人对本次**Vuejs**框架的项目是十分期待的，毕竟先前的工作没有做过这方面的，想积累一些使用框架和**UI库**来进行开发的经验。

> 之前的工作样式方面都以**手写样式**为主。

毕竟只有简单利用开发过**个人小项目**的经验\-\-\-\-先前使用Vuejs框架简单实现过知乎日报，可想而知本次开发过程中会遇到很多坑点，所以我决定将本次开发经历详细地记录到此篇博文里。

顺便最近利用下班时间一直在看一本书**<<Vue.js前端开发快速入门与专业应用>>**，希望能对开发过程有所帮助。

## 技术栈

关于技术栈这方面，并没有什么规定，**Vuejs全家桶**是少不了的。

项目使用`Vue-cli`的**Webpack**模板进行创建，所有项目打包工具也自然而然地使用了**Webpack**。

因为有先前实现过几个页面的Demo，封装的一部分组件是基于**Element-UI**的，而且**Element-UI**也是Vuejs实现后端系统大家都在使用的UI库，所以UI库仍然使用**Element-UI**。

代码风格检查使用了**ESLint**，它也是`Vuejs`官方推荐的代码风格检查工具，而且它是完全可配置的。代码风格的规定继承了**Standard**规范（Vue-cli创建项目时可选），然后再根据自身代码风格对部分规则进行了覆盖和重写。

数据请求方面，早先的Demo使用了**whatwg-fetch**模块来直接封装`Common-Query API`，因为我使用的是后端二次封装后的API，所以将数据请求使用的模块改为了Vuejs官方推荐的**Axios**并且引入了**qs**模块来发送`POST`请求。

动画方面虽然页面以数据展示为主，设计的动画也并不多，不过为了增强用户体验，仍然引入了动画库**Animate.css**。

时间格式化方面使用了**Moment**模块。

接口返回的数据处理方面，根据需求来按需引入**lodash**模块。

CSS预处理器方面，因为提供的组件使用了**Sass**，所以我这边也仍然使用它。

以上各种模块的对应版本如下表：

|   模块名    |  版本号  |
| :---------: | :------: |
|     vue     |  v2.5.2  |
| vue-router  |  v2.6.0  |
|    vuex     |  v2.3.1  |
|    axios    | v0.18.0  |
| element-ui  | v1.4.13  |
| animate.css |  v3.6.1  |
|   lodash    | v4.17.10 |
|   moment    | v2.22.1  |
|     qs      |  v6.5.2  |

## 项目创建

项目使用**Yarn**来进行依赖包的下载和管理，使用**Vue-cli**进行项目创建。

使用**Vue-cli**创建项目，使用`vue-router`，使用`eslint`，不使用*单元测试*和*端对端测试*。

打开`./config/index.js`，修改`autoOpenBrowser`为`true`，修改`notifyOnErrors`为`false`（这个功能太烦人了。）

运行项目

``` bash
$ yarn dev
```

## 项目目录

虽然有先前实现过部分页面的`Demo`，不过整个项目仍然是我从零开始创建的，毕竟自己走一遍流程，会更加熟悉项目的结构。

项目文件目录如下：

``` bash
project
│ ├─build # Vuejs的webpack打包运行脚本
│ ├─config # Vuejs的webpack打包配置脚本
│ ├─node_modules # 项目依赖 npm包
│ └─src # 项目主要源码
|    ├─assets # 项目图标，页面背景图等资源。
|    ├─components # 封装的可复用的功能性组件 根据业务对Element-UI进行二次封装。
|    ├─constants # 项目配置文件，常量，方便修改。如项目名，系统页面目录，i18n多语言支持等。
|    ├─pages # 以页面为结构切分的vue组件 对应不同的路由。
|    ├─router # 路由文件
|    ├─services # API服务封装
|    ├─store # 状态管理
|    ├─utils # 通用方法封装
|    ├─App.vue # 项目根组件
|    ├─main.js # Webpack打包入口文件，连接其他文件
|    └─style.scss # App.vue的样式文件，可以用style标签写入App.vue。
|
│ ├─static # 项目用到的静态资源 不常迭代的三方资源 
│ ├─theme # Element-UI官方下载的组件自定义主题样式css文件
│ ├─.babelrc # Babel转译工具配置
│ ├─.editorconfig # 编辑器规范配置
│ ├─.eslintignore # 不进行ESLint检查的文件和目录配置
│ ├─.eslintrcjs # ESLint检查规则配置
│ ├─.gitignore # 不使用Git追踪的文件配置
│ ├─element-variables.css # Element-UI变量
│ ├─index.html # 单页应用的模板HTML文件
│ ├─package.json # Node项目的包管理等信息
│ ├─README.md # 项目说明文件
│ └─yarn.lock # Yarn包管理生成的包版本文件
```

## 配置ESLint

因为提供的Demo和组件的代码风格和我有很大的不同，而接下来的开发周期很可能只会是我一个人参与，所以我根据自己的代码风格重新配置了ESLint。

### 忽略对提供文件的代码检查

在`./eslintignore`文件中添加`src/components/*`忽略对所有提供组件的代码风格检查。

### 根据需要配置新的检查规则

新的代码风格检查规则如下：

```js
// https://eslint.org/docs/user-guide/configuring

module.exports = {
  root: true, // 不再向上搜索配置文件
  parserOptions: {
    parser: 'babel-eslint'
  },
  env: {
    browser: true, // 代码运行在浏览器端
  },
  extends: [
    // https://github.com/vuejs/eslint-plugin-vue#priority-a-essential-error-prevention
    // consider switching to `plugin:vue/strongly-recommended` or `plugin:vue/recommended` for stricter rules.
    'plugin:vue/essential', // 继承Vue推荐代码风格
    // https://github.com/standard/standard/blob/master/docs/RULES-en.md
    'standard' // 继承standard代码风格
  ],
  // required to lint *.vue files
  plugins: [
    'vue'
  ],
  // add your custom rules here
  rules: {
    'generator-star-spacing': 0, // allow async-await
    'semi': [2, 'always'],    // 必须使用分号，且正确使用
    'semi-spacing': 0,  // 强制分号之前和之后使用一致的空格
    'one-var': [2, { // 变量连续声明
      var: 'always',
      let: 'always',
      const: 'never'
    }],
    'indent': [2, 2, {
      VariableDeclarator: 2/*, // 多行变量连续声明变量名缩进对齐
      MemberExpression: 2*/
    }],
    'padded-blocks': [0, 'always'], // 关闭块作用域填充空行
    'comma-dangle': [2, 'never'], // 禁止对象后出现无用的逗号
    'no-multi-spaces': 2, // 禁止使用多个空格
    'no-void': 0, // 关闭禁用Void
    // allow debugger during development
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off' // 无调试信息
  }
};
```

## 配置Babel

为了优化打包后体积，我们采取按需加载`Element-UI`的方式(需要使用`babel-plugin-component`插件)，所以需要在`.babelrc`文件中进行相关的配置。

最终配置文件如下所示：

``` json
{
  "presets": [
    ["env", {
      "modules": false,
      "targets": {
        "browsers": ["> 1%", "last 2 versions", "not ie <= 8"]
      }
    }],
    "stage-2"
  ],
  "plugins": [
    "transform-vue-jsx",
    "transform-runtime",
    ["component", [
        {
            "libraryName": "element-ui", 
            "styleLibraryName": "~theme"
        }
    ]]
  ]
}
```




## 踩坑记录

### 无法修改UI库组件样式

**.vue**文件中的`style`标签如果被设置了`scoped`属性，那么最终会在编译生成的css上加上一个哈希值，那么这个新的选择器就无法选择到Ui库的样式。

所以要覆盖UI库的样式，就不能给组件加`scoped`属性。这时候我们可以使用**BEM**命名法来防止样式冲突。

### 给元素绑定行内样式

使用`v-bind:style`如下形式来绑定行内样式：

``` html
<foo-bar :style="{ width: value }" />
```

> 如果有多条样式，建议以对象的方式传入

### 异步更新组件内容无法触发视图更新

原因，组件在异步更新之前已经渲染，这时候父子组件间还没有通过`props`来进行传值。然后在`created mounted` 的生命周期函数内，会使用默认值来进行渲染。

解决方法：

1. 在需要异步更新的组件上增加`v-if`属性，通过在异步操作结束后更新标志位的方式来触发组件更新。
2. 使用watch功能，监听`props`传入的数据，手动更新，覆盖当前data返回的数据，触发视图更新。

### 路由访问

组件内访问当前路由使用`this.$route`。

组件内调用路由的方法使用`this.$router`。

### 渲染样式完全不同的列表

在`v-for`内部使用`template`内置组件，在上面使用`v-if`，`v-else`等逻辑，来进行条件渲染。

当组件挂载到DOM上时候，`template`标签会自动移除。

``` vue
<ul class="list">
  <li
      v-for="(item, index) in list"
      :key="index"
      :class="{
         item1: item.type === 1,
         item2: item.type === 2,
         item3: item.type !== 1 && item.type !== 2
       }"
      >
  	<template v-if="item.type === 1">
			<section>1</section>
    </template>
  	<template v-else-if="item.type === 2">
			<section>2</section>
    </template>	
  	<template v-else>
			<section>3</section>
    </template>		
  </li>
</ul>
```

### UI库组件绑定的事件无法触发。

原因： **Vue2.0**开始，为**自定义组件**绑定**原生事件**必须使用`.native`修饰符。

``` vue
<my-component @click.native="handleClick">Click Me</my-component>
```

[Element-ui-FAQ](https://github.com/ElemeFE/element/blob/dev/FAQ.md)

### 打包后样式丢失

开发时候使用了`-webkit-box-orient: vertical;`来控制文本多行溢出隐藏。

但是经过`webpack`打包后部署到线上发现该条样式丢失了，查询资料后发现是被`autoprefixer`移除了。

解决方式：在该条样式前后分别加上`/*! autoprefixer: off */`和`/*! autoprefixer: on */`来跳过对该条样式的处理。

### Axios的POST请求无法发送数据。

因为`axios`会对post的参数进行处理，所以根据查询到的资料，使用了`qs`库。

但是今天重新装了一遍依赖后，axios的请求不再发送数据，反而注释掉了有关**qs**库的使用后正常了。

可能原因：先前我的`yarn.lock`文件保存到所有包的仓库都是`yarn`的官方仓库下载的，前两天我将仓库默认地址切换到了淘宝的地址，所以应该`lock`文件也无法保证下载的依赖是完全相同的了。

### 使用Element-UI封装的地域联动选择插件无法绑定初始值。

项目中，有个配置页面，支持2种操作。

1. 创建一条配置，默认地域选择为全部。
2. 更新某条配置，需要绑定先前设置的地域配置。

在开发种选择了使用**Element-UI**的**Select**组件进行封装，来实现地域选择的二级联动效果。

使用HTTP请求，读取地域数据(**Json**)。再迭代数据，获取到所有的省份，绑定给省级区域下拉列表，再根据省级区域的选择结果读取对应的市级地域数据，渲染出市级区域下拉列表供用户选择。

但在更新值的时候，发现一次请求得到的地域信息值，无法同时将省级区域和市级区域绑定到二级地域联动选择上。

思考：个人觉得可行的办法是，在初次未进行选择的时候，市级区域，默认可供选择的区域数据为所有的市级区域。(**数据量过大**)

最终商量后，解决方案修改为使用**Element-UI**的**Cascade**插件来实现二级地域联动效果。这个组件本身便是支持级联选择的，同时可以给组件绑定默认值。

### 前端返回需要图片，后端数据返回无图片。

首次在**Vue**项目中遇到这样的问题。

从设计的角度来说，列表内的新闻项都应该有新闻相关图片，但是三方API有时候并不能提供图片，新闻项的图片字段为**null**。

那么，首先想到的解决方案就是，在图片加载失败的时候，选择展现默认图片，并将其地址赋值给图片的**src**属性，再将这个错误事件清除掉，避免多次触发。实现如下：

``` html
<img :src="images.jpg" onerror="this.src='path_to_the_pic/pic.jpg'; this.onerror=null;" />
```

但在实际应用中，发现如何设置图片地址是个问题。

因为vue项目在经过`webpack`打包后，会将相关静态文件打包到`static`目录下，并且给文件加上**哈希值**。

经过查询资料后，知道了应该让webpack处理这个图片，那么打包后的引用关系就能正常。

实现方法就是`:onerror="this.src=' " + require('@/assets/default.png') + "'"`，使用`require`方法引入图片。

但是默认图片仍然无法正常展示。

开始，我怀疑是因为单双引号的问题，导致内联`js代码`无法正常执行。

后来，经过多次替换括号类型等，发现并不能实际解决问题。

仔细研究良久后恍然大悟，因为使用`v-bind`给图片绑定`src`属性，但是绑定的内容为`null`，所以图片根本不会发起**资源请求**，那么也便不存在失败一说，继而无法触发`onerror`事件。

解决：在项目的**Store**文件夹下的`modules`中，寻找对应的**JS模块**。

将图片通过`webpack`处理，获取处理后的图片引用地址。

使用`map`方法，改变`actions`里，判断新闻项的图片字段是否为空，若为空将其修改为默认的图片链接。

## 未完待续

