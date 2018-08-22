//
//  UIImage+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/2.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIImage+PPMakeSupport.h"

@implementation UIImage (PPMakeSupport)
+(UIImage *)ppmake_imageWithColor:(UIColor *)color
{
    return [UIImage ppmake_imageWithColor:color size:CGSizeMake(1, 1)];
}
+(UIImage *)ppmake_imageWithColor:(UIColor *)color
                             size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
