---
title: Mac下的Docker入门
tags: [Docker]
date: 2018-05-30 00:59:27
description: Mac系统下的Docker从安装到简单实践。
category: 学习
---

Mac系统下的Docker从安装到简单实践。<!-- more -->

## 为什么选择Docker？

**Docker**🐳是一款使用Go语言开发的基于容器的**虚拟化**环境软件。
与传统的虚拟化方式相比，**Docker**的兴起和流行得益于它如下的优势：

- 更高效地利用系统资源
- 更快速的启动时间
- 一致的运行环境
- 持续交付和部署
- 更轻松的迁移
- 更轻松的维护和扩展

它非常适合开发，运维，测试等人员进行学习。

## Mac OS安装Docker

> 以后可能我写博客，安装软件都只会记录Mac上的安装途径了，毕竟Mac更适合搞开发。(Linux也是)

### 命令行安装

使用`Homebrew cask`来安装`Docker`。

> 确保已经安装了`Homebrew cask`。

``` bash
$ brew cask install docker
```

### 官网下载安装包

[Docker for Mac](https://www.docker.com/docker-mac)

戳上面的链接即可下载**Docker for Mac**，需要**Mac OS**版本为**10.10.3**以上。

下载到`.dmg`文件后双击打开，再将可爱的**Docker 小鲸鱼**拖动到`Application`图标里即安装成功。

## 注册Docker ID

安装成功打开应用，即可在**Mac**右上角生成一个**小鲸鱼**🐳图标，点击需要使用**Docker ID**登录，点击注册地址即可跳转至官方注册界面。注意填写好邮箱地址，需要进入邮箱确认注册后账号才可使用。

## 安装成功测试

可使用以下的命令来测试是否**Docker**已被成功安装。

``` bash
➜  ~ docker --version
Docker version 18.03.1-ce, build 9ee9f40

➜  ~ docker-compose --version
docker-compose version 1.21.1, build 5a3f1a3

➜  ~ docker-machine --version
docker-machine version 0.14.0, build 89b8332
```
安装正确，会返回当前的版本号。

## 配置镜像加速服务

因为某些不可抗力因素，在国内直接从**Docker Hub**上拉取镜像的速度非常缓慢，所以为了方便使用，建议根据需求配置使用国内的镜像加速服务。

**Mac OS**系统可以通过以下几个步骤来设置使用镜像：

1. **任务栏点击小鲸鱼图标**🐳
2. 选择**Preference...**选项
3. 选择**Daemon**选项
4. 选择**Registry mirrors**
5. 在列表中输入`https://registry.docker-cn.com`
6. 点击**Apply & Start**按钮

## 简单实践

### 拉取官方nginx镜像并启动

``` bash
➜  ~ docker run -d -p 80:80 --name webserver nginx

Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
f2aa67a397c4: Pull complete
3c091c23e29d: Pull complete
4a99993b8636: Pull complete
Digest: sha256:0fb320e2a1b1620b4905facb3447e3d84ad36da0b2c8aa8fe3a5a81d1187b884
Status: Downloaded newer image for nginx:latest
2ebaa72c4fd442b1ffe249010b3231326fe17271c2eb5f10442221c4c82ae2dd
```

### 浏览器检测是否运行成功

打开浏览器输入访问`localhost`，如果看到**Nginx**服务器的欢迎页，则运行成功。

### 停用服务及删除

> 操作以容器为单位

``` bash
$ docker stop webserver

$ docker rm webserver
```

## 参考资料

[Docker — 从入门到实践](https://legacy.gitbook.com/book/yeasy/docker_practice/details)
