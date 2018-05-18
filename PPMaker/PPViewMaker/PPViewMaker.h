//
//  PPViewMaker.h
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//  !!! 感谢[如何利用Objective-C写一个精美的DSL](http://williamzang.com/blog/2017/01/10/ru-he-jing-mei-de-xie-yi-ge-lian-shi-ocku/)

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*
 * 待做清单
 * 1. 圆角支持
 * 2. 点击事件
 * 3. 一些简单动画
 * ...
 */

@interface PPViewMaker : NSObject
/** superView */
@property(nonatomic,copy,readonly) PPViewMaker *(^intoView)(UIView *superV);
/** frame */
@property(nonatomic,copy,readonly) PPViewMaker *(^frame)(CGRect frame);
/** 背景色 */
@property(nonatomic,copy,readonly) PPViewMaker *(^bgColor)(UIColor *color);

@property(nonatomic,copy,readonly) PPViewMaker *(^cornerRadius)(CGFloat cornerRadius);

//【用CAShapeLayer创建一根线】
//@property(nonatomic,copy) PPViewMaker *(^dashLine)(CGFloat lineItemWidth,CGFloat lineMargin);

@end

@interface UIView (PPMaker)
+(UIView *)pp_viewMake:(void(^)(PPViewMaker *maker))make;
@end




