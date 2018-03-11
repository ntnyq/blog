---
title: 图片上传预览
description: 工作中踩坑之-----图片上传预览。
date: 2017-04-18 12:04:37
tags: [踩坑, 前端, upload]
category: 工作
---

公司正在进行的项目，今天开始在踩图片上传预览的坑。这里整理一下搜索到的资料。<!-- more -->

## 万恶之源

早期因为浏览器对H5的支持度不够，而且input的file控件也只能选择单图上传。所以更多的文件上传采用的是flash，比如swfupload.js的实现。

而现在随着XMLHTTPRequest2.0的到来，以及更多新的比如Blob对象，FileReader对象，二进制上传等API的实现，H5的图片上传注定要成为以后的主流。

首先我们当然需要一个图片选择控件啦。
控件作用，创建一个Fileupload对象。

```
<input type="file" />
```

input的Fileupload对象属性请参考(http://www.w3school.com.cn/jsref/dom_obj_fileupload.asp)[w3cschool]

> 注意：该元素的value值保存了用户选择文件的文件名，但是如果提交时候，发送给服务器的内容就又不仅仅是文件名。

## 上传方式

> 注意input对象下面的files属性是一个数组 如果只选择了一个文件，也要用files[0]来取得它。在这个files[0]对象下，有图片的name, size, type等属性。

### 原生上传

要想使用浏览器原生的文件上传功能的话，注意给父级的form元素加上enctype="multipart/form-data"，决定编码方式。默认的表单编码方式是application/x-www-form-urlencoded。

### Blob对象

> 兼容性IE10+

Blob对象可以看做是存放二进制数据的容器，此外还可以通过Blob设置二进制数据的MIME类型。

#### 文件下载

window.URL对象可以为Blob对象生成一个网络地址，结合a标签的download属性，可以实现点击url下载文件。

```
createDownload("download.txt","download file");

function createDownload(fileName, content){
    var blob = new Blob([content]);
    var link = document.createElement("a");
    link.innerHTML = fileName;
    link.download = fileName;
    link.href = URL.createObjectURL(blob);
    document.getElementsByTagName("body")[0].appendChild(link);
}
```

#### 显示图片

img的src属性及background的url属性，都可以通过接收图片的网络地址或base64来显示图片，同样的，我们也可以把图片转化为Blob对象，生成URL（URL.createObjectURL(blob)），来显示图片。
```
// 兼容创建图片的url
_self.getObjectURL = function(file) {
    var url = null;
    if (window.createObjectURL != undefined) {
        url = window.createObjectURL(file);
    } else if (window.URL != undefined) {
        url = window.URL.createObjectURL(file);
    } else if (window.webkitURL != undefined) {
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
}
```

### FormData上传

> 兼容性IE10+部分

```
var formData = new FormData();
formData.append(filename, files[n]);
// 再用ajax发送formData内容
```


### FileReader 对象

> 兼容性IE11+部分兼容


```
// 读取到的是base64编码结果
var fr = new FileReader();
fr.readAsDataUrl(files[n])
fr.onload = function (e) {
    if(e.total/1024/1023 >= 2) {
        alert('文件大于2M')
        return;
    }
    var img = new Image();
    img.src = this.result;
}
```

## 优化

### 控件外观

原生的控件外观实在是太丑啦。那么如何改变呢？

我最近用的方式是把控件设置成透明的，在下面放个模拟按钮的元素。这样点击的时候其实是点击了浮在上面的文件控件。

缺点：要使用定位 下边按钮的比如hover效果等不能触发

在看了张鑫旭的博文后，发现了这种更好的优化方式：

用label元素与file控件关联，优点：

- 点击自定义的漂亮按钮就是点击我们file控件
- 没有尺寸控制不精确的问题
- 没有不能响应hover态active态的问题
- 漂亮按钮可以与form表单元素解耦。

### 文件类型

可以指定弹出选择窗口时允许选择的文件类型。比如
```
// 所以图片类型
accept="image/*
// 或用逗号隔开
accept="image/png, image/jpeg, image/gif, image/jpg"
```

## 我不玩啦

如何清空选择呢 调用form对象的reset()方法即可。


## 参考资料

[张鑫旭：关于input表单的那些事儿](http://www.zhangxinxu.com/wordpress/2015/11/html-input-type-file/)

兼容性资料来自于[Can I Use?](http://caniuse.com/#search=FormData)


