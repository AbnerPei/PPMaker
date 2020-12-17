//
//  PPMakeHowKVOWorksViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/17.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeHowKVOWorksViewController.h"
#import "PPKVOPerson.h"
#import <objc/objc.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface PPMakeHowKVOWorksViewController ()
{
    NSInteger tapCount;
}
@property(nonatomic,strong) PPKVOPerson *person1;
@property(nonatomic,strong) PPKVOPerson *person2;
@end

@implementation PPMakeHowKVOWorksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.person1 = [[PPKVOPerson alloc]init];
    self.person2 = [[PPKVOPerson alloc]init];
    /*
     数组的好处
     - 很大程度上可以减少定义的变量的数目；
     - 访问变量非常方便（只需要变动下标就可以达到访问不同值的目的）。
     - 数据的查找
     - 数据的移动
     **/
    NSLog(@"添加观察者之前1111");
    NSLog(@"%p\n",[self.person1 methodForSelector:@selector(setAge:)]);
    NSLog(@"%p\n",[self.person2 methodForSelector:@selector(setAge:)]);

    [self.person1 addObserver:self forKeyPath:NSStringFromSelector(@selector(age)) options:(NSKeyValueObservingOptionNew) context:@"age变化KVO测试"];
    
    NSLog(@"添加观察者之后2222");
    NSLog(@"%p\n",[self.person1 methodForSelector:@selector(setAge:)]);
    NSLog(@"%p\n",[self.person2 methodForSelector:@selector(setAge:)]);
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
     NSLog(@"%@对象的%@属性改变了：%@", object, keyPath, change);
}

-(void)dealloc
{
    [self.person1 removeObserver:self forKeyPath:NSStringFromSelector(@selector(age))];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.person1.age = tapCount;
    tapCount++;
}

@end
