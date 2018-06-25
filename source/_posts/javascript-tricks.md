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

### 复制大量文字版权附加

``` js
$('body').on('copy', function (e) {

  if (typeof window.getSelection == 'undefined') {

    return;
  }

  var body_element = document.body,
      selection = window.getSelection();

  if (('' + selection).length < 30) {

    return;
  }

  var newdiv = document.createElement('div');

  newdiv.style.position = 'absolute';

  newdiv.style.left = '-99999px';

  body_element.appendChild(newdiv);

  newdiv.appendChild(selection.getRangeAt(0).cloneContents());

  if (selection.getRangeAt(0).commonAncestorContainer.nodeName == 'PRE') {

    newdiv.innerHTML = '<pre>' + newdiv.innerHTML + '</pre>';
  };

  newdiv.innerHTML += '<br />著作权归作者所有。<br />商业转载请联系作者获得授权,非商业转载请注明出处。<br />原文: <a href="' + location.href + '">' + location.href + '</a> © ntnyq.com';

  selection.selectAllChildren(newdiv);

  window.setTimeout(function () {

    body_element.removeChild(newdiv);
  }, 200);
});
```

## 创建可下载文件

``` js
function createFileDownload (filename, content) {
  
  var aLink = document.createElement('a'),
      blob = new Blob([content], { type: 'url' }),
      event = new Event('click');
  
  aLink.download = filename;
  aLink.href = URL.createObjectURL(blob);
  aLink.click();
  
  URL.revokeObjectURL(blob); // 回收内存
}
```

### 创建从0开始自然数的数组

``` js
[...Array(n).keys()]
```



