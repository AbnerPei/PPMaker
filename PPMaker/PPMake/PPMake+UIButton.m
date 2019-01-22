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


- (PPMake *(^)(NSString *, UIControlState))titleState
{
    
    PPMakeBTAssert
    return ^PPMake *(NSString *t,UIControlState cs){
        return makeBtTC(t, cs, YES, self);
    };
}
- (PPMake *(^)(NSString *))normalTitle
{
    PPMakeBTAssert
    return ^PPMake *(NSString *nt){
        return makeBtTC(nt, UIControlStateNormal, YES, self);
    };
}
- (PPMake *(^)(NSString *))highlightedTitle
{
    PPMakeBTAssert
    return ^PPMake *(NSString *ht){
        return makeBtTC(ht, UIControlStateHighlighted, YES, self);
    };
}

- (PPMake *(^)(UIColor *, UIControlState))titleColorState
{
    PPMakeBTAssert
    return ^PPMake *(UIColor *tc,UIControlState cs){
        return makeBtTC(tc, cs, NO, self);
    };
}
- (PPMake *(^)(UIColor *))normalTitleColor
{
    PPMakeBTAssert
    return ^PPMake *(UIColor *ntc){
        return makeBtTC(ntc, UIControlStateNormal, NO, self);
    };
}
- (PPMake *(^)(UIColor *))highlightedTitleColor
{
    PPMakeBTAssert
    return ^PPMake *(UIColor *htc){
        return makeBtTC(htc, UIControlStateHighlighted, NO, self);
    };
}
static inline PPMake *makeBtTA(id target,SEL action,UIControlEvents ce,PPMake *m){
    UIButton *bt = (UIButton *)m.createdView;
    [bt addTarget:target action:action forControlEvents:ce];
    return m;
}
- (PPMake *(^)(id, SEL, UIControlEvents))addTarget
{
    PPMakeBTAssert
    return ^PPMake *(id target,SEL action,UIControlEvents ce){
        return makeBtTA(target, action, ce, self);
    };
}
- (PPMake *(^)(id, SEL))addTargetTouchUpInside
{
    PPMakeBTAssert
    return ^PPMake *(id target,SEL action){
        return makeBtTA(target, action, UIControlEventTouchUpInside, self);
    };
}
- (PPMake *(^)(makeBtActionBlock))actionBlock
{
    PPMakeBTAssert
    return ^PPMake *(makeBtActionBlock ab){
        if (ab) {
            UIButton *bt = (UIButton *)self.createdView;
            [bt ppmake_actionWithBlock:ab];
        }
        return self;
    };
}
#pragma mark --- 设置button的图片
- (PPMake *(^)(UIImage *, UIControlState))imageState
{
    return [self _imageWithIsBg:NO];
}
- (PPMake *(^)(UIImage *, UIControlState))bgImageState
{
    return [self _imageWithIsBg:YES];
}
#pragma mark --- private 根据image和controlState设置image
- (PPMake *(^)(UIImage *, UIControlState))_imageWithIsBg:(BOOL)isBg
{
    PPMakeBTAssert
    return ^PPMake *(UIImage *img,UIControlState state){
        UIButton *bt = (UIButton *)self.createdView;
        if (isBg) {
            [bt setBackgroundImage:img forState:state];
        }else{
            [bt setImage:img forState:state];
        }
        return self;
    };
}

- (PPMake *(^)(NSString *, UIControlState))imageNameState
{
    return [self _imageNameWithIsBg:NO];
}

- (PPMake *(^)(NSString *, UIControlState))bgImageNameState
{
    return [self _imageNameWithIsBg:YES];
}
#pragma mark --- private 根据imageName和controlState设置image
- (PPMake *(^)(NSString *, UIControlState))_imageNameWithIsBg:(BOOL)isBg
{
    PPMakeBTAssert
    return ^PPMake *(NSString *imgName,UIControlState state){
        UIButton *bt = (UIButton *)self.createdView;
        if (isBg) {
            [bt setBackgroundImage:[UIImage imageNamed:imgName] forState:state];
        }else{
            [bt setImage:[UIImage imageNamed:imgName] forState:state];
        }
        return self;
    };
}

- (PPMake *(^)(UIImage *))normalImage
{
    return [self _imageWithState:(UIControlStateNormal) isBg:NO];
}
- (PPMake *(^)(UIImage *))highlightedImage
{
    return [self _imageWithState:(UIControlStateHighlighted) isBg:NO];
}
- (PPMake *(^)(UIImage *))normalBgImage
{
    return [self _imageWithState:(UIControlStateNormal) isBg:YES];
}
- (PPMake *(^)(UIImage *))highlightedBgImage
{
    return [self _imageWithState:(UIControlStateHighlighted) isBg:YES];
}
#pragma mark --- private 根据image设置image
- (PPMake *(^)(UIImage *))_imageWithState:(UIControlState)state isBg:(BOOL)isBg
{
    PPMakeBTAssert
    return ^PPMake *(UIImage *img){
        UIButton *bt = (UIButton *)self.createdView;
        if (isBg) {
            [bt setBackgroundImage:img forState:state];
        }else{
            [bt setImage:img forState:state];
        }
        return self;
    };
}

- (PPMake *(^)(NSString *))normalImageName
{
    return [self _imageNameWithState:(UIControlStateNormal) isBg:NO];
}
- (PPMake *(^)(NSString *))highlightedImageName
{
    return [self _imageNameWithState:(UIControlStateHighlighted) isBg:NO];
}
- (PPMake *(^)(NSString *))normalBgImageName
{
    return [self _imageNameWithState:(UIControlStateNormal) isBg:YES];
}
- (PPMake *(^)(NSString *))highlightedBgImageName
{
    return [self _imageNameWithState:(UIControlStateHighlighted) isBg:YES];
}
#pragma mark --- private 根据imageName设置image
- (PPMake *(^)(NSString *))_imageNameWithState:(UIControlState)state isBg:(BOOL)isBg
{
    PPMakeBTAssert
    return ^PPMake *(NSString *imgName){
        UIButton *bt = (UIButton *)self.createdView;
        if (isBg) {
            [bt setBackgroundImage:[UIImage imageNamed:imgName] forState:state];
        }else{
            [bt setImage:[UIImage imageNamed:imgName] forState:state];
        }
        return self;
    };
}


#pragma mark --- attributedString
- (PPMake *(^)(NSAttributedString *, UIControlState))attributedStringState
{
    PPMakeBTAssert
    return ^PPMake *(NSAttributedString *as,UIControlState s){
        UIButton *bt = (UIButton *)self.createdView;
        [bt setAttributedTitle:as forState:s];
        return self;
    };
}
- (PPMake *(^)(NSAttributedString *))normalAttributedString
{
    return [self _asWithState:UIControlStateNormal];
}
- (PPMake *(^)(NSAttributedString *))highlightAttributedString
{
    return [self _asWithState:UIControlStateHighlighted];
}
- (PPMake *(^)(NSAttributedString *))_asWithState:(UIControlState)state
{
    PPMakeBTAssert
    return ^PPMake *(NSAttributedString *as){
        UIButton *bt = (UIButton *)self.createdView;
        [bt setAttributedTitle:as forState:state];
        return self;
    };
}
- (PPMake *(^)(UIFont *, UIColor *, NSString *, UIControlState))attributedFontColorTitleState
{
    PPMakeBTAssert
    return ^PPMake *(UIFont *f,UIColor *c,NSString *t,UIControlState cs){
        return [self _configureBtAttributedFont:f color:c state:cs title:t];
    };
}
- (PPMake *)_configureBtAttributedFont:(UIFont *)f
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
- (PPMake *(^)(UIFont *, UIColor *, NSString *))normalAttributedFontColorTitle
{
    PPMakeBTAssert
    return [self _asFontColorTitleWithState:UIControlStateNormal];
}
- (PPMake *(^)(UIFont *, UIColor *,NSString *t))highlightAttributedFontColorTitle
{
    PPMakeBTAssert
    return [self _asFontColorTitleWithState:UIControlStateHighlighted];
}
- (PPMake *(^)(UIFont *, UIColor *,NSString *))_asFontColorTitleWithState:(UIControlState)state
{
    return ^PPMake *(UIFont *f,UIColor *c,NSString *t){
        return [self _configureBtAttributedFont:f color:c state:state title:t];
    };
}

#pragma mark --- 防止重复点击
- (PPMake *(^)(NSTimeInterval))clickTimeInterval
{
    PPMakeBTAssert
    return ^PPMake *(NSTimeInterval ti){
        UIButton *bt = (UIButton *)self.createdView;
        bt.clickTimeInterval = ti;
        return self;
    };
}

- (PPMake *(^)(CGFloat, CGFloat, CGFloat, CGFloat))setImageEdgeInsets
{
    PPMakeBTAssert
    return ^PPMake *(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        UIButton *bt = (UIButton *)self.createdView;
        [bt setImageEdgeInsets:UIEdgeInsetsMake(top, left, bottom, right)];
        return self;
    };
}
- (PPMake *(^)(CGFloat, CGFloat, CGFloat, CGFloat))setTitleEdgeInsets
{
    PPMakeBTAssert
    return ^PPMake *(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        UIButton *bt = (UIButton *)self.createdView;
        [bt setTitleEdgeInsets:UIEdgeInsetsMake(top, left, bottom, right)];
        return self;
    };
}


@end
