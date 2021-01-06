//
//  UIView+HandyFrame.h
//  PPMaker
//
//  Created by PPAbner on 2021/1/4.
//
/*
  声明：该Category严重"抄袭"[casatwy](https://github.com/casatwy) 的HandyAutoLayout中的HandyFrame，只不过在自己使用中，加以改造，以便自己更方便使用。
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HandyFrame)

- (UIView *)ppmake_topSuperView;

- (void)ppmake_fill;
- (void)ppmake_fillWidth;
- (void)ppmake_fillHeight;

- (void)ppmake_widthEqualView:(UIView *)view;
- (void)ppmake_heightEqualView:(UIView *)view;
- (void)ppmake_sizeEqualView:(UIView *)view;

- (void)ppmake_centerEqualView:(UIView *)view;
- (void)ppmake_centerXEqualView:(UIView *)view;
- (void)ppmake_centerYEqualView:(UIView *)view;

- (void)ppmake_topEqualView:(UIView *)view;
- (void)ppmake_leftEqualView:(UIView *)view;
- (void)ppmake_bottomEqualView:(UIView *)view;
- (void)ppmake_rightEqualView:(UIView *)view;

- (void)ppmake_top:(CGFloat)top fromView:(UIView *)view;
- (void)ppmake_left:(CGFloat)left fromView:(UIView *)view;
- (void)ppmake_bottom:(CGFloat)bottom fromView:(UIView *)view;
- (void)ppmake_right:(CGFloat)right fromView:(UIView *)view;

- (void)ppmake_topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize;
- (void)ppmake_leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize;
- (void)ppmake_bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize;
- (void)ppmake_rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize;

#pragma mark --- 常见简单组合
- (void)ppmake_topHeightEqualView:(UIView *)view;
- (void)ppmake_leftEqualTop:(CGFloat)top fromView:(UIView *)view;
- (void)ppmake_left:(CGFloat)left size:(CGSize)size centerYEqualView:(UIView *)view;

#pragma mark --- 下面①、②、③的view不能是self.superView,因为是的话，不再superView上，意义不大。
///①当前view在左边，自适应宽度
- (void)ppmake_left:(CGFloat)left fromView:(UIView *)view leftOfSelf:(CGFloat)leftOfSelf;

///②当前view在右边，自适应宽度
- (void)ppmake_right:(CGFloat)right fromView:(UIView *)view rightInContainer:(CGFloat)rightInContainer;

///③当前view在中间，自适应宽度
- (void)ppmake_right:(CGFloat)right fromView:(UIView *)leftFromView left:(CGFloat)left fromView:(UIView *)rightFromView;

@end

NS_ASSUME_NONNULL_END
