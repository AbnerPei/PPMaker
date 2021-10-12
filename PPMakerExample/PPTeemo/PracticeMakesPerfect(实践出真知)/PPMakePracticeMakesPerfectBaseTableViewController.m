//
//  PPMakePracticeMakesPerfectBaseTableViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/22.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakePracticeMakesPerfectBaseTableViewController.h"

@interface PPMakePracticeMakesPerfectBaseTableViewController ()

@end

@implementation PPMakePracticeMakesPerfectBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)configureDatas
{
    self.titles = @[
        @"底层原理探究",
        @"runtime实战大全",
        @"runloop和线程",
        @"深拷贝和浅拷贝",
        @"底层探究",
        @"MVC && MVVM 实战",
        @"获取图片主色调"
    ];
    self.vcs = @[
        @"PPMake_EOUP_BaseTableViewController",
        @"PPMakeRuntimeBaseTableViewController",
        @"PPMakeRunloopBaseTableViewController",
        @"PPMakeDeepCopyAndShallowCopyViewController",
        @"PPMakeInfrastructureExploreBaseTableViewController",
        @"PPMakeMVCMVVMBaseTableViewController",
        @"PPMake_GetImageMainColorViewController"
    ];
}

@end
