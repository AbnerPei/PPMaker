//
//  PPMakerHandyFrameExampleViewController.m
//  PPMakerExample
//
//  Created by PPAbner on 2021/1/4.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPMakerHandyFrameExampleViewController.h"
#import "PPMaker.h"

@interface PPMakerHandyFrameExampleViewController ()

@end

@implementation PPMakerHandyFrameExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self demo1];
    
    [self demo2];
    
    [self demo3];
}


- (void)demo1
{
    UIView *bgV = [[UIView alloc] initWithFrame:CGRectMake(KWIDTH(15), 120, kScreenW - KWIDTH(30), KWIDTH(60))];
    [self.view addSubview:bgV];
    bgV.backgroundColor = UIColor.purpleColor;
    
    UILabel *leftLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.font([UIFont systemFontOfSize:16]);
        make.textColor(UIColor.blackColor);
        make.text(@"200人正在热议200人正在热议200人正在热议200人正在热议");
        make.bgColor(UIColor.grayColor);
    }];
    [bgV addSubview:leftLB];
    
    
    UILabel *rightLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.font([UIFont systemFontOfSize:16]);
        make.textColor(UIColor.blackColor);
        make.text(@"88人已投票，12天后结束");
        make.bgColor(UIColor.cyanColor);
    }];
    [bgV addSubview:rightLB];
    
    
    [rightLB sizeToFit];
    [rightLB ppmake_rightInContainer:KWIDTH(10) shouldResize:NO];
    [rightLB ppmake_centerYEqualView:bgV];
    
    ///等价于
    
//    [rightLB ppmake_rightInContainer:KWIDTH(10) centerYEqualView:bgV];
    
    
    [leftLB sizeToFit];
//    leftLB.left = KWIDTH(15);
//    [leftLB ppmake_left:KWIDTH(20) fromView:rightLB];
    [leftLB ppmake_left:KWIDTH(5) fromView:rightLB leftOfSelf:KWIDTH(15)];
    [leftLB ppmake_centerYEqualView:bgV];
    
}

- (void)demo2
{
    UIView *bgV = [[UIView alloc] initWithFrame:CGRectMake(KWIDTH(15), 200, kScreenW - KWIDTH(30), KWIDTH(60))];
    [self.view addSubview:bgV];
    bgV.backgroundColor = UIColor.purpleColor;
    
    UILabel *leftLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.font([UIFont systemFontOfSize:16]);
        make.textColor(UIColor.blackColor);
        make.text(@"200人正在热议");
        make.bgColor(UIColor.grayColor);
    }];
    [bgV addSubview:leftLB];
    
    UILabel *middleLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.font([UIFont systemFontOfSize:16]);
        make.textColor(UIColor.whiteColor);
        make.text(@"我是中间文字，我可以展示不全，但左右必须展示全");
        make.bgColor(UIColor.redColor);
    }];
    [bgV addSubview:middleLB];
    
    
    UILabel *rightLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.font([UIFont systemFontOfSize:16]);
        make.textColor(UIColor.blackColor);
        make.text(@"88人已投票，12天后结束");
        make.bgColor(UIColor.cyanColor);
    }];
    [bgV addSubview:rightLB];
    
    
    [rightLB sizeToFit];
    [rightLB ppmake_rightInContainer:KWIDTH(10) shouldResize:NO];
    [rightLB ppmake_centerYEqualView:bgV];
    
    
    [leftLB sizeToFit];
    [leftLB ppmake_leftInContainer:KWIDTH(15) shouldResize:NO];
    [leftLB ppmake_centerYEqualView:bgV];
    
    [middleLB sizeToFit];
    [middleLB ppmake_right:KWIDTH(10) fromView:leftLB left:KWIDTH(10) fromView:rightLB];
    [middleLB ppmake_centerYEqualView:bgV];
}

- (void)demo3
{
    UIView *bgV = [[UIView alloc] initWithFrame:CGRectMake(KWIDTH(15), 280, kScreenW - KWIDTH(30), KWIDTH(60))];
    [self.view addSubview:bgV];
    bgV.backgroundColor = UIColor.purpleColor;
    
    UILabel *leftLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.font([UIFont systemFontOfSize:16]);
        make.textColor(UIColor.blackColor);
        make.text(@"200人正在热议200人正在热议200人正在");
        make.bgColor(UIColor.grayColor);
    }];
    [bgV addSubview:leftLB];
    
    
    UILabel *rightLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.font([UIFont systemFontOfSize:16]);
        make.textColor(UIColor.blackColor);
        make.text(@"88人已投票，12天后结束");
        make.bgColor(UIColor.cyanColor);
    }];
    [bgV addSubview:rightLB];
    
    
    [leftLB sizeToFit];
    leftLB.left = KWIDTH(15);
    [leftLB ppmake_centerYEqualView:bgV];
    
    [rightLB sizeToFit];
    [rightLB ppmake_right:KWIDTH(10) fromView:leftLB rightInContainer:KWIDTH(5)];
    [rightLB ppmake_centerYEqualView:bgV];
    
    ///等价于
    
//    [rightLB ppmake_rightInContainer:KWIDTH(10) centerYEqualView:bgV];
    
}

@end
