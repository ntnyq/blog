---
title: Node内置模块fs简单文件操作
description: 学习简单的Node文件操作，方便写些简单的脚本。
tags: [Node, 文件]
category: 学习
---

简单学习一下Node的fs模块，写一些小的脚本，实现一些小功能。

希望能够通过学习，替代一些需要人力去实现的工作。

<!-- more -->

## fs简介

`fs`即**文件系统**`file system`。

它是Node内置的**原生模块**之一，这意味着你不需要通过下载依赖就可以适用它。

只需在要使用它的地方使用如下的方式进行引入即可。

```
let fs = require('fs')
```

> 以下代码都默认已经引入了fs模块

Node环境提供给了我们利用`javascript`语法去操作文件的能力，而这种能力是浏览器环境下的javascript所不具有的。

## 读文件

在脚本的同级目录下创建文件`hello.txt`，内容放上`Hello world`。

### 同步文件读取

API: fs.readFileSync(filename, charset, ...)

如果不指定读取方式的字符集，那么默认的读取字符集是`Buffer`类型的数据。

```
let data = fs.readFileSync('hello.txt', 'utf-8')

console.log(data) // Hello world
```

### 异步文件读取

```
fs.readFile('text.txt', 'utf-8', (err, data) => {
  if (err) {
    return
  }
  console.log(data) // Hello world
})
```

## 写文件

可选的flag参数：

- w 写入文件
- a 追加文件
- r 读取文件

```
fs.writeFile('text2.txt', 'Hello ntnyq', { flag: 'w'}, err => {
  if (err) {
    return;
  }
  console.log('File saved!')
})
```

## 创建目录

在当前目录下创建名为`text`的新目录。

若目录已经存在，则提示`file already exists`的错误。

```
fs.mkdir('text', err => {
  if (err) {
    return
  }
  console.log('Dir maked!')
})
```

### 读取目录

读取目录下的所有文件，返回读取的目录下包含的所有文件名的数组。

> 若目标目录为空目录，那么得到的结果会是一个空数组。

```
fs.readdir('img', (err, files) => {
  if (err) {
    return
  }
  console.log(files)
})
```

### 获取文件信息

利用如下方法可以读取文件信息对象，可以再利用对象的方法来做别的判断。

- isFile() 是否为文件
- isDirectory() 是否为目录

```
fs.stat('text.txt', (err, stats) => {
  console.log(stats) // 文件信息对象
  console.log(stats.isFile()) // true
})
```

### 创建读取流

```
let stream = fs.createReadStream('text.txt')
```

### 创建写入流

```
let stream = fs.createWriteStream('text.txt')
```


## 参考资料

[node文件批量重命名](http://www.bestvist.com/2017/10/19/node-rename/)



