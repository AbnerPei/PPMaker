//
//  UIFont+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/14.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIFont+PPMakeSupport.h"

NSString * const kFontNamePingFangSCSemibold = @"PingFangSC-Semibold";
NSString * const kFontNamePingFangSCMedium   = @"PingFangSC-Medium";
NSString * const kFontNamePingFangSCRegular  = @"PingFangSC-Regular";

@implementation UIFont (PPMakeSupport)
/** PingFangSC-Semibold格式字体 */
+(instancetype)ppmake_fontPingFangSCSemiboldSize:(CGFloat)size
{
   return _makeFont(kFontNamePingFangSCSemibold, size);
}
/** PingFangSC-Medium格式字体 */
+(instancetype)ppmake_fontPingFangSCMediumSize:(CGFloat)size
{
    return _makeFont(kFontNamePingFangSCMedium, size);
}
/** PingFangSC-Regular格式字体 */
+(instancetype)ppmake_fontPingFangSCRegularSize:(CGFloat)size
{
   return _makeFont(kFontNamePingFangSCRegular, size);
}

static inline UIFont * _makeFont(NSString *fontName,CGFloat fontSize){
    UIFont *font = [UIFont fontWithName:fontName size:fontSize];
    if (font) {
        return font;
    }
    return [UIFont systemFontOfSize:fontSize];
}
@end
