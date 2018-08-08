//
//  UIColor+PPMakeSupportJudge.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/6.
//  Copyright © 2018年 PPAbner. All rights reserved.
//  参考：https://www.xuebuyuan.com/298520.html

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (PPMakeSupportJudge)

/**
 * 获取color的透明度
 * example如下：
 * NSLog(@"%f",CGColorGetAlpha(kColorRGBA(220, 220, 220, 0.6).CGColor));
 * 2018-07-06 15:10:56.770399+0800 PPMakerExample[12460:464005] 0.600000
 */
-(CGFloat)ppmake_alpha;
+(CGFloat)ppmake_alphaWithColor:(UIColor *)color;

/**
 * 比较两个颜色是否相同
 */
-(BOOL)ppmake_isEqualToColor:(UIColor *)color;
+(BOOL)ppmake_isSameColor:(UIColor *)oneColor
               otherColor:(UIColor *)otherColor;
@end

NS_ASSUME_NONNULL_END
