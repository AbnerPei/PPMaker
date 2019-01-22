//
//  UIFont+PPMakeUIFontCreation.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/29.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIFont+PPMakeUIFontCreation.h"
NSString *const PPFontSpecifiedIdentifier = @"###";

@implementation UIFont (PPMakeUIFontCreation)

+ (UIFont *)ppmake_systemFontOfSize:(CGFloat)fontSize
{
    return [UIFont systemFontOfSize:fontSize*ratioValue()];
}
+ (UIFont *)ppmake_boldSystemFontOfSize:(CGFloat)fontSize
{
    return [UIFont boldSystemFontOfSize:fontSize*ratioValue()];

}
+ (instancetype)ppmake_font:(id)idFont
{
    if (!idFont) {
        return nil;
    }
    if ([idFont isKindOfClass:[UIFont class]]) {
        return idFont;
    }else if ([idFont isKindOfClass:[NSString class]]){
        NSString *fontStr = (NSString *)idFont;
        if ([fontStr hasPrefix:@"B"] && fontStr.length > 1) {
            NSString *secondStr = [[fontStr componentsSeparatedByString:@"B"] objectAtIndex:1];
            CGFloat fontSize = [secondStr floatValue];
            if (fontSize >= 0) {
#ifdef k_layoutMyAppFont_setting
                return [UIFont ppmake_boldSystemFontOfSize:fontSize];
#else
                return [UIFont boldSystemFontOfSize:fontSize];
#endif
            }
        }else{
            CGFloat fontSize = [fontStr floatValue];
            if (fontSize >= 0) {
#ifdef k_layoutMyAppFont_setting
                return [UIFont ppmake_systemFontOfSize:fontSize];
#else
                return [UIFont systemFontOfSize:fontSize];
#endif
            }
        }
    }else if ([idFont isKindOfClass:[NSNumber class]]){
        NSNumber *fontSizeN = (NSNumber *)idFont;
        CGFloat fontSizeF =  [fontSizeN floatValue];
        if (fontSizeF >= 0) {
#ifdef k_layoutMyAppFont_setting
            return [UIFont ppmake_systemFontOfSize:fontSizeF];
#else
            return [UIFont systemFontOfSize:fontSizeF];
#endif
        }
    }
    return nil;
}

static inline CGFloat ratioValue(){
    return [UIScreen mainScreen].bounds.size.width/375.0;
}

@end
