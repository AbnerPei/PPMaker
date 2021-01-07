//
//  UIColor+PPMakeSupport.m
//  PPMakerExample
//
//  Created by PPAbner on 2020/12/17.
//  Copyright © 2020 PPAbner. All rights reserved.
//

#import "UIColor+PPMakeSupport.h"

@implementation UIColor (PPMakeSupport)

+ (UIColor *)ppmake_colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a
{
    return PPMakeUIColorRgbA(r, g, b, a);
}

+ (UIColor *)ppmake_colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b
{
    return PPMakeUIColorRgb(r, g, b);
}

+ (UIColor *)ppmake_colorWithR:(CGFloat)r a:(CGFloat)a
{
    return PPMakeUIColorRa(r, a);
}

+ (UIColor *)ppmake_colorWithR:(CGFloat)r
{
    return PPMakeUIColorR(r);
}

+ (UIColor *)ppmake_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha
{
    return PPMakeUIColorHexA(hex, alpha);
}

+ (UIColor *)ppmake_randomColor
{
    NSInteger r = arc4random() % 255;
    NSInteger g = arc4random() % 255;
    NSInteger b = arc4random() % 255;
    return PPMakeUIColorRgb(r, g, b);
}

+ (UIColor *)ppmake_000000
{
    return PPMakeUIColorHex(0x000000);
}

+ (UIColor *)ppmake_111111
{
    return PPMakeUIColorHex(0x111111);
}

+ (UIColor *)ppmake_222222
{
    return PPMakeUIColorHex(0x222222);
}

+ (UIColor *)ppmake_333333
{
    return PPMakeUIColorHex(0x333333);
}

+ (UIColor *)ppmake_444444
{
    return PPMakeUIColorHex(0x444444);
}

+ (UIColor *)ppmake_555555
{
    return PPMakeUIColorHex(0x555555);
}

+ (UIColor *)ppmake_666666
{
    return PPMakeUIColorHex(0x666666);
}

+ (UIColor *)ppmake_777777
{
    return PPMakeUIColorHex(0x777777);
}

+ (UIColor *)ppmake_888888
{
    return PPMakeUIColorHex(0x888888);
}

+ (UIColor *)ppmake_999999
{
    return PPMakeUIColorHex(0x999999);
}


@end
