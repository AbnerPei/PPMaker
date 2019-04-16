////
////  UILabel+PPMakeSupport.m
////  PPMakerExample
////
////  Created by ╰莪呮想好好宠Nǐつ on 2018/9/7.
////  Copyright © 2018年 PPAbner. All rights reserved.
////
//
//#import "UILabel+PPMakeSupport.h"
//
//@implementation UILabel (PPMakeSupport)
//
//@end
//
//
//@implementation UILabel (PPMakeCalculate)
//+ (CGFloat)ppmake_calculateWidthWithFont:(id)font
//                                 height:(CGFloat)height
//                                   text:(NSString *)text
//{
//    return _calculate(font, YES, height, text);
//    
//}
//+ (CGFloat)ppmake_calculateHeightWithFont:(id)font width:(CGFloat)width text:(NSString *)text
//{
//    return _calculate(font, NO, width, text);
//}
//
//static inline CGFloat _calculate(id font,BOOL isWidth,CGFloat xx,NSString *text){
//    if (!text || text.length == 0 || !font || xx <= 0) {
//        return 0;
//    }
//    UIFont *_font_ = [UIFont ppmake_font:font];
//    CGSize contentSize = isWidth ? CGSizeMake(CGFLOAT_MAX, xx):CGSizeMake(xx, CGFLOAT_MAX);
//    CGSize _size_ = [text boundingRectWithSize:contentSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:_font_} context:nil].size;
//    return isWidth ? _size_.width:_size_.height;
//}
//
//@end
