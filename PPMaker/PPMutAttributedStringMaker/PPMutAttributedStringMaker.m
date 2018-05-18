//
//  PPMutAttributedStringMaker.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMutAttributedStringMaker.h"

@interface PPMutAttributedStringMaker ()
@property(nonatomic,strong) NSMutableAttributedString *mutAttrbutedStr;
@end

@implementation PPMutAttributedStringMaker
#pragma mark --- 字体
-(PPMutAttributedStringMaker *(^)(UIFont *))font
{
    return ^PPMutAttributedStringMaker *(UIFont *f){
        if (f) {
            self.mutAttrbutedStr.maker_font = f;
        }
        return self;
    };
}
-(PPMutAttributedStringMaker *(^)(UIFont *, NSRange))fontRange
{
    return ^PPMutAttributedStringMaker *(UIFont *f,NSRange r){
        if (f) {
            [self.mutAttrbutedStr maker_setFont:f range:r];
        }
        return self;
    };
}
#pragma mark --- 颜色
-(PPMutAttributedStringMaker *(^)(UIColor *))textColor
{
    return ^PPMutAttributedStringMaker *(UIColor *tc){
        if (tc) {
            self.mutAttrbutedStr.maker_color = tc;
        }
        return self;
    };
}
-(PPMutAttributedStringMaker *(^)(UIColor *, NSRange))textColorRange
{
    return ^PPMutAttributedStringMaker *(UIColor *tc,NSRange r){
        if (tc) {
            [self.mutAttrbutedStr maker_setColor:tc range:r];
        }
        return self;
    };
}
#pragma mark --- 段落
-(PPMutAttributedStringMaker *(^)(NSParagraphStyle *))paragraphStyle
{
    return ^PPMutAttributedStringMaker *(NSParagraphStyle *ps){
        if (ps) {
            self.mutAttrbutedStr.maker_paragraphStyle = ps;
        }
        return self;
    };
}
-(PPMutAttributedStringMaker *(^)(NSParagraphStyle *, NSRange))paragraphStyleRange
{
    return ^PPMutAttributedStringMaker *(NSParagraphStyle *ps,NSRange r){
        if (ps) {
            [self.mutAttrbutedStr maker_setParagraphStyle:ps range:r];
        }
        return self;
    };
}
#pragma mark --- 行间距
-(PPMutAttributedStringMaker *(^)(CGFloat))lineSpacing
{
    return ^PPMutAttributedStringMaker *(CGFloat ls){
        self.mutAttrbutedStr.maker_lineSpacing = ls;
        return self;
    };
}
-(PPMutAttributedStringMaker *(^)(CGFloat, NSRange))lineSpacingRange
{
    return ^PPMutAttributedStringMaker *(CGFloat ls,NSRange r){
        [self.mutAttrbutedStr maker_setLineSpacing:ls range:r];
        return self;
    };;
}
#pragma mark --- 字间距
-(PPMutAttributedStringMaker *(^)(NSNumber *))kern
{
    return ^PPMutAttributedStringMaker *(NSNumber *k){
        self.mutAttrbutedStr.maker_kern = k;
        return self;
    };
}
-(PPMutAttributedStringMaker *(^)(NSNumber *, NSRange))kernRange
{
    return ^PPMutAttributedStringMaker *(NSNumber *k,NSRange r){
        [self.mutAttrbutedStr maker_setKern:k range:r];
        return self;
    };
}
#pragma mark --- 某个特别文字处理
-(PPMutAttributedStringMaker *(^)(NSString *, UIFont *, UIColor *))specialText
{
    return ^PPMutAttributedStringMaker *(NSString *specialText,UIFont *specialFont,UIColor *specialColor){
        [self.mutAttrbutedStr maker_specialText:specialText specialFont:specialFont specialColor:specialColor];
        return self;
    };
}
#pragma mark --- 特别文字统一处理
-(PPMutAttributedStringMaker *(^)(NSArray<NSString *> *, NSArray<UIFont *> *, NSArray<UIColor *> *))specialTextSet
{
    return ^PPMutAttributedStringMaker *(NSArray<NSString *> *specialTextArray,NSArray<UIFont *> *specialTextFontArray,NSArray<UIColor *> *specialTextColorArray){
        [self.mutAttrbutedStr maker_specialTextArray:specialTextArray specialTextFontArray:specialTextFontArray specialTextColorArray:specialTextColorArray];
        return self;
    };
}


@end

@implementation NSMutableAttributedString (PPMaker)
+(NSMutableAttributedString *)pp_attributedStringMake:(void (^)(PPMutAttributedStringMaker *))make str:(NSString *)str
{
    PPMutAttributedStringMaker *asMaker = [[PPMutAttributedStringMaker alloc]init];
    asMaker.mutAttrbutedStr = [[NSMutableAttributedString alloc]initWithString:str];
    
    if (make) {
        make(asMaker);
    }
    return asMaker.mutAttrbutedStr;
}

-(NSRange)maker_allRange
{
    return NSMakeRange(0, self.length);
}

/**
 * 配置指定范围（range）内单个属性（NSAttributedStringKey）的值（value）
 * 参考"NSAttributedString+YYText.h"
 */
-(void)maker_setAttribute:(NSAttributedStringKey)name value:(id)value range:(NSRange)range
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
-(void)maker_setAttribute:(NSAttributedStringKey)name value:(id)value
{
    [self maker_setAttribute:name value:value range:self.maker_allRange];
}
/**
 * 字体
 * 默认值：UIFont, Helvetica(Neue) 12
 */
//@property(nonatomic,strong,readwrite) UIFont *maker_font;
-(UIFont *)maker_font
{
    return (UIFont *)[self attributeFromKey:NSFontAttributeName];
}
-(void)setMaker_font:(UIFont *)maker_font
{
    [self maker_setFont:maker_font range:self.maker_allRange];
}
-(void)maker_setFont:(UIFont *)font range:(NSRange)range
{
    [self maker_setAttribute:NSFontAttributeName value:font range:range];
}

#pragma mark 🐴--- 颜色相关 🔴🔴🔴🔜🔜🔜🔜🔜🔜
/**
 * 文字颜色
 * 默认值：UIColor, default blackColor
 */
//@property(nonatomic,strong,readwrite) UIColor *maker_color;
-(UIColor *)maker_color
{
    return (UIColor *)[self attributeFromKey:NSForegroundColorAttributeName];
}
-(void)setMaker_color:(UIColor *)maker_color
{
    [self maker_setColor:maker_color range:self.maker_allRange];
}
-(void)maker_setColor:(UIColor *)color range:(NSRange)range
{
    [self maker_setAttribute:NSForegroundColorAttributeName value:color range:range];
}

#pragma mark --- 内部的方法
-(id)attributeFromKey:(NSAttributedStringKey)attrName
{
    if (self.length == 0 || !attrName) {
        return nil;
    }
    NSRange allRange = self.maker_allRange;
    return [self attribute:attrName atIndex:0 effectiveRange:&allRange];
}


#pragma mark 🐴--- 段落相关 🔱🔱🔱🔜🔜🔜🔜🔜🔜
/**
 * 段落属性（是个模型，里面又嵌套很多具体的属性：行间距（lineSpacing）、段落间距、首行缩进个等）
 * 默认值：NSParagraphStyle, default defaultParagraphStyle
 */
-(NSParagraphStyle *)maker_paragraphStyle
{
    return [self attributeFromKey:NSParagraphStyleAttributeName];
}
-(void)setMaker_paragraphStyle:(NSParagraphStyle *)maker_paragraphStyle
{
    [self maker_setParagraphStyle:maker_paragraphStyle range:self.maker_allRange];
}
-(void)maker_setParagraphStyle:(NSParagraphStyle *)paragraphStyle range:(NSRange)range
{
    [self maker_setAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
}
#define KMakerParagraphStyleGet(_attr_) \
NSParagraphStyle *ps = self.maker_paragraphStyle; \
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
                  [self maker_setParagraphStyle:paragraphStyle range:range]; \
              }];


/** 文字行间距 */
-(CGFloat)maker_lineSpacing
{
    KMakerParagraphStyleGet(lineSpacing);
}
-(void)setMaker_lineSpacing:(CGFloat)maker_lineSpacing
{
    [self maker_setLineSpacing:maker_lineSpacing range:self.maker_allRange];
}
-(void)maker_setLineSpacing:(CGFloat)lineSpacing range:(NSRange)range
{
    KMakerParagraphStyleSet(lineSpacing);
}

/** 文字间距（水平）*/
-(NSNumber *)maker_kern
{
    return [self attributeFromKey:NSKernAttributeName];
}
-(void)setMaker_kern:(NSNumber *)maker_kern
{
    [self maker_setKern:maker_kern range:self.maker_allRange];
}

-(void)maker_setKern:(NSNumber *)kern range:(NSRange)range
{
    [self maker_setAttribute:NSKernAttributeName value:kern range:range];
}

//特殊文字处理
-(void)maker_specialText:(NSString *)specialText specialFont:(UIFont *)specialFont specialColor:(UIColor *)specialColor
{
    if (specialText && specialText.length > 0 && [self.string containsString:specialText]) {
        NSRange specialRange = [self.string rangeOfString:specialText];
        if (specialFont) {
            [self maker_setFont:specialFont range:specialRange];
        }
        if (specialColor) {
            [self maker_setColor:specialColor range:specialRange];
        }
    }
}

-(void)maker_specialTextArray:(NSArray<NSString *> *)specialTextArray specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray
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
                        [self maker_setColor:aSpecialTextColor range:result.range];
                    }
                }
                if (specialTextFontArray.count > i) {
                    UIFont *aFont = specialTextFontArray[i];
                    [self maker_setFont:aFont range:result.range];
                }
            }
            
        }
    }
}
-(NSMutableArray <NSTextCheckingResult *>*)getOneSpecialTextRangeArrWithSpecialText:(NSString *)specialText allText:(NSString *)allText
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
