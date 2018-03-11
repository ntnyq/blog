---
title: 初试velocity动画引擎
description: velocity动画引擎，兼容性不错，而且是Js动画库，了解学习一下。
date: 2017-08-28 21:04:37
tags: [动画, animate]
category: 学习
---

Velocity是一款能够构建出令人难以置信的快速的动画的js动画引擎。它可以依赖jQuery或者独立使用。而且支持颜色动画，变形类动画，循环，缓动，SVG动画和滚动。它是jQuery和CSS过渡的完美结合。
<!-- more -->

## Velocity简介

> Velocity是一款有着与jQuery类似的API的动画引擎，例如$.animate()。它可以依赖jQuery或者独立使用。它构建的动画令人难以置信的快。而且支持颜色动画，变形类动画，循环，缓动，SVG动画和滚动。它是jQuery和CSS过渡的完美结合。

Velocity可以向后兼容至IE8和安卓2.3。

[Github仓库](https://github.com/julianshapiro/velocity)

## 常用API

### 简单动画示例

```
// with jQuery
(function ($) { // 解决$变量冲突
    $('.box').velocity({ // 注意小写的v
      width: '300px',
      height: '300px'
    }, {
      duration: 3000 // 一帧动画时间
    });
})(jQuery);

// without jQuery
Velocity(document.querySelector('.box'), {
    width: '300px',
    height: '300px'
}, {
    duration: 3000
});
```

### 组合动画实现示例

组合动画实现方案：

1. 给每个动画设置好恰当的delay属性，来维护多个动画间的先后顺序
  - 缺点：手动维护，太过麻烦
2. 在先完成的动画的complete回调里定义第二个动画
  - 缺点：多层嵌套，回调地狱
3. 定义动画队列来实现

#### 回调函数法

```
// with jQuery
(function ($) {
  $(function () {
    $('.box').velocity({
      width: '300px',
      height: '300px'
    }, {
      duration: 2000,
      complete: function () {
        $('.box').velocity({
          translateY: '300px'
        }, {
          duration: 1000
        });
      }
    });
  });
})(jQuery);

// without jQuery
Velocity(document.querySelector('.box'), {
  width: '300px',
  height: '300px'
}, {
  duration: 1500,
  complete: function () {
    Velocity(document.querySelector('.box'), {
      translateY: '300px'
    }, {
      duration: 1500
    });
  }
});
```

#### 动画队列法

JQuery写法中通过数组定义了一个动画队列。每一帧动画都是一个对象，由elements，properties，options3个属性组成。其中properties和options又分别是对象，properties是动画的变化属性，options是配置。

定义完毕后用`$.Velocity.RunSequence(seqName)`方法来依次执行。

```
// with jQuery

(function ($) {
    var animateSeq = [{
      elements: $('.box'),
      properties: {
        width: '300px',
        height: '300px'
      },
      options: {
        duration: 1000
      }
    }, {
      elements: $('.box'),
      properties: {
        translateY: '300px'
      },
      options: {
        duration: 1000
      }
    }, {
      elements: $('.box'),
      properties: {
        translateX: '300px'
      },
      options: {
        duration: 1000
      }
    }];

    $.Velocity.RunSequence(animateSeq);
})(jQuery);

// without jQuery

```

#### 预定义动画

Velocity內建了一系列的常用的动画效果，可以直接进行使用，方便开发。

关于其具体內建动画的效果，可以查看[Velocity官网](http://velocityjs.org/#uiPack)

使用內建动画，需要引入velocity.ui包

```
$('.box').velocity('callout.shake');

```

#### 自定义动画

自定义动画可以帮助我们扩充velocity没有但是我们需要的动画形式，方便我们多次使用。而且名字完全自定义，方便记忆。

定义的时候先指定默认的动画时间，再指定每一帧动画的形式和所占时间的百分比。

最后像內建的动画形式一样调用即可。

```
(function ($) {

$.Velocity.RegisterUI('ntnyq.jump', {
  defaultDuration: 2100,
  calls: [
    [{
      translateX: '200px',
      translateY: '300px'
    }, 0.2],
    [{
      scaleX: 1.2,
      scaleY: 0.9
    }, 0.3],
    [{
      scaleY: 1.3,
      scaleX: 1
    }, 0.3],
    [{
      scaleY: 1,
      scaleX: 1
    }, 0.3]
  ]
});

$('.box').on('mouseover', function(e) {
  $(this).velocity('ntnyq.jump');
});

})(jQuery);
```

