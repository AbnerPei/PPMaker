//
//  UIColor+PPMakeSupport.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/14.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kColorRGBA(r,g,b,a)    [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]
#define kColorRGB(r,g,b)       kColorRGBA(r,g,b,1.0)
#define kColorRA(r,a)          kColorRGBA(r,r,r,a)
#define kColorR(r)             kColorRGBA(r,r,r,1.0)

#define kColorHexA(hexValue,a) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:a]
#define kColorHex(hexValue)    kColorHexA(hexValue,1.0)

@interface UIColor (PPMakeSupport)
+(UIColor *)ppmake_r:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;
+(UIColor *)ppmake_r:(CGFloat)r g:(CGFloat)g b:(CGFloat)b;
+(UIColor *)ppmake_r:(CGFloat)r a:(CGFloat)a;
+(UIColor *)ppmake_r:(CGFloat)r;
+(UIColor *)ppmake_hexStr:(NSString *)hexStr a:(CGFloat)a;
+(UIColor *)ppmake_hexStr:(NSString *)hexStr;
/** 随机色 */
+(UIColor *)ppmake_random;
@end


#define kColorWhite  [UIColor ppmake_white]
#define kColorBlack  [UIColor ppmake_black]

#pragma mark --- iOS系统提供的颜色
@interface UIColor (PPMakeSystem)
/** 黑色 */
+(UIColor *)ppmake_black;
/** 深灰 */
+(UIColor *)ppmake_darkGray;
/** 浅灰 */
+(UIColor *)ppmake_lightGray;
/** 灰色 */
+(UIColor *)ppmake_gray;
/** 白色 */
+(UIColor *)ppmake_white;
/** 红色 */
+(UIColor *)ppmake_red;
/** 绿色 */
+(UIColor *)ppmake_green;
/** 蓝色 */
+(UIColor *)ppmake_blue;
/** 蓝绿 */
+(UIColor *)ppmake_cyan;
/** 黄色 */
+(UIColor *)ppmake_yellow;
/** 品红 */
+(UIColor *)ppmake_magenta;
/** 橙色 */
+(UIColor *)ppmake_orange;
/** 紫色 */
+(UIColor *)ppmake_purple;
/** 棕色 */
+(UIColor *)ppmake_brown;
/** 无色 */
+(UIColor *)ppmake_clear;
@end


#pragma mark --- comes from http://www.sioe.cn/yingyong/yanse-rgb-16/
@interface UIColor (PPMakeBeautifulColor)
/** 浅粉红 */
+(UIColor *)ppmake_lightPink;
/** 天蓝色 */
+(UIColor *)ppmake_skyBlue;
/** 金黄色 */
+(UIColor *)ppmake_goldenYellow;
/** 森林绿 */
+(UIColor *)ppmake_forestGreen;
/** 巧克力 */
+(UIColor *)ppmake_chocolate;
/** 印度红 */
+(UIColor *)ppmake_indiaRed;
/** 板栗色 */
+(UIColor *)ppmake_marron;
/** 草莓色 */
+(UIColor *)ppmake_strawberry;
/** 番茄色 */
+(UIColor *)ppmake_tomato;
/** 深红色 */
+(UIColor *)ppmake_deepRed;
/** 孔雀蓝 */
+(UIColor *)ppmake_peacockBlue;
/** 紫罗兰 */
+(UIColor *)ppmake_violet;
/** 黄褐色 */
+(UIColor *)ppmake_tawny;
/** 淡黄色 */
+(UIColor *)ppmake_jasmine;
/** 蛋壳色 */
+(UIColor *)ppmake_eggShell;
@end
