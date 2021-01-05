//
//  PPMakeBaseViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/1.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeBaseViewController.h"
#import "PPMakerDefines.h"
#import <PPMaker/PPMaker.h>

@interface PPMakeBaseViewController ()
/** 用UIView对象创建的导航栏,如果觉得不合适，可以隐藏掉，设置自己需要的 */
@property(nonatomic,strong) UIView *p_navigationView;
/** 导航栏下面的线（宽：屏宽，高：1） */
@property(nonatomic,strong) UIView *p_navigationLine;
/** 返回按钮 */
@property(nonatomic,strong) UIButton *p_backBT;
/** 标题LB */
@property(nonatomic,strong) UILabel *p_titleLB;
/** 标题LB的文字 (注意区别系统体统的title，所以用titleStr)*/
@property(nonatomic,copy) NSString *p_titleStr;
@end

@implementation PPMakeBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = colorWhite();
    
    CGFloat backBT_W = kWidth(50);
    CGFloat backBT_H = 44;
    
    self.p_navigationView = [PPMAKEV pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.bgColor(colorWhite());
        make.frame(CGRectMake(0, 0, kScreenW, kNavBarH));
    }];
    
    self.p_backBT = [PPMAKEBT pp_make:^(PPMake *make) {
        make.intoView(self.p_navigationView);
        make.frame(CGRectMake(0, kStatusBarH, kWidth(50), backBT_H));
        make.normalImageName(@"ppmaker_back");
        make.addTargetTouchUpInside(self, @selector(backAction));
    }];
    
    self.p_titleLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.intoView(self.p_navigationView);
        make.frame(CGRectMake(self.p_backBT.right, self.p_backBT.top, kScreenW-backBT_W*2, backBT_H));
        make.font(fontPingFangSCSemibold(18));
        make.textColor(colorBlack());
        make.textAlignment(NSTextAlignmentCenter);
        if (self.p_titleStr && self.p_titleStr.length > 0) {
            make.text(self.p_titleStr);
        }
    }];
    
    self.p_navigationLine = [PPMAKEV pp_make:^(PPMake *make) {
        make.intoView(self.p_navigationView);
        make.frame(CGRectMake(0, self.p_navigationView.height-1, self.p_navigationView.width, 1));
        make.bgColor(colorHex(0xf2f2f2));
    }];
}
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark --- titleStr
-(NSString *)titleStr
{
    return self.p_titleLB.text;
}

-(void)setTitleStr:(NSString *)titleStr
{
    if (titleStr && titleStr.length > 0) {
        self.p_titleStr = titleStr;
        if (self.p_titleLB) {
            self.p_titleLB.text = titleStr;
        }
    }
}

#pragma mark --- 获取只读属性的对象
-(UIView *)navigationView
{
    return self.p_navigationView;
}
-(UIView *)navigationLine
{
    return self.p_navigationLine;
}
-(UIButton *)backBT
{
    return self.p_backBT;
}
-(UILabel *)titleLB
{
    return self.p_titleLB;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
