//
//  PPLabelMaker.h
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PPLabelMaker : NSObject

@property(nonatomic,copy) PPLabelMaker *(^intoView)(UIView *superV);
@property(nonatomic,copy) PPLabelMaker *(^frame)(CGRect frame);

@property(nonatomic,copy) PPLabelMaker *(^bgColor)(UIColor *bgColor);
@property(nonatomic,copy) PPLabelMaker *(^textColor)(UIColor *textColor);
@property(nonatomic,copy) PPLabelMaker *(^text)(NSString *text);
@property(nonatomic,copy) PPLabelMaker *(^attributedText)(NSAttributedString *attributedText);


@property(nonatomic,copy) PPLabelMaker *(^font)(UIFont *font);
@property(nonatomic,copy) PPLabelMaker *(^fontSize)(CGFloat fontSize);
@property(nonatomic,copy) PPLabelMaker *(^boldFontSize)(CGFloat boldFontSize);
@property(nonatomic,copy) PPLabelMaker *(^fontNameAndSize)(NSString *fontName,CGFloat fontSize);

@property(nonatomic,copy) PPLabelMaker *(^textAlignment)(NSTextAlignment textAlignment);
@property(nonatomic,copy) PPLabelMaker *(^numberOfLines)(NSInteger numberOfLines);

@end

@interface UILabel (PPMaker)
+(UILabel *)pp_lbMake:(void(^)(PPLabelMaker *maker))make;
@end
