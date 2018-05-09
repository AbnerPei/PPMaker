//
//  PPImageViewMaker.h
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PPImageViewMaker : NSObject

@property(nonatomic,copy) PPImageViewMaker *(^intoView)(UIView *superV);
@property(nonatomic,copy) PPImageViewMaker *(^frame)(CGRect frame);
@property(nonatomic,copy) PPImageViewMaker *(^imageName)(NSString *imageName);

@end

@interface UIImageView (PPMaker)
+(UIImageView *)pp_imgVMake:(void(^)(PPImageViewMaker *maker))make;
@end
