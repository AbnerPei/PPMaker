//
//  UIButton+PPMakeSupport.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/18.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^makeBtActionBlock)(void);
typedef void(^makerBtActionBlock)(void);

@interface UIButton (PPMakeSupport)
-(void)ppmake_actionWithControlEvent:(UIControlEvents )event
                           withBlock:(makeBtActionBlock)actionBlock;
-(void)ppmake_actionWithBlock:(makeBtActionBlock)actionBlock;
@end


@interface UIButton (PPMakerSupport)
-(void)maker_actionBlock:(makerBtActionBlock)block controlEvent:(UIControlEvents )event;
-(void)maker_actionBlock:(makerBtActionBlock)block;

@end
