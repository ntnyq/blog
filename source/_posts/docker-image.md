---
title: Docker入门之镜像
tags: [Docker]
date: 2018-05-30 23:59:05
description: Docker从入门到实践，第二小节，学习Docker三大组件之一镜像的基本操作。
category: 学习 
---

Docker从入门到实践，第二小节，学习Docker三大组件之一镜像的基本操作。<!-- more -->

## 简介

**镜像(Images)**是Docker中极为重要的一个组件，它是虚拟化容器运行所依赖的基础。

我们需要熟悉Docker**镜像**再以下环境下的使用：

- 从仓库获取镜像
- 管理本地主机上的镜像
- 发布镜像到仓库

同时，我们需要了解**镜像实现的基本原理**。

## 获取镜像

获取镜像需要使用`docker pull`命令。

> 我们在学习**Docker**时，可以使用`docker [command_name] -h`命令来查看命令的简单介绍文档。

**Docker pull**命令格式如下：

``` bash
$ docker pull <...args> <docker registry 地址>[:port/]repo_name<:tag_name>
```

- **Docker registry**地址代表配置的docker仓库的地址，配置过程可参考上一篇博客。默认的仓库地址是[**Docker Hub**](https://hub.docker.com)。
- **repo_name**代表仓库名。格式为**username/software**，对于**Docker hub**来说，如果未指定用户名，那么默认将从用户名为**library**的用户名下下载软件。

例如：

``` bash
$ docker pull ubuntu:16.04
```

## 管理本机镜像


