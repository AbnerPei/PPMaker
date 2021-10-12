//
//  PPMakeNSRecursiveLockViewController.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/9/5.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPMakeNSRecursiveLockViewController.h"

@interface PPMakeNSRecursiveLockViewController ()

@end

@implementation PPMakeNSRecursiveLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)test
{
    NSRecursiveLock *lock = [[NSRecursiveLock alloc] init];
}

@end
