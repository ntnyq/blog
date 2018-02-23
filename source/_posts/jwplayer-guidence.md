---
title: 简单学习jwplayer播放器
description: 工作需要，学习一下jwplayer播放器的使用。
tags: [插件, 播放器]
category: 学习
---

## jwplayer播放器

jwplayer播放器是一款流行的开源播放器。

支持播放`Adobe Flash Player`和`HTML5浏览器可以处理任何格式`，如（FLV文件，H.264标准，MP4功能，VP8的，WEBM，支持MP3，AAC，JPG，PNG和GIF）等。

<!-- more -->

支持各种流数据播放和播放清单等功能。

同时拥有大量的插件和皮肤，提供丰富的配置项和易用的`Javascript API`，方便使用和扩展。

## 开始

### 源码下载

[github仓库](https://github.com/jwplayer/jwplayer)

[jwplayer官网](https://www.jwplayer.com/)

本教程使用的版本是`v7.12.3`

### 主文件引入

需要引入的2个js文件

```
  <script src="./your_path_to_file/jwplayer.js"></script>
  <script src="./your_path_to_file/jwplayer.controls.js"></script>
```

需要设置lisence才可以使用，否则会提示`Error setting up player: Missing license key`，设置方式

```
<script>
    jwplayer.key="bAoNHra71KE/mHvb0sirT4HeWLTAkpiYa1mVsA==";
</script>
```

### 初始化

**jwplayer播放器**可以采用以三种方式来进行初始化

### 利用div标签初始化

```
// html

<div id="myPlayer">播放器载入中...</div> // 内容用于播放器未载入时给用户提示

// js

var myPlayer = jwPlayer('myPlayer');
```

### 利用video标签初始化

```
// html

<video id="myPlayer" height="600" width="400"></video>

// js

var myPlayer = jwPlayer('myPlayer');
```

### 快速初始化

在需要初始化的video标签上添加**jwplayer**类，将初始化用jwplayer播放器来播放视频

```
<video class="jwplayer" src="./your_path_to_file/video.mp4"></video>
```

成功初始化后我们得到了一个`myPlayer`对象，我们可以在控制台打印它，简单查看相关的API。

```
console.log(myPlayer);
```

## 播放文件

### 简单播放

利用file参数指定视频文件的路径

```
myPlayer.setup({
    file: './your_path_to_file/video.mp4'
})
```

别的配置项也是通过上面的方法以**对象**的方式传入。

### 定制播放

配置各种参数来根据需求播放视频文件

我们可以通过`myPlayer.getConfig()`来查看当前配置和默认配置，再根据需求进行修改定制。

常用配置项

配置项 | 含义 | 类型 | 默认值 | 可用值
--- | --- | --- | --- | ---
width | 播放器宽度 | Number | 480 | 数字即可
height | 播放器高度 | Number | 270 | 数字即可
autostart | 是否自动播放 | Boolean | false | true / false
volume | 初始化音量 | Number | 90 | 1-100整数
controls | 是否展现控制播放 | Boolean | true | true / false
mute | 是否初始化静音 | Boolean | false | true / false
playbackRateControls | 是否展现播放速度控制 | Boolean | false | true / false
repeat | 是否开启重复播放 | Boolean | false | true / false
skin | 播放器皮肤设置 | String | 'seven' | 'seven', 'six', 'beelden', <br />'vapor', 'glow'等

### 列表播放

在配置项中添加

```
playlist: [
  { duration: 100, title: '视频1', file: './your_path_to_file/1.mp4', image: './your_path_to_file/1.jpg' },
  { duration: 150, title: '视频2', file: './your_path_to_file/2.mp4', image: './your_path_to_file/2.jpg' },
  { duration: 200, title: '视频3', file: './your_path_to_file/3.mp4', image: './your_path_to_file/3.jpg' }
]
```

#### 参数含义

- duration 当前视频播放时间 不代表最终时间 只做预览用 单位秒 会自动格式化为`mm:ss`格式
- title 当前视频名称 字符串
- file 当前视频路径 字符串
- image 当前视频预览图 替代video标签的poster属性

## 语言设置

播放器本身需要用到语言提示的地方并不多，可通过如下配置进行定制

具体可以通过`myPlayer.getConfig()`来查看

```
localization: {
    playlist: '播放列表',
    nextUp: '下集',
    buffer: '缓冲中...',
    pause: '暂停'
}
```

## API

`jwplayer播放器`提供的API可以通过打印初始化得到的对象查看

```
console.log(myPlayer);
```

常用API

#### 属性

```
myPlayer.version

// 版本与插件信息
7.12.3+commercial_v7-12-3.190.commercial.4b867e.jwplayer.7a74dd.freewheel.a63b67.googima.94433c.vast.80361a.analytics.16a0a9.plugin-gapro.7e936b.plugin-related.7adae3.plugin-sharing.586630.vr-plugin.725b2e.hls.js.

myPlayer.id

// 初始化的dom元素id
myPlayer
```

#### getter类方法

API | 含义 | 结果类型
--- | --- | ---
getConfig | 获取配置参数 | Object
getControls | 是否有播放控制 | Boolean
getDuration | 当前视频总时长 | Number
getFullscreen | 是否全屏 | Boolean
getMute | 是否静音 | Boolean
getPlaybackRate | 获取播放速率 | Number
getPlaylist | 获取播放列表 | Array
getPosition | 获取已播放时长 | Number
getState | 当前播放器状态 | String
getVolume | 获取当前音量 | Number
isBeforeComplete | 是否要完成播放 | Boolean
isBeforePlay | 是否即将播放 | Boolean

> getState获取的播放状态有'buffering', 'playing', 'pause', 'complete', 'idle'

#### setter类方法

API | 含义 | 参数
--- | --- | ---
setup | 设置播放器配置 | Object
pause | 暂停播放 | null
play | 开始播放 | null
stop | 停止播放 | null
next | 播放下一视频 | null
remove | 移除播放器对象 | null
seek | 跳转播放进度 | Number，代表秒
setMute | 设置是否静音 | Boolean
setFullscreen | 设置是否全屏 | Boolean
setPlaybackRate | 设置播放速率 | Number，以1位标准速率
setVolume | 设置播放音量 | Number，取值1-100

#### 事件方法

API | 事件
--- | ---
onBeforeComplete | 视频播放完毕前触发
onBeforePlay | 视频即将播放前触发
onBuffer | 视频缓冲中触发
onBufferChange | 缓冲状态变化触发
onBufferFull | 缓冲完毕触发
onComplete | 播放完毕触发
onDisplayClick | 播放界面点击触发
onError | 播放器出错触发
onFullscreen | 切换全屏触发
onIdle | 停止播放触发
onMute | 静音触发
onPause | 暂停触发
onPlay | 播放触发
onPlaylistComplete | 播放列表播放完成触发

> 事件方法可以通过传入匿名函数的方式来进行对编辑器初始化，在事件触发的时候会执行该匿名函数

## 参考资料

[JWPlayer快速入门指南（中文）](http://blog.csdn.net/gaohuanjie/article/details/24957223)

[官方API文档](https://developer.jwplayer.com/jw-player/docs/developer-guide/)









