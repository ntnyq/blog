---
title: HTML跳转期间传递消息。
description: 最近用到的一个小技术，在HTML页面跳转的时候传递消息到另个页面。
date: 2017-11-10 22:04:37
tags: [HTML, javascript]
category: 学习
---

最近在做一个小项目，需要再首页点击后，页面跳转，同时利用点击的这个元素的信息生成一个页面。那么就要把这些信息传递到下一个页面。<!-- more -->

## 构思

起先我的想法是利用H5的本地存储或者cookie来实现，就是把信息暂存到cookie或者本地存储里面，在另一个页面打开后再去读取这个值。如果读取到了就生成这个页面。

### 本地存储实现

**经测试可行**

``` html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <title>页面1</title>
</head>
<body>
  <a href="test2.html" msg="我是本地存储的文本"></a>
  <button id="btn">测试</button>
  <script>
    window.onload = function () {

      var btn = document.querySelector('#btn');

      var a = document.querySelector('a');

      btn.onclick = function () {

        localStorage.setItem('msg', a.getAttribute('msg'));
        alert('done!');
      };
    };
  </script>
</body>
</html>
```

``` html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <title>页面2</title>
</head>
<body>
  <script>
    window.onload = function () {
      alert(localStorage.getItem('msg'));
    };
  </script>
</body>
</html>
```

### cookie测试

待测试中

## 查询结果

### url的search段

url的search段实现，**可行**

``` html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <title>页面1</title>
</head>
<body>
  <a href="test2.html" msg="我是存在查询段的文本"></a>
  <button id="btn">测试</button>
  <script>
    window.onload = function () {

      var btn = document.querySelector('#btn');

      var a = document.querySelector('a');

      btn.onclick = function () {

        window.location.href = 'test2.html?msg=' + a.getAttribute('msg');
      };
    };
  </script>
</body>
</html>
```

``` html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <title>页面2</title>
</head>
<body>
  <script>
    window.onload = function () {
      alert(decodeURIComponent(window.location.search).split('=')[1]);
    };
  </script>
</body>
</html>
```

### 哈希段

将内容存至url的hash段**仍然可行**

``` html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <title>页面1</title>
</head>
<body>
  <a href="test2.html" msg="我是存在哈希段中的文本"></a>
  <button id="btn">测试</button>
  <script>
    window.onload = function () {

      var btn = document.querySelector('#btn');

      var a = document.querySelector('a');

      btn.onclick = function () {

        window.location.href = 'test2.html#msg=' + a.getAttribute('msg');
      };
    };
  </script>
</body>
</html>
```

``` html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <title>页面2</title>
</head>
<body>
  <script>
    window.onload = function () {
      alert(decodeURIComponent(window.location.hash).split('=')[1]);
    };
  </script>
</body>
</html>
```

我做了一个小demo来演示一下， 可以点击在线测试效果。

点我\-\-\-\-[在线演示DEMO](https://ntnyq.github.io/demo/test1.html)吧！！！

