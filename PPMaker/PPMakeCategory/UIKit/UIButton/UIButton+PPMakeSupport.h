//
//  UIButton+PPMakeSupport.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/18.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^makeBtActionBlock)(void);

@interface UIButton (PPMakeSupport)
/**
 * button点击事件block
 */
- (void)ppmake_actionWithControlEvent:(UIControlEvents)event
                           withBlock:(makeBtActionBlock)actionBlock;
- (void)ppmake_actionWithBlock:(makeBtActionBlock)actionBlock;
@end


@interface UIControl (PPMakeSupport)
/**
 * 点击事件的间隔时间
 */
@property(nonatomic,assign) NSTimeInterval clickTimeInterval;
/**
 * 重置button的可点击状态，为可点击，用于clickTimeInterval时间未到，但是需要可点击。
 */
- (void)ppmake_reset;
@end
