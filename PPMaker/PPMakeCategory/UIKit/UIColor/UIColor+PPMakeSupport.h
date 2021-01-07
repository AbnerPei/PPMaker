//
//  UIColor+PPMakeSupport.h
//  PPMakerExample
//
//  Created by PPAbner on 2020/12/17.
//  Copyright © 2020 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

UIKIT_STATIC_INLINE UIColor * PPMakeUIColorRgbA(CGFloat r,CGFloat g,CGFloat b,CGFloat a)
{
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a];
}

UIKIT_STATIC_INLINE UIColor * PPMakeUIColorRgb(CGFloat r,CGFloat g,CGFloat b)
{
    return PPMakeUIColorRgbA(r, g, b, 1.0);
}

UIKIT_STATIC_INLINE UIColor * PPMakeUIColorRa(CGFloat r,CGFloat a)
{
    return PPMakeUIColorRgbA(r, r, r, a);
}

UIKIT_STATIC_INLINE UIColor * PPMakeUIColorR(CGFloat r){
    return PPMakeUIColorRa(r, 1.0);
}

UIKIT_STATIC_INLINE UIColor * PPMakeUIColorHexA(UInt32 hex,CGFloat a)
{
    return [UIColor colorWithRed:((hex >> 16) & 0xFF) / 255.0
                           green:((hex >> 8 ) & 0xFF) / 255.0
                            blue:(hex & 0xFF) / 255.0
                           alpha:a];
}

UIKIT_STATIC_INLINE UIColor * PPMakeUIColorHex(UInt32 hex){
    return PPMakeUIColorHexA(hex, 1.0);
}

@interface UIColor (PPMakeSupport)

+ (UIColor *)ppmake_colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;
+ (UIColor *)ppmake_colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b;

+ (UIColor *)ppmake_colorWithR:(CGFloat)r a:(CGFloat)a;
+ (UIColor *)ppmake_colorWithR:(CGFloat)r;

+ (UIColor *)ppmake_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;

+ (UIColor *)ppmake_randomColor;
@property (nonatomic, strong, readonly, class) UIColor *ppmake_randomColor;

+ (UIColor *)ppmake_000000;
@property (nonatomic, strong, readonly, class) UIColor *ppmake_000000;

+ (UIColor *)ppmake_111111;
@property (nonatomic, strong, readonly, class) UIColor *ppmake_111111;

+ (UIColor *)ppmake_222222;
@property (nonatomic, strong, readonly, class) UIColor *ppmake_222222;

+ (UIColor *)ppmake_333333;
@property (nonatomic, strong, readonly, class) UIColor *ppmake_333333;

+ (UIColor *)ppmake_444444;
@property (nonatomic, strong, readonly, class) UIColor *ppmake_444444;

+ (UIColor *)ppmake_555555;
@property (nonatomic, strong, readonly, class) UIColor *ppmake_555555;

+ (UIColor *)ppmake_666666;
@property (nonatomic, strong, readonly, class) UIColor *ppmake_666666;

+ (UIColor *)ppmake_777777;
@property (nonatomic, strong, readonly, class) UIColor *ppmake_777777;

+ (UIColor *)ppmake_888888;
@property (nonatomic, strong, readonly, class) UIColor *ppmake_888888;

+ (UIColor *)ppmake_999999;
@property (nonatomic, strong, readonly, class) UIColor *ppmake_999999;

@end

NS_ASSUME_NONNULL_END
