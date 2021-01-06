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

@end
