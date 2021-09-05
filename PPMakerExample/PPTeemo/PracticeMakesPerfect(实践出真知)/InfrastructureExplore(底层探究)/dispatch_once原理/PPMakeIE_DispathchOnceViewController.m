//
//  PPMakeIE_DispathchOnceViewController.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/8/17.
//  Copyright © 2021 PPAbner. All rights reserved.
//
/**
 QUESTIONS:
 ①：单例是如何只执行一次？
 ②：单例的优缺点
 ③：单例示例
 */

#import "PPMakeIE_DispathchOnceViewController.h"

@interface PPMakeIE_DispathchOnceViewController ()

@end

@implementation PPMakeIE_DispathchOnceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        <#code to be executed once#>
    });
}

@end
