---
title: Ubuntu系统安装Nodejs环境
description: 打算将开发环境迁移至Linux系统上，空闲时间开始折腾，不过我对于Linux的了解还比较有限，所以学习中。
date: 2017-11-22 09:59:31
tags: [Linux, Node]
category: 学习
---

打算将开发的主环境迁移到Linux系统上，所以空闲时间开始慢慢折腾了。

目前的进度是在`Virtualbox`上面安装了`Ubuntu 16.0.4`系统，安装了中文输入法，`Sublime Text`编辑器以及相关开发插件，安装了`Nodejs`环境。

所以这里记录一下遇到的一些问题和解决方案。
<!-- more -->

## 复制粘贴

虚拟机和主机之间的复制粘贴问题。

### 问题情境

我想将Sublime的配置导入Linux环境下，用了比较蠢的复制粘贴的方式。但是发现竟然不起作用。即使我将虚拟机的 `设备` => `共享粘贴板` => `双向` 已经勾选。

### 解决方法

`VirtualBox` => `存储` => `控制器：SATA`

勾选 **使用主机输入输出(I/0)缓存**

再点击 `ubuntu.vdi` 勾选 **固态驱动器**

### 参考资料

[百度经验 - VirtualBox主机与虚拟机不能复制粘贴的解决办法](https://jingyan.baidu.com/article/574c521917db806c8d9dc18c.html)


## 安装Nodejs

以下操作都在`Terminal`环境中执行。

### 下载安装包

```
wget https://nodejs.org/dist/v8.9.1/node-v8.9.1-linux-x64.tar.xz
```

### 解压

解压`node-v8.9.1-linux-x64.tar.xz`文件获得`node-v8.9.1-linux-x64.tar`文件

解压`node-v8.9.1-linux-x64.tar`文件获得`node-v8.9.1-linux-x64`文件夹


```
xz -d node-v8.9.1-linux-x64.tar.xz

tar xvf node-v8.9.1-linux-x64.tar
```

### 移动目录

将`node-v8.9.1-linux-x64`文件夹移动到`/opt`目录下并且命名为`node`文件夹

```
sudo mv node-v8.9.1-linux-x64 /opt/node
```

### 建立链接

需要建立node和npm的链接，这样就可以在全局环境适用`node`和`npm`命令了。

```
sudo ln -s /opt/node/bin/node /usr/local/bin/node
sudo ln -s /opt/node/bin/npm /usr/local/bin/npm
```

### 检查版本

```
node -v // => v8.9.1
npm -v // => 5.5.1
```


## 全局安装模块失效

### 情境描述

通过`sudo cnpm install express-generator -g`下载的模块，然后在`Terminal`输入`express`提示找不到命令

### 问题原因

未正确设置`Node`的环境变量，导致下载的全局包无法被找到。

1. 方案1 建立链接 到/usr/local/bin/module_name

2. 方案2 配置全局变量

### 配置全局变量

使用vim编辑器打开`/etc/profile`

在文档最后加入

```
export $PATH=PATH:/opt/node/bin
```

再修改当前用户的配置文件`~/.profile`，同样的操作

再执行`source .profile`刷新配置文件

### 参考资料

[nodejs在linux安装、环境变量配置](http://blog.techbeta.me/2015/10/nodejs-install-in-linux/)
