//
//  PPMakeMVCMVVMBaseTableViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeMVCMVVMBaseTableViewController.h"

@interface PPMakeMVCMVVMBaseTableViewController ()

@end

@implementation PPMakeMVCMVVMBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)configureDatas
{
    
    self.titles = @[
                    @"真正的MVC"
                    ];
    self.vcs = @[
                 @"PPMake_MVC_ViewController"
                 ];
}

@end
