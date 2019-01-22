//
//  UIButton+PPMakeEasilyConfigure.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/30.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (PPMakeEasilyConfigure)
/**
 设置btn可点击时的bgColor、title 【配置了userInteractionEnabled = YES】
 */
- (void)ppmake_btWithEnabledBgColor:(UIColor *)bgColor
                         title:(NSString *)title;
/**
 设置btn【不】可点击时的bgColor、title 【配置了userInteractionEnabled = NO】
 */
- (void)ppmake_btWithUnenabledBgColor:(UIColor *)bgColor
                           title:(NSString *)title;

/**
 设置btn bgColor、Normal和Highlighted下的title 【相同】
 */
- (void)ppmake_btWithBgColor:(UIColor *)bgColor
                  title:(NSString *)title;
/**
 设置btn Normal和Highlighted下的image 【相同】
 */
- (void)ppmake_btSetImageWithImgName:(NSString *)imgName;
/**
 设置btn Normal和Highlighted下的TitleColor 【相同】
 */
- (void)ppmake_btSetTitleColor:(UIColor *)titleColor;
/**
 设置btn Normal和Highlighted下的Title 【相同】
 */
- (void)ppmake_btSetTitle:(NSString *)title;

@end
