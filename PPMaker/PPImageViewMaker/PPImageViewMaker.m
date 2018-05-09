//
//  PPImageViewMaker.m
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPImageViewMaker.h"
#define PPImgVMakerStrongSelf(type)  __strong typeof(type) type = weak##type;

@interface PPImageViewMaker ()
/** 要创建的imageView */
@property(nonatomic,strong) UIImageView *creatingImageView;
@end

@implementation PPImageViewMaker
-(instancetype)init
{
    self = [super init];
    if (self) {
        
        __weak typeof(self) weakself = self;
        //父视图
        _intoView = ^PPImageViewMaker *(UIView *superV){
            PPImgVMakerStrongSelf(self)
            if (superV) {
                [superV addSubview:self.creatingImageView];
            }
            return self;
        };
        
        //frame
        _frame = ^PPImageViewMaker *(CGRect frame){
            PPImgVMakerStrongSelf(self)
            self.creatingImageView.frame = frame;
            return self;
        };
        
        //imageName
        _imageName = ^PPImageViewMaker *(NSString *imageName){
            PPImgVMakerStrongSelf(self)
            if (imageName && imageName.length > 0) {
                self.creatingImageView.image = [UIImage imageNamed:imageName];
            }
            return self;
        };
    }
    return self;
}

-(UIImageView *)creatingImageView
{
    if (!_creatingImageView) {
        _creatingImageView = [[UIImageView alloc]init];
        _creatingImageView.contentMode = UIViewContentModeScaleToFill;
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
