//
//  PPMakeCategoryBaseTableViewController.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/8/14.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPMakeCategoryBaseTableViewController.h"

@interface PPMakeCategoryBaseTableViewController ()

@end

@implementation PPMakeCategoryBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)configureDatas
{
    self.titles = @[
                    @"NSDate的Category验证",
                    @"NSArray的Category验证"
                    ];
    self.vcs = @[
                 @"PPNSDateCategoryDemoViewController",
                 @"PPNSArrayCategoryDemoViewController"
                 ];
}

@end
