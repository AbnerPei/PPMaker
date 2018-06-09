//
//  UIButton+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/18.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIButton+PPMakeSupport.h"
#import <objc/runtime.h>
#import "NSObject+PPMakeSupport.h"

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

@implementation UIControl (PPMakeSupport)
-(NSTimeInterval)clickTimeInterval
{
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}
-(void)setClickTimeInterval:(NSTimeInterval)clickTimeInterval
{
    objc_setAssociatedObject(self, @selector(clickTimeInterval), @(clickTimeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(BOOL)isIgnoreClickEvent
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
-(void)setIsIgnoreClickEvent:(BOOL)isIgnoreClickEvent
{
    objc_setAssociatedObject(self, @selector(isIgnoreClickEvent), @(isIgnoreClickEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(void)load
{
    [UIControl ppmake_swizzleWithOriginSelector:@selector(sendAction:to:forEvent:) swizzledSelector:@selector(ppmakeSendAction:to:forEvent:)];
}
-(void)ppmakeSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (self.isIgnoreClickEvent) {
        return;
    }
    
    if (self.clickTimeInterval > 0) {
        self.isIgnoreClickEvent = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.clickTimeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.isIgnoreClickEvent = NO;
        });
    }
    [self ppmakeSendAction:action to:target forEvent:event];
}
-(void)ppmake_reset
{
    [self setIsIgnoreClickEvent:NO];
    self.clickTimeInterval = 0;
}
@end

