//
//  PPMutAttributedStringMaker.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMutAttributedStringMaker.h"
#import <NSMutableAttributedString+PPMakeSupport.h>

@interface PPMutAttributedStringMaker ()
@property(nonatomic,strong) NSMutableAttributedString *mutAttrbutedStr;
@end

@implementation PPMutAttributedStringMaker
- (instancetype)initWithStr:(NSString *)str
{
    self = [super init];
    if (self) {
        self.mutAttrbutedStr = [[NSMutableAttributedString alloc] initWithString:str];
    }
    return self;
}

- (NSMutableAttributedString *)attributedString
{
    return _mutAttrbutedStr;
}

#pragma mark --- 字体
- (PPMutAttributedStringMaker *(^)(UIFont *))font
{
    return ^PPMutAttributedStringMaker *(UIFont *f){
        if (f) {
            self.mutAttrbutedStr.ppmake_font = f;
        }
        return self;
    };
}
- (PPMutAttributedStringMaker *(^)(UIFont *, NSRange))fontRange
{
    return ^PPMutAttributedStringMaker *(UIFont *f,NSRange r){
        if (f) {
            [self.mutAttrbutedStr ppmake_setFont:f range:r];
        }
        return self;
    };
}
#pragma mark --- 颜色
- (PPMutAttributedStringMaker *(^)(UIColor *))textColor
{
    return ^PPMutAttributedStringMaker *(UIColor *tc){
        if (tc) {
            self.mutAttrbutedStr.ppmake_color = tc;
        }
        return self;
    };
}
- (PPMutAttributedStringMaker *(^)(UIColor *, NSRange))textColorRange
{
    return ^PPMutAttributedStringMaker *(UIColor *tc,NSRange r){
        if (tc) {
            [self.mutAttrbutedStr ppmake_setColor:tc range:r];
        }
        return self;
    };
}
#pragma mark --- 段落
- (PPMutAttributedStringMaker *(^)(NSParagraphStyle *))paragraphStyle
{
    return ^PPMutAttributedStringMaker *(NSParagraphStyle *ps){
        if (ps) {
            self.mutAttrbutedStr.ppmake_paragraphStyle = ps;
        }
        return self;
    };
}
- (PPMutAttributedStringMaker *(^)(NSParagraphStyle *, NSRange))paragraphStyleRange
{
    return ^PPMutAttributedStringMaker *(NSParagraphStyle *ps,NSRange r){
        if (ps) {
            [self.mutAttrbutedStr ppmake_setParagraphStyle:ps range:r];
        }
        return self;
    };
}
#pragma mark --- 行间距
- (PPMutAttributedStringMaker *(^)(CGFloat))lineSpacing
{
    return ^PPMutAttributedStringMaker *(CGFloat ls){
        self.mutAttrbutedStr.ppmake_lineSpacing = ls;
        return self;
    };
}
- (PPMutAttributedStringMaker *(^)(CGFloat, NSRange))lineSpacingRange
{
    return ^PPMutAttributedStringMaker *(CGFloat ls,NSRange r){
        [self.mutAttrbutedStr ppmake_setLineSpacing:ls range:r];
        return self;
    };;
}
#pragma mark --- 字间距
- (PPMutAttributedStringMaker *(^)(NSNumber *))kern
{
    return ^PPMutAttributedStringMaker *(NSNumber *k){
        self.mutAttrbutedStr.ppmake_kern = k;
        return self;
    };
}
- (PPMutAttributedStringMaker *(^)(NSNumber *, NSRange))kernRange
{
    return ^PPMutAttributedStringMaker *(NSNumber *k,NSRange r){
        [self.mutAttrbutedStr ppmake_setKern:k range:r];
        return self;
    };
}
#pragma mark --- 某个特别文字处理
- (PPMutAttributedStringMaker *(^)(NSString *, UIFont *, UIColor *))specialText
{
    return ^PPMutAttributedStringMaker *(NSString *specialText,UIFont *specialFont,UIColor *specialColor){
        [self.mutAttrbutedStr ppmake_specialText:specialText specialFont:specialFont specialColor:specialColor];
        return self;
    };
}
#pragma mark --- 特别文字统一处理
- (PPMutAttributedStringMaker *(^)(NSArray<NSString *> *, NSArray<UIFont *> *, NSArray<UIColor *> *))specialTextSet
{
    return ^PPMutAttributedStringMaker *(NSArray<NSString *> *specialTextArray,NSArray<UIFont *> *specialTextFontArray,NSArray<UIColor *> *specialTextColorArray){
        [self.mutAttrbutedStr ppmake_specialTextArray:specialTextArray specialTextFontArray:specialTextFontArray specialTextColorArray:specialTextColorArray];
        return self;
    };
}

@end


