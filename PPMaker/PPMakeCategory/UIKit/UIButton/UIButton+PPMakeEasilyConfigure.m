//
//  UIButton+PPMakeEasilyConfigure.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/30.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIButton+PPMakeEasilyConfigure.h"

@implementation UIButton (PPMakeEasilyConfigure)

- (void)ppmake_btWithEnabledBgColor:(UIColor *)bgColor title:(NSString *)title
{
    self.userInteractionEnabled = YES;
    [self ppmake_btWithBgColor:bgColor title:title];
}

- (void)ppmake_btWithUnenabledBgColor:(UIColor *)bgColor title:(NSString *)title
{
    self.userInteractionEnabled = NO;
    [self ppmake_btWithBgColor:bgColor title:title];
    
}
- (void)ppmake_btWithBgColor:(UIColor *)bgColor title:(NSString *)title
{
    if (bgColor) {
        self.backgroundColor = bgColor;
    }
    if (title && title.length > 0) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateHighlighted];
    }
}
#pragma mark --- 设置btn Normal和Highlighted下的image 【相同】
- (void)ppmake_btSetImageWithImgName:(NSString *)imgName
{
    if (imgName.length == 0 ) {
        return;
    }
    [self setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:imgName] forState:UIControlStateHighlighted];
}

#pragma mark --- 设置btn Normal和Highlighted下的titleColor 【相同】
- (void)ppmake_btSetTitleColor:(UIColor *)titleColor
{
    if (!titleColor) {
        return;
    }
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateHighlighted];
}

#pragma mark --- 设置btn Normal和Highlighted下的title 【相同】
- (void)ppmake_btSetTitle:(NSString *)title
{
    if (!title || title.length == 0) {
        return;
    }
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateHighlighted];
}
@end
