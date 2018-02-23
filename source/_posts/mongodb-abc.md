---
title: 初试芒果数据库mongodb。
description: mongodb是一个面向文档的noSQL形式的数据库管理系统。
tags: [mongodb, 数据库]
category: 后端
---

最近在学习express+mongodb建站，所以简单学习一下mongodb。<!-- more -->

## mongodb简介

momgodb是一套noSQL形式的数据库管理系统。

与传统的以SQL语言语法为主的关系数据库相比，mongodb摒弃了它们的一些在现代应用开发中使用频度不高的特性，换来的却是执行效率的显著提升。再加上mongodb没有使用传统的表的概念，而是用集合，更方便进行扩展。

而mongodb的文档构建是以json的形式构建的，数据库的操作也是使用的对象方法的形式，方便我们前端程序员的学习和使用。

## 环境搭建

### 下载

mongodb的环境需要安装mongodb程序。可以从[mongodb官网](https://www.mongodb.com/)下载当前稳定版本或者从github上下载[github仓库](https://github.com/mongodb/mongo)上下载所需版本的二进制文件进行编译。

### 安装

安装过程直接按照官方指引解压安装即可。

### 配置

在软件根目录下创建data文件夹用来保存数据，创建log文件夹来保存运行日志。

在根目录下创建bin目录将相关可执行文件移入。

在根目录下创建mongo.config文件来保存配置信息。

输入以下配置: (具体根据个人配置进行更改)

```
port=12345 // 指定mongo服务器端口为12345 默认端口为27017
dbpath=D:\mongodb\data // 指定数据存储目录 这里使用了绝对路径 使用相对路径也可
logpath=D:\mongodb\log\mongo.log // 指定日志文件命名 注意这里路径后面是文件
```

### 启动服务器

运行bin目录下的mongod文件，为其指定配置文件为我们配置好的文件。

```
mongod -f ../mongo.config // -f --fork指定保护模式
```

如果没有编写配置文件，也可以这样来启动:

```
mongod --fork --logpath <log_file_path> --dbpath <db_folder_path> port <portNum>
```

当我们在本地成功启动mongo服务器后，可以在浏览器打开`localhost:<portNum>`进行查看。

```
// 看到服务器返回这个字样 说明服务启动成功
It looks like you are trying to access MongoDB over HTTP on the native driver port.
```

### 连接服务器

运行bin目录下的mongo文件，就会连接服务器。

进入mongo的命令行交互界面。

![mongodb命令行交互界面](http://olo2ef5ol.bkt.clouddn.com/mongo.png)

## 基础命令

mongodb基础的常用的命令。效果见上图。

### 数据库操作

#### 查看数据库

```
// 与mysql相比 这里不需要再末尾输入分号
show dbs
```

#### 切换数据库

```
use <dbName> // 切换到指定数据库名的数据库 若不存在则创建同名数据库
```

#### 查看数据库中集合

```
show collections // 查看当前数据库包含的所有集合
```

#### 删除某个集合

```
db.<collectName>.drop()
```

### 集合操作

#### 新建集合/插入记录

```
db.<collectName>.insert({name: 'ntnyq'}) // 向指定集合插入一条记录
```

#### 查看集合

```
db.<collectName>.find() // 查看指定集合 无参数则返回集合中的所有记录
```

- 可以传入对象，返回符合条件的所有集合，如{name: 'ls'}，返回所有name为ls的记录。
- 可以追加方法，实现别的功能比如skip, limit, sort等等。

mongodb会自动为存入的记录追加`_id`属性，作为一个唯一的值来标识一条记录。不过我们也可以手动指定一个`_id`，前提是不与集合中已有的`_id`冲突，否则插入失败，且会报错。

#### 修改集合

```
db.<collecName>.update({name: 'ntnyq'}, {name: 'lssham'}) // 指定更新符合条件的记录
```

- 这里会筛选，并且更新第一条记录，而且是采用的替换更新的方式。也就是用新的记录完全覆盖原先的记录。
- 如果我们需求增量更新，那么我们讲第二个参数指定为{$set: {name: 'lssham'}}
- 如果我们需要一次修改多条符合要求的数据，可以追加参数`false, true`




### 未完待续...









