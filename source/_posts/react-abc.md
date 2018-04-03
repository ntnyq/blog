---
title: React框架入门学习
description: 台湾友人的推荐加上自己的兴趣，我来折腾React了。
date: 2018-03-31 19:43:16
tags: [React]
category: 学习
---

前阵子台湾友人推荐我学习React，刚好我自己最近也在接触Gatsby博客。本着技多不压身的思想，所以我打算Vue和React都学。<!-- more -->

简单的React应用需要引入2个库。

React和ReactDOM

> 如果在浏览器端使用，需要引入browser.js提供jsx语法编译支持，并且script的type属性需要设置为`text/babel`。

## JSX

ReactDOM要使用`JSX`语法来进行编写。

JSX语法可以直接在JS里写HTML内容，不需要加任何引号。

JSX语法基本规则：遇到HTML代码块(以`<`开头)，就以HTML的规则来解析；遇到JavaScript代码块(以`{`开头)，就用JavaScript规则进行解析。

>JSX语法与原生js语法不兼容。但是它可以通过转译变成原生js。

JSX语法允许在模板内插入JavaScript变量，如果这个变量是一个数组，那么会展开这个数组中的所有成员，添加进模板。

ReactDOM有一个**render**方法，它接收2个参数，要渲染的内容(JSX语法)和被挂载的位置(原生DOM节点)。用于将模板转化为HTML内容，并且插入到指定的DOM节点。

JSX语法支持使用原生js的一些方法。(原生js返回JSX语法)
JSX语法使用`{}`来作为模板语法。

## 组件

React对象拥有一个`createClass`方法，用于创建组件类。创建出的组件类，可以以HTML元素的形式来使用，使用的时候会自动生成一个组件类的**实例**。
创建出的组件类必须要有一个`render`方法，返回一段`JSX`格式的内容来进行组件类的输出。

> 组件类的名称必须大写，组件类返回内容只能包含一个顶层标签，否则会报错。

组件内部可以使用`this.props`对象来获取绑定在组件上的属性。

> 添加属性时候要注意，`class`属性必须写作`className`，`for`属性必须写作`htmlFor`。因为`class`和`for`是JavaScript中的保留字。

> `this.props.children`是组件类属性的例外，它表示组件的所有子节点。若无子节点，值为`undefined`，若有一个子节点，其数据类型为`object`，若有多个子节点，其数据类型为`Array`。
>
> React提供了一个`React.Children`方法来处理`this.props.children`。我们可以使用`React.Children.map`来遍历子节点，而无需关心`this.props.children`的数据类型。
>
> 组件类的属性可以为任意类型的值，数字，字符串，对象，数组，函数等都可以。

创建组件类的时候，可以通过设置`propTypes`属性来设置我们对每个props属性期待的值的类型。例如:

``` text
const HelloWorld = React.createClass({
    propTypes: {
        foo: React.PropTypes.string.isRequired
    },
    render: function () {
        return <h1>{this.props.foo}</h1>;
    }
});
```

可以通过`getDefaultProps`方法来设置组件属性的默认值。

``` text
const HelloWorld = React.createClass({
    getDefaultProps: function () {
        return {
            foo: 'hello world'
        };
    },
    render: function () {
        return <h1>{this.props.foo}</h1>;
    }
});
```

组件DOM并非真实的`DOM`，而是一种数据结构，叫做**虚拟DOM(Virtual DOM)**，只有将它插入到HTML文档后，才会变为真正的DOM。所有DOM的变动，都是先发生在虚拟DOM上，然后再将真正发生了变化的部分渲染到真实DOM上，这种算法叫做`DOM Diff`算法，它可以极大地提高网页地性能表现。

那么如何在React中获取真实DOM呢，这时候我们需要用到`ref`属性。

``` text
var MyComponent = React.createClass({
  handleClick: function () {
    this.refs.myTextInput.focus();
  },
  render: function () {
    return (
      <div>
        <input type="text" ref="myTextInput" />
        <input type="button" value="Focus the text input" onClick={this.handleClick} />
      </div>
    );
  }
});
```

> 由于ref属性拿到的是真实DOM，所以必须要在虚拟DOM渲染到文档后才能使用这个属性，否则会报错。使用的时候格式为`this.refs.refName`，绑定事件时候使用模板语法，且`onClick`要大写。

组件类的`getInitialState`属性用于设置组件内状态的初始值，它会返回一个对象，包含了组件的所有状态，这些状态值可以通过`this.state.stateName`来获取。当用户与组件进行了交互或者组件的状态值需要改变时，可以通过`setState`方法来修改组件的状态值，修改后它会自动调用组件的`render`方法，重新进行组件渲染。

``` text
var LikeButton = React.createClass({
  getInitialState: function () {
    return {
      liked: false
    };
  },
  handleClick: function (e) {
    this.setState({ liked: !this.state.liked });
  },
  render: function () {
    var text = this.state.liked ? 'like' : 'haven\'t liked';
    return (
      <p onClick={this.handleClick}>
        You {text} this.  Click to toggle
      </p>
    );
  }
});
```

> props常用于定义那些不会改变的状态，而state常用于定义会变化或者存在交互的状态值。


React中不能通过`value`直接获取表单的值，而是要通过定义一个`onChange`回调，通过`event.target.value`来获取常见表单元素的值。

``` text
var TextInput = React.createClass({
  getInitialState: function () {
    return {
      value: 'hello'
    };
  },
  handleChange: function (e) {
    this.setState({ value: e.target.value });
  },
  render: function () {
    var value = this.state.value;
    return (
      <div>
        <input type="text" value={value} onChange={this.handleChange} />
        <p>{value}</p>
      </div>
    );
  }
});
```

### 生命周期

组件的生命周期分为三个状态：

- Mounting：已经插入真实DOM
- Updating：正在被重新渲染
- Unmounting：已移出真实DOM

React为每个状态都提供了两种处理函数，`will`函数在进入状态之前调用，`did`在进入状态之后调用。三种状态共计五种处理函数。

``` js
componentWillMount()
componentDidMount()
componentWillUpdate(object nextProps, object nextState)
componentDidUpdate(object prevProps, object prevState)
componentWillUnmount()
```

此外React还提供了两种特殊状态的处理函数。

``` js
componentWillReceiveProps(object nextProps) // 已加载改组件收到新的参数时调用
shouldComponentUpdate(object nextProps, object nextState) // 组件判断是否重新渲染时调用
```

例子：

``` text
var HelloMessage = React.createClass({
  getInitialState: function () {
    return {
      opacity: 1.0
    };
  },
  componentDidMount: function () {
    this.timer = setInterval(function () {
      var opacity = this.state.opacity;
      opacity -= .05;
      if (opacity < 0.1) {
        opacity = 1.0;
      }
      this.setState({
        opacity: opacity
      });
    }.bind(this), 100);
  },
  render: function () {
    return (
      <div style={{opacity: this.state.opacity}}>
        Hello {this.props.name}
      </div>
    );
  }
});
```

### 样式

React组件样式是一个对象，使用的时候要使用如下写法

```
style={{attrName: attrValue}} // 第一个大括号表示这是js语法 第二个大括号表示样式对象
```


## 参考资料

- [React 入门实例教程](http://www.ruanyifeng.com/blog/2015/03/react.html)


