//
//  UIViewController+UIScreenBrightness.h
//  PPMakerExample
//
//  Created by PPAbner on 2019/10/31.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UIScreenBrightness)

/// 是否更新用户设置的亮度,默认NO。
/// 用户设置包含以下2种情况：
/// 1.不活跃状态（UIApplicationStateInactive）时，【下拉通知栏】更改亮度，更新用户设置的亮度；
/// 2. 进入后台（UIApplicationStateBackground，双击home键或者打开其它APP），
///    用户通过【设置--亮度】or【下拉通知栏】更改亮度，更新用户设置的亮度。
/// 参考：
/// 「支付宝 & 微信」付款码界面，isNeedToUpdateWhenUserBrightnessChanged = NO;
///
@property (nonatomic, assign) BOOL isNeedToUpdateWhenUserBrightnessChanged;

/// 设置最大亮度（0.0 - 1.0）
/// 如果小于0.0，默认0.6；
/// 如果大于1.0，默认1.0；
/// @param maxBrightness 最大亮度
- (void)setupMaxBrightness:(CGFloat)maxBrightness;

/// 进入扫码界面，渐变到最大亮度（maxBrightness）
- (void)changeToMaxBrightnessWhenViewDidAppear;

/// 退出扫码界面，恢复到用户设置的亮度
- (void)changeToUserBrightnessWhenViewDidDisappear;

@end
