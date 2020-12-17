//
//  PPMakeRuntimeCommonViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/24.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeRuntimeCommonViewController.h"
#import <objc/runtime.h>

@interface PPMakeRuntimeCommonViewController ()

@end

@implementation PPMakeRuntimeCommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //objc_msgSend
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- SEL 探究  start
-(void)SEL_test:(NSString *)name{
    NSLog(@"111---name");
}
//// 打开下面的方法，会报错，可见：在OC中，同一个方法名在同一个类or子类里面，只能表示一个方法，跟参数无关。
//-(void)SEL_test:(NSInteger)age{
//    NSLog(@"222---age");
//}

//// 在C语言中，方法是根据参数名来区分的
//详见：[ios开发SEL和IMP](https://www.jianshu.com/p/cadffcec0250)



@end
