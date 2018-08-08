//
//  PPMakeCustomTextFieldBaseTableViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/25.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeCustomTextFieldBaseTableViewController.h"

@interface PPMakeCustomTextFieldBaseTableViewController ()

@end

@implementation PPMakeCustomTextFieldBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)configureDatas
{
    self.titles = @[
                    @"自定义一个Done的TextField"
                    ];
    
    self.vcs = @[
                 @"PPMakeCustomDoneTextFieldViewController"
                 ];
}

@end
