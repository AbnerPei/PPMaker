//
//  UIFont+PPMakeUIFontCreation.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/29.
//  Copyright © 2018年 PPAbner. All rights reserved.
//  参考系统`@interface NSMutableArray<ObjectType> (NSMutableArrayCreation)`的命名



#import <UIKit/UIKit.h>

///定义app字体适配 [可根据具体情况放在工程的pch中]
#define k_layoutMyAppFont_setting 1

@interface UIFont (PPMakeUIFontCreation)

+ (UIFont *)ppmake_systemFontOfSize:(CGFloat)fontSize;
+ (UIFont *)ppmake_boldSystemFontOfSize:(CGFloat)fontSize;

/*
 * UIFont创建：用字符串快速创建，规则见下:
 * ☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞
 * ☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞
 * 1. 只接受NSFont/NSNumber/NSString三种类型
 *
 * NSString类型规则：
 * ①: @"18"/@"16.8"/@"8"            等价于 [UIFont systemFontOfSize:18/16.8/8]
 * ②: @"B18"                        等价于 [UIFont boldSystemFontOfSize:18]
 * ☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜
 *☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜
 */
+ (instancetype)ppmake_font:(id)idFont;

@end
