//
//  PPMake+UIButton.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake.h"
#import "UIButton+PPMakeSupport.h"

@interface PPMake (UIButton)
/**【通用】设置state对应的title */
@property(nonatomic,copy,readonly) PPMake *(^titleState)(NSString *title,UIControlState state);
/** 设置normal对应的title */
@property(nonatomic,copy,readonly) PPMake *(^normalTitle)(NSString *normalTitle);
/** 设置Highlighted对应的title */
@property(nonatomic,copy,readonly) PPMake *(^highlightedTitle)(NSString *highlightedTitle);

/**【通用】设置state对应的titleColor */
@property(nonatomic,copy,readonly) PPMake *(^titleColorState)(UIColor *titleColor,UIControlState state);
/** 设置normal对应的titleColor */
@property(nonatomic,copy,readonly) PPMake *(^normalTitleColor)(UIColor *normalTitleColor);
/** 设置Highlighted对应的titleColor */
@property(nonatomic,copy,readonly) PPMake *(^highlightedTitleColor)(UIColor *highlightedTitleColor);

@property(nonatomic,copy,readonly) PPMake *(^addTarget)(id target,SEL action,UIControlEvents controlEvents);
@property(nonatomic,copy,readonly) PPMake *(^addTargetTouchUpInside)(id target,SEL action);
@property(nonatomic,copy,readonly) PPMake *(^actionBlock)(makeBtActionBlock actionBlock);

//设置图片
@property(nonatomic,copy,readonly) PPMake *(^imageState)(UIImage *image,UIControlState state);
@property(nonatomic,copy,readonly) PPMake *(^imageNameState)(NSString *imageName,UIControlState state);
@property(nonatomic,copy,readonly) PPMake *(^normalImageName)(NSString *normalImageName);
@property(nonatomic,copy,readonly) PPMake *(^highlightedImageName)(NSString *highlightedImageName);

//attributedString
/**
 * 【UIButton】注意：1> 设置了attributedString。setTitle/setTitleColor等会失效，attributedString优先级高。
 * 【♘♘♘ 注意区分button的attributedText。】
 */
@property(nonatomic,copy,readonly) PPMake *(^attributedStringState)(NSAttributedString *attributedString,UIControlState state);
@property(nonatomic,copy,readonly) PPMake *(^normalAttributedString)(NSAttributedString *normalAttributedString);
@property(nonatomic,copy,readonly) PPMake *(^highlightAttributedString)(NSAttributedString *highlightAttributedString);

@property(nonatomic,copy,readonly) PPMake *(^attributedFontColorTitleState)(UIFont *titleFont,UIColor *titleColor,NSString *title,UIControlState state);
@property(nonatomic,copy,readonly) PPMake *(^normalAttributedFontColorTitle)(UIFont *normalTitleFont,UIColor *normalTitleColor,NSString *title);
@property(nonatomic,copy,readonly) PPMake *(^highlightAttributedFontColorTitle)(UIFont *highlightTitleFont,UIColor *highlightTitleColor,NSString *title);

/**
 * 防止重复点击
 * 👍👍 如果在timeInterval内，想让button恢复响应，bt可调用ppmake_reset方法来实现。
 */
@property(nonatomic,assign,readonly) PPMake *(^clickTimeInterval)(NSTimeInterval timeInterval);

/**【bt】: setImageEdgeInsets*/
@property(nonatomic,copy,readonly) PPMake *(^setImageEdgeInsets)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
/**【bt】: setTitleEdgeInsets*/
@property(nonatomic,copy,readonly) PPMake *(^setTitleEdgeInsets)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);


@end
