//
//  PPMake+UIButton.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake+UIButton.h"

@implementation PPMake (UIButton)
#pragma mark --- private method
/**
 内部提供的方法：设置button的title以及titleColor
 */
static inline PPMake *makeBtTC(id tOrC,UIControlState cs,BOOL isT,PPMake *m){
    UIButton *bt = (UIButton *)m.createdView;
    if (isT) {
        [bt setTitle:tOrC forState:cs];
    }else{
        [bt setTitleColor:tOrC forState:cs];
    }
    return m;
}

-(PPMake *(^)(NSString *, UIControlState))title
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(NSString *t,UIControlState cs){
        return makeBtTC(t, cs, YES, self);
    };
}
-(PPMake *(^)(NSString *))normalTitle
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(NSString *nt){
        return makeBtTC(nt, UIControlStateNormal, YES, self);
    };
}
-(PPMake *(^)(NSString *))highlightedTitle
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(NSString *ht){
        return makeBtTC(ht, UIControlStateHighlighted, YES, self);
    };
}

-(PPMake *(^)(UIColor *, UIControlState))titleColor
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(UIColor *tc,UIControlState cs){
        return makeBtTC(tc, cs, NO, self);
    };
}
-(PPMake *(^)(UIColor *))normalTitleColor
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(UIColor *ntc){
        return makeBtTC(ntc, UIControlStateNormal, NO, self);
    };
}
-(PPMake *(^)(UIColor *))highlightedTitleColor
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(UIColor *htc){
        return makeBtTC(htc, UIControlStateHighlighted, NO, self);
    };
}
static inline PPMake *makeBtTA(id target,SEL action,UIControlEvents ce,PPMake *m){
    UIButton *bt = (UIButton *)m.createdView;
    [bt addTarget:target action:action forControlEvents:ce];
    return m;
}
-(PPMake *(^)(id, SEL, UIControlEvents))addTarget
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(id target,SEL action,UIControlEvents ce){
        return makeBtTA(target, action, ce, self);
    };
}
-(PPMake *(^)(id, SEL))addTargetTouchUpInside
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(id target,SEL action){
        return makeBtTA(target, action, UIControlEventTouchUpInside, self);
    };
}
-(PPMake *(^)(makeBtActionBlock))actionBlock
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(makeBtActionBlock ab){
        if (ab) {
            UIButton *bt = (UIButton *)self.createdView;
            [bt ppmake_actionWithBlock:ab];
        }
        return self;
    };
}
#pragma mark --- 设置button的图片
-(PPMake *(^)(UIImage *, UIControlState))imageState
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(UIImage *img,UIControlState state){
        UIButton *bt = (UIButton *)self.createdView;
        [bt setImage:img forState:state];
        return self;
    };
}
-(PPMake *(^)(NSString *, UIControlState))imageNameState
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(NSString *imgN,UIControlState s){
        UIButton *bt = (UIButton *)self.createdView;
        [bt setImage:[UIImage imageNamed:imgN] forState:s];
        return self;
    };
}
-(PPMake *(^)(NSString *))normalImageName
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(NSString *nImgN){
        UIButton *bt = (UIButton *)self.createdView;
        [bt setImage:[UIImage imageNamed:nImgN] forState:UIControlStateNormal];
        return self;
    };
}
-(PPMake *(^)(NSString *))highlightedImageName
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(NSString *hImgN){
        UIButton *bt = (UIButton *)self.createdView;
        [bt setImage:[UIImage imageNamed:hImgN] forState:UIControlStateHighlighted];
        return self;
    };
}
#pragma mark --- attributedString
-(PPMake *(^)(NSAttributedString *, UIControlState))attributedString
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(NSAttributedString *as,UIControlState s){
        UIButton *bt = (UIButton *)self.createdView;
        [bt setAttributedTitle:as forState:s];
        return self;
    };
}
-(PPMake *(^)(NSAttributedString *))normalAttributedString
{
    return [self _asWithState:UIControlStateNormal];
}
-(PPMake *(^)(NSAttributedString *))highlightAttributedString
{
    return [self _asWithState:UIControlStateHighlighted];
}
-(PPMake *(^)(NSAttributedString *))_asWithState:(UIControlState)state
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(NSAttributedString *as){
        UIButton *bt = (UIButton *)self.createdView;
        [bt setAttributedTitle:as forState:state];
        return self;
    };
}
-(PPMake *(^)(UIFont *, UIColor *, UIControlState, NSString *))attributedFontColorTitle
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(UIFont *f,UIColor *c,UIControlState cs,NSString *t){
        return [self _configureBtAttributedFont:f color:c state:cs title:t];
    };
}
-(PPMake *)_configureBtAttributedFont:(UIFont *)f
                                color:(UIColor *)c
                                state:(UIControlState)state
                                title:(NSString *)title
{
    UIButton *bt = (UIButton *)self.createdView;
    NSAssert(title.length > 0, @"PPMaker提示：title为空时，无法设置对应的attributedStr");
    NSMutableDictionary<NSAttributedStringKey, id> *attributes = [NSMutableDictionary dictionary];
    if (f) {
        [attributes setValue:f forKey:NSFontAttributeName];
    }
    if (c) {
        [attributes setValue:c forKey:NSForegroundColorAttributeName];
    }
    NSMutableAttributedString *titleAttributedStr = [[NSMutableAttributedString alloc]initWithString:title attributes:attributes];
    [bt setAttributedTitle:titleAttributedStr forState:state];
    return self;
}
-(PPMake *(^)(UIFont *, UIColor *, NSString *))normalAttributedFontColorTitle
{
    return [self _asFontColorTitleWithState:UIControlStateNormal];
}
-(PPMake *(^)(UIFont *, UIColor *,NSString *t))highlightAttributedFontColor
{
    return [self _asFontColorTitleWithState:UIControlStateHighlighted];
}
-(PPMake *(^)(UIFont *, UIColor *,NSString *))_asFontColorTitleWithState:(UIControlState)state
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(UIFont *f,UIColor *c,NSString *t){
        return [self _configureBtAttributedFont:f color:c state:state title:t];
    };
}

#pragma mark --- 防止重复点击
-(PPMake *(^)(NSTimeInterval))clickTimeInterval
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(NSTimeInterval ti){
        UIButton *bt = (UIButton *)self.createdView;
        bt.clickTimeInterval = ti;
        return self;
    };
}
@end
