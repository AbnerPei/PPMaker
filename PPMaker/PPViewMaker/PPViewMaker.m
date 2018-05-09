//
//  PPViewMaker.m
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPViewMaker.h"
#define PPViewMakerStrongSelf(type)  __strong typeof(type) type = weak##type;

@interface PPViewMaker ()
/** 要创建的view */
@property(nonatomic,strong) UIView *creatingView;
@end

@implementation PPViewMaker

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        __weak typeof(self) weakself = self;
        //父视图
        _intoView = ^PPViewMaker *(UIView *superV){
            PPViewMakerStrongSelf(self)
            if (superV) {
                [superV addSubview:self.creatingView];
            }
            return self;
        };
        
        //背景色
        _bgColor = ^PPViewMaker *(UIColor *color){
            PPViewMakerStrongSelf(self)
            self.creatingView.backgroundColor = color;
            return self;
        };
        
        //frame
        _frame = ^PPViewMaker *(CGRect frame){
            PPViewMakerStrongSelf(self)
            self.creatingView.frame = frame;
            return self;
        };
    }
    return self;
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
