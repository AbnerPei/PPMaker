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

//UIKIT_STATIC_INLINE UIColor * _000000(void){ return PPMakeUIColorHex(0x000000);}
//UIKIT_STATIC_INLINE UIColor * _111111(void){ return PPMakeUIColorHex(0x111111);}
//UIKIT_STATIC_INLINE UIColor * _222222(void){ return PPMakeUIColorHex(0x222222);}
//UIKIT_STATIC_INLINE UIColor * _333333(void){ return PPMakeUIColorHex(0x333333);}
//UIKIT_STATIC_INLINE UIColor * _444444(void){ return PPMakeUIColorHex(0x444444);}
//UIKIT_STATIC_INLINE UIColor * _555555(void){ return PPMakeUIColorHex(0x555555);}
//UIKIT_STATIC_INLINE UIColor * _666666(void){ return PPMakeUIColorHex(0x666666);}
//UIKIT_STATIC_INLINE UIColor * _777777(void){ return PPMakeUIColorHex(0x777777);}
//UIKIT_STATIC_INLINE UIColor * _888888(void){ return PPMakeUIColorHex(0x888888);}
//UIKIT_STATIC_INLINE UIColor * _999999(void){ return PPMakeUIColorHex(0x999999);}

@interface UIColor (PPMakeSupport)

+ (UIColor *)ppmake_colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;
+ (UIColor *)ppmake_colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b;

+ (UIColor *)ppmake_colorWithR:(CGFloat)r a:(CGFloat)a;
+ (UIColor *)ppmake_colorWithR:(CGFloat)r;

+ (UIColor *)ppmake_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;

+ (UIColor *)ppmake_randomColor;
@property (nonatomic, strong, readonly, class) UIColor *ppmake_randomColor;

@end

NS_ASSUME_NONNULL_END
