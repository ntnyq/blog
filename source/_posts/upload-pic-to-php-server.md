---
title: FormData对象上传图片到php服务器
description: H5+jQuery+php的图片上传服务器。
date: 2017-04-18 17:04:37
tags: [文件上传, 前端]
category: 分享
---

前两天项目里要用到图片上传服务器的功能，我倒是以前看过这方面的资料，然后就写了一下只前端的代码，然后后台的哥们儿来问我应该怎么接收图片参数，嗯，我也懵了。<!-- more -->

## 反思

所以说，没有调查就没有发言权，没有实践怎么能随便把代码给别人。

然后只能去网上搜了两篇上传图片的教程发给他，然后自己看了一下，ajax方法的参数自己的都少写了几个。

哎，我的锅啊。

所以周末休息，就自己找找方法测试一下。

还有，以后不能这样啊！！！

## 代码

直接上代码就是了, 用的jquery写的，注释足以解释了。

```
// html

<input id="file" type="file" accept="images/*" multiple="true" />
<button id="upload" type="button">上传</button>
<div id="preview"></div>
```

```
// js

$(function () {

  var $file = $('#file'),
      $upload = $('#upload'),
      $preview = $('#preview'); // 预览

  var fd = new FormData(); // 创建formdata对象
  // 监听表单控件change事件
  $file.change(function(e) {
    var img = $(this).get(0).files[0];
    var str = '';
      if (img.type.match('image.*')) { // 检测选择文件类型
        var url = window.URL.createObjectURL(img), // blob对象创建图片路径
            name = img.name,
            size = img.size;
            str = `<div><img src="${url}" alt="预览图片">
                <p class="title" title="${name}">${name}</p>
                <p class="size">(${size} KB)</p></div>`;
        fd.append('file', img); // 将图片加至FormData对象
      }
    $preview.html(str); // 添加预览
  });
  // 点击上传图片
  $upload.click(function(e) {
    $.ajax({
      url: 'recieve.php',
      type: 'POST',
      processData: false,
      contentType: false,
      data: fd
    })
    .done(function(res) {
      console.log(res);
    })
    .fail(function(err) {
      console.log(err);
    });
  });
});
```

```
// receive.php

<?php
$file = $_FILES['file']; // 获取传输数据
$name = $file['name']; // 获取文件名
$type = strtolower(substr($name,strrpos($name,'.')+1)); // 文件类型
$allow_type = array('jpg','jpeg','gif','png');
if(!in_array($type, $allow_type)){ // 类型判断
  return ;
}
if(!is_uploaded_file($file['tmp_name'])){ // 是否post上传
  return ;
}
$upload_path = "upload/"; // 指定存放路径
if(move_uploaded_file($file['tmp_name'],$upload_path.$file['name'])){
  echo "成功上传图片" . $name . "! \n";
  echo "它保存在/" . $upload_path . $name;
}else{
  echo "Oops, 上传失败!";
}
?>
```

## 目录结构

```
|-- js
|--|-- jquery.min.js
|--|-- main.js
|-- upload
|  |-- a.jpg
|  |-- b.png
|-- index.html
|-- receive.php
```


