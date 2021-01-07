//
//  PPMake_MVC_View.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake_MVC_View.h"
#import "PPMutAttributedStringMaker.h"
#import "PPMakerDefines.h"
#import <PPMaker/PPMaker.h>

@interface PPMake_MVC_View ()
@property(nonatomic,strong) UILabel *orderStatusLB;
@end

@implementation PPMake_MVC_View

+(instancetype)viewWithOrderStatus:(NSString *)orderStatus
                        leftTitles:(NSArray<NSString *> *)leftTitles
                       rightTitles:(NSArray<NSString *> *)rightTitles
{
    PPMake_MVC_View *view = [[PPMake_MVC_View alloc]init];
    view.backgroundColor = colorWhite();
    if (leftTitles.count == rightTitles.count && leftTitles.count > 0) {
        [view createUIWithOrderStatus:orderStatus leftTitles:leftTitles rightTitles:rightTitles];
    }
    return view;
}
-(void)refreshViewWithOrderStatus:(NSString *)orderStatus
                       leftTitles:(NSArray<NSString *> *)leftTitles
                      rightTitles:(NSArray<NSString *> *)rightTitles
{
    for (UIView *aView in self.subviews) {
        [aView removeFromSuperview];
    }
    
    [self createUIWithOrderStatus:orderStatus leftTitles:leftTitles rightTitles:rightTitles];
}
-(void)createUIWithOrderStatus:(NSString *)orderStatus
                    leftTitles:(NSArray<NSString *> *)leftTitles
                   rightTitles:(NSArray<NSString *> *)rightTitles
{
    CGFloat leftMargin = kWidth(16);
    CGFloat topH = kHeight(38);
    
    _createOrderStatusTextLB(leftMargin, topH, self);
    
    self.orderStatusLB = [PPMAKE(PPMakeTypeLB) pp_make:^(PPMake *make) {
        make.intoView(self);
        CGFloat leftX = kWidth(116);
        make.frame(CGRectMake(leftX, 0, kScreenW-leftX-leftMargin, topH));
        make.font(PPMakeUIFontPingFangSCSemibold(14));
        make.textColor(colorHex(0xff4d4d)).textAlignment(NSTextAlignmentRight);
        make.text(orderStatus);
    }];
    
    CALayer *line = [CALayer layer];
    [self.layer addSublayer:line];
    line.frame = CGRectMake(0, topH-1, kScreenW, 1);
    line.backgroundColor = colorHex(0xf2f2f2).CGColor;
    
    CGFloat marginV = kHeight(8);
    CGFloat lbH = kHeight(20);
    CGFloat leftTextW = kWidth(80);
    CGFloat rightLBX = leftMargin+leftTextW;
    CGFloat rightLBW = kScreenW-leftMargin-rightLBX;
    
    for (int i = 0; i < leftTitles.count; i++) {
        NSString *leftTitle = leftTitles[i];
        NSString *rightTitle = rightTitles[i];
        CGFloat lbY = topH+marginV+(marginV+lbH)*i;
        //左边
        [PPMAKE(PPMakeTypeLB) pp_make:^(PPMake *make) {
            make.intoView(self);
            make.text(leftTitle).textColor(color666666());
            make.frame(CGRectMake(leftMargin, lbY, leftTextW, lbH));
            make.font(PPMakeUIFontPingFangSCMedium(14));
        }];
        //右边
        if (i == 1) {
            [PPMAKE(PPMakeTypeLB) pp_make:^(PPMake *make) {
                make.intoView(self);
                make.frame(CGRectMake(rightLBX, lbY, rightLBW, lbH));
                NSString *showMoneyDetailStr = @"费用明细";
                NSString *str = [NSString stringWithFormat:@"%@  %@",rightTitle,showMoneyDetailStr];
                make.attributedText([NSMutableAttributedString ppmake_attributedStringWithMake:^(PPMutAttributedStringMaker *maker) {
                    maker.font(PPMakeUIFontPingFangSCSemibold(16));
                    maker.textColor(colorHex(0xff4d4d));
                    NSRange range = [str rangeOfString:showMoneyDetailStr];
                    maker.textColorRange(colorHex(0x4D88FF), range);
                    maker.fontRange(PPMakeUIFontPingFangSCMedium(12), range);
                } str:str]);
            }];
//            CGFloat btX = [UILabel ppmake_calculateWidthWithFont:fontPingFangSCSemibold(16) height:lbH text:rightTitle]+rightLBX+5;
            CGFloat btX = kWidth(70);
            CGFloat btW = kWidth(60);
            [PPMAKE(PPMakeTypeBT) pp_make:^(PPMake *make) {
                make.intoView(self);
                make.frame(CGRectMake(btX, lbY, btW, lbH));
                make.bgColor([UIColor clearColor]);
                make.actionBlock(^{
                    if (self.showMoneyDetailBlock) {
                        self.showMoneyDetailBlock();
                    }
                });
            }];
        }else{
            [PPMAKE(PPMakeTypeLB) pp_make:^(PPMake *make) {
                make.intoView(self);
                make.frame(CGRectMake(rightLBX, lbY, rightLBW, lbH));
                make.font(PPMakeUIFontPingFangSCSemibold(14));
                make.textColor(colorBlack());
                make.text(rightTitle);
            }];
        }
    }
    
    self.frame = CGRectMake(0, 0, kScreenW, _getHeight(leftTitles.count));
    
}

void _createOrderStatusTextLB(CGFloat textX,CGFloat textH,UIView *view){
    [PPMAKE(PPMakeTypeLB) pp_make:^(PPMake *make) {
        make.intoView(view);
        make.font(PPMakeUIFontPingFangSCSemibold(16));
        make.textColor(colorBlack()).text(@"订单状态");
        make.frame(CGRectMake(textX, 0, kWidth(100), textH));
    }];
}

float _getHeight(NSInteger count){
    return kHeight(38)+kHeight(28)*count+kHeight(8);
}

-(void)updateOrderStatus:(NSString *)orderStatus
{
    if (orderStatus.length == 0) {
        return;
    }
    self.orderStatusLB.text = orderStatus;
}

@end
