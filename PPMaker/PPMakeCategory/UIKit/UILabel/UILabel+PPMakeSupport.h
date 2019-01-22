//
//  UILabel+PPMakeSupport.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (PPMakeSupport)

@end

@interface UILabel (PPMakeCalculate)
/**
 计算文字宽
 
 @param font 字体  只接受NSNumber/NSString/UIFont三种类型
 @param height 给定的高度
 @param text 文字
 */
+ (CGFloat)ppmake_calculateWidthWithFont:(id)font
                                 height:(CGFloat)height
                                   text:(NSString *)text;

/**
 计算文字高
 
 @param font 字体  只接受NSNumber/NSString/UIFont三种类型
 @param width 给定的宽度
 @param text 文字
 */
+ (CGFloat)ppmake_calculateHeightWithFont:(id)font
                                   width:(CGFloat)width
                                    text:(NSString *)text;
@end
