---
title: Web Worker学习笔记
tags: [Worker]
date: 2018-08-01 21:19:52
description: 利用websocket搭建简单的聊天室。
category: 学习
---

Web worker的存在，为JavaScript提供了多线程的运行环境，允许主线程创建worker线程。
<!-- more -->

> 此文档主要介绍的是**Dedicated Worker**

## 背景

JavaScript语言设计之初采用的是**单线程**的模型。所有的任务都是在一个线程上通过回调来进行调度的。前面的任务没做完，后面的任务就只能等着。随着计算机算力的增强，尤其是**多核CPU**的出现，单线程限制了计算机算力的发挥。

## 作用

**Web worker**的存在，为JavaScript提供了多线程的运行环境，允许**主线程创建worker线程**，并将一些任务分配给后者。在主线程运行的同时，**worker**线程在后台运行，二者互不干扰。等到**Worker线程**完成运算后，再将运算结果返回给主线程。

优势：**计算密集型**或者**高延迟**的任务由Worker来进行，不会给主线程(**负责UI与交互**)造成负担(阻塞或者拖慢)，增强用户体验。

缺点：Worker线程一旦创建成果，就会始终运行，不会被主线程的交互打断。这样**有利于随时相应主线程的通信**，但是也会浪费一定的资源，不应被过度使用。而且，一旦使用完毕，就应该尽快关闭它。

## 特点

- 同源限制

   分配给**Worker**线程执行的脚本文件，必须与主线程的脚本同源。

- DOM限制

  **Worker线程**所在的全局对象，与主线程不同，无法读取主线程所在网页上的DOM对象。也无法使用**window**，**document**，**parent**这些对象。但是**Worker线程**可以使用**Navigator**和**Location**对象。

- 通信联系

  **Worker线程**与主线程不在同一个上下文环境，它们之间不能直接通信，必须通过消息来完成。

- 脚本显示

  **Worker线程**不能执行`alert()`和`confirm()`方法，但可以使用`XMLHTTPRequest`对象来完成`Ajax`请求。

- 文件限制

  **Worker线程**无法读取本地文件，也就是说它无法打开本机的文件系统(**file://**)，它加载的脚本，必须来自于网络。

## 用法

### 主线程

#### 创建

主线程中采用`Worker`构造函数来新建**Worker进程**，它接收一个参数，就是脚本文件(且只能加载js脚本，否则报错)，即是**Worker线程**即将执行的任务。这个文件必须来自网络。如果加载不成功，它会**静默失败**。

``` js
var worker = new Worker('worker.js');
```

> 第二个参数是可选项，用于配置，比如`name`属性可以用来自定义`worker`的名字，可在`worker`内使用`self.name`访问到。

#### 发送消息

然后主线程调用`worker.postMessage()`方法给**Worker进程**发送消息。

``` js
worker.postMessage('Hello world');
worker.postMessage({
    method: 'echo',
    args: ['work']
});
```

**worker**可以接收包括二进制在内的各种数据类型的消息内容。

#### 接收消息

主线程可以通过`worker.onmessage()`来指定监听函数，接收**Worker线程**发送回来的消息。

``` js
worker.onmessage = function (event) {
    console.log('Received message ' + event.data);
    doSomething();
};

function doSomething () {
    // 执行任务
    worker.postMessage('Work done!');
}
```

**Worker线程**发送给主线程的数据被保存在事件对象`event`的`data`字段上。

#### 关闭Worker

**Worker线程**任务完成后，主线程就可以把它关掉。

``` js
worker.terminate();
```

#### 错误监听

``` js
worker.onerror(function (err) {
   console.log([
    'ERROR: Line ', e.lineno, ' in ', e.filename, ': ', e.message
  ].join(''));
});

worker.addEventListner('error', function (evt) {
    // doSomething
}, !1);
```



### Worker线程

> Worker的内部可以再新建worker

#### 消息处理

**Worker线程**内部需要有一个事件监听函数，来监听`message`事件。

``` js
self.addEventListener('message', function (e) {
    self.postMessage('You said ' + e.data);
}, !1);
```

代码中`self`代表**Worker线程**自身，即子线程的全局对象。也可以写作`this`或者省略。

也可以直接使用`self.onmessage`来指定事件监听函数。

根据主线程发来的数据的不同，**Worker线程**可以执行不同的任务来调用不同的方法：

``` js
self.addEventListener('message', function (e) {
    var data = e.data;
    switch (data.cmd) {
        case 'start':
            self.postMessage('WORKER SATRTED' + data.msg);
            break;
        case 'stop':
            self.postMessage('WORKER STOPED' + data.msg);
            self.close(); // Terminates worker
            break;
        default:
            self.postMessage('Unknown CMD' + data.msg);
    }
}, !1);
```

`self.close()`用于在**Worker线程**内关闭自身。

#### 加载脚本

**Worker线程**内部如果要加载其他脚本，有一个专门的方法**importScripts**。

``` js
// 加载单个脚本
importScripts('worker1.js');

// 加载多个脚本
importScripts('worker1.js', 'worker2.js');
```

#### 错误监听

在**Worker线程**内部可以监听`error`事件，来捕获其内发生的错误。

---

## 同页面的Worker

通常情况下，我们会将**Worker线程**的代码写入一个单独的`JavaScript`文件中，但是我们也可以载入和主线程在同一个网页的代码。

``` html
<!DOCTYPE html>
  <body>
    <script id="worker" type="app/worker">
      addEventListener('message', function () {
        postMessage('some message');
      }, false);
    </script>
  </body>
</html>
```

注意需要将`Script`标签的`type`值设置为浏览器无法识别的一个值。

再读取这段脚本，用`Worker`来处理。

> 先将嵌入网页的脚本代码，转换成一个二进制对象，然后为这个二进制对象生成了URL，再让Worker加载这个URL。

``` js
var blob = new Blob([document.querySelector('#worker').textContent]);
var url = window.URL.createObjectURL(blob);
var worker = new Worker(url);

worker.onmessage = function (e) {
  // e.data === 'some message'
};
```



## 参考资料

[Web Worker 使用教程](http://www.ruanyifeng.com/blog/2018/07/web-worker.html)

