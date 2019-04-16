//
//  PPMakeRuntimeButtonTimeIntervalViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/24.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeRuntimeButtonTimeIntervalViewController.h"
#import "PPMakerFontDefine.h"

@interface PPMakeRuntimeButtonTimeIntervalViewController ()

@end

@implementation PPMakeRuntimeButtonTimeIntervalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   [PPMAKEBT pp_make:^(PPMake *make) {
       make.intoView(self.view);
       make.frame(CGRectMake(40, 120, kScreenW-80, 50));
       make.bgColor(kColorHexA(0xff4d4d, 0.3));
       make.borderWidth(1);
       make.borderColor([UIColor ppmake_tawny]);
       make.normalAttributedFontColorTitle(fontPingFangSCSemibold(14), kColorHex(0xff4d4d), @"我是一个button");
       //button的block点击事件
       make.actionBlock(^{
           NSLog(@"点击了一下button");
       });
       //button的延时操作
       make.clickTimeInterval(5);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
