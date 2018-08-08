//
//  UIColor+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/14.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIColor+PPMakeSupport.h"

@implementation UIColor (PPMakeSupport)
+(UIColor *)ppmake_r:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a
{
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];
}
+(UIColor *)ppmake_r:(CGFloat)r g:(CGFloat)g b:(CGFloat)b
{
    return [UIColor ppmake_r:r g:g b:b a:1.0];
}
+(UIColor *)ppmake_r:(CGFloat)r a:(CGFloat)a
{
    return [UIColor ppmake_r:r g:r b:r a:a];
}
+(UIColor *)ppmake_r:(CGFloat)r
{
    return [UIColor ppmake_r:r a:1.0];
}

+(UIColor *)ppmake_hexStr:(NSString *)hexStr a:(CGFloat)a
{
    //删除字符串中的空格
    NSString *cString = [[hexStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6){
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"] || [cString hasPrefix:@"0x"]){
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]){
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6){
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:a];
}
+(UIColor *)ppmake_hexStr:(NSString *)hexStr
{
    return [UIColor ppmake_hexStr:hexStr a:1.0];
}
+(UIColor *)ppmake_random
{
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    return [UIColor ppmake_r:aRedValue g:aGreenValue b:aBlueValue];
}
@end

#pragma mark --- iOS系统提供的颜色
@implementation UIColor (PPMakeSystem)
/** 黑色 */
+(UIColor *)ppmake_black{
    return [UIColor blackColor];
}
/** 深灰色 */
+(UIColor *)ppmake_darkGray{
    return [UIColor darkGrayColor];
}
/** 浅灰色 */
+(UIColor *)ppmake_lightGray{
    return [UIColor lightGrayColor];
}
/** 灰色 */
+(UIColor *)ppmake_gray{
    return [UIColor grayColor];
}
/** 白色 */
+(UIColor *)ppmake_white{
    return [UIColor whiteColor];
}
/** 红色 */
+(UIColor *)ppmake_red{
    return [UIColor redColor];
}
/** 绿色 */
+(UIColor *)ppmake_green{
    return [UIColor greenColor];
}
/** 蓝色 */
+(UIColor *)ppmake_blue{
    return [UIColor blueColor];
}
/** 蓝绿色 */
+(UIColor *)ppmake_cyan{
    return [UIColor cyanColor];
}
/** 黄色 */
+(UIColor *)ppmake_yellow{
    return [UIColor yellowColor];
}
/** 品红色 */
+(UIColor *)ppmake_magenta{
    return [UIColor magentaColor];
}
/** 橙色 */
+(UIColor *)ppmake_orange{
    return [UIColor orangeColor];
}
/** 紫色 */
+(UIColor *)ppmake_purple{
    return [UIColor purpleColor];
}
/** 棕色 */
+(UIColor *)ppmake_brown{
    return [UIColor brownColor];
}
/** 无色 */
+(UIColor *)ppmake_clear{
    return [UIColor clearColor];
}
@end

#pragma mark --- comes from http://www.sioe.cn/yingyong/yanse-rgb-16/
@implementation UIColor (PPMakeBeautifulColor)
/** 浅粉红 */
+(UIColor *)ppmake_lightPink{
    return [UIColor ppmake_r:255 g:182 b:193];
}
/** 天蓝色 */
+(UIColor *)ppmake_skyBlue{
    return [UIColor ppmake_r:135 g:206 b:235];
}
/** 金黄色 */
+(UIColor *)ppmake_goldenYellow{
    return [UIColor ppmake_r:255 g:215 b:0];
}
/** 森林绿 */
+(UIColor *)ppmake_forestGreen{
    return [UIColor ppmake_r:34 g:139 b:34];
}
/** 巧克力色 */
+(UIColor *)ppmake_chocolate{
    return [UIColor ppmake_r:210 g:105 b:30];
}
/** 印度红 */
+(UIColor *)ppmake_indiaRed{
    return [UIColor ppmake_r:176 g:23 b:31];
}
/** 栗色 */
+(UIColor *)ppmake_marron{
    return [UIColor ppmake_r:176 g:48 b:96];
}
/** 草莓色 */
+(UIColor *)ppmake_strawberry{
    return [UIColor ppmake_r:135 g:38 b:87];
}
/** 番茄色 */
+(UIColor *)ppmake_tomato{
    return [UIColor ppmake_r:255 g:99 b:71];
}
/** 深红色 */
+(UIColor *)ppmake_deepRed{
    return [UIColor ppmake_r:255 g:0 b:255];
}
/** 孔雀蓝 */
+(UIColor *)ppmake_peacockBlue{
    return [UIColor ppmake_r:51 g:161 b:201];
}
/** 紫罗兰色 */
+(UIColor *)ppmake_violet{
    return [UIColor ppmake_r:138 g:43 b:226];
}
/** 黄褐色 */
+(UIColor *)ppmake_tawny{
    return [UIColor ppmake_r:240 g:230 b:140];
}
/** 淡黄色 */
+(UIColor *)ppmake_jasmine{
    return [UIColor ppmake_r:245 g:222 b:179];
}
/** 蛋壳色 */
+(UIColor *)ppmake_eggShell{
    return [UIColor ppmake_r:252 g:230 b:201];
}
@end
