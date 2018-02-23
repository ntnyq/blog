---
title: 版本管理软件Git入门
tags: [Git]
date: 2017-12-26 20:40:44
description: 版本控制软件Git用法记录。
category: 学习
---

版本控制软件有助于合理高效地管理自己开发项目的各个版本，它可以提供便捷回退功能和多人协作开发功能。
<!-- more -->

## Git介绍

**Git**是由`Linux系统`之父*Linus Torvalds*为管理Linux内核开发而开发出的一个免费开源的分布式版本控制系统软件。

[Git的Github页面](https://github.com/git)

[Git官网](https://git-scm.com/)

## 下载安装

Git可以从[Git官网](https://git-scm.com/)官网免费下载得到，注意选择适合自己操作系统的版本(Windows, Linux MacOS)。

安装过程非常简单，各种常见软件的安装方式即可。

安装结束后，打开`Terminal`(Windows系统打开cmd.exe, Powershell或者Git Bash)。键入如下命令:

``` bash
git --version # => git version 2.14.0
```

返回版本号即为安装成功。

## 配置

刚开始使用的时候我们需要全局配置用户名和邮箱:

``` bash
git config --global user.name 'ntnyq'

git config --global user.email 'me@ntnyq.com'
```

`--global`参数代表全局进行配置

我们可以通过如下命令来查看当前配置:

``` bash
git config -l

git config --list
```

## 版本库

**Git**的分布式就体现在它并不单单将版本库保存在服务器上，每个参与项目开发开发的人都可以拥有一个自己的该项目的版本库。

我们可以在自己的版本库里面创建分支，再随着开发进度将分支的内容合并到主分支(master)上，再将主分支推送到服务器上。

我们可以通过2种方式在本地创建版本库。

### 新建版本库

``` bash
git init # 本地新建版本库

git clone git_repo_url # 从远程获取版本库 支持多种协议
```

命令执行后会在根目录下生成一个名为`.git`的隐藏文件夹来保存仓库的版本信息。

同时**Git**会自动追踪根目录下所有文件夹及文件夹内所有文件的变化。

可以通过如下命令来查看当前版本库的状态信息:

``` bash
git status
```

## 提交

### 提交修改

``` bash
git add file_name # 添加文件至缓冲区

git add . # 添加所有追踪的修改
```


## 分支

**分支**的存在是Git的一个亮点。我们可以通过在分支上进行开发，在开发到达某个阶段后，再把分支合并到主分支上。

### 查看分支

``` bash
git branch # 查看当前分支

git branch -a # 查看所有分支 包括远程

git branch -r # 查看远程分支
```

### 创建分支

``` bash

git branch branch_name # 创建分支

git checkout -b branch_name # 创建分支并且将当前工作区切换到创建的分支

git checkout -t origin/branch_name # 拉取远程分支 在本地创建 并跟踪
```

### 切换分支

``` bash
git checkout - # 切换至上一个分支 用于2个分支间切换

git checkout branch_name # 切换至指定分支
```

> 在分支的开发结束后 要记得在分支进行 `git commit`操作。

### 合并分支

将某分支合并到master分支

> 需要先切回至主分支

``` bash
git merge branch_name
```


合并分支的过程分为4步：

1. 保持工作目录clean
2. `git checkout master` 切换回主分支
3. `git merge branch_name` 合并分支
4. 如果有冲突问题，解决冲突

> master push前，在分支上`merge master`。然后，在`master`上，`merge`分支，再`push`

### 取消所有修改

``` bash
git checkout .
```

## 远程版本库

``` bash
git remote -v # 查看远程主机的网址

git remote show [host_name] # 查看远程主机详细信息

git remote add [host_name] [url] # 添加远程主机

git remote rm [host_name] # 删除远程主机

git remote rename [old_name] [new_name] # 重命名远程主机
```

## 拉取与推送

``` bash
git pull [remote_host] [remote_branch]:[local_branch] # 拉取远程分支 与本地分支合并

git push [remote_host] [local_branch]:[remote_branch] # 将本地分支推送至远程主机

git pull [remote_host] # 本地的当前分支自动与对应的origin主机的追踪分支(remote-tracking branch)进行合并。

git push [remote_host] # 当前分支与远程分支之间存在追踪关系，则本地分支和远程分支都可以省略

git pull # 当前分支自动与唯一一个追踪分支进行合并
git push # 当前分支只有一个追踪分支，那么主机名都可以省略
```

> `git pull`拉取时候，如果远程分支是与当前分支合并，则冒号后面的部分可以省略。
> `git push`推送时候，如果远程分支不存在，则会被新建。

## 合并与变基

``` bash

git merge # 用"pull"命令把"origin"分支上的修改拉下来并且和你的修改合并；
结果看起来就像一个新的"合并的提交"(merge commit)
```


## 冲突解决

Tips: 你可以根据如下步骤解决冲突：

``` bash
1、git fetch

2、git checkout releases/xxx # 注:如本地还未检出过发布分支，请执行 git checkout -b releases/xxx origin/releases/xxx

3、git pull

4、git merge --no-ff b109eff1348a2fcf9a793deb81f3981d691e453c # 使用版本号合并,将出现的冲突一一解决

5、git status 查看冲突，并按命令提示进行修复

6、git add xxx
   git commit xxx

7、git push origin releases/xx
```

## 其它

``` bash
git fetch [remote_host] [branch_name] # 取回远程主机的分支

git checkout . # 取消本地所有未提交的修改

git stash #把所有没有提交的修改暂存到stash里面。可用git stash pop回复。

git reset --hard HASH #返回到某个节点，不保留修改。

git reset --soft HASH #返回到某个节点。保留修改
```

## 参考资料

[我所记录的git命令](http://www.cnblogs.com/fanfan259/p/4810517.html)
