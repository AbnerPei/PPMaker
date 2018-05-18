//
//  PPLabelMaker.m
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPLabelMaker.h"

@interface PPLabelMaker ()
/** 要创建的UILabel对象 */
@property(nonatomic,strong) UILabel *creatingLB;
@end

@implementation PPLabelMaker
-(UILabel *)lb
{
    return self.creatingLB;
}
#pragma mark --- 父视图
-(PPLabelMaker *(^)(UIView *))intoView
{
    return ^PPLabelMaker *(UIView *superV){
        if (superV) {
            [superV addSubview:self.creatingLB];
        }
        return self;
    };
}
#pragma mark --- frame
-(PPLabelMaker *(^)(CGRect))frame
{
    return ^PPLabelMaker *(CGRect frame){
        self.creatingLB.frame = frame;
        return self;
    };
}
#pragma mark --- 背景色
-(PPLabelMaker *(^)(UIColor *))bgColor
{
    return ^PPLabelMaker *(UIColor *color){
        self.creatingLB.backgroundColor = color;
        return self;
    };
}
#pragma mark --- 文字
-(PPLabelMaker *(^)(NSString *))text
{
    return ^PPLabelMaker *(NSString *text){
        self.creatingLB.text = text;
        return self;
    };
}
#pragma mark --- attributedText
-(PPLabelMaker *(^)(NSAttributedString *))attributedText
{
    return ^PPLabelMaker *(NSAttributedString *aStr){
        self.creatingLB.attributedText = aStr;
        return self;
    };
}
#pragma mark --- 字体颜色
-(PPLabelMaker *(^)(UIColor *))textColor
{
    return ^PPLabelMaker *(UIColor *color){
        self.creatingLB.textColor = color;
        return self;
    };
}
#pragma mark --- font
-(PPLabelMaker *(^)(UIFont *))font
{
    return ^PPLabelMaker *(UIFont *font){
        self.creatingLB.font = font;
        return self;
    };
}
-(PPLabelMaker *(^)(CGFloat))fontSize
{
    return ^PPLabelMaker *(CGFloat fontSize){
        self.creatingLB.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}
-(PPLabelMaker *(^)(CGFloat))boldFontSize
{
    return ^PPLabelMaker *(CGFloat boldFontSize){
        self.creatingLB.font = [UIFont boldSystemFontOfSize:boldFontSize];
        return self;
    };
}
-(PPLabelMaker *(^)(NSString *, CGFloat))fontNameAndSize
{
    return ^PPLabelMaker *(NSString *fontName,CGFloat fontSize){
        self.creatingLB.font = [UIFont fontWithName:fontName size:fontSize];
        return self;
    };
}
#pragma mark --- 文字对齐方式
-(PPLabelMaker *(^)(NSTextAlignment))textAlignment
{
    return ^PPLabelMaker *(NSTextAlignment textAlignment){
        self.creatingLB.textAlignment = textAlignment;
        return self;
    };
}
#pragma mark --- numberOfLines
-(PPLabelMaker *(^)(NSInteger))numberOfLines
{
    return ^PPLabelMaker *(NSInteger numberOfLines){
        self.creatingLB.numberOfLines = numberOfLines;
        return self;
    };
}
#pragma mark --- 尾巴
-(PPLabelMaker *(^)(NSLineBreakMode))lineBreakMode
{
    return ^PPLabelMaker *(NSLineBreakMode lineBreakMode){
        self.creatingLB.lineBreakMode = lineBreakMode;
        return self;
    };
}
#pragma mark --- 是否允许用户交互
-(PPLabelMaker *(^)(BOOL))userInteractionEnabled
{
    return ^PPLabelMaker *(BOOL userInteractionEnabled){
        self.creatingLB.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}


#pragma mark --- 懒加载
-(UILabel *)creatingLB
{
    if (!_creatingLB) {
        _creatingLB = [[UILabel alloc]init];
    }
    return _creatingLB;
}
@end

@implementation UILabel (PPMaker)
+(UILabel *)pp_lbMake:(void (^)(PPLabelMaker *))make
{
    PPLabelMaker *lbMaker = [[PPLabelMaker alloc]init];
    if (make) {
        make(lbMaker);
    }
    return lbMaker.creatingLB;
}
@end
