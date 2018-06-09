//
//  PPMake+UILabel.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake+UILabel.h"

@implementation PPMake (UILabel)
#pragma mark --- 文字
-(PPMake *(^)(NSString *))text
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(NSString *text){
        UILabel *lb = (UILabel *)self.createdView;
        lb.text = text;
        return self;
    };
}
#pragma mark --- attributedText
-(PPMake *(^)(NSAttributedString *))attributedText
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(NSAttributedString *aStr){
        UILabel *lb = (UILabel *)self.createdView;
        lb.attributedText = aStr;
        return self;
    };
}
#pragma mark --- 字体颜色
-(PPMake *(^)(UIColor *))textColor
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(UIColor *color){
        UILabel *lb = (UILabel *)self.createdView;
        lb.textColor = color;
        return self;
    };
}
#pragma mark --- font
-(PPMake *(^)(UIFont *))font
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(UIFont *font){
        UILabel *lb = (UILabel *)self.createdView;
        lb.font = font;
        return self;
    };
}
-(PPMake *(^)(CGFloat))fontSize
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(CGFloat fontSize){
        UILabel *lb = (UILabel *)self.createdView;
        lb.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}
-(PPMake *(^)(CGFloat))boldFontSize
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(CGFloat boldFontSize){
        UILabel *lb = (UILabel *)self.createdView;
        lb.font = [UIFont boldSystemFontOfSize:boldFontSize];
        return self;
    };
}
-(PPMake *(^)(NSString *, CGFloat))fontNameAndSize
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(NSString *fontName,CGFloat fontSize){
        UILabel *lb = (UILabel *)self.createdView;
        lb.font = [UIFont fontWithName:fontName size:fontSize];
        return self;
    };
}
#pragma mark --- 文字对齐方式
-(PPMake *(^)(NSTextAlignment))textAlignment
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(NSTextAlignment textAlignment){
        UILabel *lb = (UILabel *)self.createdView;
        lb.textAlignment = textAlignment;
        return self;
    };
}
#pragma mark --- numberOfLines
-(PPMake *(^)(NSInteger))numberOfLines
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(NSInteger numberOfLines){
        UILabel *lb = (UILabel *)self.createdView;
        lb.numberOfLines = numberOfLines;
        return self;
    };
}
#pragma mark --- 尾巴
-(PPMake *(^)(NSLineBreakMode))lineBreakMode
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(NSLineBreakMode lineBreakMode){
        UILabel *lb = (UILabel *)self.createdView;
        lb.lineBreakMode = lineBreakMode;
        return self;
    };
}
@end
