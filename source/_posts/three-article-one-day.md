---
title: 小目标, 每天3篇技术文章
description: 技术是个厚积薄发的过程，用时间去积累，让坚持变为习惯。
date: 2017-03-13 08:04:37
tags: [软文]
category: 学习
---
给自己订一个小目标，每天坚持看三篇技术类文章，在此每天记录下链接。

文章来源主要集中于 **微软公众号** 推文，我关注的**技术博客**，前端或相关站点**论坛主题帖**等。
*如有侵权行为，请[联系我](https:ntnyq.github.io/aboutme)进行删除*。

<!-- more -->

今天是**2017.02.17**，就从今天开始吧。
### **2017年**

### 2月

#### 17日
1. [Chrome 开发者控制台中，你可能意想不到的功能](http://mp.weixin.qq.com/s/EqRfLbuta7RU5jePJCCWAg)
2. [翻译：2017年值得学习的3个CSS特性](http://caibaojian.com/3-new-css-features-to-learn-in-2017.html)
3. [HTML input type=file文件选择表单元素二三事](http://www.zhangxinxu.com/wordpress/2015/11/html-input-type-file/)

知识点概要：
- 文章1介绍了console中的一些API，例如：
  - 选取DOM元素
  - 设置网页可在浏览器实时编辑
  - 查询DOM元素关联的事件
  - 计算代码块的执行时间列举元素的属性
  - 清空控制台等
- 文章2介绍了CSS的3个新特性：
  - @suppots规则检验浏览器是否支持某属性
  - grid布局的网格组件和单位fr
  - css原生变量 (现在都是用sass之类来实现)
- 文章3介绍了file表单控件
  - 了解了type="file"的Input表单控件的兼容情况
  - 学到了如何自定义控件外观将label与控件关联，再设置其样式
  - 了解了控制上传多文件的方法，和实时预览，上传类型控制等

#### 18日
1. [JavaScript 中的 this !](http://www.qdfuns.com/notes/36631/9822900df487efa3c39e25250985c689.html)
2. [Javascript闭包——懂不懂由你，反正我是懂了](http://kb.cnblogs.com/page/110782/)
3. [Flex 布局教程：语法篇](http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html?utm_source=tuicool)

知识点概要：
- 文章1介绍了各种情况下this的指向，例如：
  - 函数执行和控制台
  - 严格模式和函数自执行
  - 函数作为对象的方法
  - 对象的方法赋值给变量后调用
  - 回调函数和闭包中的this
  - ES6的箭头函数的this无法改变，只由定义决定
- 文章2借用stackoverflow上的问题答案解释：
  - 什么是闭包，闭包的定义
  - 闭包该如何应用
  - 闭包所带来的利和弊
- 文章3介绍了flex布局
  - 一种有别于传统盒模型的新的布局方案
  - flex布局的定义和基本概念
  - 实现flex布局要用到的CSS样式和实现方法
  - 明天看此文的另一篇-实例篇。

#### 19日
1. [Flex 布局教程：实例篇](http://www.ruanyifeng.com/blog/2015/07/flex-examples.html)
2. [12种不宜使用的Javascript语法](http://www.ruanyifeng.com/blog/2010/01/12_javascript_syntax_structures_you_should_not_use.html)
3. [如何让搜索引擎抓取AJAX内容？](http://www.ruanyifeng.com/blog/2013/07/how_to_make_search_engines_find_ajax_content.html)

知识点概要：
- 文章1展示了些简单的flex布局实例：
  - 骰子的布局
  - 网格布局
  - 圣杯布局
  - 输入框的布局
  - 悬挂式布局
  - 固定底栏布局
  - 特别常用的属性就是flex:1来实现自适应
  - 流式布局
  - 搭配百分比和vh之类还有媒体查询，最小最大尺寸
  - 如果用flex-basis设定宽度百分比，那么高度就要另设
- 文章2介绍javascript中的一些雷点：
  - == 和 ===
  - eval和with
  - function的函数提升
  - 基本包装类型
  - 无用的void运算符（返回undefined）
- 文章3介绍利用History API实现页面无刷新更改url
  - 用histroy api 代替了#结构利于spider抓取
  - popstate和pushstate API来改变url
  - 再用ajax获取anchor指向的链接再请求对应页面内容
  - 利用noscript标签来给spider提供页面内容

> 今天傍晚停电了，还好晚上电又来了。在阮一峰老师的博客里看了四篇文章，第四篇是node命令行程序的简单开发教程，因为今天的都显得比较短，就不贴链接了。继续实践flex布局去，中午开始在写个小demo，感觉真心好用。

#### 20日
1. [ES6核心内容学习](http://www.qdfuns.com/notes/30895/8e792742617a999c6275b13dfbfe0bd7.html)
2. [vue-router-v2.0简介](https://router.vuejs.org/zh-cn/)
3. [浏览器的怪异模式和标准模式](http://www.cnblogs.com/mirror/p/3178646.html)

知识点概要：
- 文章1列举了部分ES6中的新特性和应用：
  - let和const关键字
  - 数组和对象解构赋值
  - 数组，字符串和Math对象的扩展方法
  - 函数参数默认值和**箭头函数**
  - 新增的symbol数据类型
  - Set和Map数据结构
  > 最近学习vue和看别人笔记的时候已经有接触过这些新特性，感觉很好用，很灵活。我还下载了阮一峰老师的《ECMAScript入门》打算有时间了好好研究一下。

- 文章2介绍了vue-router的用法：
  - 讲述了如何利用vue+vue-router来做单页应用的开发
  - vue-router的安装方式
  - 动态路由适配 嵌套路由的实现
  - 命名路由和命名视图
  - 导航钩子和过渡动效 数据的获取
  - router-link和router-view的相关要点
  > 本来是在看篇博文的，不过是介绍vue1.x的，因为我主要学2.x，所以就去官方看api了。
- 文章3从浏览器和前端的发展历史解析了：
  - 浏览器的渲染模式分为怪异模式和标准模式的原因
  - 火狐引入的准严格模式和DTD(文档类型定义)
  - 两种模式的主要区别，盒模型方面
  - 利用document的compatMode属性来判断浏览器的当前模式
    1. 'BackCompat'对应怪异模式
    2. 'CSS1Compat'对应标准模式

#### 21日
1. [IE6 浏览器常见兼容问题 大汇总（23个）](http://blog.163.com/hongshaoguoguo@126/blog/static/18046981201371611543769/)
2. [HTTP状态码->HTTP Status Code](http://www.cnblogs.com/DeasonGuan/articles/Hanami.html)
3. [理解SVG viewport,viewBox,preserveAspectRatio缩放](http://www.zhangxinxu.com/wordpress/2014/08/svg-viewport-viewbox-preserveaspectratio/)

知识点概要：
- 文章1列举了常见的23种IE6兼容问题：
  - img标签的边框，格式，背景透明，下面多5px等问题
  - 布局上的横向双倍外边距 默认行高 3像素bug等
  - a标签以外不支持:hover伪类 子选择器不能用
  - 不支持最大最小宽高 不支持display: table-cell
  - li设置宽高内部浮动 子标签无法撑起父元素等问题
  - 解决方法: 各种hack
  > 听说现在政府大学国企之类的部门除外，基本兼容是IE8
  +，不过学习一下总是有用的。

- 文章2介绍了常用的HTTP状态码：
  - 1xx代表服务器临时响应，需要请求者继续执行操作
  - 2xx代表服务器成功受理了请求
  - 4xx代表请求可能出错，妨碍了服务器的处理
  - 5xx服务器在响应请求的时候可能本身发生了错误
  - 常用：200: 服务器成功返回网页
  - 常用：404：请求的资源不存在
  - 常用：503：服务不可用
  > 个人觉得应该要再加上304: Not Modified 服务器资源未修改，本地cacha可用。

- 文章3从主要讲解了svg的几个属性：
  - view-box和viewport的区别
  - 以上两者可以上设置的值及含义
  - preserveAspectRatio属性决定view-box和viewport二者比例不同时的情况
  - preserveAspectRatio作用域SVG属性，由空格分割的2个值组成
    1. 第1个值表示，viewBox如何与SVG viewport对齐（由2个部分组成，前半部分表示x方向对齐，后半部分表示y方向对齐）
    2. 第2个值表示，如何维持高宽比（如果有）
> 作者给的小demo还不错，蛮直观的。上[demo](http://www.zhangxinxu.com/study/201408/svg-viewbox-alignment.html)。

#### 22日
1. [impress.js初体验 - 前端装X利器）](http://www.cnblogs.com/Darren_code/archive/2013/01/04/impressjs.html)
2. [抛弃jQuery，拥抱原生JavaScript](http://www.qdfuns.com/notes/26978/20d30e7fafacf0ccc487a0492c4acd72.html)
3. [web前端开发之几种布局方式之响应式布局](http://blog.csdn.net/gertyy/article/details/52764527)

知识点概要：
- 文章1介绍了一个由js和html共同协作的演示工具：
  - 通过**data-**属性来做些简单的3D变换
  - 其实就是把CSS的transform属性封装到了html中
  - 再通过javascript初始化后控制来展示
  - 不需要对前端开发有多深入的了解，看看API就可以使用
  - 不过为了美观，CSS样式要自己写，加上点关键帧动画和颜色设计好，会漂亮多
  > 今天我也用impress.js做了个小demo。[点击观看在线演示](http://ntnyq.xyz/projects/impress-demo.html)。

- 文章2移除jQuery的原因和做法

1. Why not jQuery

  - 传统的DOM为中心的模式已经转变为数据为中心的开发模式
  - jQuery不支持同构渲染，性能较差
  - 原生的API如querySelector借鉴jQuery已经足够好用
  - 时机早已成熟，是该放弃兼容老版本IE浏览器，同时移除jQuery

2. How to remove jQuery

  - 替换代码，具体替换过程请参考[API](https://github.com/oneuijs/You-Dont-Need-jQuery)
  - 旧版本浏览器自动跳转，设置IE条件HACK，提醒用户下载新的浏览器。

> If We Didn’t Spend So Much on IE Support, We Could Be Taking Vacations on Mars，said Christian Alfoni.

- 文章3介绍了以下几种布局方案的更迭：
  - 传统布局，固定高度和宽度
  - flex布局，设置容器和项目属性达到自适应的目的
  - 自适应布局 根据分辨率变化 页面内元素大小不会改变 位置会变
  - 流式布局 百分比布局方法 在屏幕尺寸跨度大时候效果差
  - 响应式布局，通过视口和媒体查询，展现响应式内容（图文）
  - 利用相对单位(rem,em,vw,vh)等来实现

#### 23日
1. [手机界面设计中12种常用布局）](http://www.xuanfengge.com/12-kinds-of-commonly-used-in-mobile-interface-design-layout.html)
2. [提高你css技能的css开发技巧](http://www.haorooms.com/post/css_skill)
3. [vue2.0构建单页应用最佳实战](https://segmentfault.com/a/1190000007630677?utm_source=weekly&utm_medium=email&utm_campaign=email_weekly)

知识点概要：
- 文章1介绍了常用的8种手机页面布局和4种次导航布局：
  - 主页面： 列表式 陈列馆式
  - 选项卡试 旋转木马式 九宫格式
  - 多面板 和 图表式 行为扩展式
  - 次导航： 抽屉式 弹出式
  - 超级菜单式 图片轮盘式
  > 总结的不错，还给出了图片样例，应用场景和优缺点。最近我正在做个小DEMO，在纠结该如何做UI，可以参考一下了。
  > 而且打算实现一下这些布局，练习练习。

- 文章2介绍了一些开发中可以用到的css技巧

> 比较好的一些点：
> - 文本显示优化，刚好这两天看到别人用过
> - border的应用技巧，给边框double属性，没用过
> - 表格单元格等宽 tabale-layout: fixed;属性
> - :not()的应用技巧，一些导航没有右边线之类的优雅实现
> - resize实现图片对比
> - 当然，有些属性的兼容性可能不够好，需要用的话可以去[caniuse](http://caniuse.com)去查询。

- 文章3以一个todoList为例讲述了一个vue2.0的SPA构建过程：
  - 运用的包 vue vuex vue-router vue-resource
  - 环境node+NPM 运用webpack打包工具
  - 运用vue-cli脚手架搭建项目
  - 学习.vue文件进行组件化的开发过程
  - vuex管理数据 vue-router实现路由 vue-resource请求网络资源

> 之前敲过一遍作者的vue1.x版本作品，今天看到2.0版本的，又跟着实践了一遍，收益匪浅，主要作者的项目结构很好，比较易懂。
> 这里我放上[github链接](https://github.com/MeCKodo/vue-tutorial)吧


#### 24日
1. [移动端适配方案(上)](https://github.com/riskers/blog/issues/17)
2. [移动端适配方案(下)](https://segmentfault.com/a/1190000004358316)
3. [es6 扩展运算符 三个点（...）](http://blog.csdn.net/qq_30100043/article/details/53391308)

知识点概要：

>  文章1从物理像素和设备像素谈起，解释了一个元素在移动端设备上显示的像素的取决因素
> 1. 元素是否被缩放
> 2. 屏幕是否为高密度的
> 再介绍了视口这个概念，然后分别介绍了布局视口，视觉视口和理想视口的区别，还有如何获取这些视口的尺寸，如何在移动端开发中对视口进行设置。
> 最后还给了设备像素比的js获取方式和计算方式

---


> 文章2承接上文，给了一些BAT等大公司在移动端适配方案的例子：
> 介绍了3种常见的移动端适配方案
> 1. 高度固定 宽度自适应方案
> 2. 宽度固定 viewport缩放方案
> 3. rem做单位 viewport缩放方案
> 个人觉得，3种方案的最后一种在移动端的适配效果会更好，设置了viewport缩放和根据设备的dpr更改rem值，再在根元素上面设置了data-dpr属性 这样可以对移动端页面的字体也有比较好的适配效果 给用户更好的体验

---


> 文章3中作者针对ES5的新扩展运算符...的含义和衍生用法进行了详细的说明:
> 定义：将一个数组转换成用逗号分隔的参数序列.
> 作用：
> 1. 函数调用，需要传入非数组的可以传入运算符加数组
> 2. 替换数组的apply方法 不再需要apply将数组转换为参数
> 3. 合并数组新方法 每个数组变成参数序列即可[...a, ...b, ...c]
> 4. 与结构赋值结合将多个值存入数组var [a, ...b] = [1, 2, 3, 4, 5]
> 5. 函数的返回值，如此函数可以返回多个值
> 6. 将字符串转换为真正的单字符的数字
> 等等，总之很强大，需要好好练习使用。


#### 25日
1. [prototype的本质](http://www.qdfuns.com/notes/17398/35b250e9b392675c44f4f0cd833b72c8.html)
2. [JavaScript的API背诵篇](http://www.qdfuns.com/notes/17398/b95c07ed545cb18cef438a480456c94f.html)
3. [apply、call、bind？哈哈哈哈哈](http://www.qdfuns.com/notes/17398/7dc03d3c54d2abad1e09434ce031c51f.html)

知识点概要：

> 文章1提到了一种观点：原型的本质是一种委托关系，即我这里没有，就去我的原型找，一旦找到了就可以当做自己的来用。
> 而原型链就是顺着原型向原型的原型去找，这样的关系
> 文章举得例子，生动的解析了这个过程，再介绍了构造函数的过程。
> 学到了2个api
> 1. Object.setPrototypeOf(obj1, obj2) 设置obj2位obj1的原型
> 2. ObJect.create(value)  创建一个对象

---


> 文章2我只能说全是干货，我现在肯定是看不完的，不过先收藏着，以后慢慢看，尤其是觉得用途广泛点儿的。就像今天上门的那两个Object对象的方法。以前看过的setProperty等，感觉实际用起来比较好用，还显得自己的知识面广泛点，更重要的是，技术在前进，我们要不断学习新的东西，而不是一直守着旧的。我觉得先进的技术总会比较优雅。

---


> 文章3中只用了例子，介绍了call, apply和bind的作用，但是通过例子的对比，可以清晰看出其中的区别，而且我最近学的了this指向问题和ES6的扩展运算符...等都提到了这3个API的一些用法，今天试着自己实践了一下apply和call，理解更深刻了。
> 接下来要再做实践，对这几个API更熟悉。
> 说说现在的理解，apply和call都会立即执行函数，而执行的环境的this指向就是传入的第一个参数，而执行的参数就是后面的参数，不同的是apply传入一个数组，call传入的是分开的参数。不过ES6的扩展操作符使用了后可以替换掉数组的apply方法了。

---

> 最近再看还是看老姚的文章，明天看一下他的那篇构建自己的栅格系统。实践才是检验真理的唯一标准，做一遍，理解会更深。

#### 26日
1. [打造自己的栅格系统](http://www.qdfuns.com/notes/17398/12c2613f09b3d895d4712bc5d779807d.html)
2. [前端中经常出现的算法总结](http://www.qdfuns.com/notes/36458/33b83dab7cb5cbb9cacdc6722feeaff6.html)
3. [vue-cli的webpack模板项目配置文件分析](http://www.qdfuns.com/notes/40585/9e2cd48b5ef2c1fc14118eabe67d11bc.html)

知识点概要：

> 文章1介绍了通过百分比和浮动来简单实现bootstrap的响应式栅格系统
> 通过.col-后面加数字代表栅格的宽度 这个通过浮动来实现 同时加上内边距
> 通过.row来实现栅格系统中的行 同时给.row设置负的外边距来实现.row的嵌套
> 通过给.container增加内边距来抵消.row的外边距
> 给.col设置tetx-align: center来实现文字居中
> 给.col设置margin的百分比 来实现栅格的水平偏移
> 再今天学到了，元素的padding值和margin值设置百分比的时候是根据的**父元素的宽度**。
> border不可设置百分比为宽度。

---


> 文章2介绍了一些前端中的常见算法的代码实现，比如排序算法，回文字符串，斐波那契数列等。作为一个前端，数据结果和算法可以不那么精通，但是基本的了解还是要有的，个人觉得思考学习算法，也是一种对逻辑思维能力的锻炼，而且好的算法，还体现了一种设计思想，是非常值得学习的。

---


> 文章3没的说，干货中的干货，如果你也像我在学习vue，但是对node和webpack只是简单的接触，你想了解一下vue-cli是如何打包和转译ES6和.vue文件的，这个过程中到底都发生了什么，那么你应该来看一下这篇文章，作者给配置文件标注了详尽的注释，这不能帮助你一下子精通webpack，但是可以让你对npm run dev 和npm run build的过程都发生了什么有个简单的了解。

#### 27日
1. [移动端高清、多屏适配方案](http://div.io/topic/1092)
2. [动手实现一个网页加载进度loading](http://www.cnblogs.com/likar/p/6247951.html)
3. [谈谈HTTP协议中的短轮询、长轮询、长连接和短连接](http://mp.weixin.qq.com/s/IqKNVqD4txdrL4ic5RMQ6Q)

知识点概要：

> 最近一直在纠结的点就是移动端布局的适配问题，也接触到了一些概念，设备像素，设备独立像素，物理像素，逻辑像素。布局视口，视觉视口和理想视口。看着多了，概念穿插着都有点对这些概念看的越多越糊涂了，虽然在布局上明白多了，直到看到了这篇文章。
> 其实解决这种困惑的办法很简单，举一个例子就可以没我们以iphone6为例。
> 375 \* 667 这个数值是它的**逻辑像素(也叫设备独立像素，密度无关像素，CSS像素)**。
> 750 \* 1334 这个数值是它的**设备像素(也叫设计像素和物理像素)**。
> 它的布局视口是由浏览器厂商规定的，大多是980px。
> 它的视觉视口是375 \* 667  这个和CSS像素是相等的。
> 而理想视口是用width=device-width来规定的，得到的也是375 \* 667.
> 当然也可以规定成别的，这样来理解就清晰多了。
> 而且文章也给了**移动端布局，1像素边框，响应式图片和响应式字体**一些解决方案。

---


> 文章2介绍了一个网页的loading效果并且给出了一个代码实现方案。
> 我们为什么要写loading效果：加载资源需要时间，为了避免空白期，**增强用户体验**。
> 而一个loading效果要求的就是，在它需要的时候出现，当资源加载完成也要让这个loading效果结束。所以这个loading的变化不能是线性的，大多常见的方案就是开始匀速变化，到后面再缓慢变化，直到资源加载结束。
> 还要考虑的点就是js加载的时间，因为我们的loading是由js控制的。
> 再接触了一个概念，首屏加载时间，因为我们没必要等所有资源全部加载完毕再展现给用户。那样需要的时间势必会更长，时间越长，用户体验越差。
> 首屏加载时间一般最好不要超过5秒。

---


> 文章3介绍的HTTP协议的相关点。提出了一个观点：
> HTTP协议不存在长连接，和短连接的区别。HTPP协议是基于请求/响应的，因此只要服务端给了响应，本次HTTP连接就结束了，或者更准确的说，是本次HTTP请求就结束了。
> 网上长提到的HTTP连接的长连接和短连接，其实是**TCP协议的连接**。TCP连接是一个双向的通道，它可以保持一段时间不关闭。
> 如何把连接设置为长连接：服务器和客户端都设置Connection为keep-alive。
> 我们平时用的是不是长连接？答案\-\-\-\-是的。
> 普通的web应用使用长连接的优点：长连接是为了复用，省去了多次请求网页内容，CSS文件，JS文件，图片等的过程，节省了消耗。
> 短轮询是客户端发起请求后，服务器不管有没检测到变化立即给予响应。
> 长轮询是客户端发起请求后，服务器如果没有检测到变化，就先把请求挂起一段时间，检测到变化后再给予响应，或者超时再响应。
> 优点：客户端的请求将会减少，节省了网络流量，也让服务器不至于一直在接受请求。
> 缺点：暂时不响应的话，服务器会挂起一个线程。
> 评价：长轮询和短轮训都不适合用户量特别大的情况。


#### 28日
1. [利用CSS、JavaScript及Ajax实现图片预加载的三大方法](http://www.qdfuns.com/notes/36458/93b1e49cbfc3d30d568b414e242b5aa1.html)
2. [99%的人都理解错了HTTP中GET与POST区别](http://www.qdfuns.com/notes/36458/38c8a472bd25fca8c3b78e887791aff0.html)
3. [IE6兼容性问题及IE6常见bug详细汇总](http://www.qdfuns.com/notes/35870/a55cdafb756eac77df65314503bcb6d2.html)

知识点概要：

> 图片预加载，又是一个为提升用户体验的技术，没办法，用户体验好，就是一切。
> 方案1：以背景图的形式延时（在首页首页加载完毕之后）将图片加载进来，注意，用户在没有请求时候是看不到这些图片的，当用户请求这些资源时候，直接从缓存中读取。
> 方案2：使用纯javascript里面的Image()类，为其指定URL，再通过js延时加载进来，该方法比较适合预加载图片量大的情况。
> 方案3：利用ajax技术实现。利用XMLHTTPRequest对象来请求对应的资源，再利用DOM创建对应标签，通过href，src等方法请求资源，将资源预加载进来。
> 优点：加载的资源并不会应用于加载页面之上。

---


> 文章2介绍了GET和POST两种HTTP请求方式的不同，主要表现在以下这些方面:
> GET在浏览器回退是无害的，而POST则会**再次**提交请求。
> GET产生的URL地址可以被书签存储，而POST产生的不可以。
> GET请求会被浏览器主动cache，而POST不可以。
> GET请求只能进行url编码，而POST请求支持多种编码形式。
> GET请求会被完整的保留在浏览器的历史记录里，而POST的参数不会被保留。
> GET请求在URL中传送的参数长度是有限的，而POST理论上没有限制。
> GET请求只接受ASCII字符，POST没有限制。
> GET比POST不安全，因为参数直接暴露在URL上面。
> GET参数通过URL传递，而POST则放在Request body中。
> GET请求只产生一个数据包，而POST请求产生**2个TCP数据包**。
> 详细解释：
> - GET请求，浏览器会把http头部和数据一起发送出去，服务器返回200。
> - POST请求，先发送头部，服务器返回100(continue)，则发送数据，服务器返回200。
> FF的POST只发送一次数据包。

---


> 现在的公司会要求兼容IE6吗？我先前装的国内的浏览器也是IE8的内核，万恶之源的IE浏览器啊。不过在论坛里和招聘里还是有看到要求兼容IE6的。我也有点不能理解，浏览器都发展的这么好了，W3C标准推出了这么多优雅而且强大的API，虽然我们要平稳退化渐进增强，但是兼容IE6，我个人认为应该让IE8以前的用户升级浏览器。所以好多框架啊库啊的，也基本放弃了对IE8以前的兼容，比如jquery3.x，bootstrap，vue等等，因为都使用了ES5的语法。
> 不过还是看看以前的FEer们，都经历着怎么样的坑。嗯，很多很强大，兼容这样的浏览器，内心都是拒绝的啊。
> 这里就不一一列举都有什么坑了。


### 3月

#### 1日
1. [12个JavaScript技巧](http://mp.weixin.qq.com/s/JEQ2SHBmeCqN77GKbHV_YA)
2. [H5单页面手势滑屏切换原理](http://mp.weixin.qq.com/s/EDCbuz6yyMOmKblPY4gBaQ)
3. [less的基础入门学习笔记，less基础教程](http://blog.csdn.net/kongjiea/article/details/52457400)

知识点概要：

> 文章1从实用的角度上介绍了一些javascript中常见的代码。一些看起来很简单，但是实际应用却很广泛的编码技巧。比如强制转换boolen类型，字符串转数字，获取数组中的最后一个元素，数组元素的洗牌，并条件符省去一次if判断，与运算符设定默认值等。
> 我一直认为优雅的代码就是这样的技巧造就的，不用juery，但是它的思想write lesss, do more依然使用。

---


> 文章2以一个小demo为例，介绍了H5单页面手势滑屏切换的原理。
> 利用了H5的触摸事件和CSS3的transform动画，来实现。
> 关于这个小demo，我打算亲自敲代码实现一次。
> 到时候我放上来。

---


> 今天开始折腾less了，感觉就是比css方便多了。
> 虽然都只是写一些简单的页面，没有到工程项目级别。不过我想，要是大项目来用肯定更舒服。
> 首先，用变量来定义一些颜色库啊之类的，或者一些别的库。
> 然后用混合来写一些效果，比如下划线，阴影效果等等，然后引用保证了一个整体的基调的统一。
> 再者，less的嵌套本身就有着面向对象的思想在里面，感觉会更容易维护，再加上运算符之类。
> 已经开始尝试去用less来写页面了，然后用gulp来编译less，同时进行自动的浏览器刷新。
> 走向前端的自动化了 :)

#### 2日
1. [雅虎前端优化的35条军规](http://www.cnblogs.com/xianyulaodi/p/5755079.html)
2. [前端面试笔试知识汇总1（含答案）](http://www.cnblogs.com/huansky/p/5923665.html)
3. [gulp学习笔记](http://www.cnblogs.com/huansky/p/6004257.html)

知识点概要：

> 文章1是别人转发的早先的雅虎35条军规，涵盖css，js，图片，cookie，移动端，服务器端等的性能优化要点。对于前端，性能优化是很重要的，而雅虎军规，则给我们分析总结了我们做优化应该针对的点，给我们以一个比较清晰的方向。以下列举一些点：
> 1. 减少http请求  合并压缩文件 精灵图 base64图片
> 2. 缓存ajax 延迟加载组件 预加载组件
> 3. 减少DOM元素的数量 少用iframe
> 4. 舍弃@import IE滤镜等
> 5. 样式表放在顶部 script脚本放在body结束之前
> 6. 使用cdn等 使用cookie设置有效时间

---


> 看点面试题，就当为自己可能要经历的面试做做准备吧。
> 感觉面试题一般问的虽然比较宽泛，但是答的就要相对系统一点，所以对把知识串联起来是有很大的帮助的。
> 比如一个跨域请求方案，jsonp，document.domain，H5的postMessage()方法，CROS和图片ping等技术。
> 再比如CSS3+H5+ES6的新特性，看总结，内心也是对自己了解的知识点的一次粗略的回放。
> 这对于学习是有很大的帮助的。

---


> 这几天折腾了一下gulp，自动化笔记更方便。
> 目前使用的模块有：
> - js压缩  \-\-\-uglify
> - 编译less  \-\-\-less
> - 浏览器同步刷新  \-\-\-browser-sync
> - 自动添加css厂商前缀  \-\-\-autoprefixer
> - 还有就是万恶之源的gulp和rename模块
> 感觉就是方便啊，起码不用刷新浏览器就省了大功夫了，感觉再弄个显示器，一个写代码，一个看效果，简直不能更安逸。
>
> 另外打算这两天写个gulp的使用教程，虽然网上的蛮多的，不过还是想分享一下自己的学习使用心得。

#### 3日

1. [程序员的基础生存技能：高效用Google](http://mp.weixin.qq.com/s/Nvki2kxVHg0StFVE4nogXg)
2. [漫画告诉你什么是DDoS攻击？](http://www.leiphone.com/news/201509/9zGlIDvLhwguqOtg.html)
3. [【译】怎样编写移动优先的CSS](http://www.cnblogs.com/huansky/p/6095854.html)

知识点概要：

> 搜索引擎是近二十年最伟大的发明之一，极大地消灭了信息的不平等。
> 我非常同意作者的这个观点，我个人是非常享受搜索引擎带来的极大的便利的。也有一些个人使用搜索引擎的心得，比如关键字的提炼，如何快速有效地搜索到自己需要的信息。
> 不过看了这篇软文后，还是感觉学到了，这些使用谷歌搜索的技巧。
> 完整匹配 筛选 站内搜索 通配符 语言和日期。

---


> 前端网是我一直在关注的学习网站之一，每天分享技术和个人代码的并不多，所以每天都会点开看看，如果有人分享了有价值的笔记，就认真读读。
> 不过最近经常会出现无法访问的情况，刚才一看提醒，竟然是最近在遭受DDoS攻击，这个词我在群里还是偶尔有听到的。
> 看了这篇文章后，对DDoS攻击的原理和防范方法也有了简单的认识，不过后面那个所谓的什么解决方法，个人感觉比较偏理论，实践起来并没有那么简单。

---

> 互联网已经走入了一个移动端优先的时代，君不见招聘上面要求好多的都是有过移动端的开发经验或者要页面兼容移动端设备。
> 那么移动端优先和桌面优先的区别呢？
> 移动端优先意味着样式应该首先应用于移动端设备，大屏幕的高级样式和其他样式则通过媒体查询来实现。
> 移动端优先的优点：较大屏幕的代码通常比小屏幕的要复杂，所以首先编写移动端的代码会更简单，代码量和逻辑处理也会相对减少。


#### 4日

1. [H5移动端页面设计心得详解](http://www.xuanfengge.com/h5-design-jd-introduce.html)
2. [玩转HTML5移动页面](http://www.xuanfengge.com/break-html5-mobile-page.html)
3. [腾讯网无障碍说明](http://www.qq.com/demo/accessibility.htm)

知识点概要：

> 前端就只是切图写效果吗？我不这么认为，我个人认为前端的乐趣在于创造。
> 当然我们在做商业上的项目时候无法决定用户的UI，然而我们自己写一些demo时候呢，一个好的UI给自己也能以美的感受。
> 当然我们并不专业，不过我们可以把UI设计的简单点，简单的学习一下UI方便的设计，绝对是百利而无一害的。
> 而且UI的设计原则就有简单这一条。
> 本文从字体，排版，动效，适配性等方面介绍了如何设计一个H5移动端页面。

---


> 设计一个移动端H5页面的标准，这篇就看的是实现一个H5页面的方式。
> 当然H5的时候了，静态页面是不可能了，那么作为一个前端，我们应该给页面加上什么特效呢？
> 本文从动画的实现和优化两个2方面，详细地介绍了一个优秀的H5页面的实现思路。
> 介绍了一些可用的工具库。
> 还介绍了如何分享一个H5页面和SEO优化方面的要点。
> 最后比较人性化的一点，无障碍优化。
> 点击《[腾讯网无障碍说明](http://www.qq.com/demo/accessibility.htm)》了解无障碍优化的要点。

---

> 顺便今天看了这篇腾讯网无障碍说明，对针对残障人士的页面优化有了更深的了解，不过个人感觉我们常见的代码规范好多和这个说明也是比较贴合的，而且好多条也是适用于SEO优化的要点。
> 文章中提到的好多点即使我们不是针对的去为残障人士优化仍然有遵守的必要。
> 记得在bootstrap里面就有着sr-only的类是针对特殊设备的，看来我们的互联网开发是很人性化的。
> 我想这才是互联网的意义，人人都可以从互联网上获取信息，互联网应该是开放。


#### 5日

1. [CSS3动画那么强，requestAnimationFrame还有毛线用？](http://www.zhangxinxu.com/wordpress/2013/09/css3-animation-requestanimationframe-tween-%E5%8A%A8%E7%94%BB%E7%AE%97%E6%B3%95/comment-page-1/#comments)
2. [javascript策略模式的应用！](http://www.qdfuns.com/notes/14070/7200127628b41fbb5907c12edab2f492.html)
3. [js拖拽完整版](http://www.qdfuns.com/notes/14070/079855d61dfd52eb1c9b590f22405b95.html)

知识点概要：

> 本文主要是关于js新的关键帧动画请求APIrequestAnimationFrame的一些讲解。
> 在这里先说用setTimeout的局限性 也就是和浏览器的刷新屏幕有关，所以能设置的最短间隔为1000/60ms，因为浏览器是每秒钟刷新60次，如果间隔低于这个，那么就会有帧丢失的情况。而且更耗费性能，而requestAnimationFrame比CSSS动画更加强大的是它还能支持缓动动画而不是CSS3动画那样的贝塞尔曲线动画。
> CSS3的动画也有局限性，比如无法控制滚动条运动等。

---


> 设计模式的使用就是代码优雅之道。而且还能实现代码的复用，扩展，便于组件化的开发，高内聚，低耦合。
> 而策略模式的核心就是定义一系列的方法，将它们封装正在一起，并且使它们可以根据需要来切换。
> 策略模式的使用可以减少我们的逻辑分支处理和降低代码的耦合。
> 如果我们需要加入新的策略，可以很方便的加进去，不至于违背开放封闭原则，去改原先策略的代码。

---

> 文章给的拖拽代码设计的原理很清晰易懂，通过两种拖拽的原理分别实现了鼠标对元素的拖拽，并且给出了简单易懂代码。
> 实现拖拽，需要监听3个事件，鼠标按下，鼠标移动，鼠标停止。
> 设置一个变量，监听拖拽状态，设置一个对象，保存拖拽的坐标变化，最后还要对拖拽范围做出判断，不至于拖拽除边界。


#### 6日

1. [面试题第三季更新喽~超值干货越看越猛烈！](http://www.qdfuns.com/notes/40869/b58298776679526035fb25cd3fc1e289.html)
2. [JavaScript学习笔记整理（4）：对象](http://ghmagical.com/article/page/id/XaoliaYIxPDO)
3. [img 标签下多余空白的解决方法](http://ghmagical.com/article/page/id/9i94YhLn0pki)

知识点概要：

> 一些偏向基础的面试题，不过并不代表基础的东西就没有价值。
> 基础好才能走的更远。这个文章主要是一些目前前端三大技术的基础和jquey的基础。
> 我想基础这东西，是要在应用中慢慢培养的。
> 一定要扎实。

---


> 在一切都是对象的javascript里面，不能很好地了解对象那势必会在应用中造成困难。
> 那么多的API，怎么才能灵活而且优雅的运用呢？
> 创建对象有3种方式，你知道吗？
> 字面量，构造函数，Object.create()？
> 你真的应该看看这篇文章了。

---

> 一个很简单，但是很常见的小问题。应该就是行内块元素与行内元素的基线对齐的问题。
> 不过作者提供了5个解决方案。
> 1. 图片设置为display: block;
> 2. 图片设置为vertical-align: top;
> 3. 父级元素设置font-size: 0;
> 4. 父级元素设置overflow: hidden;
> 5. 去掉图片标签和其父级最后一个标签之间的空格。


#### 7日

1. [你应该知道的CSS小技巧](http://ghmagical.com/article/page/id/fx3SbTvCQnDM)
2. [用CSS3来制作倒影（box-reflect）](http://ghmagical.com/article/page/id/ATnSHK1GV2VC)
3. [low逼码农：Re.从零开始用nodejs搭建一个静态服务器](http://www.im9.com/post.html?community_id=369&post_id=20491#!look_landlord=2)

知识点概要：

> CSS3的强大让你无法想象。
> 而这里作者给出的只是一部分应用，不过依然有价值。很常用的一些效果。
> 滚动条美化，斑马线表格，tootip效果，选择文本的背景和颜色，表单的美化等。

---


> 依然还是CSS3，只是一个属性box-reflect就可以用于给图片或者视频设置各个方向的倒影。
> 并且倒影可以用长度也可以用百分比，还可以设置遮罩效果，甚至视频可以同步播放，如此神奇，那就看上面的文章去了解学习吧。

---

> 看东西看到B站去了，我也是厉害了。
> 这是早点的时候，在B站的兴趣圈搜了一下编程看到的，用node来搭建一个静态服务器。
> 引用了node内置的4个模块 url, path, http, fs。
> 只能识别简单的html格式的文档，不过重要的是思想。
> 再就是好玩儿哈哈，我跟着实现了一遍。


#### 8日

1. [《高性能网站建设指南》笔记](http://www.qdfuns.com/notes/42225/ba180246ba836816eba515f541427322.html)
2. [JavaScript 基础阶段测试题，试试你能得多少分？）](http://www.qdfuns.com/notes/40869/ce9dbeda506e5806f3824ccb4bbdd7f0.html)
3. [JavaScript 的 this 指向问题深度解析](http://mp.weixin.qq.com/s/39MPz6u8G9bPFBXCrg3XYw)

知识点概要：

> 依然是前端性能优化的要点，看到了就再看了一遍，加深一下记忆。

---


> 妙味课堂的这些测试题出的不错，不仅基础，还需要细心才能答对。
> 比如第一题的int从1开始，估计很多人就要上当了。
> 不过我看了下，感觉基本都是会做的。
> 编程的题我个人感觉是考研知识广度的题，要能用更优雅的方式实现。
> 就像一行代码的数组去重一样。

---

> 依然this指向的问题。不解释了。



#### 9日

1. [前端基础进阶（四）：详细图解作用域链与闭包](http://mp.weixin.qq.com/s/taddUMUOcPgAriW6xZWFcA)
2. [js中的事件委托](http://www.cnblogs.com/leejersey/p/3801452.html)
3. [HTML页面跳转期间传递消息](https://ntnyq.github.io/cross-html-deliver-msg/)

知识点概要：

> 闭包不做过多解释。
> 再看只是为了加深记忆。
> 而且前端大全这个公众号推送了。我基本都在看。

---


> 事件委托，利用事件冒泡的原理，把事件绑定在父级身上，再利用事件发生的target来判断。决定事件发生的目标。可以不用多次去为了元素绑定事件。
> 而且可以为动态添加的元素也绑定上事件。

---

> 这篇是为了解决一个我这两天在做的一个小项目的问题查询后学到的，不过链接找不到了，就自己写个demo放着吧。
> [DEMO](https://ntnyq.github.io/demo/test1.html)点击查看.

#### 10日

1. [Web App 开发的最佳实践](http://lyric.im/best-practice-for-web-app-development/)
2. [使用Vue.js从零构建GitHub项目浏览器](https://segmentfault.com/a/1190000005651367)
3. [JavaScript的API背诵篇](http://www.qdfuns.com/notes/17398/b95c07ed545cb18cef438a480456c94f.html)

知识点概要：

> 移动端WEB APP开发的一些要点。感觉总结的很好。
> 既然是做移动端的WEB APP，就不能完全照着原生APP的模子去写。记得哪里看的，移动端的WEB APP适合数据的展现等功能。
> 还有一点就是： 不要写大型的WEB APP!

---


> 学习这种事儿，切莫好高骛远，更忌眼高手低。有的东西想起来很简单，实现的过程就会冒出各种问题。
> 最近做的知乎日报的项目就暴露了好多平时没关注的问题。而且有的问题现在我还在寻求解决的方式。
> 所以再由从VUE基础点的单页应用的实现开始。

---

> 今天过了一遍API，感觉主要是对象那块儿有的东西没接触到，接下来找时间加深一下印象。
> 再就是数组原型的方法map, reduce, reduceRight, filter, every, some这几个。还要搞清楚回调中传值的顺序。

#### 11日

1. [Vue.js——60分钟快速入门](http://www.cnblogs.com/keepfool/p/5619070.html)
2. [js碰撞机制检测](http://www.qdfuns.com/notes/40893/74cae5343c882f496652d8e9c9592368.html)
3. [跨浏览器对象获取](http://www.qdfuns.com/notes/18019/74c01e44838998ac33b272521c31d412.html)

知识点概要：

> vue入门介绍的一篇博文。从基础再次复习，争取把我的小项目也搞个SPA出来。

---


> 碰撞检测，做动画啊，小游戏啊会很有用的。其实就是检测边界的重合。
> 但是要用简短点的代码来实现。而且要暴露的变量少一点。

---

> 过了一遍，先前倒是不知道IE浏览器的是没有charCode属性的，而是keyCode。
>
> - 最近实现忙了点，心情也不好，学习这些记录的也比较水。希望找到工作后能心平气和地写下去。

#### 12日

最近基本都是在看API，把vue的基本过了一遍，vue-router的也过了一遍。
因为最近在做个有关vue的小项目。
所以也比较忙，不过每天也有看微信的推文。
就是没什么时间来记录。

#### 26日

好多天没再更新说明了，最近在看Bootstrap的less源码，打算写篇博文记录一下学习的过程。

听说boostrap的less源码的架构很高，我的博客fork的主体就是用less写成的，原作者还说借鉴了bootstrap。