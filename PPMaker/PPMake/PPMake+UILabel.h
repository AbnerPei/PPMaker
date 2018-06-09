//
//  PPMake+UILabel.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake.h"

@interface PPMake (UILabel)

@property(nonatomic,copy,readonly) PPMake *(^text)(NSString *text);
/**
 *【UILabel】设置UILabel的attributedText。【♘♘♘ 注意区分button的attributedString。】
 */
@property(nonatomic,copy,readonly) PPMake *(^attributedText)(NSAttributedString *attributedText);
@property(nonatomic,copy,readonly) PPMake *(^textColor)(UIColor *textColor);
@property(nonatomic,copy,readonly) PPMake *(^font)(UIFont *font);
@property(nonatomic,copy,readonly) PPMake *(^fontSize)(CGFloat fontSize);
@property(nonatomic,copy,readonly) PPMake *(^boldFontSize)(CGFloat boldFontSize);
@property(nonatomic,copy,readonly) PPMake *(^fontNameAndSize)(NSString *fontName,CGFloat fontSize);
@property(nonatomic,copy,readonly) PPMake *(^textAlignment)(NSTextAlignment textAlignment);
@property(nonatomic,copy,readonly) PPMake *(^numberOfLines)(NSInteger numberOfLines);
/**
 NSLineBreakByTruncatingHead,     // Truncate at head of line: "...wxyz"
 NSLineBreakByTruncatingTail,     // Truncate at tail of line: "abcd..."  默认
 NSLineBreakByTruncatingMiddle    // Truncate middle of line:  "ab...yz"
 */
@property(nonatomic,copy,readonly) PPMake *(^lineBreakMode)(NSLineBreakMode lineBreakMode);
@end
