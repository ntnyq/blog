---
title: 常用代码块整理，方便查阅
description: 自己学习中遇到的一些比较常用的代码块，整理一下，放在这里。如果有错误，请指正。
date: 2017-05-29 22:04:37
tags: [代码, 前端]
category: 学习
---

一些在学习中遇到的一些常用的代码块，整理好放在这里，源代码我会上传到github上面去，需要的时候方便查阅。如果有错误或者更好的方案，请指出，大家一起学习。<!-- more -->

## 代码块整理

### 面向对象的javascript

### 位置尺寸相关

#### 偏移量
元素相对于父级已定位元素的偏移量: obj.offsetTop 和 obj.offsetLeft

上一级已定位元素 **obj.offsetParent** (注意，并非parentNode,因为td是相对于table定位的,而不是tbody)

偏移量包含了元素在屏幕上占的所有可用空间 由元素的大小来决定 包括内边距边框和滚动条,**不包括外边距**

获取元素相对于页面的偏移量，将offsetParent循环直根元素，代码实现如下：
```
function getOffsetPos (element) {

  var offsetTop = element.offsetTop,
      offsetLeft = element.offsetLeft;

  var curParent = element.offsetParent;
  // document.body.offsetParent == null;
  while (curParent !== null) {

    offsetTop += curParent.offsetTop;
    offsetLeft += curParent.offsetLeft;
    // 这里注意用offsetParent是因为在表格里面tbody是td之类的parentNode
    curParent = curParent.offsetParent;
  }
  return {
    left: offsetTop,
    top: offsetLeft
  };
}
```

#### 客户区
客户区是指元素的内容和其内边距所占据的大小

和偏移量相同每次访问，都需要重新计算

元素的客户区的大小clientWidth和clientHeight

浏览器的客户区用如下代码获得:
```
function getViewport () {
  if (document.compatMode == 'BackCompat') {
    return {
      width: document.body.clientWidth,
      height: document.body.clientHeight
    };
  } else {
      return {
        width: document.documentElement.clientWidth,
        height: document.documentElement.clientHeight
      };
    }
}
```

#### 滚动尺寸
scrollWidth 没滚动条时候 元素的总宽度 scrollHeight 没滚动条时 元素的总高度

通常认为html元素是web浏览器视口中滚动的元素， 因此document.documentElement.scrollTop就是页面高度

scrollLeft scrollHeight 被隐藏掉的滚动区域外的 像素数目 这两个值是**可写**的  这样来设置滚动位置

对于不包含滚动条的页面 scrollWidth 和clientWidth的关系并不清晰 根据浏览器的不同有差异
```
function getDocSize () {
  return {
    width: Math.max(document.documentElement.scrollWidth, document.documentElement.clientWidth),
    height: Math.max(document.documentElement.scrollHeight, document.documentElement.clientHeight)
  };
}
```
> 对于混杂模式的IE浏览器 使用document.body代替document.documentElement

#### 元素的位置
浏览器提供了一个getBoundingClientRect()方法 包含left top bottom right 四个属性,
但是IE8以前是以页面的(2, 2)为原点计算的, 跨浏览器的获取方法:
```
function getBoundingClientRect (element) {

  var scrollTop = document.documentElement.scrollTop,
      scrollLeft = document.documentElement.scrollLeft;

  if (element.getBoundingClientRect) {
    if (typeof arguments.callee.offset != 'number') {

      var temp = document.createElement('div');

      temp.style.cssText = 'position:absolute; left:0; top:0';
      document.body.appendChild(temp);
      arguments.callee.offset = - temp.getBoundingClientRect().top - scrollTop;
      document.body.removeChild(temp);
      temp = null;
    }

    var rect = element.getBoundingClientRect();
    var offset = arguments.callee.offset;

    return {
      left: rect.left + offset,
      right: rect.right + offset,
      top: rect.top + offset,
      bottom: rect.bottom + offset
    };
  }else {

    var actualLeft = getElementLeft(element);
    var actualTop = getElementTop(element);

    return {
      left: actualLeft - scrollLeft,
      right: actualLeft + element.offsetWidth - scrollLeft,
      top: actualTop - scrollTop,
      bottom: actualTop + element.offsetHeight - scrollTop
    };
  }
}
```

### 运动框架

这是一个简单封装的运动框架，运动目标可以发生宽度高度和透明度的变化。
只需要传入1个dom对象和一个的变化目标的json就可，还能支持回调函数。
上面的getStyle方法可以获取元素的样式。
```
/**
 * [getStyle 兼容获取元素的样式]
 * @param  {[type]} obj  [DOM元素]
 * @param  {[type]} attr [想获得的属性值]
 * @return {[type]}      [返回具体属性值]
 */
function getStyle (obj, attr) {
  // 在IE下，有style属性的元素有个currentStyle属性,这个属性包含了所有计算后的样式
  return obj.currentStyle ? obj.currentStyle[attr] : getComputedStyle(obj, false)[attr];
}

/**
 * [startMove 兼容IE6+的运动框架]
 * @param  {[type]} obj   [发生事件的对象]
 * @param  {[type]} json  [事件具体的变化对象和目标值]
 * @param  {[type]} fnEnd [回调函数]
 * @return {[type]}       [description]
 */
function startMove (obj, json, fnEnd) {
  // 如果在运动清楚元素身上的定时器
  clearInterval(obj.timer);

  obj.timer = setInterval(function () {
    // 假设运动不需要执行
    var stop = true;

    for (var attr in json) {

      var start = 0; //运动的初始状态
      // 透明度变化
      if (attr === 'opacity') {
        start = Math.round(parseFloat(getStyle(obj, attr)) * 100);
      }else {
        start = parseInt(getStyle(obj, attr));
      }
      if (start !== json[attr]) { // 若有属性未到达json设置的目标值 将stop设置为false
        stop = false;
      }

      var speed = (json[attr] - start) / 8;

      speed = speed > 0 ? Math.ceil(speed) : Math.floor(speed); //速度为正值向上取整，速度为负值，向下取整

      if (attr === 'opacity') {
        obj.style.filter = 'alpha(opacity:' + (start + speed) + ')';   // 兼容IE浏览器的滤镜设置透明度
        obj.style.opacity = (start + speed) / 100;  // 非IE浏览器
      }else {
        obj.style[attr] = start + speed + 'px';
      }
    }

    if (stop) {
      clearInterval(obj.timer);
      if (fnEnd) {
        fnEnd();
      }
    }
  }, 30);
}
```

### 事件相关
这是一个工具类，兼容地进行事件相关操作，例如绑定事件，解绑事件，停止冒泡，阻止默认事件等。
```
var EventUtil = {
    // 绑定事件的兼容写法
    addHandler: function(element, type, handler){
        if (element.addEventListener){
            element.addEventListener(type, handler, false);
        } else if (element.attachEvent){
            element.attachEvent("on" + type, handler);
        } else {
            element["on" + type] = handler;
        }
    },

    getButton: function(event){
        if (document.implementation.hasFeature("MouseEvents", "2.0")){
            return event.button;
        } else {
            switch(event.button){ // 各种鼠标事件
                case 0:
                case 1:
                case 3:
                case 5:
                case 7:
                    return 0;
                case 2:
                case 6:
                    return 2;
                case 4: return 1;
            }
        }
    },

    getCharCode: function(event){
        if (typeof event.charCode == "number"){
            return event.charCode;
        } else {
            return event.keyCode;
        }
    },
    // 获取粘贴板数据
    getClipboardText: function(event){
        var clipboardData =  (event.clipboardData || window.clipboardData);
        return clipboardData.getData("text");
    },
    // 获取事件对象的兼容写法
    getEvent: function(event){
        return event ? event : window.event;
    },

    getRelatedTarget: function(event){
        if (event.relatedTarget){
            return event.relatedTarget;
        } else if (event.toElement){
            return event.toElement;
        } else if (event.fromElement){
            return event.fromElement;
        } else {
            return null;
        }

    },
    // 获取事件发生的目标
    getTarget: function(event){
        return event.target || event.srcElement;
    },

    getWheelDelta: function(event){
        if (event.wheelDelta){
            return (client.engine.opera && client.engine.opera < 9.5 ? -event.wheelDelta : event.wheelDelta);
        } else {
            return -event.detail * 40;
        }
    },
    // 阻止默认事件
    preventDefault: function(event){
        if (event.preventDefault){
            event.preventDefault();
        } else {
            event.returnValue = false;
        }
    },
    // 解绑事件
    removeHandler: function(element, type, handler){
        if (element.removeEventListener){
            element.removeEventListener(type, handler, false);
        } else if (element.detachEvent){
            element.detachEvent("on" + type, handler);
        } else {
            element["on" + type] = null;
        }
    },

    setClipboardText: function(event, value){
        if (event.clipboardData){
            event.clipboardData.setData("text/plain", value);
        } else if (window.clipboardData){
            window.clipboardData.setData("text", value);
        }
    },
    // 停止冒泡
    stopPropagation: function(event){
        if (event.stopPropagation){
            event.stopPropagation();
        } else {
            event.cancelBubble = true;
        }
    }

};
```

#### 鼠标事件发生位置

获取事件对象的兼容写法:
```
function getEvent (event) {
  return event ? event : window.event;
}
```

##### 客户区位置
代表的是事件发生时候鼠标指针在视口中的水平坐标和垂直坐标

所有浏览器都支持clientX和clientY属性
##### 页面位置

IE8以及更早版本不支持事件对象上的页面坐标, 不过可以通过客户区坐标和滚动信息来计算出来

需要用到document.body(混杂模式)或者document.documentElement(标准模式)的scrollLeft和scrollTop属性

页面没有发生滚动的时候 事件对象的pageX与pageY 和 clientX与clientY相等

```
function getPagePos(e){
  var pageX = e.pageX,
        pageY = e.pageY;

    if (pageX === undefined) {
      pageX = e.clientX + (document.body.scrollLeft || document.documentElement.scrollLeft);
    }
    if (pageY === undefined) {
      pageY = e.clientY + (document.body.scrollTop || document.documentElement.scrollTop);
    }

    return {
      x: pageX,
      y: pageY
    };
}
```

##### 屏幕位置

屏幕位置可以通过screenX和screenY来获取，表示事件发生的位置相对于屏幕原点(左上点)的坐标值 单位：像素。

### Ajax与jsonp

### 客户端检测

