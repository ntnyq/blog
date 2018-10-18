---
title: Fetch API学习笔记
tags: [Fetch]
date: 2018-05-27 23:27:56
description:
category: 学习
---

**Fetch API**是新一代用于进行**HTTP请求**的JavaScript接口。它提供了一个全局的`fetch()`方法，该方法使用简单，可用于跨网络**异步获取资源**。<!-- more -->

## 对比

与**XMLHTTPRequest**对象提供的数据请求相比，**fetch API**使用方式更加简单，API更易理解且方便被其它技术使用。

与`$.ajax()`相比：

当接收到一个代表错误的HTTP状态码时，`fetch()`返回的Promise**不会被标记为reject**，即使HTTP响应的状态码为404或者500。相反，它会将Promise的状态标记为resolve(**但是会将resolve返回的`ok`属性设置为false**)，仅当网络故障或者请求被阻止时，才会调用reject回调方法。

默认情况下，`fetch()`不会从服务端发送或者接收任何cookies，如果站点依赖于用于session，则会导致为经认证的请求。(要发送cookies，必须设置**credentials**选项)。

## 请求

fetch请求的使用非常简单。例如：

``` js
fetch('https://api.github.com/search/repositories?q=javascript&sort=stars')
	.then(res => res.json())
  .then(data => {
  	 console.log(data);
	});

fetch('https://api.github.com/search/repositories', {
  q: 'javascript',
  sort: 'stars'
})
	.then(res => res.json())
  .then(data => {
  	 console.log(data);
	});
```

**Fetch()**方法会返回一个**Promise**实例。

将上面的例子粘贴到Chrome浏览器控制台运行，就可以看到请求的结果。

该例子通过一个参数来指定**fetch()**的路径，然后返回一个包含响应结果的Promise对象。

当然HTTP请求默认返回的格式并不是真正的Json。我们在已知返回格式的情况下，可以使用**json()**方法，将返回结果转换为对象格式。

其余支持的格式：

- arrayBuffer()
- blob()
- json()
- text()
- formData()

上述方法同样会返回一个被解析的**Promise对象**和数据。



## 特性检测

> 检测当前环境是否支持**fetch API**，可以通过检测Window对象上是否有`Headers`，`Request`，`Response`或者`fetch`。

例如：

``` js
if (this.fetch) {
	// Fetch request is supported
} else {
	// Oops, it seems you need XMLHTTPRequest
}
```

## Polyfill

要在不支持的浏览器中使用Fetch，可以使用[Fetch Polyfill](https://github.com/github/fetch)。

## 浏览器兼容性****

>  非IE浏览器

## 参考资料

[MDN-Fectch API](https://developer.mozilla.org/zh-CN/docs/Web/API/Fetch_API/Using_Fetch)