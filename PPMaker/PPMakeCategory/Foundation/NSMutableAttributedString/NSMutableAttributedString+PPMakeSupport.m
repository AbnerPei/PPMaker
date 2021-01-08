//
//  NSMutableAttributedString+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/14.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "NSMutableAttributedString+PPMakeSupport.h"

@interface PPMutAttributedStringMaker ()
@property(nonatomic,strong) NSMutableAttributedString *mutAttrbutedStr;
@end

@implementation NSMutableAttributedString (PPMakeSupport)

+ (NSMutableAttributedString *)ppmake_attributedStringWithMake:(void (^)(PPMutAttributedStringMaker * _Nonnull))make str:(NSString *)str
{
    PPMutAttributedStringMaker *asMaker = [[PPMutAttributedStringMaker alloc] init];
    NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc] initWithString:str];
    asMaker.mutAttrbutedStr = mutStr;
    if (make) {
        make(asMaker);
    }
    return mutStr;
}

- (NSRange)ppmake_allRange
{
    return NSMakeRange(0, self.length);
}

/**
 * 配置指定范围（range）内单个属性（NSAttributedStringKey）的值（value）
 * 参考"NSAttributedString+YYText.h"
 */
- (void)ppmake_setAttribute:(NSAttributedStringKey)name value:(id)value range:(NSRange)range
{
    if (!name || [name isKindOfClass:[NSNull class]]) {
        return;
    }
    if (value && ![value isKindOfClass:[NSNull class]]) {
        [self addAttribute:name value:value range:range];
    }else{
        //如果value都没有了，就移除
        [self removeAttribute:name range:range];
    }
}

- (void)ppmake_setAttribute:(NSAttributedStringKey)name value:(id)value
{
    [self ppmake_setAttribute:name value:value range:self.ppmake_allRange];
}

/**
 * 字体
 * 默认值：UIFont, Helvetica(Neue) 12
 */
- (UIFont *)ppmake_font
{
    return (UIFont *)[self attributeFromKey:NSFontAttributeName];
}

- (void)setPpmake_font:(UIFont *)ppmake_font
{
    [self ppmake_setFont:ppmake_font range:self.ppmake_allRange];
}

- (void)ppmake_setFont:(UIFont *)font range:(NSRange)range
{
    [self ppmake_setAttribute:NSFontAttributeName value:font range:range];
}

#pragma mark 🐴--- 颜色相关 🔴🔴🔴🔜🔜🔜🔜🔜🔜
/**
 * 文字颜色
 * 默认值：UIColor, default blackColor
 */
//@property(nonatomic,strong,readwrite) UIColor *ppmake_color;
- (UIColor *)ppmake_color
{
    return (UIColor *)[self attributeFromKey:NSForegroundColorAttributeName];
}

- (void)setPpmake_color:(UIColor *)ppmake_color
{
    [self ppmake_setColor:ppmake_color range:self.ppmake_allRange];
}

- (void)ppmake_setColor:(UIColor *)color range:(NSRange)range
{
    [self ppmake_setAttribute:NSForegroundColorAttributeName value:color range:range];
}

#pragma mark --- 内部的方法
- (id)attributeFromKey:(NSAttributedStringKey)attrName
{
    if (self.length == 0 || !attrName) {
        return nil;
    }
    NSRange allRange = self.ppmake_allRange;
    return [self attribute:attrName atIndex:0 effectiveRange:&allRange];
}


#pragma mark 🐴--- 段落相关 🔱🔱🔱🔜🔜🔜🔜🔜🔜
/**
 * 段落属性（是个模型，里面又嵌套很多具体的属性：行间距（lineSpacing）、段落间距、首行缩进个等）
 * 默认值：NSParagraphStyle, default defaultParagraphStyle
 */
- (NSParagraphStyle *)ppmake_paragraphStyle
{
    return [self attributeFromKey:NSParagraphStyleAttributeName];
}

- (void)setPpmake_paragraphStyle:(NSParagraphStyle *)ppmake_paragraphStyle
{
    [self ppmake_setParagraphStyle:ppmake_paragraphStyle range:self.ppmake_allRange];
}

- (void)ppmake_setParagraphStyle:(NSParagraphStyle *)paragraphStyle range:(NSRange)range
{
    [self ppmake_setAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
}

#define KMakerParagraphStyleGet(_attr_) \
NSParagraphStyle *ps = self.ppmake_paragraphStyle; \
    if (!ps) { \
       ps = [NSParagraphStyle defaultParagraphStyle]; \
    } \
return ps._attr_;

#define KMakerParagraphStyleSet(_attr_) \
[self enumerateAttribute:NSParagraphStyleAttributeName \
                 inRange:range \
                 options:kNilOptions \
              usingBlock:^(NSParagraphStyle *value, NSRange range, BOOL * _Nonnull stop) { \
                  NSMutableParagraphStyle *paragraphStyle = nil; \
                  if (value) { \
                      if (value._attr_ == _attr_) { \
                          return; \
                      } \
                      if ([value isKindOfClass:[NSMutableParagraphStyle class]]) { \
                          paragraphStyle = (NSMutableParagraphStyle *)value; \
                      }else{ \
                          paragraphStyle = [value mutableCopy]; \
                      } \
                  }else{ \
                      if ([NSParagraphStyle defaultParagraphStyle]._attr_ == _attr_) { \
                          return; \
                      } \
                      paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy]; \
                  } \
                  paragraphStyle._attr_ = _attr_; \
                  [self ppmake_setParagraphStyle:paragraphStyle range:range]; \
              }];


/** 文字行间距 */
- (CGFloat)ppmake_lineSpacing
{
    KMakerParagraphStyleGet(lineSpacing);
}
- (void)setPpmake_lineSpacing:(CGFloat)ppmake_lineSpacing
{
    [self ppmake_setLineSpacing:ppmake_lineSpacing range:self.ppmake_allRange];
}
- (void)ppmake_setLineSpacing:(CGFloat)lineSpacing range:(NSRange)range
{
    KMakerParagraphStyleSet(lineSpacing);
}

/** 文字间距（水平）*/
- (NSNumber *)ppmake_kern
{
    return [self attributeFromKey:NSKernAttributeName];
}

- (void)setPpmake_kern:(NSNumber *)ppmake_kern
{
    [self ppmake_setKern:ppmake_kern range:self.ppmake_allRange];
}

- (void)ppmake_setKern:(NSNumber *)kern range:(NSRange)range
{
    [self ppmake_setAttribute:NSKernAttributeName value:kern range:range];
}

//特殊文字处理
- (void)ppmake_specialText:(NSString *)specialText specialFont:(UIFont *)specialFont specialColor:(UIColor *)specialColor
{
    if (specialText && specialText.length > 0 && [self.string containsString:specialText]) {
        NSRange specialRange = [self.string rangeOfString:specialText];
        if (specialFont) {
            [self ppmake_setFont:specialFont range:specialRange];
        }
        if (specialColor) {
            [self ppmake_setColor:specialColor range:specialRange];
        }
    }
}

- (void)ppmake_specialTextArray:(NSArray<NSString *> *)specialTextArray specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray
{
    if (specialTextArray.count > 0) {
        for (int i = 0; i<specialTextArray.count; i++) {
            NSString *aSpecialStr = specialTextArray[i];
            if (!aSpecialStr) { continue; }
            NSMutableArray *resultArrs = [self getOneSpecialTextRangeArrWithSpecialText:aSpecialStr allText:self.string];
            for (int j = 0; j<resultArrs.count; j++) {
                NSTextCheckingResult *result = resultArrs[j];
                if (specialTextColorArray.count > i) {
                    id aSpecialTextColor = specialTextColorArray[i];
                    if (aSpecialTextColor && [aSpecialTextColor isKindOfClass:[UIColor class]]) {
                        [self ppmake_setColor:aSpecialTextColor range:result.range];
                    }
                }
                if (specialTextFontArray.count > i) {
                    UIFont *aFont = specialTextFontArray[i];
                    [self ppmake_setFont:aFont range:result.range];
                }
            }
            
        }
    }
}

- (NSMutableArray <NSTextCheckingResult *>*)getOneSpecialTextRangeArrWithSpecialText:(NSString *)specialText allText:(NSString *)allText
{
    if (specialText.length == 0 || allText.length == 0) {
        return nil;
    }
    NSMutableArray *rangeArrs = [NSMutableArray array];
    NSRange totalRange = NSMakeRange(0, allText.length);
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:specialText options:(NSRegularExpressionIgnoreMetacharacters) error:nil];
    [regularExpression enumerateMatchesInString:allText options:0 range:totalRange usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        [rangeArrs addObject:result];
    }];
    return rangeArrs;
}

@end


@implementation PPMutAttributedStringMaker

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

