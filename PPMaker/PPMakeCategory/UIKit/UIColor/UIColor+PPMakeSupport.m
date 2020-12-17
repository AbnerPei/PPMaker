//
//  UIColor+PPMakeSupport.m
//  PPMakerExample
//
//  Created by PPAbner on 2020/12/17.
//  Copyright © 2020 PPAbner. All rights reserved.
//

#import "UIColor+PPMakeSupport.h"

@implementation UIColor (PPMakeSupport)

+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a
{
    return UIColorRgbA(r, g, b, a);
}

+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b
{
    return UIColorRgb(r, g, b);
}

+ (UIColor *)colorWithR:(CGFloat)r a:(CGFloat)a
{
    return UIColorRa(r, a);
}

+ (UIColor *)colorWithR:(CGFloat)r
{
    return UIColorR(r);
}

+ (UIColor *)colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha
{
    return UIColorHexA(hex, alpha);
}

+ (UIColor *)RandomColor
{
    return UIColorRandom();
}

@end
