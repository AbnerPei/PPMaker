//
//  UIButton+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/18.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIButton+PPMakeSupport.h"
#import <objc/runtime.h>
#import "NSObject+PPMakeSupport.h"

@implementation UIButton (PPMakeSupport)

- (void)ppmake_actionWithControlEvent:(UIControlEvents)event withBlock:(makeBtActionBlock)actionBlock
{
    objc_setAssociatedObject(self, @selector(clickAction:), actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(clickAction:) forControlEvents:event];
}
- (void)ppmake_actionWithBlock:(makeBtActionBlock)actionBlock
{
    objc_setAssociatedObject(self, @selector(clickAction:), actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)clickAction:(UIButton *)button{
    makeBtActionBlock actionBlock =objc_getAssociatedObject(self, _cmd);
    if (actionBlock) {
        actionBlock();
    }
}

- (void)ppmake_setLayoutStyle:(UIButtonLayoutStyle)style imageTitleSpace:(CGFloat)space
{
    if (@available(iOS 15.0, *)) {
        UIButtonConfiguration *config = [UIButtonConfiguration plainButtonConfiguration];
        switch (style) {
            case UIButtonLayoutStyleLeftImageRightTitle:
                config.imagePlacement = NSDirectionalRectEdgeLeading;
                break;
                
            case UIButtonLayoutStyleLeftTitleRightImage:
                config.imagePlacement = NSDirectionalRectEdgeTrailing;
                break;
                
            case UIButtonLayoutStyleTopImageBottomTitle:
                config.imagePlacement = NSDirectionalRectEdgeTop;
                break;
                
            case UIButtonLayoutStyleTopTitleBottomImage:
                config.imagePlacement = NSDirectionalRectEdgeBottom;
                break;
                
            default:
                config.imagePlacement = NSDirectionalRectEdgeAll;
                break;
        }
        config.imagePadding = space;
        self.configuration = config;
    } else {
        /// 1. 得到imageView和titleLabel的宽、高
        CGFloat imageWith = self.imageView.frame.size.width;
        CGFloat imageHeight = self.imageView.frame.size.height;
        
        CGFloat labelWidth = 0.0;
        CGFloat labelHeight = 0.0;
        if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
            /// 由于iOS8中titleLabel的size为0，用下面的这种设置
            labelWidth = self.titleLabel.intrinsicContentSize.width;
            labelHeight = self.titleLabel.intrinsicContentSize.height;
        } else {
            labelWidth = self.titleLabel.frame.size.width;
            labelHeight = self.titleLabel.frame.size.height;
        }
        
        /// 2. 声明全局的imageEdgeInsets和labelEdgeInsets
        UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
        UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
        
        /// 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch (style) {
            case UIButtonLayoutStyleTopImageBottomTitle:
            {
                imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
                labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
            }
                break;
            case UIButtonLayoutStyleLeftImageRightTitle:
            {
                imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
                labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
            }
                break;
            case UIButtonLayoutStyleTopTitleBottomImage:
            {
                imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
                labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
            }
                break;
            case UIButtonLayoutStyleLeftTitleRightImage:
            {
                imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
                labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
            }
                break;
            default:
                break;
        }
        // 4. 赋值
        self.titleEdgeInsets = labelEdgeInsets;
        self.imageEdgeInsets = imageEdgeInsets;
    }
}

@end

@implementation UIControl (PPMakeSupport)
- (NSTimeInterval)clickTimeInterval{
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}
- (void)setClickTimeInterval:(NSTimeInterval)clickTimeInterval{
    objc_setAssociatedObject(self, @selector(clickTimeInterval), @(clickTimeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+ (void)load{
    [UIControl ppmake_swizzleWithOriginSelector:@selector(sendAction:to:forEvent:) swizzledSelector:@selector(ppmakeSendAction:to:forEvent:)];
}
- (void)ppmakeSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    //是否忽略点击事件，YES，直接return；
    if (self.isIgnoreClickEvent) {
        return;
    }
    //是否忽略点击事件，NO，判断时间间隔是否大于0；
    if (self.clickTimeInterval > 0) {
        //如果时间间隔大于0，先设置忽略点击事件，然后开启一个倒计时
        [self setIsIgnoreClickEvent:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.clickTimeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self setIsIgnoreClickEvent:NO];
        });
    }
    //最后，执行系统的sendAction:to:forEvent:方法
    ///Q: 为什么此处调用ppmakeSendAction，而不是sendAction？调用ppmakeSendAction不会死循环吗？
    ///A：在load方法里面，已经把两者交换了，所以执行ppmakeSendAction就是执行sendAction
    [self ppmakeSendAction:action to:target forEvent:event];
}
- (BOOL)isIgnoreClickEvent{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
- (void)setIsIgnoreClickEvent:(BOOL)isIgnoreClickEvent{
    objc_setAssociatedObject(self, @selector(isIgnoreClickEvent), @(isIgnoreClickEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)ppmake_reset{
    [self setIsIgnoreClickEvent:NO];
    self.clickTimeInterval = 0;
}
@end

