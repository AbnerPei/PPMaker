//
//  PPMakeLockBaseTableViewController.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/9/5.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPMakeLockBaseTableViewController.h"

@interface PPMakeLockBaseTableViewController ()

@end

@implementation PPMakeLockBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)configureDatas
{
    self.titles = @[
                    @"@synchronized",
                    @"NSLock",
                    @"NSRecursiveLock",
                    ];
    self.vcs = @[
                 @"PPMakeSynchronizedViewController",
                 @"PPMakeNSLockViewController",
                 @"PPMakeNSRecursiveLockViewController",
                 ];
}

@end
