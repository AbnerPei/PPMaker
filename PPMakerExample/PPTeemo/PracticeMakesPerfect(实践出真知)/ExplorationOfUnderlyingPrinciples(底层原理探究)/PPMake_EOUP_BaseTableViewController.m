//
//  PPMake_EOUP_BaseTableViewController.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/9/20.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPMake_EOUP_BaseTableViewController.h"

@interface PPMake_EOUP_BaseTableViewController ()

@end

@implementation PPMake_EOUP_BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)configureDatas
{
    self.titles = @[
                    @"[self class]和[super class]",
                    @"weak底层原理",
                    @"assign底层原理",
                    ];
    self.vcs = @[
                 @"PPMake_EOUP_selfclass_superclass_ViewController",
                 @"PPMake_EOUP_weak_ViewController",
                 @"PPMake_EOUP_assign_ViewController",
                 ];
}

@end
