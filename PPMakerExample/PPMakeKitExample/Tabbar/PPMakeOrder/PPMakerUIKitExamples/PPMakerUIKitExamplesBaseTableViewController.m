//
//  PPMakerUIKitExamplesBaseTableViewController.m
//  PPMakerExample
//
//  Created by PPAbner on 2020/12/30.
//  Copyright © 2020 PPAbner. All rights reserved.
//

#import "PPMakerUIKitExamplesBaseTableViewController.h"

@interface PPMakerUIKitExamplesBaseTableViewController ()

@end

@implementation PPMakerUIKitExamplesBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleStr = @"我的UI";
}

-(void)configureDatas
{
    
    self.titles = @[
                    @"横向CollectionView",
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
                 @"PPMakerUIHorizontalCollectionViewExampleViewController",
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

@end
