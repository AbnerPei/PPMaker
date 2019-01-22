//
//  UIImage+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/2.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIImage+PPMakeSupport.h"

@implementation UIImage (PPMakeSupport)
+ (UIImage *)ppmake_imageWithColor:(UIColor *)color
{
    return [UIImage ppmake_imageWithColor:color size:CGSizeMake(1, 1)];
}
+ (UIImage *)ppmake_imageWithColor:(UIColor *)color
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

@implementation UIImage (PPMakeStretchImage)
+ (UIImage *)ppmake_imageByStretchWithOriginalImageName:(NSString *)originalImageName capInsets:(UIEdgeInsets)capInsets
{
    if (!originalImageName || originalImageName.length == 0) {
        return nil;
    }
    UIImage *image = [UIImage imageNamed:originalImageName];
    // 指定为拉伸模式，伸缩后重新赋值
    image = [image resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch];
    return image;
}
+ (UIImage *)ppmake_imageByStretchWithOriginalImageName:(NSString *)originalImageName
{
    return [UIImage ppmake_imageByStretchWithOriginalImageName:originalImageName capInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
}
@end
