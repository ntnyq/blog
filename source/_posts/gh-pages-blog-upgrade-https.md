---
title: Github Pages个人域名升级为HTTPS
tags: [hexo, HTTPS]
date: 2017-12-18 11:22:16
description: 给博客的域名加上绿色的HTTPS认证，顿时感觉高大上了不少。
category: 学习
---

![HTTPS](http://olo2ef5ol.bkt.clouddn.com/https.jpg)

给你的`hexo`博客域名加上**HTTPS**认证。
<!-- more -->

## HTTPS

简单讲，**HTTPS**就是`HTTP`更加安全的版本。实现原理是在`HTTP`下加入了`SSL`层，通过身份认证，来保证数据传输的安全。

而网站升级`HTTPS`，需要`CA`(Certificate Authority)机构wosign的颁发的SSL(Secure Sockets Layer 安全套接层)证书。

然而，Github Pages无法上传SSL证书。

## CloudFlare

`CloudFlare`是一家CDN提供商，它提供了免费的HTTPS服务(但不是应用SSL证书)。

实现的方式：用户到CDN服务器的连接为`HTTPS`，而CDN服务器到Github Page服务器的连接为HTTP，就是在CDN服务器那里加上反向代理。

> [CloudFlare官网](https://www.cloudflare.com/)

### 注册

注册并登陆CloudFlare，并将自己域名下的`Name Server`修改为CloudFlare的`Name Server`。

![CloudFlare的NS](http://olo2ef5ol.bkt.clouddn.com/name-server.png)

比如我的域名是在万网购买的。

进入万网域名列表页面，选择要更改NS的域名，点击后面的*管理*。

![步骤1](http://olo2ef5ol.bkt.clouddn.com/step1.png)

在基本管理\->基本信息页面 选择 **修改DNS**

然后填写CloudFlare的Name Server值。

### 解析

在CloudFlare控制台的**DNS**面板将域名解析到Github Pages。

![步骤2](http://olo2ef5ol.bkt.clouddn.com/step2.png)

### Crypto设置

在CloudFlare控制台的**Crypto**面板设置 SSL为**Flexible**。

![步骤3](http://olo2ef5ol.bkt.clouddn.com/step3.png)

### Page Rules设置

在CloudFlare控制台的**Page Rules**面板设置路由规则。

利用**Always use https**设置两条规则，规则链接分别为`http://domain.com/*`与`http://domain.com/`(开启https强制跳转)。

![步骤4](http://olo2ef5ol.bkt.clouddn.com/step4.png)

## 大功告成

![成果展示](http://olo2ef5ol.bkt.clouddn.com/https-done.png)

## 参考资料

[Github Pages 个人域名完美支持https](http://blog.csdn.net/itechzero/article/details/72784218)

