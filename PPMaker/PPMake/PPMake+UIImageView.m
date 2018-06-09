//
//  PPMake+UIImageView.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake+UIImageView.h"

#define PPMakeImgVAssert \
NSString *rStr = [NSString stringWithFormat:@"☠请注意☠:%@不是%@所拥有的属性！",NSStringFromSelector(_cmd),@"UIImageView *"]; \
NSAssert(self.makeType == PPMakeTypeImgV, rStr);

@implementation PPMake (UIImageView)
-(PPMake *(^)(UIImage *))image
{
    PPMakeImgVAssert
    return ^PPMake *(UIImage *image){
        UIImageView *imgV = (UIImageView *)self.createdView;
        imgV.image = image;
        return self;
    };
}
#pragma mark --- 图片名字
-(PPMake *(^)(NSString *))imageName
{
    PPMakeImgVAssert
    return ^PPMake *(NSString *imageName){
        UIImageView *imgV = (UIImageView *)self.createdView;
        if (imageName && imageName.length > 0) {
            imgV.image = [UIImage imageNamed:imageName];
        }
        return self;
    };
}

@end
