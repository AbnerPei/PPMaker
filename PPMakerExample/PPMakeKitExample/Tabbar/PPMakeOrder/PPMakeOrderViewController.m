
//
//  PPMakeOrderViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/1.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeOrderViewController.h"
#import "XMNetworking.h"

@interface PPMakeOrderViewController ()

@end

@implementation PPMakeOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backBT.hidden = YES;
    self.titleStr = @"我的UI";
    
}

-(void)configureDatas
{
    
    self.titles = @[
                    @"我的UI系列",
                    @"HandyFrame示例"
                    ];
    
    self.vcs = @[
                 @"PPMakerUIKitExamplesBaseTableViewController",
                 @"PPMakerHandyFramBaseTableViewExamples"
                 ];
}

@end
