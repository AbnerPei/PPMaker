//
//  PPMakeHomepageViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/1.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeHomepageViewController.h"
#import <objc/runtime.h>
#import "PPMakerDefines.h"

@interface PPMakeHomepageViewController ()

@end


@implementation PPMakeHomepageViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");

    // Do any additional setup after loading the view.
    self.backBT.hidden = YES;
    self.titleStr = @"首页";
    self.view.backgroundColor = colorRGB(220, 20, 60);
    
//    UIFont *firstCreatedFont = [UIFont fontWithName:@"PingFangSC-Semibold" size:14];
//    NSLog(@"\n系统启动就创建一个font对象 \n%@",firstCreatedFont);
//
//    UIImage *img = [UIImage imageNamed:@"1024"];
//    NSLog(@"home-img %@",img);
       
    [self block_demo2];
}

- (void)block_demo1
{
    int age = 18;
    void(^Block1)(void) = ^ {
        NSLog(@"block1 age = %d",age);
    };
    age = 28;
    Block1();
    
    //block1 age = 18
}

- (void)block_demo2
{
    //auto是系统默认的，可以不写。但是此处为了更突出、更明了还是写上
    auto int age = 18;
    static int height = 180;
    void(^Block2)(void) = ^ {
        NSLog(@"block2 %d %d",age,height);
    };
    age = 28;
    height = 170;
    Block2();
    //block2 18 170
    
}


- (void)strTest
{
    NSString *str1 = @"str1";
    NSString *str2 = [NSString stringWithFormat:@"str1"];
    NSString *str3 = str1;
    NSString *str4 = str1.copy;
    
    NSLog(@"\n str1 %p\n str2 %p\n str3 %p\n str4 %p\n",str1,str2,str3,str4);
    NSLog(@"st1 == str2   --- %d\n",str1 == str2);
    NSLog(@"st1 == str3   --- %d\n",str1 == str3);
    NSLog(@"st1 isEqualToString str2   --- %d\n",[str1 isEqualToString:str2]);
    NSLog(@"st1 isEqualToString str3   --- %d\n",[str1 isEqualToString:str3]);

    
}

- (void)str_isNumberTest
{
    NSString *str1 = @"1234 ";
    NSString *str2 = @"5";
    NSString *str3 = @"a123";
    NSLog(@"isNumber \n %d \n %d \n %d \n",isNumber(str1),isNumber(str2),isNumber(str3));
}

-(void)log
{
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList(NSClassFromString(@"PHAsset"), &count);
    //ivars不是数组而是内存地址
    
    NSLog(@"count:%d",count);
    
    for (int i = 0; i < count; i++) {
        //获取成员变量
        Ivar ivar = ivars[i];
        
        const char *name = ivar_getName(ivar);
        
        NSString *sname = [NSString stringWithUTF8String:name];
        
        NSLog(@"sname:%@",sname);
    }
    free(ivars);
    
}

-(void)configureDatas
{
    
    self.titles = @[
                    @"所有Category验证",
                    @"DoIt",
                    @"programmingTest",
                    @"讲解源码系列",
                    @"实践出真知系列",
                    @"系统API学习",
                    @"多线程学习",
                    @"UIFont的缓存池探究（详见.m文件）",
                    @"tableCell折叠",
                    @"UIView不常用方法探究",
                    @"学习transform",
                    @"圆角和阴影相关",
                    @"KVO原理探究及自定义KVO",
                    @"封装九宫格快速创建",
                    @"算法",
                    @"自定义TextField(探究self.delegate = self)"
                    ];
    
    self.vcs = @[
                 @"PPMakeCategoryBaseTableViewController",
                 @"PPMakeDoItBaseTableViewController",
                 @"PPMake_InterView_ViewController",
                 @"PPMakeExplainSourceCodeBaseTableViewController",
                 @"PPMakePracticeMakesPerfectBaseTableViewController",
                 @"PPMakeAPILearnBaseTableViewController",
                 @"PPMakeMultithreadingBaseTableViewController",
                 @"UIFontCacheViewController",
                 @"PPMakeTreeBaseTableViewController",
                 @"UnusualMethodsOfUIViewViewController",
                 @"LearnTransformViewController",
                 @"PPMakeCornerAndShadowViewController",
                 @"PPMakeKVOBaseTableViewController",
                 @"PPMakeGridViewViewController",
                 @"PPMakeAlgorithmBaseViewController",
                 @"PPMakeCustomTextFieldBaseTableViewController"
                 ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
