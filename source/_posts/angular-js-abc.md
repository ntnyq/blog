---
title: 初试AngularJS框架
description: 工作需要简单研究一下AngularJS的API。
tags: [angular, JS框架]
category: 学习
---

因为工作的原因，暂时研究的版本是ng1。有机会的话打算认真研究一下2和4版本的。<!-- more -->


## 指令

```
- ng-app 可以在任何节点上使用将其定义为ng应用

- ng-model 双向数据绑定 数据展现也是{{}}形式

- ng-controller 明确创建一个$scope对象

- ng-click 绑定鼠标单击事件

- ng-init 初始化变量的值

- ng-bind 用于绑定数据到dom

- ng-bind-html 输出html 但是要先对数据使用$sec模块的trustAsHtml()方法

- ng-repeat 循环数组或者json

- ng-show/ng-hide 控制DOM显示隐藏

- ng-submit 提交表单

- ng-disabled 元素不可用


```

## 模块

**angular.module**函数集合
应用被启动时候，这些函数就会执行

```
// 定义一个名为myApp的模块
var app = angular.module('myApp', []);
```

这个模块可以通过ng-app属性挂载到页面上

## Scopes

$scope用户把dom元素和controller连接起来

在mvc架构里$scope就是model, 提供一个绑定到dom的执行上下文

它其实是一个javascript对象view和controller都可以访问到它

我们可以在这个对象身上存储数据和运行在view上的函数

每一个ng应用都会有一个顶级的$rootScope，对应着有ng-app指令元素的那个Dom元素。

如果页面上没有明确设定$scope，ng就会把数据绑定到$rootScope上。

在页面绑定了controller的话，需要用app.controller来注册和修改。

除了一个例外，所有scope都遵循原型继承（prototypal inheritance），这意味着它们都能访问父scope们。

唯一的例外：有些指令属性可以选择性地创建一个独立的scope，让这个scope不继承它的父scope们。

```
app.controller('ControllerName', ['$scope', function ($scope) {
    $scope.xx = xxx;
    $scope.xx = function () {
        // do something
    }
}])
```


## 数据绑定

采用ng-model指令可以把是数据绑定到文本框上
也可以使用模板展现语法或者ng-bind来展现数据

对按钮或者超链接，可以使用另一个指令来绑定
ng-click

## ajax

使用$http函数来进行数据请求 然后将获取的数据挂到$scope上面
需要显示地引用$http模块 如下

```
app.controller('ControllerName', function ($scope, $http) {
    $http({
        url: '',
        method: ''
    }).success(function (data, status, headers, config) {
        // do something
        $scope.xx = data.xxx
    }).error(function (data, status, headers, config) {

    })
})

// 或者
app.controller('ControllerName', ['$scope', '$http', function($scope, $http) {

}])
```

## 指令属性

指定在应用被创建的时候由ng-app的开始被收集 指令属性拥有自己的优先级

1. ng-model的实现是在这个值上绑定了$watch函数

>  模板展现语法会对里面的表达式使用$watch函数进行监听

2. ng-init 应用启动前时运行的函数 可以在程序运行前设置初始变量的值

```
<b ng-init="name='ntnyq'">Hello, {{ name }}</b>
```

3. ng-click 给按钮或者link绑定点击事件 当事件发生 则执行绑定在$scope的函数或者表达式

4. ng-show/ng-hide 根据表达式计算后的布尔值来决定所属的DOM的现实或者隐藏

5. ng-repeat 遍历数据集合中的每个数据元素,再使用模板渲染出来
每个使用模板渲染的DOM元素都有自己的scope

## 表达式

- 表达式会在scope这个上下文里被执行 所以可以使用$scope中的变量
- 表达式执行出错 错误不会被抛出
- 表达式里不允许进行流程控制
- 表达式可以接收一个或者多个串联起来的过滤器

## 自定义指令

目的 更加模块化 方便管理 使用自己创建的指令 减少复杂性

指令命名使用小驼峰形式 使用指令时候用横线小写形式。


```
app.directive('ntNyq', function() {
    return {
        restrict: 'A',
        replace: true,
        scope: {
            myUrl: '@',  // 绑定策略
            myLinkText: '@'
        },
        template: '<a href="{{myUrl}}">' + '{{myLinkText}}</a>'
    };
})

// 使用
<div nt-nyq my-url="https://google.com" my-url-text="click me"></div>
```

其中restrict取值有 E，A，C，M。决定指定的使用方式，分别为元素，属性，类，注释。默认为EA，可以一次使用多个。

绑定策略也可以为等号=someAttr 然后在使用指令时候找some-attr属性


## Services

Services都是单例的 每一个应用中，service对象只会被实例化一次($injector)

主要负责提供一个接口把特定函数需要的方法放在一起

比如$http，$window，$route，$location

在AngularJS中我们可以轻松建立自己的services，只需要通过注册service即可，一旦注册，编译器就可以找到并加载他们供程序执行时候随时用

```
// 用angular.module API的factory模式创建services

angular.module('myApp.services', [])
    .factory('githubServices', function () {
        var serviceInstance = {};
        return serviceInstance;
    })

// 另外还可以使用內建的$provide service来创建service
使用service创建服务 还可以注入已经可用的服务
```

创建一个service就是简单的返回一个函数，这个函数返回一个对象。这个对象是在创建应用实例的时候创建的

```
// 创建与使用service
app.factory('githubService', ['$http', function ($http) {

  var doRequest = function (username, path) {
    return $http({
      method: 'jsonp',
      url: 'https://api.github.com/users/' + username + '/' + path + '?callback=JSON_CALLBACK'
    });
  };
  return {
    events: function (username) {
      return doRequest(username, 'events');
    }
  };
}]);

app.controller('ServiceController', ['$scope', 'githubService', function ($scope, githubService) {
  $scope.$watch('username', function (newUsername) {
    githubService.events(newUsername).success(function (data, status, headers) {
      $scope.events = data.data;
    });
  });
}]);


// html

<div ng-controller="ServiceController">
<label for="username">Type in a Github username</label>
<input type="text" ng-model="username" placeholder="Enter a Github username" />
<table>
  <tbody>
    <tr ng-repeat="(type, value) in events">
      <td>{{ type }}</td>
      <td>{{ value }}</td>
    </tr>
  </tbody>
</table>
</div>
```

> 注意我们要遵守Angular services依赖注入的规范：自定义的service要写在内建的Angular services之后，自定义的service之间是没有先后顺序的

**不要在controller中有任何的操控DOM的行为，如果这么做会污染你的controller并留下潜在的隐患**


$document內建服务，代表window.document元素的(所有html页面里javascript的根对象)引用

```
// 这样使用  相当于document
$document[0]
```

通过注入$rootScope，可以来监听全局的属性

在事件中可以这样来调用局部的方法
```
$rootScope.$apply(xxx.xx())
```


## Routing

在单页面应用中，Routing功能用来控制视图之间的跳转，决定呈现什么内容给用户。

虽然我们可以在主页面中通过引用不同的模板来实现，但是这样会让代码臃肿凌乱，不方便管理。

通过ng-include指令 可以把很多的模板整合在视图中

不过我们可以通过将视图，打散成小模块，变成layout和template来实现根据特定的URL显示不同的内容

AngularJS通过在$routeProvider($route服务的提供者)上面声明routes来实现上述功能。

### 实现方案

1. 布局

通过ng-view指令将告诉$routePovider在哪里渲染模板

2. 配置需要的路由信息

$routeProvider提供了两种方法来处理路由

- when

  方法when接收2个参数
  1. 设置$location.path() 也可以直接用'//'
  2. 参数的配置对象
    - controller
      如果在配置对象中设置了controller属性，那这个controller会在route加载的时候实例化，这个属性可以是一个字符串(必须在module中注册过的controller)也可以是controller function
    - Template模板
    ```
        template: '<div><h2></h2></div>'
    ```
        如果我们在配置对象的template属性设置了值，那么模板就会被渲染到DOM中的ng-view处
    - templateUrl
        模板的地址 如果我们在配置对象的templateUrl属性中设置了值，AngularJS将通过XHR来获取该模板并把模板内容渲染到DOM中的ng-view处

  > 值得注意的是：templateUrl属性跟其他AngularJS XHR请求的处理流程是一样的，也就是说，即使用户从这个页面离开，等他再回到这个页面，应用不会再去请求这个模板页面，因为$templateCache已经缓存了这个模板

  添加一些路由

  $routeProvider还可以处理URL里的传递的参数(比如，/people/42, 假设42是我们要找的people的id号) 只需要简单在字符串前加上 ‘:’,$routeProvider会尝试匹配URL中id并把id作为key在$routeParams服务中使用

- otherwise

```
// 路由定义实例
angular.module('myApp', [])
    .config(['$routeProvider', function ($routeProvider) {
        $routeProvider.when('/', {
            controller: 'ControllerName',
            template: '<h2>Lorem ipsum dolor sit.</h2>'
        })
        .otherwise({
            redirectTo: '/'
            })
    }])
```

## 过滤器

filter提供了一种格式化数据的方法，Angular也提供给我们了很多内建的过滤器，并且建立自定义过滤器也是相当的简单

在HTML的模板绑定中，我们可以使用竖线 来调用过滤器，比如，我们想让字符串全部大写字符显示

```
{{ name | uppercase }}
```

也可以用$filter內建服务来调用过滤器

```
$scope.name = $filter('lowercase')('Arial')
```


给filter传递参数

在filter后面加冒号 再加上参数

比如

```
// 限制数字位数 显示小数的话 加上位数就可以
{{ 213123.2132 | number: 2 }}
```

常用过滤器

```
currency 数字转货币

123 =>  $123.00

可以设置参数 来决定货币符号
```

```
date
默认
date: 'mediumDate'  Oct 28, 2017
常用
date: 'medium'  Oct 28, 2016 8:15:25 AM
date: 'shortTime'   05:32 AM
date: 'shortDate' 11/23/16
date: 'short' 10/29/17 8:25 AM
```

```
// filter过滤器主要用来过滤一个数组数据并返回一个包含子数组数据的新数组
filter

参数

true： 执行严格的匹配比较（跟’angular.equals(expected,actual)一样）
false： 执行大小写敏感的substring匹配
Function 执行一个函数并且接受一个元素 前提是返回真

$scope.isCapitalized =
  function(str) { return str[0] == str[0].toUpperCase(); }
```

```
json

接收JSON或者JS对象 转化成字符串
```

```
limitTo 限定字符或者数组的长度 参数为整数
```

```
lowercase 小写
uppercase 大写
Number 数字 若非数字 会返回空字符串

{{ 1234567890 | number }}  1,234,567,890
```

```
orderBy
通过给定的表达式对数组进行排序

接受2个参数

第一个决定排序方式是
```

创建自定义的过滤器

```
angular.module('name', [])
    .filter('filterName', function () {
    return function (input) {
        if(input) {
        return input[0].toUpperCase() + input.slice(1)
        }
    }
})
```



## 参考资料

[七步从Angular.JS菜鸟到专家](http://blog.jobbole.com/46779/)系列文章





