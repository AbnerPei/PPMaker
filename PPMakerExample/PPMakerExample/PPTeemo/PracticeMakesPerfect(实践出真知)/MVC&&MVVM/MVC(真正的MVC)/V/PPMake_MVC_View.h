//
//  PPMake_MVC_View.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPMake_MVC_View : UIView

@property(nonatomic,copy) void(^showMoneyDetailBlock)(void);

+(instancetype)viewWithOrderStatus:(NSString *)orderStatus
                        leftTitles:(NSArray<NSString *> *)leftTitles
                       rightTitles:(NSArray<NSString *> *)rightTitles;

-(void)refreshViewWithOrderStatus:(NSString *)orderStatus
                       leftTitles:(NSArray<NSString *> *)leftTitles
                      rightTitles:(NSArray<NSString *> *)rightTitles;

-(void)updateOrderStatus:(NSString *)orderStatus;

@end
