---
title: 移动端事件汇总学习
description: 移动端基础事件简单学习。
tags: [移动端, 前端]
category: 学习
---

处在这个时代里，身为一个前端工程师是必须要学习移动端开发的。而事件则是开发的基础。<!-- more -->

## 触摸事件touch

### touch事件分类

#### touchstart
手指放在屏幕上触发
#### touchmove
手指在屏幕上移动时候，连续触发
#### touchend
手指离开屏幕触发
#### touchcancel
当系统停止跟踪时候触发 当更高级事件发生会触发 比如来电话 发生时候会暂停游戏 存档等操作

**移动端事件会触发浏览器默认行为，所以调用事件要阻止默认行为**


```
document.addEventListener('touchstart',function(ev){
	ev.preventDefault();
});
var box=document.getElementById("box");
box.addEventListener('touchstart',function(){
	this.innerHTML='手指按下了';
});
box.addEventListener('touchmove',function(){
	this.innerHTML='手指移动了';
});
box.addEventListener('touchend',function(){
	this.innerHTML='手指离开了';
});
```

### touch事件对象

ev.touches 当前屏幕上的手指列表
ev.targetTouches 当前元素上的手指列表
ev.changedTouches 触发当前事件的手指列表

每个touch对象都包含以下几个属性

> clientX  //触摸目标在视口中的X坐标。
  clientY  //触摸目标在视口中的Y坐标。
  Identifier   //标示触摸的唯一ID。
  pageX  //触摸目标在页面中的X坐标。
  pageY  //触摸目标在页面中的Y坐标。
  screenX//触摸目标在屏幕中的X坐标。
  screenY //触摸目标在屏幕中的Y坐标。
  target // 触摸的DOM节点目标。


```
var box=document.getElementById("box");
//相当于mousedown
box.addEventListener('touchstart',function(ev){
	//console.log(ev.touches);
	this.innerHTML=ev.touches.length;//按下手指数
});
```


## 设备加速事件 devicemotion

devicemotion 封装了运动传感器数据的事件 可以获取手机运动的状态

其中加速度的数据包含以下三个方向：
1. 横向贯穿手机屏幕  x
2. 纵向贯穿手机屏幕  y
3. 垂直手机屏幕   z

- 鉴于有些设备没有排除重力的影响，所以该事件会返回2个属性
  1. accelerationIncludingGravity(含重力的加速度)
  2. acceleration(排除重力的加速度)

> 这个事件只能放在window对象上

```
window.addEventListener('devicemotion',function(ev){
	var motion=ev.accelerationIncludingGravity;
    box.innerHTML='x:'+motion.x+'<br/>'+'y:'+motion.y+'<br/>'+'z:'+motion.z;
}); // 显示重力加速度
```

```
window.addEventListener('devicemotion',function(ev){
	var motion=ev.accelerationIncludingGravity;
	var x=parseFloat(getComputedStyle(box).left);//box目前的left值
	box.style.left=x+motion.x+'px';
}); // 方块跟着重力左右移动
```

```
var box=document.getElementById('box');
var lastRange=0;		//上一次摇晃的幅度
var isShake=false;		//决定用户到底有没有大幅度摇晃

window.addEventListener('devicemotion',function(ev){
	var motion=ev.accelerationIncludingGravity;
	var x=Math.abs(motion.x);
	var y=Math.abs(motion.y);
	var z=Math.abs(motion.z);

	var range=x+y+z;			//当前摇晃的幅度
	if(range-lastRange>100){
		//这个条件成立说明用户现在已经在大幅度摇晃
		isShake=true;
	}

	if(isShake && range<50){
		//这个条件成立，说明用户摇晃的幅度很小了就要停了
		box.innerHTML='摇晃了';
		isShake=false;
	}
});  // 摇一摇应用原理
```



## 设备方向事件 deviceorientation

这个事件封装了方向传感器数据的事件，可以获取手机静止状态下的方向数据（手机所处的角度，朝向等）
ev.beta  表示在x轴上旋转的角度 范围为-180-180 描述的是设备由前向后旋转的情况
ev.gamma 表示设备在y轴上的旋转角度 范围是-90-90  藐视的是由左向右旋转的情况
ev.alpha 表示设备沿z轴 的旋转角度  范围是0-360

> 此事件只发生在window对象上


```
window.addEventListener('deviceorientation',function(ev){
	box.innerHTML='x轴倾斜:'+ev.beta.toFixed(1)+'</br>y轴倾斜:'+ev.gamma.toFixed(1)+'</br>z轴倾斜:'+ev.alpha.toFixed(1);
});
```

## 手势事件 gesture

IOS的safari引入了一组手势事件 当两个手指触摸屏幕就会产生手势 手势通常会改变显示项的大小，或者旋转显示项，有三个手势事件

1. gesturestart 当一个手指已经按在屏幕上 另个手指又触摸时候触发
2. gesturechange 当触摸屏幕的任何一个手指发生改变的时候触发
3. gestureend 当任何一个手指从屏幕上移开时候触发

ev.rotation 表示手指引起旋转角度 负值表示逆时针 正表示顺 从0开始
ev.scale 表示两个手指之间的距离情况 向内收缩会缩短距离

**目前只有ios2.0以上支持 安卓不支持**
**一定要阻止浏览器默认行为**

```
var startDeg=0;		//上次旋转后的角度
//两个或者两个以上手指按下
box.addEventListener('gesturestart',function(){
	this.style.background='blue';
	//rotate(90deg)
	if(this.style.transform){
		startDeg=parseFloat(this.style.transform.split('(')[1]);
	}
});
//两个或者两个以上手指变换
box.addEventListener('gesturechange',function(ev){
	/*this.style.background='black';
	this.innerHTML=ev.rotation;*/
	this.style.transform='rotate('+(ev.rotation+startDeg)+'deg)';
});
//两个或者两个以上手指抬起
box.addEventListener('gestureend',function(){
	this.style.background='green';
});  // 多指旋转
```


```
document.addEventListener('touchstart',function(ev){
	ev.preventDefault();
});
document.addEventListener('touchmove',function(ev){
	ev.preventDefault();
});

var box=document.getElementById("box");
var startScale=1;		//上次缩放后的角度
//两个或者两个以上手指按下
box.addEventListener('gesturestart',function(){
	this.style.background='blue';
	//rotate(90deg)
	if(this.style.transform){
		startScale=parseFloat(this.style.transform.split('(')[1]);
	}
});
//两个或者两个以上手指变换
box.addEventListener('gesturechange',function(ev){
	/*this.style.background='black';
	this.innerHTML=ev.rotation;*/
	var sc=ev.scale*startScale;
	sc=sc<0.5?0.5:sc;//设置最小缩放到0.5
	this.style.transform='scale('+sc+')';
});
//两个或者两个以上手指抬起
box.addEventListener('gestureend',function(){
	this.style.background='green';
});  // 多指缩放
```

**本文参考了qdfuns社区的笔记，是对其笔记的再学习，并非完全原创，不过链接没找到**

