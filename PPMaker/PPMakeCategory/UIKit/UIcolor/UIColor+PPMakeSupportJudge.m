//
//  UIColor+PPMakeSupportJudge.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/6.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIColor+PPMakeSupportJudge.h"

@implementation UIColor (PPMakeSupportJudge)
/**
 * 获取color的透明度
 */
-(CGFloat)ppmake_alpha
{
    return CGColorGetAlpha(self.CGColor);
}
+(CGFloat)ppmake_alphaWithColor:(UIColor *)color
{
    return [color ppmake_alpha];
}

/**
 * 比较两个颜色是否相同
 */
-(BOOL)ppmake_isEqualToColor:(UIColor *)color
{
    return CGColorEqualToColor(self.CGColor, color.CGColor);
}
+(BOOL)ppmake_isSameColor:(UIColor *)oneColor
               otherColor:(UIColor *)otherColor
{
    return [oneColor ppmake_isEqualToColor:otherColor];
}
@end
