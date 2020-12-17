//
//  PPMake_InterView_ViewController.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/18.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeBaseViewController.h"

@interface PPMake_InterView_ViewController : PPMakeBaseViewController

//读源码顺序值得思考一下：
//1. AFN+SD

/*
 
 ### 源码解读
 1. AFNetworking源码
 2. SDWebImage源码
 
 ### 基础知识
 - 属性关键字（strong、copy、assign、weak、readwrite等）
 
 - @property是干啥的？
   > iOS6以后出来的关键词,编译器会自动给你生成setter和getter方法的声明以及实现还有一个以_xxx的成员变量(xxx是你属性定义的变量名字)
 
 - UIViewControllere的生命周期
    > https://www.jianshu.com/p/9d3d95e1ef5a
 - 响应链
 - window的level有几个？
 - 内存管理？
 - 什么是ARC?
 
 ### 延伸
 1. viewDidLoad和viewWillAppear的区别？
    > - 都需要先调用父类对应的方法
    >
    > - viewDidLoad: 在控制器生命周期中，该方法只会被调用一次。
                     该方法被调用意味着控制器有可能（并非一定）在未来会显示。
    >
    > - viewWillAppear: 在控制器生命周期中，该方法可能会被多次调用。
                        该方法被调用意味着控制器将一定会显示。
 
 2. 为什么IBOutlet属性是weak的？
    > https://blog.csdn.net/monkeyyangyang/article/details/51869421
    > IBOutlet添加的控件，并不是添加在vc上，而是vc的view上，view对控件强引用就可以了，vc就没有必要。
 
 3. @synthesize和@dynamic的区别
    > [iOS - @property与@synthesize与@dynamic](https://www.jianshu.com/p/0695ecbe9e06)
    > [IOS学习笔记之关键词@dynamic](https://www.cnblogs.com/taintain1984/p/3887478.html)
 
 4. NSTimer准吗？在使用的时候遇到什么问题？怎么解决的？
    > https://www.jianshu.com/p/481783a1265a
 
 
 
 ### 本质探究
 1. block的本质
 2. weak的本质
 3. category的本质（category为什么不能添加属性？如果能，怎么添加？）
    > 如果是readonly属性，怎么修改值？
 
 
 ### 项目经验
 1. 什么时候会产生循环引用？如果有，怎么解决？
 2. 项目崩溃原因有哪些？
 3. 项目遇到难题怎么解决？
 
 ### 拓展
 1. 跨平台了解吗？
 2. Swift有使用过吗？
 
 
 */

@end
