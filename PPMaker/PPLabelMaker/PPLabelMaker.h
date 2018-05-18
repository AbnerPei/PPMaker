//
//  PPLabelMaker.h
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//待处理：text 一个一个字显示

@interface PPLabelMaker : NSObject 

/** 创建的UILabel */
@property(nonatomic,strong,readonly) UILabel *lb;

@property(nonatomic,copy,readonly) PPLabelMaker *(^intoView)(UIView *superV);
@property(nonatomic,copy,readonly) PPLabelMaker *(^frame)(CGRect frame);

@property(nonatomic,copy,readonly) PPLabelMaker *(^bgColor)(UIColor *bgColor);
@property(nonatomic,copy,readonly) PPLabelMaker *(^text)(NSString *text);
@property(nonatomic,copy,readonly) PPLabelMaker *(^attributedText)(NSAttributedString *attributedText);
@property(nonatomic,copy,readonly) PPLabelMaker *(^textColor)(UIColor *textColor);


@property(nonatomic,copy,readonly) PPLabelMaker *(^font)(UIFont *font);
@property(nonatomic,copy,readonly) PPLabelMaker *(^fontSize)(CGFloat fontSize);
@property(nonatomic,copy,readonly) PPLabelMaker *(^boldFontSize)(CGFloat boldFontSize);
@property(nonatomic,copy,readonly) PPLabelMaker *(^fontNameAndSize)(NSString *fontName,CGFloat fontSize);

@property(nonatomic,copy,readonly) PPLabelMaker *(^textAlignment)(NSTextAlignment textAlignment);
@property(nonatomic,copy,readonly) PPLabelMaker *(^numberOfLines)(NSInteger numberOfLines);

/**
 NSLineBreakByTruncatingHead,     // Truncate at head of line: "...wxyz"
 NSLineBreakByTruncatingTail,     // Truncate at tail of line: "abcd..."  默认
 NSLineBreakByTruncatingMiddle    // Truncate middle of line:  "ab...yz"
 */
@property(nonatomic,copy,readonly) PPLabelMaker *(^lineBreakMode)(NSLineBreakMode lineBreakMode);

/** 默认NO */
@property(nonatomic,copy,readonly) PPLabelMaker *(^userInteractionEnabled)(BOOL userInteractionEnabled);


@end

@interface UILabel (PPMaker)
+(UILabel *)pp_lbMake:(void(^)(PPLabelMaker *maker))make;
@end


