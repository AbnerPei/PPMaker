//
//  PPLabelMaker.m
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPLabelMaker.h"
#define PPLbMakerStrongSelf(type)  __strong typeof(type) type = weak##type;

@interface PPLabelMaker ()
/** 要创建的UILabel对象 */
@property(nonatomic,strong) UILabel *creatingLB;
@end

@implementation PPLabelMaker

-(instancetype)init
{
    self = [super init];
    if (self) {
    
        __weak typeof(self) weakself = self;
        //父视图
        _intoView = ^PPLabelMaker *(UIView *superV){
            PPLbMakerStrongSelf(self)
            if (superV) {
                [superV addSubview:self.creatingLB];
            }
            return self;
        };
        
        //frame
        _frame = ^PPLabelMaker *(CGRect frame){
            PPLbMakerStrongSelf(self)
            self.creatingLB.frame = frame;
            return self;
        };
        
        //背景色
        _bgColor = ^PPLabelMaker *(UIColor *color){
            PPLbMakerStrongSelf(self)
            self.creatingLB.backgroundColor = color;
            return self;
        };
        //字体颜色
        _textColor = ^PPLabelMaker *(UIColor *color){
            PPLbMakerStrongSelf(self)
            self.creatingLB.textColor = color;
            return self;
        };
        //文字
        _text = ^PPLabelMaker *(NSString *text){
            PPLbMakerStrongSelf(self)
            self.creatingLB.text = text;
            return self;
        };
        _attributedText = ^PPLabelMaker *(NSAttributedString *aStr){
            PPLbMakerStrongSelf(self)
            self.creatingLB.attributedText = aStr;
            return self;
        };
        
        //font
        _font = ^PPLabelMaker *(UIFont *font){
            PPLbMakerStrongSelf(self)
            self.creatingLB.font = font;
            return self;
        };
        _fontSize = ^PPLabelMaker *(CGFloat fontSize){
            PPLbMakerStrongSelf(self)
            self.creatingLB.font = [UIFont systemFontOfSize:fontSize];
            return self;
        };
        _boldFontSize = ^PPLabelMaker *(CGFloat boldFontSize){
            PPLbMakerStrongSelf(self)
            self.creatingLB.font = [UIFont boldSystemFontOfSize:boldFontSize];
            return self;
        };
        _fontNameAndSize = ^PPLabelMaker *(NSString *fontName,CGFloat fontSize){
            PPLbMakerStrongSelf(self)
            self.creatingLB.font = [UIFont fontWithName:fontName size:fontSize];
            return self;
        };
        
        
        
        //对齐方式
        _textAlignment = ^PPLabelMaker *(NSTextAlignment textAlignment){
            PPLbMakerStrongSelf(self)
            self.creatingLB.textAlignment = textAlignment;
            return self;
        };
        
        //numberOfLines
        _numberOfLines = ^PPLabelMaker *(NSInteger numberOfLines){
            PPLbMakerStrongSelf(self)
            self.creatingLB.numberOfLines = numberOfLines;
            return self;
        };
        
        
        
    }
    return self;
}

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
