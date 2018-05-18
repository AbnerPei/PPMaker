//
//  PPViewMaker.m
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPViewMaker.h"

@interface PPViewMaker ()
/** 要创建的view */
@property(nonatomic,strong) UIView *creatingView;

@end

@implementation PPViewMaker

#pragma mark --- 父视图
-(PPViewMaker *(^)(UIView *))intoView
{
    return ^PPViewMaker *(UIView *superV){
        if (superV) {
            [superV addSubview:self.creatingView];
        }
        return self;
    };
}
#pragma mark --- frame
-(PPViewMaker *(^)(CGRect))frame
{
    return ^PPViewMaker *(CGRect frame){
        self.creatingView.frame = frame;
        return self;
    };
}
#pragma mark --- 背景色
-(PPViewMaker *(^)(UIColor *))bgColor
{
    return ^PPViewMaker *(UIColor *color){
        self.creatingView.backgroundColor = color;
        return self;
    };
}
-(PPViewMaker *(^)(CGFloat))cornerRadius
{
    return ^PPViewMaker *(CGFloat cornerRadius){
        self.creatingView.layer.cornerRadius = cornerRadius;
        return self;
    };
}


#pragma mark --- 懒加载
-(UIView *)creatingView
{
    if (!_creatingView) {
        _creatingView = [[UIView alloc]init];
    }
    return _creatingView;
}


@end

@implementation UIView (PPMaker)
+(UIView *)pp_viewMake:(void (^)(PPViewMaker *))make
{
    PPViewMaker *viewMaker = [[PPViewMaker alloc]init];
    if (make) {
        make(viewMaker);
    }
    return viewMaker.creatingView;
}

@end


