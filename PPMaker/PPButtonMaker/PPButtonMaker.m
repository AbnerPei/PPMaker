//
//  PPButtonMaker.m
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPButtonMaker.h"
#import <objc/runtime.h>

@interface PPButtonMaker ()
/** 要创建的bt */
@property(nonatomic,strong) UIButton *creatingBT;
/** 记录bt的block点击事件 */
@property(nonatomic,copy) makerBtActionBlock creatingBtActionBlock;

@end

@implementation PPButtonMaker
#pragma mark --- 父视图
-(PPButtonMaker *(^)(UIView *))intoView
{
    return ^PPButtonMaker *(UIView *superV){
        if (superV) {
            [superV addSubview:self.creatingBT];
        }
        return self;
    };
}
#pragma mark --- frame
-(PPButtonMaker *(^)(CGRect))frame
{
    return ^PPButtonMaker *(CGRect frame){
        self.creatingBT.frame = frame;
        return self;
    };
}
#pragma mark --- 背景色
-(PPButtonMaker *(^)(UIColor *))bgColor
{
    return ^PPButtonMaker *(UIColor *color){
        self.creatingBT.backgroundColor = color;
        return self;
    };
}
#pragma mark --- 文字
-(PPButtonMaker *(^)(NSString *, UIControlState))title
{
    return ^PPButtonMaker *(NSString *title,UIControlState state){
        [self.creatingBT setTitle:title forState:state];
        return self;
    };
}
-(PPButtonMaker *(^)(NSString *))normalTitle
{
    return ^PPButtonMaker *(NSString *normalTitle){
        [self.creatingBT setTitle:normalTitle forState:UIControlStateNormal];
        return self;
    };
}
-(PPButtonMaker *(^)(NSString *))highlightedTitle
{
    return ^PPButtonMaker *(NSString *highlightedTitle){
        [self.creatingBT setTitle:highlightedTitle forState:UIControlStateHighlighted];
        return self;
    };
}

#pragma mark --- 字体颜色
-(PPButtonMaker *(^)(UIColor *, UIControlState))titleColor
{
    return ^PPButtonMaker *(UIColor *titleColor,UIControlState state){
        [self.creatingBT setTitleColor:titleColor forState:state];
        return self;
    };
}
-(PPButtonMaker *(^)(UIColor *))normalTitleColor
{
    return ^PPButtonMaker *(UIColor *normalTitleColor){
        [self.creatingBT setTitleColor:normalTitleColor forState:UIControlStateNormal];
        return self;
    };
}
-(PPButtonMaker *(^)(UIColor *))highlightedTitleColor
{
    return ^PPButtonMaker *(UIColor *highlightedTitleColor){
        [self.creatingBT setTitleColor:highlightedTitleColor forState:UIControlStateHighlighted];
        return self;
    };
}
#pragma mark --- 原始的target-action点击事件
-(PPButtonMaker *(^)(id, SEL, UIControlEvents))addTarget
{
    return ^PPButtonMaker *(id target,SEL action,UIControlEvents controlEvents){
        [self.creatingBT addTarget:target action:action forControlEvents:controlEvents];
        return self;
    };
}
#pragma mark --- UIControlEventTouchUpInside
-(PPButtonMaker *(^)(id, SEL))addTargetTouchUpInside
{
    return ^PPButtonMaker *(id target,SEL action){
        [self.creatingBT addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}
#pragma mark --- block形式的点击事件
-(PPButtonMaker *(^)(makerBtActionBlock))actionBlock
{
    return ^PPButtonMaker *(makerBtActionBlock block){
        if (block) {
            self.creatingBtActionBlock = block;
        }
        return self;
    };
}

-(UIButton *)creatingBT
{
    if (!_creatingBT) {
        _creatingBT = [UIButton buttonWithType:UIButtonTypeCustom];
        [_creatingBT maker_actionBlock:^{
            if (self.creatingBtActionBlock) {
                self.creatingBtActionBlock();
            }
        }];
    }
    return _creatingBT;
}
-(void)dealloc
{
    NSLog(@"PPButtonMaker释放了");
}
@end

@implementation UIButton (PPMaker)

+(UIButton *)pp_btMake:(void (^)(PPButtonMaker *))make
{
    PPButtonMaker *btMaker = [[PPButtonMaker alloc]init];
    if (make) {
        make(btMaker);
    }
    return btMaker.creatingBT;
}

-(void)maker_actionBlock:(makerBtActionBlock)block controlEvent:(UIControlEvents)event
{
    if (block) {
        objc_setAssociatedObject(self, @selector(clickAction:), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    [self addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)maker_actionBlock:(makerBtActionBlock)block
{
    [self maker_actionBlock:block controlEvent:UIControlEventTouchUpInside];
}

-(void)clickAction:(UIButton *)button{
    makerBtActionBlock block =objc_getAssociatedObject(self, _cmd);
    if (block) {
        block();
    }
}
@end





