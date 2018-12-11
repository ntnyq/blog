---
title: 输入框自动填充样式问题解决。
tags: [CSS]
date: 2018-11-16 12:32:03
description: 输入框自动填充样式问题解决。
category: 前端
---

如何 Hack Chrome 浏览器对表单自动填充时候的淡黄色背景。

<!-- more --->

在 Web 开发中，我们经常会遇到一个问题，浏览器会在记住密码时自动填充登录表单，同时输入框会增加淡黄色的背景。如下图所示：

![自动填充](https://ws1.sinaimg.cn/large/d0cab7ccly1fxtj6479g2j20zk0uoq4o.jpg)

在对样式要求不严苛的情况下，这样淡黄色的背景色是可以忍受的。

但是在对样式有严格定制的情况下，或者产品，设计要求下，或者这个淡黄色与系统主题颜色及其不搭配时候，自定义这个样式就非常有必要了。

## 样式覆盖

首先，我们想到的解决方案，应该是 **样式覆盖**。通过浏览器的 **Inspect** 功能，可以从 `Element -> Styles` 面板查看到，在输入框被自动填充时，它会增加如下样式：

``` scss
input:-webkit-autofill, textarea:-webkit-autofill, select:-webkit-autofill {
    background-color: rgb(250, 255, 189) !important;
    background-image: none !important;
    color: rgb(0, 0, 0) !important;
}
```

在CSS增加样式覆盖后，虽然后引入权值更高，但是并**不能**覆盖浏览器默认的样式。

## 表单类型修改

> 设置 **input** 的 `autocomplete` 属性值为 `new-password` 可以避免表单被自动填充。

``` html
<input type="text" autocomplete="new-password" />
```

### Hack修改

> 一些奇思妙想，但是有奇效的方法。

### 纯色背景输入框

> 使用阴影遮盖淡黄色背景

``` scss
input:-webkit-autofill {
  -webkit-box-shadow: 0 0 0px 1000px white inset;
  -webkit-text-fill-color: #333;
}
```

### 透明背景输入框

> 此hack方法让我惊为天人，过渡5000秒

``` scss
:-webkit-autofill {
  -webkit-text-fill-color: #fff !important;
  transition: background-color 5000s ease-in-out 0s;
}
```

## 参考资料

[Chrome 自动填充的表单是淡黄色的背景，有方法自定义吗](https://segmentfault.com/q/1010000000671971)