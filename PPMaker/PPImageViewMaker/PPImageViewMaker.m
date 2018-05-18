//
//  PPImageViewMaker.m
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPImageViewMaker.h"

@interface PPImageViewMaker ()
/** 要创建的imageView */
@property(nonatomic,strong) UIImageView *creatingImageView;
@end

@implementation PPImageViewMaker
#pragma mark --- 父视图
-(PPImageViewMaker *(^)(UIView *))intoView
{
    return ^PPImageViewMaker *(UIView *superV){
        if (superV) {
            [superV addSubview:self.creatingImageView];
        }
        return self;
    };
}
#pragma mark --- frame
-(PPImageViewMaker *(^)(CGRect))frame
{
    return ^PPImageViewMaker *(CGRect frame){
        self.creatingImageView.frame = frame;
        return self;
    };
}
#pragma mark --- 图片
-(PPImageViewMaker *(^)(UIImage *))image
{
    return ^PPImageViewMaker *(UIImage *image){
        self.creatingImageView.image = image;
        return self;
    };
}
#pragma mark --- 图片名字
-(PPImageViewMaker *(^)(NSString *))imageName
{
    return ^PPImageViewMaker *(NSString *imageName){
        if (imageName && imageName.length > 0) {
            self.creatingImageView.image = [UIImage imageNamed:imageName];
        }
        return self;
    };
}
#pragma mark --- 设置imageView的contentMode
-(PPImageViewMaker *(^)(UIViewContentMode))contentMode
{
    return ^PPImageViewMaker *(UIViewContentMode contentMode){
        self.creatingImageView.contentMode = contentMode;
        return self;
    };
}
-(PPImageViewMaker *(^)(BOOL))userInteractionEnabled
{
    return ^PPImageViewMaker *(BOOL userInteractionEnabled){
        self.creatingImageView.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

#pragma mark --- 懒加载
-(UIImageView *)creatingImageView
{
    if (!_creatingImageView) {
        _creatingImageView = [[UIImageView alloc]init];
        //此处默认值和系统的不一样
        _creatingImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _creatingImageView;
}
@end

@implementation UIImageView (PPMaker)
+(UIImageView *)pp_imgVMake:(void (^)(PPImageViewMaker *))make
{
    PPImageViewMaker *imgViewMaker = [[PPImageViewMaker alloc]init];
    if (make) {
        make(imgViewMaker);
    }
    return imgViewMaker.creatingImageView;
}
@end
