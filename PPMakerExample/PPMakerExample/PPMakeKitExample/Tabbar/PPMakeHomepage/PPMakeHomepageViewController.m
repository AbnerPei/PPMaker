//
//  PPMakeHomepageViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/1.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeHomepageViewController.h"
#import <objc/runtime.h>

@interface PPMakeHomepageViewController ()


@end


@implementation PPMakeHomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backBT.hidden = YES;
    self.titleStr = @"首页";
    
    UIFont *firstCreatedFont = kFontSemibold(14);
    NSLog(@"\n系统启动就创建一个font对象 \n%@",firstCreatedFont);
    
}
-(void)configureDatas
{
    self.titles = @[
                    @"讲解源码",
                    @"系统API学习",
                    @"UIFont的缓存池探究（详见.m文件）",
                    @"tableCell折叠",
                    @"UIView不常用方法探究",
                    @"学习transform",
                    @"圆角和阴影相关",
                    @"KVO原理探究及自定义KVO",
                    @"封装九宫格快速创建",
                    @"自定义TextField(探究self.delegate = self)"
                    ];
    
    self.vcs = @[
                 @"PPMakeExplainSourceCodeBaseTableViewController",
                 @"PPMakeAPILearnBaseTableViewController",
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
