---
title: vue常用指令
description: 小巧但却强大的双向数据绑定框架vue。
tags: [vue, javascript]
category: 学习
---

vue.js是一个构建数据驱动的 web 界面的渐进式框架。<!-- more -->


## npm下载安装模块

```
npm install module-name -save 自动把模块和版本号添加到dependencies部分
npm install module-name -save-dve 自动把模块和版本号添加到devdependencies部分
至于配置文件区分这俩部分， 是用于区别开发依赖模块和产品依赖模块， 以我见过的情况来看 devDepandencies主要是配置测试框架， 例如jshint、mocha。
```

```
-S, --save: Package will appear in your dependencies.
-D, --save-dev: Package will appear in your devDependencies.
-O, --save-optional: Package will appear in your optionalDependencies.
```

## Vue指令学习

**展示data**中的数据 采用展现的方式双大括号。

### 指令-循环

#### 循环数组


```
1. <li v-for="item in items"> 第{{ $index }}条:{{ item.message }}</li>  // vue 1
2. - <li v-for="(item, index) in items"> 第{{ index }}条:{{ item.message }}</li>  // vue 2
   - <div v-for="item in items" v-bind:key="item.id"> // vue 2
```


#### 循环对象


```
1. <li v-for="(key, value) in obj"></li>
2. <li v-for="(value, key) in obj"></li>   // **==注意是相反的==**
```


#### 循环数字


```
<span v-for="n in 10">{{ n }} </span>
<!-- Vue 1 从0开始，Vue 2从1开始  -->
```


#### 条件控制


```
<!-- 如果ok为false, 不输出在 HTML 中 -->
<div v-if="ok">Yes</div>
<div v-else>No</div>

<!-- 如果ok为false,只是 display:none 而已 -->
<h1 v-show="ok">Hello!</h1>
```

#### 事件绑定

```
<button v-on:click="say('hi')">点击</button>
<!-- 简写 -->
<button @click="say('hi')">点击</button>
<!-- 传入 event 对象 -->
<button @click="say('hi', $event)">点击</button>
<!-- 阻止单击事件冒泡 -->
<button @click.stop="doSth">点击</button>
<!-- 阻止默认行为 -->
<button @submit.prevent="doSth">点击</button>
<!-- 修饰符可以串联 -->
<a @click.stop.prevent="doThat"></a>
<!-- 按键修饰符：回车时才会执行 -->
<input @keyup.13="submit"><!-- 13 为 keycode -->
<input @keyup.enter="submit">
<!-- 支持的全部按钮为 enter, tab, delete, space, up, down, left, right 字母 -->
```
#### 表单的双向绑定


```
<input type="text" v-model="message">
<!-- 自定义选中值。否则 选中为value值，不选为空 -->
<input
  type="checkbox"
  v-model="toggle"
  v-bind:true-value="a"
  v-bind:false-value="b">
```

#### 绑定属性


```
<div v-bind:class="{ 'class-a': isA, 'class-b': isB }"></div>
<div v-bind:class="classArr"></div> <!-- classArr 是一个数组 -->
<!-- 简写 -->
<div :class="{ 'class-a': isA, 'class-b': isB }"></div>
<div :style="{ color: activeColor, fontSize: fontSize + 'px' }"></div>
<img :src="imgSrc">
<a :href="baseURL + '/path'">

<!--在 Vue 2 中，**如果属性值是==变量==，必须用绑定属性**的写法。-->
// wrong
<img src="{{imgSrc}}">  // 不再使用展现的形式
// right
<img :src="imgSrc">
```

#### 避免闪烁


```
[v-cloak] {
  display: none;
}
<div v-cloak>
  {{ message }}
</div>
```

不会显示 <div> 的内容，直到编译结束。

#### 单向绑定

```
<!-- Vue 1 这么写 -->
<span>This will never change: {{* msg }}</span>
<!-- Vue 2 ==不支持== -->
```

#### 输出 HTML

```
<!-- Vue 1 这么写 -->
<div>{{{ raw_html }}}</div> <!-- {{}} 中的 HTML 内容的会转为纯文本 -->
<!-- Vue 2 这么写 -->
<div v-html="raw_html"></div>
```

#### 计算属性

可以用展现的方式来展现计算后返回的结果  相当于data里的变量

```
<div id="demo">{{fullName}}</div>
new Vue({
  data: {
    firstName: 'Foo',
    lastName: 'Bar'
  },
  computed: {
    fullName: function () {
      return this.firstName + ' ' + this.lastName
    }
  }
});
```
#### 自定义指令

```
Vue.directive('my-directive', {
  bind: function () {
    // 准备工作
    // 例如，添加事件处理器或只需要运行一次的高耗任务
    this.el;// 添加指令的元素
    this.vm.$get(name)// 获得该指令的上下文 ViewModel
    this.expression;// 指令的表达式的值
  },
  update: function (newValue, oldValue) {
    // 值更新时的工作
    // 也会以初始值为参数调用一次
  },
  unbind: function () {
    // 清理工作
    // 例如，删除 bind() 添加的事件监听器
  }
})

<div v-my-directive="someValue"></div>
```
####　监听数据变化


```
new Vue({
  data: {
    firstName: 'Foo'
  },
  watch: {　// 是一个类
    firstName: function (val, oldVal) {
    }
  }
});
```

#### 自定义过滤器


```
Vue.filter('wrap', function (value, begin, end) {
  return begin + value + end;
});

<!-- 'hello' => 'before hello after' -->
<!-- Vue 2 这么写 -->
<span v-text="message | wrap('before', 'after')"></span>
```

#### 生命周期相关的钩子函数


```
// Vue 2
new Vue({
  created: function(){},
  mounted : function(){},// 相对与 1 中的 ready
  beforeDestroy: function(){},
  destroyed: function(){}
});
```

#### 过渡效果


```
<!-- Vue 1 这么写 -->
<div v-if="show" transition="my-transition"></div>
<!-- Vue 2 这么写 -->
<transition v-bind:name="my-transition">
  <!-- ... -->
</transition>
/* 必需 */
.my-transition-transition {
  transition: all .3s ease;
}
/* .my-transition-enter 定义进入的开始状态 */
.my-transition-enter{}
/* .my-transition-leave 定义离开的结束状态 */
.my-transition-leave {}
```








