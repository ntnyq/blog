---
title: 实用的JavaScript开发技巧
description: 一些实用的JavaScript项目开发中可用的小技巧。
tags: [JavaScript, 技巧]
category: 学习
---

## 判断是否为移动端

```
// 利用是否拥有移动端事件来判断 得到一个布尔值
'ontouchend' in document
```

## 判断对象是否为空

```
// 如果可以进行for-in循环 那么对象就不为空
const isEmptyObject = (obj) => {
    for(let attr in obj) {
        return false;
    }
    return true;
}
```

## 禁止复制网页内容

```
<script type="text/javascript">
    // oncontextmenu 事件在元素中用户右击鼠标时触发并打开上下文菜单
    document.oncontextmenu=new Function("event.returnValue=false");
    // onselectstart几乎可以用于所有对象，其触发时间为目标对象被开始选中时（即选中动作刚开始，尚未实质性被选中）
    document.onselectstart=new Function("event.returnValue=false");
</script>
```

## 过滤HTML标签

```
str.replace(/<\w+>(.+?)<\/\w+>/g, function(match,$0){return $0});
```
