//
//  UIView+HandyFrame.m
//  PPMaker
//
//  Created by PPAbner on 2021/1/4.
//

#import "UIView+HandyFrame.h"
#import "UIView+PPMakeSupport.h"
#import <objc/runtime.h>


@implementation UIView (HandyFrame)

- (UIView *)ppmake_topSuperView
{
    UIView *topSuperView = self.superview;
    if (topSuperView == nil) {
        topSuperView = self;
    } else {
        while (topSuperView.superview) {
            topSuperView = topSuperView.superview;
        }
    }
    return topSuperView;
}

#pragma mark --- fill
- (void)ppmake_fill
{
    self.frame = CGRectMake(0, 0, self.superview.width, self.superview.height);
}

- (void)ppmake_fillWidth
{
    self.width = self.superview.width;
    self.left = 0;
}

- (void)ppmake_fillHeight
{
    self.height = self.superview.height;
    self.top = 0;
}

#pragma mark --- [width/height/sizeEqualView:]
- (void)ppmake_widthEqualView:(UIView *)view
{
    self.width = view.width;
}

- (void)ppmake_heightEqualView:(UIView *)view
{
    self.height = view.height;
}

- (void)ppmake_sizeEqualView:(UIView *)view
{
    self.size = view.size;
}

#pragma mark --- [center/X/YEqualView:]
- (void)ppmake_centerEqualView:(UIView *)view
{
    if ([self.superview.subviews containsObject:view]) {
        self.center = view.center;
    }else{
        CGPoint newCenter = [self getNewCenterOfConstraintView:view];
        self.center = newCenter;
    }
}

- (void)ppmake_centerXEqualView:(UIView *)view
{
    if ([self.superview.subviews containsObject:view]) {
        self.centerX = view.centerX;
    }else{
        CGPoint newCenter = [self getNewCenterOfConstraintView:view];
        self.centerX = newCenter.x;
    }
}

- (void)ppmake_centerYEqualView:(UIView *)view
{
    if ([self.superview.subviews containsObject:view]) {
        self.centerY = view.centerY;
    }else{
        CGPoint newCenter = [self getNewCenterOfConstraintView:view];
        self.centerY = newCenter.y;
    }
}

#pragma mark --- [top/left/bottom/rightEqualView:]
- (void)ppmake_topEqualView:(UIView *)view
{
    if ([self.superview.subviews containsObject:view]) {
        self.top = view.top;
    }else{
        CGPoint newOrigin = [self getNewOriginOfConstraintView:view];
        self.top = newOrigin.y;
    }
}

- (void)ppmake_leftEqualView:(UIView *)view
{
    if ([self.superview.subviews containsObject:view]) {
        self.left = view.left;
    }else{
        CGPoint newOrigin = [self getNewOriginOfConstraintView:view];
        self.left = newOrigin.x;
    }
}

- (void)ppmake_bottomEqualView:(UIView *)view
{
    if ([self.superview.subviews containsObject:view]) {
        self.bottom = view.bottom;
    }else{
        CGPoint newOrigin = [self getNewOriginOfConstraintView:view];
        self.top = newOrigin.y + view.height - self.height;
    }
}

- (void)ppmake_rightEqualView:(UIView *)view
{
    if ([self.superview.subviews containsObject:view]) {
        self.right = view.right;
    }else{
        CGPoint newOrigin = [self getNewOriginOfConstraintView:view];
        self.left = newOrigin.x + view.width - self.width;
    }
}

#pragma mark --- [XX: fromView:]
- (void)ppmake_top:(CGFloat)top fromView:(UIView *)view
{
    if ([self.superview.subviews containsObject:view]) {
        self.top = view.top + view.height + top;
    }else{
        CGPoint newOrigin = [self getNewOriginOfConstraintView:view];
        self.top = newOrigin.y + view.top + top;
    }
}

- (void)ppmake_left:(CGFloat)left fromView:(UIView *)view
{
    if ([self.superview.subviews containsObject:view]) {
        self.left = view.left - left - self.width;
    }else{
        CGPoint newOrigin = [self getNewOriginOfConstraintView:view];
        self.left = newOrigin.x - left - self.width;
    }
}

- (void)ppmake_bottom:(CGFloat)bottom fromView:(UIView *)view
{
    if ([self.superview.subviews containsObject:view]) {
        self.top = view.top - bottom - self.height;
    }else{
        CGPoint newOrigin = [self getNewOriginOfConstraintView:view];
        self.top = newOrigin.y - bottom - self.height;
    }
}

- (void)ppmake_right:(CGFloat)right fromView:(UIView *)view
{
    if (self.superview == view) {
        self.left = right;
    }else if ([self.superview.subviews containsObject:view]) {
        self.left = view.left + view.width + right;
    }else{
        CGPoint newOrigin = [self getNewOriginOfConstraintView:view];
        self.left = newOrigin.x + view.width + right;
    }
}

#pragma mark --- [top/left/bottom/rightInContainer: shouldResize:]
- (void)ppmake_topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.height = self.top - top + self.height;
    }
    self.top = top;
}

- (void)ppmake_leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.width = self.left - left + self.width;
    }
    self.left = left;
}

- (void)ppmake_bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.height = self.superview.height - bottom - self.top - self.safeAreaBottomGap;
    } else {
        self.top = self.superview.height - self.height - bottom - self.safeAreaBottomGap;
    }
}

- (void)ppmake_rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.width = self.superview.width - right - self.left;
    } else {
        self.left = self.superview.width - self.width - right;
    }
}


#pragma mark --- 常见简单组合
- (void)ppmake_topHeightEqualView:(UIView *)view
{
    [self ppmake_topEqualView:view];
    self.height = view.height;
}

- (void)ppmake_leftEqualTop:(CGFloat)top fromView:(UIView *)view
{
    [self ppmake_leftEqualView:view];
    [self ppmake_top:top fromView:view];
}

- (void)ppmake_left:(CGFloat)left size:(CGSize)size centerYEqualView:(UIView *)view
{
    self.left = left;
    self.size = size;
    [self ppmake_centerYEqualView:view];
}


- (void)ppmake_left:(CGFloat)left fromView:(UIView *)view leftOfSelf:(CGFloat)leftOfSelf
{
    self.left = leftOfSelf;
    if (view == self.superview) {
        NSAssert(NO, @"「当前view在左边，自适应宽度」view不能是superView,因为是的话，当前view不在superView上，意义不大");
        return;
    }else if ([self.superview.subviews containsObject:view]) {
        self.width = view.left - left - self.left;
    }else{
        CGPoint newOrigin = [self getNewOriginOfConstraintView:view];
        self.width = newOrigin.x - left - self.left;
    }
}

- (void)ppmake_right:(CGFloat)right fromView:(UIView *)view rightInContainer:(CGFloat)rightInContainer
{
    if (view == self.superview) {
        NSAssert(NO, @"「当前view在右边，自适应宽度」view不能是superView,因为是的话，当前view不在superView上，意义不大");
        return;
    }else if ([self.superview.subviews containsObject:view]) {
        self.left = view.right + right;
        self.width = self.superview.width - self.left - rightInContainer;
    }else{
        CGPoint newOrigin = [self getNewOriginOfConstraintView:view];
        self.left = newOrigin.x + view.width + right;
        self.width = self.superview.width - self.left - rightInContainer;
    }
}

- (void)ppmake_right:(CGFloat)right fromView:(UIView *)leftFromView left:(CGFloat)left fromView:(UIView *)rightFromView
{
    if (leftFromView == self.superview) {
        NSAssert(NO, @"当前view在中间，自适应宽度」，leftFromView不能是superView,因为是的话，当前view不在superView上，意义不大");
        return;
    }
    
    if (rightFromView == self.superview) {
        NSAssert(NO, @"当前view在中间，自适应宽度」，rightFromView不能是superView,因为是的话，当前view不在superView上，意义不大");
        return;
    }
    
    if ([self.superview.subviews containsObject:leftFromView] && [self.superview.subviews containsObject:rightFromView]) {
        self.left = leftFromView.right + right;
        self.width = rightFromView.left - left - self.left;
    }else{
        CGPoint newLeftOrigin = leftFromView.origin;
        CGPoint newRightOrigin = rightFromView.origin;
        if (![self.superview.subviews containsObject:leftFromView]) {
            newLeftOrigin = [self getNewOriginOfConstraintView:leftFromView];
        }
        
        if (![self.superview.subviews containsObject:rightFromView]) {
            newRightOrigin = [self getNewOriginOfConstraintView:rightFromView];
        }
        self.left = newLeftOrigin.x + leftFromView.width + right;
        self.width = newRightOrigin.x - left - self.left;
    }
}

#pragma mark --- private method
- (CGPoint)getNewOriginOfConstraintView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.origin toView:self.ppmake_topSuperView];
    CGPoint newOrigin = [self.ppmake_topSuperView convertPoint:viewOrigin toView:self.superview];
    return newOrigin;
}

- (CGPoint)getNewCenterOfConstraintView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenter = [superView convertPoint:view.center toView:self.ppmake_topSuperView];
    CGPoint newCenter = [self.ppmake_topSuperView convertPoint:viewCenter toView:self.superview];
    return newCenter;
}

/// iPhoneX adapt
- (CGFloat)safeAreaBottomGap
{
    NSNumber *gap = objc_getAssociatedObject(self, _cmd);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            if (self.superview.safeAreaLayoutGuide.layoutFrame.size.height > 0) {
                gap = @((self.superview.height - self.superview.safeAreaLayoutGuide.layoutFrame.origin.y - self.superview.safeAreaLayoutGuide.layoutFrame.size.height));
            } else {
                gap = nil;
            }
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, @selector(safeAreaBottomGap), gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}
@end
