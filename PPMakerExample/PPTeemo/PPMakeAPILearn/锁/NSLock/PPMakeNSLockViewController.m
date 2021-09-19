//
//  PPMakeNSLockViewController.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/9/5.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPMakeNSLockViewController.h"

@interface PPMakeNSLockViewController ()

@property (nonatomic, strong) NSMutableArray *testArray;

@end

@implementation PPMakeNSLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSLock *lock = [[NSLock alloc] init];
    [self test1];
}

- (void)test1
{
    for (int i = 0; i < 2000; i++) {
        self.testArray = [NSMutableArray array];
    }
}

@end
