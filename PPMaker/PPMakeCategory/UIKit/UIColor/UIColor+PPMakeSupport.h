//
//  UIColor+PPMakeSupport.h
//  PPMakerExample
//
//  Created by PPAbner on 2020/12/17.
//  Copyright © 2020 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

UIKIT_STATIC_INLINE UIColor * UIColorRgbA(CGFloat r,CGFloat g,CGFloat b,CGFloat a)
{
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a];
}

UIKIT_STATIC_INLINE UIColor * UIColorRgb(CGFloat r,CGFloat g,CGFloat b)
{
    return UIColorRgbA(r, g, b, 1.0);
}

UIKIT_STATIC_INLINE UIColor * UIColorRa(CGFloat r,CGFloat a)
{
    return UIColorRgbA(r, r, r, a);
}

UIKIT_STATIC_INLINE UIColor * UIColorR(CGFloat r){
    return UIColorRa(r, 1.0);
}

UIKIT_STATIC_INLINE UIColor * UIColorHexA(UInt32 hex,CGFloat a)
{
    return [UIColor colorWithRed:((hex >> 16) & 0xFF) / 255.0
                           green:((hex >> 8 ) & 0xFF) / 255.0
                            blue:(hex & 0xFF) / 255.0
                           alpha:a];
}

UIKIT_STATIC_INLINE UIColor * UIColorHex(UInt32 hex){
    return UIColorHexA(hex, 1.0);
}

UIKIT_STATIC_INLINE UIColor * UIColorRandom(void)
{
    NSInteger r = arc4random() % 255;
    NSInteger g = arc4random() % 255;
    NSInteger b = arc4random() % 255;
    return UIColorRgb(r, g, b);
}

UIKIT_STATIC_INLINE UIColor * _000000(void){ return UIColorHex(0x000000);}
UIKIT_STATIC_INLINE UIColor * _111111(void){ return UIColorHex(0x111111);}
UIKIT_STATIC_INLINE UIColor * _222222(void){ return UIColorHex(0x222222);}
UIKIT_STATIC_INLINE UIColor * _333333(void){ return UIColorHex(0x333333);}
UIKIT_STATIC_INLINE UIColor * _444444(void){ return UIColorHex(0x444444);}
UIKIT_STATIC_INLINE UIColor * _555555(void){ return UIColorHex(0x555555);}
UIKIT_STATIC_INLINE UIColor * _666666(void){ return UIColorHex(0x666666);}
UIKIT_STATIC_INLINE UIColor * _777777(void){ return UIColorHex(0x777777);}
UIKIT_STATIC_INLINE UIColor * _888888(void){ return UIColorHex(0x888888);}
UIKIT_STATIC_INLINE UIColor * _999999(void){ return UIColorHex(0x999999);}

@interface UIColor (PPMakeSupport)

+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;
+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b;

+ (UIColor *)colorWithR:(CGFloat)r a:(CGFloat)a;
+ (UIColor *)colorWithR:(CGFloat)r;

+ (UIColor *)colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;

+ (UIColor *)RandomColor;
@property (nonatomic, strong, readonly, class) UIColor *RandomColor;

@end

NS_ASSUME_NONNULL_END
