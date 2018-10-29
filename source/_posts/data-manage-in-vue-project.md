---
title: Vue项目中的数据管理。
tags: [Vue, Vuex]
date: 2018-10-29 09:00:11
description: 浅谈Vue项目中如何进行数据管理，以及Vuex的基本用法。
category: 前端
---

浅谈Vue项目中如何进行数据管理，以及Vuex的基本用法。

<!-- more -->

## 背景

最近连续3个项目都在使用 [Vue](https://vuejs.org/) 框架进行开发，踩了不少坑，阅读了很多资料，也学到了很多技巧。

昨晚在写 Demo 的时候，发现自己最近项目中使用 [Vuex](https://vuex.vuejs.org/) 的方式有些错误。所以特地深入研究了一番，顺便写下这篇文章做个记录。

## 踩坑

上个项目的数据管理方案为：将整个项目的所有页面按功能点划分为几大模块(根据目录)，再将每个模块映射到 Vuex 的`modules`，并且通过`modules`内使用`namespced`来导出模块。具体如下：

### vuex入口

伪代码如下：

``` js
// src/store/index.js
import Vue from 'vue'
import Vuex from 'vuex'

import modules from './modules'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules
})

export default store
```

``` js
// src/store/modules/index.js
import userState from './user-state'
import appState from './app-state'

// 将所有modules整合成一个对象导出
export dafault {
  userState,
  appState
}
```

``` js
// src/store/modules/user-state.js
import * as Api from '@/services/user' // api
import types from '@/store/mutation-types' // mutation-types 使用了keyMirror
import { mapMutations, mapActions } from '@/store/helpers' // 辅助函数

const state = {
	user: {}  
}

const conf = [
  {
    name: 'login',
    mutation: types['LOGIN'],
    service: Api.login,
    success (state, { res }) {
      state.user = res.data.user
    }
  }
]

const actions = {
	...mapActions(conf) // 辅助函数生成actions 调用api 并且根据结果提交对应mutation
}

const mutations = {
	...mapMutations(conf) // 辅助函数 生成mutations 分为调用、成功和失败，若不传回调，则为noop
}

export default {
  namespaced: true, // 启用命名空间
  state,
  actions,
  mutations
}
```

### 页面使用数据和调用方法

页面通过`mapState`辅助函数，导入对应`modules`中的数据`state`，通过调用`mapActions`辅助函数导出的方法来进行数据请求。伪代码如下：

``` vue
<script>
import { mapState, mapActions } from 'vuex' // 导出vuex辅助函数
const NAMESPACE = 'namedState' // 设置命名空间 对应vuex modules 的 key
export default {
  computed: {
    // 导出命名空间下的数据
    ...mapState(NAMESPACE, [
      'stateKey'
    ])
  },
  methods: {
    fetchData () {	
      // 调用方法
      this.actionKey(params)
        .then(res => {
          // do something
        })
    },  
    // 导出命名空间下的方法
    ...mapActions(NAMESPACE, [
      'actionKey'
    ])
  },
  mounted () {
    this.fetchData()
  }
} 
</script>
```

### 缺陷

从数据流动上来说，是完全按照 Vue 规范的数据单向流动进行的。业务上是完全可以跑通的，并且不会出现Bug。

但是会导致 Vuex 缓存的数据过多，页面占用内容增大，每个页面` created`后就一直会维持一份自己的数据。进入页面后，若数据返回较慢，则会出现一次数据更新时候的闪动，用户体验不好。（对于这个问题，当时的解决方案是增加清空数据的`actions`，并且在页面组件的`beforeDestroy`钩子函数中调用）

同时也增加了项目架构的复杂性，理解数据的流程更加困难，并且进行了很大一部分完全没有必要的编码。

针对这个问题，我早先和提供代码的人沟通过，他说是把数据缓存在 Vuex 中，并且把数据请求也封装进去，是为了方便埋点，做日志。精确记录用户都做了哪些数据请求，成功和失败的各种记录。

##  正确使用Vuex

> 配合 Vuejs Devtools，更容易理解Vuex。

先从语义上理解以下几个词：

- **store**  存储
- **state** 状态
- **dispatch** 调度
- **action** 行为
- **mutation** 转变
- **commit** 提交

### 使用规范

正确使用 Vuex，需要遵循这几个原则：

1. 正确理解 Vuex 和 组件之间数据的单向流动
2. 使用`dispatch`来调用定义好的`action`，在组件中可以通过`this.$store.dispatch`访问到。
3. 使用`action`来提交`mutation`，`action`可以同时提交多个`mutation`，并且可以包含异步操作来修改`mutation`。
4. 使用`mutation`来更新`state`，`mutation`只能同步地修改`state`。
5. 需要使用基于`state`而衍生的数据时候，可以定义一个`getter`，类似于组件中的`computed`。

### Vue组织结构

Vuex 的组织是一个类似树状的结构，如下伪代码所示：

``` js
export default new Vuex.Store({
  state: {},
  actions: {},
  mutations: {},
  getters: {},
  modules: {
    foo: {
      state: {},
      actions: {},
      mutations: {}
    },
    bar: {
      state: {},
      actions: {},
      mutations: {}
    },
 		// more modules
  }
});
```



### 辅助函数

> 命名空间模式 指，vuex 中的 某个module，设置了`namespaced： true`来导出。

- mapState

  在组件中使用可以导出状态数据。需要在computed字段使用。在状态树根部定义的属性可以通过`state.key`来进行访问，而在 module 中定义的的状态，则需要通过`state.module.key`来实现访问。

- mapGetters

  在组件中使用可以导出状态数据。需要在computed字段使用。在 getters 不多的情况下，建议只在 状态树 根部 定义 getters，并且抽离出单独的文件来进行维护。

- mapActions

  在组件中使用可以导出方法，需要在methods字段使用。普通的 module 和 状态树 根部定义的方法，都可以直接通过 `mapActions` 函数访问到。但是命名空间模式的方法导入，需要第一个参数传命名空间名，如`...mapActions(NAMESPACE, ['foo'])`，或者通过`...mapActions(['NAMESPACE/foo'])`的方式来进行导出。

- mapMutations

  不建议做导出，因为官方推荐使用 action 来 **commit** 提交 mutations。并且不建议在组件中直接修改 state。

使用辅助函数导出数据，方法等有两种形式，一种保留本身的`key`命名，一种根据需要进行自定义修改，前者语法简单，后者更为灵活。伪代码如下：

``` js
import { mapState, mapGettters, maoActions, mapMutations } from 'vuex'

// ...
computed: {
  ...mapState(['foo', 'bar']), // 数组参数 使用状态的相同key值来实现导出 mapGetters也有此语法
  ...mapGetters({							 // 对象参数 使用可自定义的key来接收函数返回的状态值 可导出modules中的数据 mapState也有此语法
    abc: state => state.foo,
    xyz: state => state.moduleA.xyz
  })
}

methods: {
  ...mapActions(['foo', 'bar']), // 数组参数 导出方法 可以通过this调用 mutations不建议做导出
  ...mapActions('appState', ['abc', 'xyz']) // 导出命名空间模式的方法，state和getters有类似写法
}
// ...
```

### 状态切分

首先，需要明确的一点是，**你也许并不需要 Vuex**？

比如你没有或者只有很少的数据需要在组件间共享，那么也可以你可以采用 cookie，sessionStorage，localstorage或者 [EventBus](https://juejin.im/post/5a4353766fb9a044fb080927) 等多种实现方式。

如果你是在构建一个大的应用，有多种状态需要管理，或者你需要考虑到系统后续的可扩展性，希望早期就使用这种更成熟的解决方案，那么 Vuex 将是你很好的选择。

那么，如何进行状态数据的切分呢？

1. 首先我会考虑需要进行状态管理数据的复杂程度，几个数据并且不存在大的命名冲突的，就不使用模块化的方案，全部使用在根部的`state, actions, mutations, getters`。
2. 如果页面属于UI上比较一致，组件的功能点上也不好做区分，需要在命名问题上下功夫的，那么建议将其切割成多个模块，保留语义性。或者页面的`actions, mutations`逻辑复杂，考虑到代码的可读性，建议使用模块化切分成多个文件，便于单独地去修改维护。

### 组件内使用

状态的使用，使用上述方法导入后，类似`data`属性，都会被 `vue` observe 到，同时被挂载在了组件实例上，通过`this.foo`的方法即可使用。

方法的使用，使用`mapActions`方法导入后，可以直接使用`this`来进行调用。或者在组件中使用`this.$store.dispatch('action_name', payload)`来进行调用。

### Vuex数据流示例

总体，单项数据流程过程是，页面内的 `dispatch` 或者 `action` 调用，可传入需要的参数，再通过 `commit` 提交 `mutation`，再在 `mutation` 中同步修改 `state`，单向数据流动的 `state` 又更细到组件内，触发组件重新渲染。

```
const state = {
  total: 0
}

const actions = {
  add ({ commit }, num) { // commit为结构出来的方法 也可以结构dispatch出来调用别的action
  	commit('ADD', num)	  // 或者同时触发多个 mutations	
  }
}

const mutations = {
  ADD (state, num) [
    state.total += num
  ]
}
```

## 相关资料

[Vuex官方文档](https://vuex.vuejs.org/zh/guide/)

## Vuex Demo

[DEMO源码](https://github.com/ntnyq/demos/tree/master/vue/vuex)