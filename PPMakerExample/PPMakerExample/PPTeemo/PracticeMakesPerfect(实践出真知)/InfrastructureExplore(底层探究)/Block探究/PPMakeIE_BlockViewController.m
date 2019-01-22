//
//  PPMakeIE_BlockViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/28.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeIE_BlockViewController.h"
#import "NSMutableArray+PPMakeSupport.h"

int c = 10;
static int d = 20;

@interface PPMakeIE_BlockViewController ()

@end

@implementation PPMakeIE_BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma mark --- Block的变量捕获机制
    
   //局部变量 （auto）
    int num = 1;
    void(^block)(void) = ^{
        //Variable is not assignable (missing __block type specifier)
        //num += 1;
        NSLog(@"block %d",num);
    };
    num = 3;
    block();
    
    //2018-09-17 14:10:26.128607+0800 PPMakerExample[42875:1500642] block 1
    
    //静态变量 （static）
    static int number = 1;
    void(^blockS)(void) = ^{
        NSLog(@"blockS %d",number);
    };
    number = 3;
    blockS();

    //2018-09-17 14:16:03.746125+0800 PPMakerExample[42955:1510761] blockS 3
    
    ///总结：
    /*
     1. auto自动变量，离开作用域就销毁，通常局部变量前面自动添加auto关键字。(通过Clang转换为C++可以看出)
     2. 为什么auto情况下结果不是更改后的3，而static情况下是？
        > 因为自动变量可能会销毁，block在执行的时候有可能自动变量已经被销毁了，那么此时如果再去访问被销毁的地址肯定会发生坏内存访问，因此对于自动变量一定是值传递而不可能是指针传递了。而静态变量不会被销毁，所以完全可以传递地址。而因为传递的是值得地址，所以在block调用之前修改地址中保存的值，block中的地址是不会变得。所以值会随之改变。
     */
    
    // 全局变量
    void(^blockG)(void) = ^{
        NSLog(@"hello, c = %d, d = %d", c,d);
    };
    c = 1;
    d = 2;
    blockG();

    //2018-09-17 14:40:28.572023+0800 PPMakerExample[43195:1542639] hello, c = 1, d = 2
    
    ///总结
    /*
     1. 局部变量因为跨函数访问所以需要捕获，全局变量在哪里都可以访问 ，所以不用捕获。
     2. 局部变量（auto -- 值传递）      被捕获
              （static -- 指针传递）   被捕获
        全局变量  直接访问              不被捕获
     */
    
    NSLog(@"%@\n", [block class]);
    NSLog(@"%@\n", [[block class] superclass]);
    NSLog(@"%@\n", [[[block class] superclass] superclass]);
    NSLog(@"%@\n", [[[[block class] superclass] superclass] superclass]);
    
    //2018-09-17 14:47:22.236679+0800 PPMakerExample[43332:1554626] __NSMallocBlock__
    //2018-09-17 14:47:22.236781+0800 PPMakerExample[43332:1554626] __NSMallocBlock
    //2018-09-17 14:47:22.236925+0800 PPMakerExample[43332:1554626] NSBlock
    //2018-09-17 14:47:22.237502+0800 PPMakerExample[43332:1554626] NSObject
    
    ///总结：
    /*
       从上述打印内容可以看出block最终都是继承自NSBlock类型，而NSBlock继承于NSObjcet。那么block其中的isa指针其实是来自NSObject中的。这也更加印证了block的本质其实就是OC对象。
     */
    
    
    // 1. 内部没有调用外部变量的block
    void (^block1)(void) = ^{
        NSLog(@"Hello");
    };
    // 2. 内部调用外部变量的block
    int a = 10;
    void (^block2)(void) = ^{
        NSLog(@"Hello - %d",a);
    };
    // 3. 直接调用的block的class
    NSLog(@"%@ %@ %@", [block1 class], [block2 class], [^{
        NSLog(@"%d",a);
    } class]);
    
    //2018-09-17 14:49:50.486439+0800 PPMakerExample[43387:1559049] __NSGlobalBlock__ __NSMallocBlock__ __NSStackBlock__
    
    ///总结：
    /*
       1. runtime运行时过程中也许对类型进行了转变(上述代码转化为c++代码查看源码时却发现block的类型与打印出来的类型不一样，c++源码中三个block的isa指针全部都指向_NSConcreteStackBlock类型地址)
       2. 在平时开发过程中MRC环境下经常需要使用copy来保存block，将栈上的block拷贝到堆中，即使栈上的block被销毁，堆上的block也不会被销毁，需要我们自己调用release操作来销毁。而在ARC环境下系统会自动调用copy操作，使block不会被销毁。
       3. 当block被赋值给__strong指针时，ARC会自动进行一次copy操作
       4. MRC用copy，ARC下copy和strong都可以。
     */
    
    //一旦block捕获的变量是对象类型就会会自动生成copy和dispose来对内部引用的对象进行内存管理。

    /*
    1. [iOS底层原理总结 - 探寻block的本质（一）](https://blog.csdn.net/wks_lovewei/article/details/80563106)
    2. [iOS block为什么要用copy](https://blog.csdn.net/shihuboke/article/details/77921287)
     */
    
    /*
    2.为什么在默认情况下无法修改被block捕获的变量？ __block都做了什么？
    默认情况下，block里面的变量，拷贝进去的是变量的值，而不是指向变量的内存的指针。
    使用__block修饰后的变量，拷贝到block里面的就是指向变量的指针，所以我们就可以修改变量的值。
     */
    
    /*
     
     1.block的实质是什么？一共有几种block？都是什么情况下生成的？
     block：本质就是一个object-c对象.
     block:存储位置，可能分为3个地方：代码区，堆区、栈区（ARC情况下会自动拷贝到堆区，因此ARC下只能有两个地方：代码区、堆区）
     代码区：不访问栈区的变量（如局部变量），且不访问堆区的变量（alloc创建的对象），此时block存放在代码区。
     堆区：访问了处于栈区的变量，或者堆区的变量，此时block存放在堆区。–需要注意实际是放在栈区，在ARC情况下会自动拷贝到堆区，如果不是ARC则存放在栈区，所在函数执行完毕就回释放，想再外面调用需要用copy指向它，这样就拷贝到了堆区，strong属性不会拷贝、会造成野指针错区。
     
     */
     
}


@end
