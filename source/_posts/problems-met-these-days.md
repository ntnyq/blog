---
title: 近期前端工作踩坑总结
description: 最近开发过程中遇到的问题，和解决方案，学到的东西。
date: 2017-06-29 22:04:37
tags: [踩坑, 前端]
category: 工作
---

工作近一个月了，简单总结最近开发过程中遇到的各种问题，解决方案和学到的东西。<!-- more -->

## 工作介绍

入职已经有27天了，谈一下现在的公司用的业务和技术。

公司主要做建站的工作，业务我个人所接触的主要就是前端页面和js效果的编写。页面主要集中于后台管理系统，信息展示这些方面，主要是一些逻辑控制方面的切换，弹出，隐藏，排序，删除等效果。基本没有什么动画元素在里面。

人员方面，公司有不少的后端，包括php后端和java后端，美工设计应该没有，专业的前端目前应该就我一个人。做为一个刚入职才一个月，先前并没有工作经验的菜鸟，我个人表示压力很大。

### 本月工作

入职后的这个月我都做了什么？

上个月25号面试晚上就签合同办理入职，第二天早上就开始做一些切图写页面的工作，基本每天的工作量是1-2个页面加上js效果的量，不过如果页面简单或者js复用先前的就会快一点。

入职后第二周基本开始当时那个项目的前端js效果的编写，写了近2个周的效果。

前三个周基本都是在做那个台湾网的项目，其间还参与了2个不同项目的大屏页面编写。

一个新蓝网的项目只写了其中的2个页面，另一个浙江哪个电视台的大屏做了一下样式的修复和那个页面的API接口对接工作。

本周在老板的指示下，扒了别人系统的3个网页。还另外做了一个CCTV的表单页面和一个CNTV的节目排行页面。

### 谈谈技术

技术方面，我问组长咱们对浏览器兼容性的要求，它说主要是chrome和FF，IE不做什么要求，所以我也就没太纠结。然后因为页面写了还要给他们后台去用，也是兼顾效率，所以页面的效果基本都是在用jquery在写。

期间自己因为业务需求写了一些jquery的插件，比如分页，日历，模态框等。毕竟个人觉得如果用到的不多，那么为了实现一个小功能引入一个插件还是代价有点大。虽然我们并没有对性能上有什么要求。

不过我始终觉得养成良好的代码习惯是很有必要的，熟悉并且在工作中实践代码规范。

自动化构建方面，我用gulp做自动化构建，写less然后编译成css，用browser-sync做hot-reload，然后还有别的插件不过基本没怎么用过比如autoprefix，uglify等。因为我写的代码他们会拿去套php的模板，所以也就没压缩，不清楚他们上线前是否会压缩代码。

最近用到的插件，有UMeditor和echarts。

## 踩坑详情

### 图片视频上传

图片上传的坑在先前的博文里面有谈过，因为不强制要求兼容ie，所以就采用了原生的FormData对象用jquery来上传。

昨天晚上突然QQ发消息说急着要搞一个视频上传的功能，还要尽快做出来。

我的神，我先前也没做过视频上传啊。但是没办法，前端就我一个，锅只能由我来背了。

虽然我知道webuploader是肯定可以实现的，不过只是一个小功能，所以心里还是有点拒绝的。

然后我已经蛮困了，但是他们又说很着急。而且说只要能上传mp4格式就可以。

没办法，开始搜索寻找解决方案。所幸的是没多久，就找到了一篇博文，一看，竟然还是用的FormData对象，马上去修改了一下先前写的上传图片的demo，测试，哎呀还真的可以。这下子就简单了。

然后还要上传时候能够实时展示进度，因为知道XMLHTTPRequest2开始支持了progress事件，然后搜索了一下jquery实现，嗯，很简单。

开始写，先写弹窗的布局。。。写到11点半，太累了，眼睛涩，坚持不下去了。

不过那会儿已经只差进度监听没实现了，然后还有个取消上传。然后把搜到的发给他们。

第二天早上，-0- 有问题需要我解决，基本还是我来写完了。

> 打算要找时间研究一下webuploader的配置，下次如果用到的多，还是用webuploader吧，毕竟兼容性还是不能忽视。

### DEBUG

1. 样式失效

上周在老板的指示下，扒了别人的几个网页，我写好布局和效果然后交给学java的哥们儿部署。然后写好，第二天发给他，嗯，一个小调整，打开css，修改，顺手加了个注释。

没想到就踩坑了。

再次发给他后，自己顺手打开页面，没想到刚测试好的结果竟然失效了？？？ 失效了？！？！？！

瞬间1W个想不通，不过遇到问题要解决问题啊，打开devtools，这条属性竟然没生效。

  - 不科学啊，难道类名写错了，全部检查复制粘贴。Ex？还是不行！！！
  - 难道选择器权重不够，在元素上加个id试试，不嵌套了！！！
  - WTF？？？Chrome出bug了？！？！？！这都不行。

直到我注意到了注释。。。

因为sublime我给安装了less语法支持，然后进入css文件也会默认以less打开。然后css不像less是支持以2个斜杠来注释的，所以在less语法的注释出现在了css文件里，看着是注释，结果导致了下面的样式失效。

解决方案：修正CSS默认语法支持。

2. 输入区域出现前面空白。

刚才组长碰到的问题，喊我去debug。

具体问题表现是这样的：一个contenteditable的div，在里面输入内容后，前面会留白，但是删除后就不会了。然后他找不到解决方案。

当我看到这个问题的第一反应，这个元素有了padding-left或者text-indent。

然后打开页面输入一堆字以后第二行开始并不存在前面的空白，所以padding-left可以pass了。然后换行后也没有空白，那么text-indent也就不是了。

再打开devtools，元素身上并没有可能什么可能会导致出问题的样式。

那么就在周围的元素上找了。然后想，是否是前面的元素的浮动问题，虽然我不清楚，浮动能导致这样的问题吗。出现浮动问题应该元素上移才对。

然后查看周围元素的样式，给父级元素添加清除浮动，然而并没有用。

再突然想，删除周围的元素，在devtools里面delete周围的element，哎呀，然后发现问题所在了。

一级一级排查，找到导致问题出现的元素。再查看它的样式。果然line-height太高了。超出了它元素本身的高度。

修改，解决！！！Perfect！！！

## 经验

### 全局状态

如何在一个页面或者模块中维护一个全局可以用的状态。答案很简单，全局变量。

但是全局变量不应该被滥用，那么就是放在命名空间里，用一个对象来维护多个全局变量。

或者放到dom节点的自定义属性里，h5的data属性就是提供这样的用途的。

### 局部状态

局部状态，应该是可以各个模块的状态不同的，而且应该分开维护，互不影响。

前几天做了一个小模块，用了各级的自定义data属性来维护，在jQ里面利用事件委托的this对象访问所在的模块，然后给它绑定多个data属性来维护。

今天在做一个排行榜页面，每个排行榜要有不同的默认展示页，全部页数，每次展现数据条数。感觉放在每一个模块上面去绑定和访问自定义属性太麻烦了，因为属性比较多。

就又想到了利用数组，数组里面保存的是对象，对象包含每个模块的各个属性。

用一种发布订阅的方式，页面接受的改变，去修改状态中的数值，然后再根据数值的变化去更新页面。

实践起来感觉很不错。

## 我的想法

有关于工作，比如前端的精灵图技术，或者base64图片等，这些项目中是否应该采用呢，自己编写的组件，会不会有出现bug的可能，我写的代码会稳定吗，性能优秀吗？

心里对好多方面有问题。

最近想着以后的开发用ejs来写，也方便后期的模块化，所以打算最近尝试一下。

然后想买几本书，设计模式，web富应用等，需要继续充电学习。

最近一直用jquery，对原生js有了一点生疏了，没事儿也该开始做做自己的小项目了。

