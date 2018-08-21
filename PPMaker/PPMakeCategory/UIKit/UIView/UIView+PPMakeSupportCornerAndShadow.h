//
//  UIView+PPMakeSupportCornerAndShadow.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/10.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

/*
 参考链接：
 1. [【iOS】实现UIView任意圆角+绘制阴影](https://www.jianshu.com/p/796b2aed6b3f)
 2. [ios解决阴影和圆角冲突](https://www.jianshu.com/p/57ab1295f878)
 */

/*
 * 总结：
 *     1. 如果只是一个纯粹的view，直接常规的设置圆角+阴影就好。
 *     示例如下：（切记，无论是view的clipsToBounds，还是layer的masksToBounds默认都是NO，不能为YES，否则阴影无     效）
          UIView *v = [[UIView alloc]initWithFrame:CGRectMake(20, 300, 100, 100)];
          [self.view addSubview:v];
          v.backgroundColor = [UIColor cyanColor]; //设置背景色并不会影响什么，参考1中说的nil，我测试不设置nil也没事。
          v.layer.shadowColor = [UIColor blackColor].CGColor;
          v.layer.shadowOffset = CGSizeZero;
          v.layer.shadowOpacity = 0.8;
          v.layer.shadowRadius = 8;
          v.layer.cornerRadius = 8;
          //v.clipsToBounds = NO;
          //v.layer.masksToBounds = NO;
 *
 *     2. 图片圆角+阴影
 *     思路如下：
 *        阴影用一个view处理，圆角自身处理；具体做法
 *        2.1 新建一个阴影用的shadowView，并设置它的frame为当前view的frame，然后设置shadowView的阴影；
 *        2.2 把shadowView添加到view的父视图上，然后再把当前view添加到阴影用的shadowView上。
 */


#import <UIKit/UIKit.h>

@interface UIView (PPMakeSupportCornerAndShadow)

/** 001
 * (UIView *)对象同时设置圆角和阴影 【注意：视图必须设置了frame以及父视图】
 * *
 * 如果单纯的圆角，请调用 PPMake *(^cornerRadius)(CGFloat cornerRadius)；
 * 如果单纯的阴影，请调用 PPMake
 * * *
 * @param cornerRadius  圆角半径
 * @param shadowRadius  阴影半径
 * @param shadowColor   阴影颜色
 * @param shadowOffset  阴影偏移量
 * @param shadowOpacity 阴影不透明度
 * * *
 */
//-(void)ppmake_cornerRadius:(CGFloat)cornerRadius
//              shadowRadius:(CGFloat)shadowRadius
//               shadowColor:(UIColor *)shadowColor
//              shadowOffset:(CGSize)shadowOffset
//             shadowOpacity:(CGFloat)shadowOpacity;
/** 002
 * view同时添加圆角和阴影 （【注意：视图必须设置了frame以及父视图】 在001的基础上，
 *                      要加圆角和阴影的view必须加在对应的superV上了，并且设置了frame
 *                      shadowColor为blackColor,shadowOffset为CGSizeZero）
 * @param cornerRadius  圆角半径
 * @param shadowRadius  阴影半径
 * @param shadowOpacity 阴影不透明度
 */
-(void)ppmake_cornerRadius:(CGFloat)cornerRadius
              shadowRadius:(CGFloat)shadowRadius
             shadowOpacity:(float)shadowOpacity;



/** 003
 * view同时设置圆角和阴影 （【注意：视图必须设置了frame以及父视图】 圆角用UIRectCorner处理的，阴影参考001）
 * *
 * @param corners       左上/右上/左下/右下
 * @param cornerRadii   圆角半径（CGSize类型）
 * @param shadowRadius  阴影半径
 * @param shadowColor   阴影颜色
 * @param shadowOffset  阴影偏移量
 * @param shadowOpacity 阴影不透明度
 * *
 */
-(void)ppmake_cornerShadowByRoundingCorners:(UIRectCorner)corners
                                cornerRadii:(CGSize)cornerRadii
                               shadowRadius:(CGFloat)shadowRadius
                                shadowColor:(UIColor *)shadowColor
                               shadowOffset:(CGSize)shadowOffset
                              shadowOpacity:(CGFloat)shadowOpacity;


/** 004
 * view同时设置圆角和阴影 （【注意：视图必须设置了frame以及父视图】圆角用UIRectCorner处理的，阴影参考003，
 *                      在003的基础上，
 *                      要加圆角和阴影的view必须加在对应的superV上了，并且设置了frame
 *                      shadowColor为blackColor,shadowOffset为CGSizeZero）
 * *
 * @param corners       左上/右上/左下/右下
 * @param cornerRadii   圆角半径（CGSize类型）
 * @param shadowRadius  阴影半径
 * @param shadowOpacity 阴影不透明度
 */
-(void)ppmake_cornerShadowByRoundingCorners:(UIRectCorner)corners
                                cornerRadii:(CGSize)cornerRadii
                               shadowRadius:(CGFloat)shadowRadius
                              shadowOpacity:(CGFloat)shadowOpacity;


@end
