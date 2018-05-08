//
//  PPLabelMaker.m
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPLabelMaker.h"
#import "PPMaker.h"

@interface PPLabelMaker ()
/** 要创建的UILabel对象 */
@property(nonatomic,strong) UILabel *creatingLB;
@end

@implementation PPLabelMaker

-(instancetype)init
{
    self = [super init];
    if (self) {
    
        PPMakerWeakSelf(self)
        //父视图
        _intoView = ^PPLabelMaker *(UIView *superV){
            PPMakerStrongSelf(self)
            if (superV) {
                [superV addSubview:self.creatingLB];
            }
            return self;
        };
        
        //frame
        _frame = ^PPLabelMaker *(CGRect frame){
            PPMakerStrongSelf(self)
            self.creatingLB.frame = frame;
            return self;
        };
        
        //背景色
        _bgColor = ^PPLabelMaker *(UIColor *color){
            PPMakerStrongSelf(self)
            self.creatingLB.backgroundColor = color;
            return self;
        };
        //字体颜色
        _textColor = ^PPLabelMaker *(UIColor *color){
            PPMakerStrongSelf(self)
            self.creatingLB.textColor = color;
            return self;
        };
        //文字
        _text = ^PPLabelMaker *(NSString *text){
            PPMakerStrongSelf(self)
            self.creatingLB.text = text;
            return self;
        };
        
        //font
        _font = ^PPLabelMaker *(UIFont *font){
            PPMakerStrongSelf(self)
            self.creatingLB.font = font;
            return self;
        };
        _fontSize = ^PPLabelMaker *(CGFloat fontSize){
            PPMakerStrongSelf(self)
            self.creatingLB.font = [UIFont systemFontOfSize:fontSize];
            return self;
        };
        _boldFontSize = ^PPLabelMaker *(CGFloat boldFontSize){
            PPMakerStrongSelf(self)
            self.creatingLB.font = [UIFont boldSystemFontOfSize:boldFontSize];
            return self;
        };
        _fontNameAndSize = ^PPLabelMaker *(NSString *fontName,CGFloat fontSize){
            PPMakerStrongSelf(self)
            self.creatingLB.font = [UIFont fontWithName:fontName size:fontSize];
            return self;
        };
        
        
        
        //对齐方式
        _textAlignment = ^PPLabelMaker *(NSTextAlignment textAlignment){
            PPMakerStrongSelf(self)
            self.creatingLB.textAlignment = textAlignment;
            return self;
        };
        
        //numberOfLines
        _numberOfLines = ^PPLabelMaker *(NSInteger numberOfLines){
            PPMakerStrongSelf(self)
            self.creatingLB.numberOfLines = numberOfLines;
            return self;
        };
        
        
        
    }
    return self;
}

+(UILabel *)pp_lbMake:(void (^)(PPLabelMaker *))make
{
    PPLabelMaker *lbMaker = [[PPLabelMaker alloc]init];
    if (make) {
        make(lbMaker);
    }
    return lbMaker.creatingLB;
}
-(UILabel *)creatingLB
{
    if (!_creatingLB) {
        _creatingLB = [[UILabel alloc]init];
    }
    return _creatingLB;
}



@end
