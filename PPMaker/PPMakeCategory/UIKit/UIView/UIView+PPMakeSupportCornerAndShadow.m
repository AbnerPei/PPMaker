//
//  UIView+PPMakeSupportCornerAndShadow.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/10.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIView+PPMakeSupportCornerAndShadow.h"
#import <objc/runtime.h>
#import "NSObject+PPMakeSupport.h"

@implementation UIView (PPMakeSupportCornerAndShadow)
+(void)load
{
    [UIView ppmake_swizzleWithOriginSelector:@selector(setFrame:) swizzledSelector:@selector(ppmake_setFrame:)];
}
-(void)ppmake_setFrame:(CGRect)frame
{
    if (self.shadowView) {
        [self.shadowView ppmake_setFrame:frame];
        [self ppmake_setFrame:self.shadowView.bounds];
    }else{
        [self ppmake_setFrame:frame];
    }
}
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
-(void)ppmake_cornerShadowWithSuperV:(UIView *)superV
                           viewFrame:(CGRect)viewFrame
                        cornerRadius:(CGFloat)cornerRadius
                        shadowRadius:(CGFloat)shadowRadius
                         shadowColor:(UIColor *)shadowColor
                        shadowOffset:(CGSize)shadowOffset
                       shadowOpacity:(CGFloat)shadowOpacity
{
    //给视图设置圆角
    //cornerRadius默认值是0，当为正数时，才有效
    CALayer *viewLayer = self.layer;
    viewLayer.masksToBounds = YES;
    viewLayer.cornerRadius = cornerRadius;
    
    //给视图设置阴影，
    [self _setupShadowViewShadowRadius:shadowRadius
                           shadowColor:shadowColor
                          shadowOffset:shadowOffset
                         shadowOpacity:shadowOpacity];
}


/** 002
 * view同时添加圆角和阴影 （【注意：视图必须设置了frame以及父视图】在001的基础上，
 *                      要加圆角和阴影的view必须加在对应的superV上了，并且设置了frame
 *                      shadowColor为blackColor,shadowOffset为CGSizeZero）
 * @param cornerRadius  圆角半径
 * @param shadowRadius  阴影半径
 * @param shadowOpacity 阴影不透明度
 */
-(void)ppmake_cornerRadius:(CGFloat)cornerRadius
              shadowRadius:(CGFloat)shadowRadius
             shadowOpacity:(float)shadowOpacity
{
    return [self ppmake_cornerShadowWithSuperV:self.superview
                                     viewFrame:self.frame
                                  cornerRadius:cornerRadius
                                  shadowRadius:shadowRadius
                                   shadowColor:[UIColor blackColor]
                                  shadowOffset:CGSizeZero
                                 shadowOpacity:shadowOpacity];
}

static inline void setShadowView(UIView *shadowView,UIView *currentView){
    objc_setAssociatedObject(currentView, @selector(shadowView), shadowView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIView *)shadowView
{
    return objc_getAssociatedObject(self, _cmd);
}

/** 003
 * view同时设置圆角和阴影 （【注意：视图必须设置了frame以及父视图】圆角用UIRectCorner处理的，阴影参考001）
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
                              shadowOpacity:(CGFloat)shadowOpacity
{
    //圆角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.frame byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    //阴影
    [self _setupShadowViewShadowRadius:shadowRadius
                           shadowColor:shadowColor
                          shadowOffset:shadowOffset
                         shadowOpacity:shadowOpacity];
}


/** 004
 * view同时设置圆角和阴影 （【注意：视图必须设置了frame以及父视图】 圆角用UIRectCorner处理的，阴影参考003，
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
                              shadowOpacity:(CGFloat)shadowOpacity
{
    [self ppmake_cornerShadowByRoundingCorners:corners
                                   cornerRadii:cornerRadii
                                  shadowRadius:shadowRadius
                                   shadowColor:[UIColor blueColor]
                                  shadowOffset:CGSizeZero
                                 shadowOpacity:shadowOpacity];
}

#pragma mark --- 内部方法抽离
-(void)_setupShadowViewShadowRadius:(CGFloat)shadowRadius
                        shadowColor:(UIColor *)shadowColor
                       shadowOffset:(CGSize)shadowOffset
                      shadowOpacity:(CGFloat)shadowOpacity
{
    //1.创建一个shadowView(已经有了，就取出来用)，设置shadowView的frame和视图的frame一样.
    UIView *shadowView = self.shadowView;
    if (!shadowView) {
        shadowView = [[UIView alloc] init];
        setShadowView(shadowView, self);
        [self.superview addSubview:shadowView];
        [shadowView addSubview:self];
        //此处注意：第一次创建shadowView的时候，先设置frame，然后再添加观察者。减少不必要的调用（如该方法最后一行的self.frame = shadowView.bounds;）
        shadowView.frame = self.frame;
        //        [shadowView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    }
    //    else{
    //        shadowView.frame = viewFrame;
    //    }
    shadowView.layer.shadowColor   = shadowColor.CGColor;
    shadowView.layer.shadowOffset  = shadowOffset;
    shadowView.layer.shadowOpacity = shadowOpacity;
    shadowView.layer.shadowRadius  = shadowRadius;
    shadowView.clipsToBounds = NO;
    //2. 把视图添加到shadowView上,并设置frame.[放外面，就算shadowView的frame变化了，保证视图的frame也变化，始终是shadowView的bounds]
    [self ppmake_setFrame:self.shadowView.bounds];
}
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
//{
//    NSLog(@"%@ %@ %@",keyPath,object,change);
//    self.frame = self.shadowView.bounds;
//}
//-(void)dealloc
//{
//    if (self.shadowView) {
//        [self.shadowView removeObserver:self forKeyPath:@"height" context:nil];
//    }
//}

@end
