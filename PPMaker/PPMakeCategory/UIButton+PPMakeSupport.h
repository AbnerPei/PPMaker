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
//button点击事件block
-(void)ppmake_actionWithControlEvent:(UIControlEvents )event
                           withBlock:(makeBtActionBlock)actionBlock;
-(void)ppmake_actionWithBlock:(makeBtActionBlock)actionBlock;

@end

