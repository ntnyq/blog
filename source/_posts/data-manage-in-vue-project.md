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
	user  
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

##  正确使用Vuex

> 配合 Vuejs Devtools，更容易理解Vuex。

先从语义上理解以下几个词：

- store  存储
- state 状态
- dispatch 调度
- action 行为
- mutation 转变
- commit 提交

正确使用 Vuex，需要遵循这几个原则：

1. 正确理解 Vuex 和 组件之间数据的单向流动
2. 使用`dispatch`来调用定义好的`action`，在组件中可以通过`this.$store.dispatch`访问到。
3. 使用`action`来提交`mutation`，`action`可以同时提交多个`mutation`，并且可以包含异步操作来修改`mutation`。
4. 使用`mutation`来更新`state`，`mutation`只能同步地修改`state`。
5. 需要使用一些基于`state`而衍生的数据时候，可以定义一个`getter`，类似于组件中的`computed`。

