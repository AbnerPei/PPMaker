//
//  PPMakeRunloopBaseTableViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/3.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeRunloopBaseTableViewController.h"

@interface PPMakeRunloopBaseTableViewController ()

@end

@implementation PPMakeRunloopBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)configureDatas
{
    
    self.titles = @[
                    @"不开启runloop的线程",
                    @"开启runloop的线程",
                    @"深拷贝和浅拷贝",
                    @"底层探究"
                    ];
    self.vcs = @[
                 @"PPMake_RunloopUnused_ViewController",
                 @"PPMake_RunloopUsed_ViewController",
                 @"PPMakeDeepCopyAndShallowCopyViewController",
                 @"PPMakeInfrastructureExploreBaseTableViewController"
                 ];
}
@end
