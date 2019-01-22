//
//  UIImage+PPMakeSupport.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/2.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PPMakeSupport)

+ (UIImage *)ppmake_imageWithColor:(UIColor *)color;

+ (UIImage *)ppmake_imageWithColor:(UIColor *)color
                             size:(CGSize)size;
@end


@interface UIImage (PPMakeStretchImage)
/*
 * 拉伸图片，得到一个新的图片
 */
+ (UIImage *)ppmake_imageByStretchWithOriginalImageName:(NSString *)originalImageName capInsets:(UIEdgeInsets)capInsets;
/*
 * 拉伸图片，得到一个新的图片 （默认，上下左右都是5）
 */
+ (UIImage *)ppmake_imageByStretchWithOriginalImageName:(NSString *)originalImageName;
@end
