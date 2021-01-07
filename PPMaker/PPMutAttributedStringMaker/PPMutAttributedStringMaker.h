//
//  PPMutAttributedStringMaker.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPMutAttributedStringMaker : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithStr:(NSString *)str;

@property (nonatomic, strong, readonly, nullable) NSMutableAttributedString *attributedString;

/** 字体 */
@property (nonatomic, copy, readonly) PPMutAttributedStringMaker *(^font)(UIFont *font);
@property (nonatomic, copy, readonly) PPMutAttributedStringMaker *(^fontRange)(UIFont *font,NSRange range);

/** 文字颜色 */
@property (nonatomic, copy, readonly) PPMutAttributedStringMaker *(^textColor)(UIColor *textColor);
@property (nonatomic, copy, readonly) PPMutAttributedStringMaker *(^textColorRange)(UIColor *textColor,NSRange range);

/** 段落 */
@property (nonatomic, copy, readonly) PPMutAttributedStringMaker *(^paragraphStyle)(NSParagraphStyle *paragraphStyle);
@property (nonatomic, copy, readonly) PPMutAttributedStringMaker *(^paragraphStyleRange)(NSParagraphStyle *paragraphStyle,NSRange range);

//行间距(竖直)
@property (nonatomic, copy, readonly) PPMutAttributedStringMaker *(^lineSpacing)(CGFloat lineSpacing);
@property (nonatomic, copy, readonly) PPMutAttributedStringMaker *(^lineSpacingRange)(CGFloat lineSpacing,NSRange range);

//字间距(横向) 次数注意参数类型为NSNumber.
@property (nonatomic, copy, readonly) PPMutAttributedStringMaker *(^kern)(NSNumber *kern);
@property (nonatomic, copy, readonly) PPMutAttributedStringMaker *(^kernRange)(NSNumber *kern,NSRange range);

/**
 *【only one】某个指定的特别字符串处理
 * ☠☠☠ 注意: 就算有多个相同的字符串，也只处理第一个☠☠☠
 */
@property (nonatomic, copy, readonly) PPMutAttributedStringMaker *(^specialText)(NSString *specialText,UIFont *specialFont,UIColor *specialColor);

/**
 *【one or more】某些指定的字符串快速处理集合, ☆☆ 数组个数最好相同 ☆☆ 。
 */
@property (nonatomic, copy, readonly) PPMutAttributedStringMaker *(^specialTextSet)(NSArray<NSString *> *specialTextArray,NSArray<UIFont *> *specialTextFontArray,NSArray<UIColor *> *specialTextColorArray);

@end

NS_ASSUME_NONNULL_END
