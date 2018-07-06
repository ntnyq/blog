---
title: Travis-CI自动部署Hexo博客到Gh-Pages
tags: [Travis]
date: 2018-02-23 22:04:37
description: 利用Travis-CI实现Hexo博客的在Github-Pages的自动部署。
category: 学习
---

将Hexo博客的源码和发布的博文代码存储在同个`Github Repo`的不同分支里，同时也对博客源码进行了备份。而通过**Travis-CI**，我们只需要简单地进行配置，就可以实现博客代码push后，博文代码的自动化部署，省略了手动发布的过程。
<!-- more -->

## Travis介绍

[Travis CI](https://travis-ci.org/)为软件开发领域提供在线的、分布式的**持续集成服务**。

目前，它只能用于绑定Github上面的项目。

它提供了一个运行环境。当你往Github仓库中Push了新的代码后，仓库的变更就会触发Travis CI的持续集成服务。执行测试，完成构建，再部署到服务器。

## Travis接入

给项目接入 **Travis CI**分为以下几个步骤：

### 登录Travis CI

进入[Travis CI官网](https://travis-ci.org/)，点击右上角的个人头像，就可以使用Github账号来登录了。

成功登录后，会看到如下界面，你登录账号的所有公开仓库都在列表里。

![仓库列表](http://olo2ef5ol.bkt.clouddn.com/blog/180511/j22K2e84bb.png?imageslim)

### 开启对应仓库

将你想要让Travis监听的仓库后面的复选框选择为打开的状态。

> 比如我给博客开启了自动部署，那么我的`ntnyq.github.io`这个仓库就是开启状态的。

### 编写配置文件

**Travis**需要读取项目根目录下的配置文件来决定构建过程需要进行的行为。

这个文件的名字必须是`.travis.yml`。

仓库**Push**后，会触发**Travis**读取这个文件，然后执行文件中定义好的脚本，来执行构建过程。

我博客的`.travis.yml`文件的内容如下，我在后面是加上了字段的含义。

``` yaml
# Travis-CI config
language: node_js # 指定构建脚本执行环境为nodejs
node_js: stable # 指定node版本为稳定版 也可以指定版本号

# Cache dir config
cache: # 缓存设置的文件或者目录
  directories:
    - node_modules

# Install scripts
install: # 构建前下载依赖
  - npm install

# script: # 构建主要要执行的脚本
script:
  - hexo g
  
# After_script
after_script: # 构建结束要执行的脚本
  - cd ./public
  - git init
  - git config user.name "ntnyq"
  - git config user.email "ntnyq13@gmail.com"
  - git add .
  - git commit -m "Update blog"
  - git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:master

branches: # github上的分支
  only:
    - dev # 我的博客源码保存在了dev分支上
env: # 构建中使用到的环境变量
 global:
   - GH_REF: github.com/ntnyq/ntnyq.github.io.git
```

`.yml`文件使用的是`YAML`语法，这是一种以数据为中心专门用来编写配置文件的语言，非常强大。

它采用空格缩进，来实现类似`JSON`的层级关系，并且支持**注释**功能。

> 想对`YAML`的语法有更多了解，推荐阅读[YAML 语言教程\-阮一峰](http://www.ruanyifeng.com/blog/2016/07/yaml.html)

上面的配置中使用到了2个**环境变量**，但是在配置文件里我们只写到了一个。这是因为在`git`推送代码的时候，需要你的github仓库权限。而出于安全性的考虑，这个用于验证`token`不方便直接出现在配置文件中，所以**GH_TOKEN**这个环境变量的内容保存在`travis-ci`的网站上，如下图所示： 

![GH_TOKEN](http://olo2ef5ol.bkt.clouddn.com/blog/180706/6bJabfG4Gj.png?imageslim)







