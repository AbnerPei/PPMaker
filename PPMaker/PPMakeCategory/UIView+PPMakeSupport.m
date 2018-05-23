//
//  UIView+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/23.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIView+PPMakeSupport.h"
#import <objc/runtime.h>

@implementation UIView (PPMakeSupport)
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

#pragma mark --- view同时设置圆角和阴影
-(void)ppmake_cornerRadius:(CGFloat)cornerRadius
              shadowRadius:(CGFloat)shadowRadius
             shadowOpacity:(float)shadowOpacity
{
    /*
     在给view加阴影并且同时加圆角的时候，会遇到经典的masksToBounds问题，masksToBounds为YES或NO时，仅阴影或圆角生效，不能同时生效。为解决此问题，解决办法是加一层layer来实现。
     要点：
     1. shadow加到单独的layer上面，layer和view.layer同frame，并且是路经阴影额？，然后加到view的底层；
     2. 在view的layer上面加cornerRadius。
     */
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = self.layer.frame;
    
    shadowLayer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    shadowLayer.shadowOffset = CGSizeMake(0, 0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    shadowLayer.shadowOpacity = shadowOpacity;//阴影透明度，默认0
    shadowLayer.shadowRadius = shadowRadius;//阴影半径，默认3
    
    //路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float width = shadowLayer.bounds.size.width;
    float height = shadowLayer.bounds.size.height;
    float x = shadowLayer.bounds.origin.x;
    float y = shadowLayer.bounds.origin.y;
    
    CGPoint topLeft      = shadowLayer.bounds.origin;
    CGPoint topRight     = CGPointMake(x + width, y);
    CGPoint bottomRight  = CGPointMake(x + width, y + height);
    CGPoint bottomLeft   = CGPointMake(x, y + height);
    
    CGFloat offset = -1.f;
    [path moveToPoint:CGPointMake(topLeft.x - offset, topLeft.y + cornerRadius)];
    [path addArcWithCenter:CGPointMake(topLeft.x + cornerRadius, topLeft.y + cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI endAngle:M_PI_2 * 3 clockwise:YES];
    [path addLineToPoint:CGPointMake(topRight.x - cornerRadius, topRight.y - offset)];
    [path addArcWithCenter:CGPointMake(topRight.x - cornerRadius, topRight.y + cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI_2 * 3 endAngle:M_PI * 2 clockwise:YES];
    [path addLineToPoint:CGPointMake(bottomRight.x + offset, bottomRight.y - cornerRadius)];
    [path addArcWithCenter:CGPointMake(bottomRight.x - cornerRadius, bottomRight.y - cornerRadius) radius:(cornerRadius + offset) startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addLineToPoint:CGPointMake(bottomLeft.x + cornerRadius, bottomLeft.y + offset)];
    [path addArcWithCenter:CGPointMake(bottomLeft.x + cornerRadius, bottomLeft.y - cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(topLeft.x - offset, topLeft.y + cornerRadius)];
    
    //设置阴影路径
    shadowLayer.shadowPath = path.CGPath;
    
    //////// cornerRadius /////////
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    [self.superview.layer insertSublayer:shadowLayer below:self.layer];
}
@end

@implementation UIView (PPMakeSupportGestureRecognizer)
/** 添加tap手势 */
-(void)ppmake_tapBlock:(makeViewGestureBlock)gestureBlock
{
    self.userInteractionEnabled = YES;
    SEL sel = @selector(_handleActionForTapGesture:);
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, sel);
    if (!gesture){
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, sel, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, sel, gestureBlock, OBJC_ASSOCIATION_COPY);
}
-(void)_handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized){
        makeViewGestureBlock gestureBlock = objc_getAssociatedObject(self, _cmd);
        if (gestureBlock){
            gestureBlock();
        }
    }
}
/** 添加长按手势 */
-(void)ppmake_longPressBlock:(makeViewGestureBlock)gestureBlock
{
    self.userInteractionEnabled = YES;
    SEL sel = @selector(_handleActionForLongPressGesture:);
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, sel);
    if (!gesture){
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, sel, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, sel, gestureBlock, OBJC_ASSOCIATION_COPY);
}
- (void)_handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized){
        makeViewGestureBlock gestureBlock = objc_getAssociatedObject(self, _cmd);
        if (gestureBlock){
            gestureBlock();
        }
    }
}
@end
