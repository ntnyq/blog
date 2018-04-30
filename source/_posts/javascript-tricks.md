---
title: 实用的JavaScript开发技巧
description: 一些实用的JavaScript项目开发中可用的小技巧。
date: 2017-07-15 22:04:37
tags: [JavaScript, 技巧]
category: 学习
---

乐在其中，是最好的学习方式。
<!-- more -->

## 判断是否为移动端

``` js
// 利用是否拥有移动端事件来判断 得到一个布尔值
'ontouchend' in document
```

## 判断对象是否为空

``` js
// 如果可以进行for-in循环 那么对象就不为空
const isEmptyObject = (obj) => {
    for(let attr in obj) {
        return false;
    }
    return true;
}
```

## 禁止复制网页内容

``` html
<script type="text/javascript">
    // oncontextmenu 事件在元素中用户右击鼠标时触发并打开上下文菜单
    document.oncontextmenu=new Function("event.returnValue=false");
    // onselectstart几乎可以用于所有对象，其触发时间为目标对象被开始选中时（即选中动作刚开始，尚未实质性被选中）
    document.onselectstart=new Function("event.returnValue=false");
</script>
```

## 过滤HTML标签

``` js
str.replace(/<\w+>(.+?)<\/\w+>/g, function(match,$0){return $0});
```


## 切换页面更改标题

```js
(function (d) {

  let pageTitle = '';

  d.addEventListener('visibilitychange', () => {

    if (d.visibilityState === 'hidden') {

      pageTitle = d.title;
      d.title = 'O(∩_∩)O哈哈~';
    } else {
      d.title = pageTitle;
    }
  }, !1);
})(document);
```

