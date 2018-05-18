//
//  PPMutAttributedStringMaker.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PPMutAttributedStringMaker : NSObject

/** 字体 */
@property(nonatomic,copy,readonly) PPMutAttributedStringMaker *(^font)(UIFont *font);
@property(nonatomic,copy,readonly) PPMutAttributedStringMaker *(^fontRange)(UIFont *font,NSRange range);

/** 文字颜色 */
@property(nonatomic,copy,readonly) PPMutAttributedStringMaker *(^textColor)(UIColor *textColor);
@property(nonatomic,copy,readonly) PPMutAttributedStringMaker *(^textColorRange)(UIColor *textColor,NSRange range);

/** 段落 */
@property(nonatomic,copy,readonly) PPMutAttributedStringMaker *(^paragraphStyle)(NSParagraphStyle *paragraphStyle);
@property(nonatomic,copy,readonly) PPMutAttributedStringMaker *(^paragraphStyleRange)(NSParagraphStyle *paragraphStyle,NSRange range);

//行间距(竖直)
@property(nonatomic,copy,readonly) PPMutAttributedStringMaker *(^lineSpacing)(CGFloat lineSpacing);
@property(nonatomic,copy,readonly) PPMutAttributedStringMaker *(^lineSpacingRange)(CGFloat lineSpacing,NSRange range);

//字间距(横向) 次数注意参数类型为NSNumber.
@property(nonatomic,copy,readonly) PPMutAttributedStringMaker *(^kern)(NSNumber *kern);
@property(nonatomic,copy,readonly) PPMutAttributedStringMaker *(^kernRange)(NSNumber *kern,NSRange range);

/**
 *【only one】某个指定的特别字符串处理
 * ☠☠☠ 注意: 就算有多个相同的字符串，也只处理第一个☠☠☠
 */
@property(nonatomic,copy,readonly) PPMutAttributedStringMaker *(^specialText)(NSString *specialText,UIFont *specialFont,UIColor *specialColor);

/**
 *【one or more】某些指定的字符串快速处理集合, ☆☆ 数组个数最好相同 ☆☆ 。
 */
@property(nonatomic,copy,readonly) PPMutAttributedStringMaker *(^specialTextSet)(NSArray<NSString *> *specialTextArray,NSArray<UIFont *> *specialTextFontArray,NSArray<UIColor *> *specialTextColorArray);

@end



@interface NSMutableAttributedString (PPMaker)
/**
 * 返回一个NSMutableAttributedString对象，同时要注意初始化时是需要一个非空str的。
 * 参考`NSAttributedString`的` - (instancetype)initWithString:(NSString *)str`方法;
 */
+(NSMutableAttributedString *)pp_attributedStringMake:(void(^)(PPMutAttributedStringMaker *maker))make str:(NSString * _Nonnull)str;

/** 整个字符串range */
@property(nonatomic,assign,readonly) NSRange maker_allRange;

/** 配置指定范围（range）内单个属性（NSAttributedStringKey）的值（value）*/
-(void)maker_setAttribute:(NSAttributedStringKey)name
                    value:(id)value
                    range:(NSRange)range;
/** 配置所有（allRange）内单个属性（NSAttributedStringKey）的值（value）*/
-(void)maker_setAttribute:(NSAttributedStringKey)name
                    value:(id)value;
/**
 * 字体
 * 默认值：UIFont, Helvetica(Neue) 12
 */
@property(nonatomic,strong,readwrite) UIFont *maker_font;
-(void)maker_setFont:(UIFont *)font range:(NSRange)range;


#pragma mark 🐴--- 颜色相关 🔴🔴🔴🔜🔜🔜🔜🔜🔜
/**
 * 文字颜色
 * 默认值：UIColor, default blackColor
 */
@property(nonatomic,strong,readwrite) UIColor *maker_color;
-(void)maker_setColor:(UIColor *)color range:(NSRange)range;


#pragma mark 🐴--- 段落相关 🔱🔱🔱🔜🔜🔜🔜🔜🔜
/**
 * 段落属性（是个模型，里面又嵌套很多具体的属性：行间距（lineSpacing）、段落间距、首行缩进个等）
 * 默认值：NSParagraphStyle, default defaultParagraphStyle
 */
@property(nonatomic,strong,readwrite) NSParagraphStyle *maker_paragraphStyle;
-(void)maker_setParagraphStyle:(NSParagraphStyle *)paragraphStyle range:(NSRange)range;

/** 文字行间距（竖直） */
@property(nonatomic,assign,readwrite) CGFloat maker_lineSpacing;
-(void)maker_setLineSpacing:(CGFloat)lineSpacing range:(NSRange)range;

/** 文字间距（水平）*/
@property(nonatomic,strong,readwrite) NSNumber *maker_kern;
-(void)maker_setKern:(NSNumber *)kern range:(NSRange)range;

/**
 *【only one】某个指定的特别字符串处理
 * ☠☠☠ 注意: 就算有多个相同的字符串，也只处理第一个☠☠☠
 */
-(void)maker_specialText:(NSString *)specialText
             specialFont:(UIFont *)specialFont
            specialColor:(UIColor *)specialColor;

/**
 *【one or more】某些指定的字符串快速处理集合, ☆☆ 数组个数最好相同 ☆☆ 。
 */
-(void)maker_specialTextArray:(NSArray<NSString *> *)specialTextArray
         specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray
        specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray;

@end
