---
title: 最近的学习、生活和工作状态
description: 反思过去，讨论现在，畅想未来。
date: 2017-09-02 11:04:37
tags: [生活, 学习, 工作]
category: 生活
---

反思过去，讨论现在，畅想未来。

最近发生的事情还蛮多的，搬到了办公室去工作了。工作的内容倒是蛮清闲。双十一快要到了，打算买个pad来看书。学习感觉进度有点差，想学习的东西太多了。

做了很多计划，又大多都被搁置了。

<!-- more -->

> 本文写于2017年11月07日。

## 学习

### 方向

昨天阅读了一下台湾友人(`36岁的全栈开发`)介绍的一本书**《用户体验要素：以用户为中心的产品设计》**。除这本外，他还介绍了别的几本书给我。

- 你不知道的JavaScript 上和中
- ECMAScript 6 入门 阮一峰著
- Nodejs Design Pattern
- Nodejs 硬实战

他是目前36岁，未婚，全栈6年。技术栈基本是`Vue系列 + Webpack2 + Scss + Mocha + Node`等。自学`Golang`，闲暇时间经常会去看看书(`至少经常在群里这么说`)。

和他聊了四次，讨论了一些技术选型和学习方向上面的问题。

收获蛮多的，感觉要找个能聊聊天的前端方面走的久的导师是不容易的。毕竟大牛的时间就更宝贵。

前两天我在[前端网](http://www.qdfuns.com/)上面看了一个小效果，简单的判断鼠标移入方向的demo。

那个demo是由一个据说有十几年经验的老前端写的，我再次看到了一个方法`Math.atan2()`，上次是从工作中实现`3d球面动态标签云`时候用到的插件源码里看到的。对于三角函数，反三角函数这些其实我是蛮懵的。

于是我抱着试试的心态问了下台湾友人。我蛮好奇，是否经验老到的前端都特别熟稔这些在我看来会很少用到的API。

果然，他是知道的。

并且粘给了我`MDN`上的详情页面，告诉我`MDN应该是你的好朋友`。

他告诉我，三角函数还是蛮重要的，因为有时候要实现一些页面上的效果，都是可能用的到的。

我也有同感。

比如看过的曲线的demo，弧形运动的demo等。

### Github

上个周日把自己的Github清理了一下，本来有17个repos，现在被我删除到只剩下7个了。

并且将本地自己敲过的大量代码放在了一个叫[Code-lib](https://github.com/ntnyq/code-lib)的仓库中，就当留个存档，也不需要占用本地的硬盘，而且可以放到`gh-pages`上面方便分享给人看。

我发现自己时长会定一些可能比较遥远的目标。比如**翻译一本书**，比如去**刷leetcode**，比如**写个hexo主体**。计划之所以被搁置或者放弃的原因可能就是目标有点太长久了，而生活和思想是变化的。

所以我应该只制定一些**可以实现的小目标**才好，尽量可以在短期内实现，比如一个周以内，而不是那种动辄要月余的。

所以我将先前某些不会继续维护下去的repos删除掉了。除了博客外留下了2个应该会长期维护下去的。翻译书和刷`LeetCode`。

翻译书真的是爱好，我感觉应该再系统学习一下，再把翻译当做成一个复习的过程，争取把知识嚼烂。

而LeetCode我试到第二题就开始需要链表了，所以打算起码等自己先学习完`JavaScript数据结构与算法`以后再继续刷题之旅。

### 项目

前两天看`Javascript设计模式`这本书时候，简单接触了一下**jQuery**的架构，发现它的设计真是奇淫技巧。于是我从[JQuery 官方repo](https://github.com/jquery/jquery)下载了jQuery的源文件。

希望可以有时间静静阅读一下源码，思考学习一下jQuery库的**代码组织和架构**。

再接触点小项目，深化一下对vue的学习理解，和一些常见类库的使用。

因为我的前端js框架选择是`Vuejs`。

## 工作

上周周四正式搬入新办公室上班了，先前的两天我和学习安卓的哥们儿一起去搬了桌子和椅子。毕竟公司在西安暂时也只有我们两个人而已。

### 项目

国双的项目一直在做，但是断断续续的，而且频繁修改需求。有的功能我没有很好的实现出来，或者因为别的原因觉得不适合。我一直在想，那样的需求真的是无法实现的吗。这个时候很希望能够有个人来指导一下我，不需要告诉我具体怎么做，只需要告诉我能否真的实现就可以。

除了国双的项目外，最近公司也没有新的活。关于CRM配色的问题我也已经解决了`我是个前端啊`，不过他们也没有再催我了。

视频播放器的广告插入功能还没找到合适的API，只有demo的实现，而且不确定具体怎么支持。不过最近也蛮沉寂的，老板也没有问过我。

### 招聘

关于公司前端招聘的问题。今天一直在看**传智播客培训机构**4个学生的项目源码。

怎么说呢，一团糟吧。

4个学生，三男一女。

项目内容基本相同，主要是以下几个：

- 博学谷PC端项目 (php + bootstrap + jQuery + art-template)
- 慢慢买移动端项目 (mongoDb + express + vue)
- 移动端商城项目
- 仿饿了么详情页项目

仔细看了下，有2个学生的博学谷项目完全相同，包括`代码 + 注释 + 缩进`等。由此基本可以得到结论，2个学生的都是down下来的。1个学生的项目down自老师的码云，`.git`文件夹里的`config`文件暴露出来的。1个女同学的项目源码700多MB，包括了数据库软件，而且还包括了2次。不过更尴尬的另外3个人的代码里根本不包括数据库和服务器端代码，导致前端代码根本没有内容可以展现。女生的代码注释里写着，`这段代码的作用忘了，思路乱了`，挺萌的呢。

更不要提各种规范，代码风格了。简直毫无可取之处。

我花了几个小时去研究了这些代码，然后赶紧真的很心累。

更让我心累的是我明天还要面试这4个人。早上2个，下午2个。

我感觉结局已经基本可以注定了，感觉这样的面试真的是在锻炼他们，也是在锻炼我。

而且我还要准备一些题去面试他们，真的不知道什么难度的问题才算是合适。

## 生活

终于快要到双十一了，终于快要买pad了。

然而最近京东、苏宁一直没货。。。- -!无语

今天晚上看到苏宁突然有了20个货，赶紧预定了一个，不出意外11月结束前应该可以拿到了。

很穷，所以不得不打好算盘。

搬去办公室工作有什么好处，我个人感觉最大的优点就是有免费的桶装水喝。

代价则是每天要骑车1个小时来回，还要**拎着十几斤的电脑包**，真的手指头都磨的疼，还骑车很不方便。

今天路上突然手提的带子一个断掉了，真是吓到。这要是直接摔下去，不得几千块。

赶紧京东下单买了个双肩包，本来打算双十一买的。

据说老板打算将每天的工作时间延长2个小时，而工资不变。

真是厉害啊。

