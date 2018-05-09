//
//  PPViewMaker.h
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//  !!! 感谢[如何利用Objective-C写一个精美的DSL](http://williamzang.com/blog/2017/01/10/ru-he-jing-mei-de-xie-yi-ge-lian-shi-ocku/)

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PPViewMaker : NSObject

/** superView */
@property(nonatomic,copy) PPViewMaker *(^intoView)(UIView *superV);
/** 背景色 */
@property(nonatomic,copy) PPViewMaker *(^bgColor)(UIColor *color);
/** frame */
@property(nonatomic,copy) PPViewMaker *(^frame)(CGRect frame);

@end

@interface UIView (PPMaker)
+(UIView *)pp_viewMake:(void(^)(PPViewMaker *maker))make;
@end




