//
//  UIButton+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/18.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIButton+PPMakeSupport.h"
#import <objc/runtime.h>

@implementation UIButton (PPMakeSupport)

-(void)ppmake_actionWithControlEvent:(UIControlEvents)event withBlock:(makeBtActionBlock)actionBlock
{
    objc_setAssociatedObject(self, @selector(clickAction:), actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)ppmake_actionWithBlock:(makeBtActionBlock)actionBlock
{
    [self ppmake_actionWithControlEvent:UIControlEventTouchUpInside withBlock:actionBlock];
}

-(void)clickAction:(UIButton *)button{
    makeBtActionBlock actionBlock =objc_getAssociatedObject(self, _cmd);
    if (actionBlock) {
        actionBlock();
    }
}
@end

