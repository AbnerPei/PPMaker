//
//  PPMakeRuntimeBaseTableViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/24.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeRuntimeBaseTableViewController.h"

@interface PPMakeRuntimeBaseTableViewController ()

@end

@implementation PPMakeRuntimeBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)configureDatas
{
    self.titles = @[
                    @"runtime实战测试用例（看.m）",
                    @"runtime实战——button的block点击事件以及防成功点击"
                    ];
    self.vcs = @[
                 @"PPMakeRuntimeCommonViewController",
                 @"PPMakeRuntimeButtonTimeIntervalViewController"
                 ];
}

@end
