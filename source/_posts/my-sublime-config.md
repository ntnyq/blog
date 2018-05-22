---
title: 我是如何使用Sublime的
tags: [Sublime]
date: 2018-05-22 17:28:33
description: 我的个人Sublime插件配置，编辑器美化和踩坑记录等。
category: 学习
---

我的个人Sublime插件配置，编辑器美化和踩坑记录等。

不定期持续更新，方便设备后重装环境，与再踩坑。<!-- more -->

## Sublime

**Sublime**是一款简洁轻量的代码编辑器。它有着丰富易用的插件可以根据自身的开发需求进行订制扩展。

在我尝试了`Atom`，`VSCode`，`WebStorm`后，我确认它\-\-\-\-**Sublime**是我最喜欢的一款编辑器。

## 版本

> 我当前使用的版本是**Version  3.1.1  Build 3176**。

## 插件

我个人从事**Web前端开发**工作，目前使用的插件有：

> 以下用无关和相关来区分，插件是否大程度针对前端开发工作。

### 无关

#### Package Control

**必备插件**，方便搜索，快捷安装其余插件的基础。

##### 安装方法：

 	1. 使用快捷键`Ctrl + \``或者点击菜单`View - Show Console`打开控制台。
		2. 复制粘贴下面的安装代码到控制台。
		3. 回车，等待安装完成。

``` bash
import urllib.request,os,hashlib; h = 'df21e130d211cfc94d9b0905775a7c0f' + '1e3d39e33b79698005270310898eea76'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```

##### 使用方法

使用`Ctrl + Shift + P`打开命令面板，输入`Package Control`就可以看到下面列表内补全的各种与**Package Control**相关的功能。

如：

- Install Package	**打开搜索下载插件功能** 
	 List Packages	**列出已安装插件** 
	 Remove Packages	**移除插件** 
	 Upgrade Package	         **升级插件** 
	 Disable Package	**暂时停用插件功能** 
- ...

##### 相关链接

[Package Control官网](https://packagecontrol.io/)

[Package Control Github仓库](https://github.com/wbond/package_control)

#### A File Icon

使用**Package Control**下载即可。

给编辑器侧栏的文件目录树添加图标。

效果入下图：

![A File Icon](http://olo2ef5ol.bkt.clouddn.com/blog/180522/i43F4Jabcd.png?imageslim)

#### AutoFileName

引用文件名路径及文件名自动补全插件。

方便在比如CSS，JS中用相对路径，沿着目录树引用文件。

#### EditorConfig

格式化编辑器配置插件，适合团队开发统一代码风格等。

在各种编辑器上都有相关的插件实现。

我的常用配置：

``` bash
# .editorconfig 文件名
root = true # 不再向上寻找.editorconfig文件

[*] # 对所有文件生效
charset = utf-8 # 使用utf-8字符集
indent_style = space # 使用空格做代码缩进
indent_size = 2 # 空格个数为2个
end_of_line = lf # 使用UNIX的lf换行符
insert_final_newline = true # 在文件最后插入一个空行
trim_trailing_whitespace = true # 移除代码行末无用的空格
```

#### Sidebar Enhencement

侧栏功能增强插件。

可根据需求配置侧栏功能，让侧栏更加强大。

如下图：

![mark](http://olo2ef5ol.bkt.clouddn.com/blog/180522/9KiaHG6A8f.png?imageslim)

### 相关



##  踩坑

### 字体渲染混乱，文字竖直方向不对齐。

效果如下图所示：

![mark](http://olo2ef5ol.bkt.clouddn.com/blog/180522/gmLh3hBA3L.png?imageslim)

经过查询发现是默认的编辑器设置`font-face`为空，需要给其设定一个字体。

在看了大家的推荐后，我选择了[Consolas-with-Yahei](https://github.com/wuqiling97/Consolas-with-Yahei)。同时支持等宽的代码常用字体**Consolas**和**微软雅黑**。

从Github下载后，双击打开字体，再点击安装等待安装完成即可。

再在编辑器设置里设置**font-face**字段为**Consolas-with-Yahei**。

OK，大功告成！

看看新的渲染效果，比先前看起来舒服多了。

![mark](http://olo2ef5ol.bkt.clouddn.com/blog/180522/E1AIjaKeDm.png?imageslim)







