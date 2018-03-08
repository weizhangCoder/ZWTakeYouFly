# LYEmptyView
空内容界面占位视图，支持TableView、CollectionView，高强度自定义，基于runtime调用灵活，
完全与项目解耦，编写一行代码就可集成一个简单的空内容视图

| 特点  | 描述 |
| ---------- | -----------|
| 基于runtime  | 利用分类给TableView/CollectionView动态添加属性和方法，使代码耦合度降低，调用更方便   |
| 高度自定义   | 利用继承特性，可对框架进行二次封装，使得自定义更简便  |
| 耦合度几乎为0 | 在界面中加入一行代码即可集成，与原代码没有一点冲突 self.tableView.ly_emptyView = [MyDIYEmpty diyNoDataEmpty]; |
| 支持全部的刷新方法 | reloadData、insert...、delete...等一共9种方法 |

# 目录
* [ 一-效果展示 ](https://github.com/yangli-dev/LYEmptyView#一-效果展示)<br>
* [ 二-集成方式 ](https://github.com/yangli-dev/LYEmptyView#二-集成方式)<br>
* [ 三-使用参考示例 ](https://github.com/yangli-dev/LYEmptyView#三-使用参考示例)<br>
    * [1-一行代码集成空内容视图](https://github.com/yangli-dev/LYEmptyView#1-一行代码集成空内容视图)<br>
    * [2-自由选择空内容元素](https://github.com/yangli-dev/LYEmptyView#2-自由选择空内容元素)<br>
    * [3-自定义空内容元素](https://github.com/yangli-dev/LYEmptyView#3-自定义空内容元素)<br>
    * [4-自定义元素的UI样式](https://github.com/yangli-dev/LYEmptyView#4-自定义元素的UI样式)<br>
    * [5-二次封装](https://github.com/yangli-dev/LYEmptyView#5-二次封装)<br>
    * [6-延迟显示emptyView](https://github.com/yangli-dev/LYEmptyView#6-延迟显示emptyView)<br>
    * [7-特殊需求，手动控制emptyView的显示隐藏](https://github.com/yangli-dev/LYEmptyView#7-特殊需求，手动控制emptyView的显示隐藏)<br>

## 一-效果展示

![](https://github.com/yangli-dev/LYEmptyView/blob/master/images/ImitateOtherApp.png)

## 二-集成方式

> 1.支持Cocoapods方式: pod 'LYEmptyView'<br>
2.手动下载导入,将LYEmptyView文件夹，导入你的工程即可

在使用的地方导入头文件：#import "LYEmptyViewHeader.h"


## 三-使用参考示例

### 1-一行代码集成空内容视图

```Objective-C
//框架方法
self.tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"noData"
                                                        titleStr:@"暂无数据，点击重新加载"
                                                       detailStr:@""];
```

PS:可对库进行二次封装，调用更简洁（二次封装方法在下面的示例5中会讲到）
```Objective-C
//二次封装方法，调用简洁
self.tableView.ly_emptyView = [MyDIYEmpty diyNoDataEmpty];
```

完全低耦合，在你的项目中加入这一行代码就可集成<br>
不管项目中是reloadData方法刷UI还是insert、delete等方式刷UI,不需做其他任何操作，只需这一行代码就可实现以下效果

![](https://github.com/yangli-dev/LYEmptyView/blob/master/images/example1.gif)

### 2-自由选择空内容元素
```Objective-C
交互事件可选择SEL或block方式
self.tableView.ly_emptyView = [LYEmptyView emptyActionViewWithImageStr:@"noData"
                                                              titleStr:@"无数据"
                                                             detailStr:@"请稍后再试!"
                                                           btnTitleStr:@"重新加载"
                                                                target:target
                                                                action:action];
self.tableView.ly_emptyView = [LYEmptyView emptyActionViewWithImageStr:@"noData"
                                                              titleStr:@""
                                                             detailStr:@""
                                                           btnTitleStr:@""
                                                         btnClickBlock:^{}];
self.tableView.ly_emptyView = [LYEmptyView emptyActionViewWithImageStr:@""
                                                              titleStr:@"暂无数据，请稍后再试!"
                                                             detailStr:@""
                                                           btnTitleStr:@""
                                                         btnClickBlock:^{}];
//    imageStr    : 占位图片
//    titleStr    : 标题
//    detailStr   : 详细描述
//    btnTitleStr : 按钮标题                                                         
```
框架提供四个元素，传入相应元素的字符串即可显示对应元素（按钮的显示前提是传入target，action或btnClickBlock）
可根据项目需求，自由进行组合，如下只展示了部分组合效果

![](https://github.com/yangli-dev/LYEmptyView/blob/master/images/example2.png)

### 3-自定义空内容元素
特殊情况下，如果空内容状态布局不满足需求时，可进行自定义<br>
通过方法`  + (instancetype)emptyViewWithCustomView:(UIView *)customView;`<br>
传入一个View 即可创建一个自定义的emptyView
```Objective-C
self.tableView.ly_emptyView = [LYEmptyView emptyViewWithCustomView:customView];
```

![](https://github.com/yangli-dev/LYEmptyView/blob/master/images/example3.png)


### 4-自定义元素的UI样式
```Objective-C
  //初始化一个emptyView
  LYEmptyView *emptyView = [LYEmptyView emptyActionViewWithImageStr:@"noData"
                                                           titleStr:@"无数据"
                                                          detailStr:@"请稍后再试!"
                                                        btnTitleStr:@"重新加载"
                                                      btnClickBlock:^{}];
  //元素竖直方向的间距
  emptyView.subViewMargin = 20.f;
  //标题字体
  emptyView.titleLabFont = [UIFont systemFontOfSize:25];
  //标题颜色
  emptyView.titleLabTextColor = MainColor(90, 180, 160);
  //描述字体
  emptyView.detailLabFont = [UIFont systemFontOfSize:17];
  //描述颜色
  emptyView.detailLabTextColor = MainColor(180, 120, 90);
  //描述label最大的行数
  emptyView.detailLabMaxLines = 5;
  //按钮背景色
  emptyView.actionBtnBackGroundColor = MainColor(90, 180, 160);
  //按钮文字颜色
  emptyView.actionBtnTitleColor = [UIColor whiteColor];

  //设置空内容占位图
  self.tableView.ly_emptyView = emptyView;
```
>这里只列举了一些常用的属性，更多属性请到LYEmptyView.h查看

![](https://github.com/yangli-dev/LYEmptyView/blob/master/images/example4.png)

### 5-二次封装
第4小节的示例代码，修改emptyView的样式需要一个个属性单独去改，如果项目中每个界面都这么写就显得很麻烦，而且不易维护<br>
解决办法是对库进行二次封装，二次封装后，对UI样式单独管理，方便维护<br>

##### 1)新建一个类继承自LYEmptyView，例如demo中的MyDIYEmpty
##### 2)重写`- (void)prepare` 方法，并修改想要改变的元素的UI样式
```Objective-C
- (void)prepare{
    [super prepare];
    
    self.titleLabFont = [UIFont systemFontOfSize:25];
    self.titleLabTextColor = MainColor(90, 180, 160);
    
    self.detailLabFont = [UIFont systemFontOfSize:17];
    self.detailLabTextColor = MainColor(180, 120, 90);
    self.detailLabMaxLines = 5;
    
    self.actionBtnBackGroundColor = MainColor(90, 180, 160);
    self.actionBtnTitleColor = [UIColor whiteColor];
}
```
操作上面的两步就可实现对样式的单独管理<br>
调用方法不变，只是调用的类变成了MYDiyEmpty
```Objective-C
self.tableView.ly_emptyView = [MYDiyEmpty emptyActionViewWithImageStr:@"noData"
                                                             titleStr:@"无数据"
                                                            detailStr:@"请稍后再试!"
                                                          btnTitleStr:@"重新加载"
                                                        btnClickBlock:^{}];
```
##### 3)进一步封装显示的元素内容，比如无数据状态图、无网络状态图<br>
在MYDiyEmpty.h定义方法`+ (instancetype)diyNoDataEmpty;`<br>
在MYDiyEmpty.m实现方法
```Objective-C
+ (instancetype)diyNoDataEmpty{
    return [MyDIYEmpty emptyViewWithImageStr:@"nodata"
                                    titleStr:@"暂无数据"
                                   detailStr:@"请检查您的网络连接是否正确!"];
}
```
>经过3步封装，自定义了UI样式，使管理更方便，使调用更简洁<br>
self.tableView.ly_emptyView = [MyDIYEmpty diyNoDataEmpty];


### 6-延迟显示emptyView
如示例1图，框架自动根据DataSource计算是否显示emptyView，在空页面发起网络请求时，DataSource肯定为空，会自动显示emptyView，有的产品需求可能不希望这样，希望发起请求时暂时隐藏emptyView。
本框架提供了两个方法可实现此需求，两个方法都是scrollView的分类，调用非常方便
```Objective-C
 /**
   一般用于开始请求网络时调用，ly_startLoading调用时会暂时隐藏emptyView
   当调用ly_endLoading方法时，ly_endLoading方法内部会根据当前的tableView/collectionView的
   DataSource来自动判断是否显示emptyView
 */
- (void)ly_startLoading;

 /**
   在想要刷新emptyView状态时调用
   注意:ly_endLoading 的调用时机，有刷新UI的地方一定要等到刷新UI的方法之后调用，
   因为只有刷新了UI，view的DataSource才会更新，故调用此方法才能正确判断是否有内容。
 */
- (void)ly_endLoading;
```

*注意点:使用这两个方法，请先将emptyView的autoShowEmptyView属性置为NO，关闭自动显隐

以下是调用示例（具体细节可参看demo中的demo2）
```Objective-C
//关闭自动显隐
self.tableView.ly_emptyView.autoShowEmptyView = NO;
//网络请求时调用
[self.tableView ly_startLoading];
//刷新UI时调用
[self.tableView ly_endLoading];
```

![](https://github.com/yangli-dev/LYEmptyView/blob/master/images/example6.gif)

### 7-特殊需求，手动控制emptyView的显示隐藏
在某些特殊界面下，有的tableView/collectionView有固定的一些死数据，其它的数据根据网络加载，这时根据以上的示例方法可能达不到这需求。<br>
本框架提供另外的两个方法来解决这个问题。

```Objective-C
/**
 手动调用显示emptyView
 */
- (void)ly_showEmptyView;

/**
 手动调用隐藏emptyView
 */
- (void)ly_hideEmptyView;
```

*注意点:使用这两个方法，请先将emptyView的autoShowEmptyView属性置为NO，关闭自动显隐

以下是调用示例（具体细节可参看demo中的demo4）
```Objective-C
//关闭自动显隐
self.tableView.ly_emptyView.autoShowEmptyView = NO;
//显示emptyView
[self.tableView ly_showEmptyView];
//隐藏emptyView
[self.tableView ly_hideEmptyView];
```

![](https://github.com/yangli-dev/LYEmptyView/blob/master/images/example7.gif)





