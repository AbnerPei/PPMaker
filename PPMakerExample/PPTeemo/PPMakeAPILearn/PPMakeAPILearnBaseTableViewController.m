//
//  PPMakeAPILearnBaseTableViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/26.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeAPILearnBaseTableViewController.h"

@interface PPMakeAPILearnBaseTableViewController ()

@end

@implementation PPMakeAPILearnBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.layer
}

- (void)configureDatas
{
    self.titles = @[
                    @"NSURLSession",
                    @"UITableView",
                    @"震动",
                    @"iOS开发中的锁"
                    ];
    self.vcs = @[
                 @"PPMakeNSURLSessionViewController",
                 @"PPMakeAPILearn_UITableView_BaseTableViewController",
                 @"PPMakeAPILearn_Shake_ViewController",
                 @"PPMakeLockBaseTableViewController"
                 ];
}

@end
