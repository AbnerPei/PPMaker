//
//  PPViewMaker.m
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPViewMaker.h"
#import "PPMaker.h"

@interface PPViewMaker ()
/** 要创建的view */
@property(nonatomic,strong) UIView *creatingView;
@end

@implementation PPViewMaker

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        PPMakerWeakSelf(self)
        //父视图
        _intoView = ^PPViewMaker *(UIView *superV){
            PPMakerStrongSelf(self)
            if (superV) {
                [superV addSubview:self.creatingView];
            }
            return self;
        };
        
        //背景色
        _bgColor = ^PPViewMaker *(UIColor *color){
            PPMakerStrongSelf(self)
            self.creatingView.backgroundColor = color;
            return self;
        };
        
        //frame
        _frame = ^PPViewMaker *(CGRect frame){
            PPMakerStrongSelf(self)
            self.creatingView.frame = frame;
            return self;
        };
    }
    return self;
}
+(UIView *)pp_viewMake:(void (^)(PPViewMaker *))make
{
    PPViewMaker *viewMaker = [[PPViewMaker alloc]init];
    if (make) {
        make(viewMaker);
    }
    return viewMaker.creatingView;
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
