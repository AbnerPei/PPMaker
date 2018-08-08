//
//  UIDevice+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/14.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIDevice+PPMakeSupport.h"

const CGFloat kiPhoneXBottomExtraH = 34;


@implementation UIDevice (PPMakeSupport)

@end


#pragma mark --- 屏幕适配
@implementation UIDevice (PPMakeAdapter)
/**
 * 【以iPhone6为准做的UI图】宽适配
 */
+(CGFloat)ppmake_width:(CGFloat)width
{
    return kRatioW*width;
}
/**
 * 【以iPhone6为准做的UI图】高适配
 * 【注意】iPhone X 实际上是高度增加了的iPhone 6/6s/7/8
 */
+(CGFloat)ppmake_height:(CGFloat)height
{
    return kRatioH*height;
}
@end

@implementation UIDevice (PPMakeAdapteriPhoneX)
/**
 * 计算VC底部view的Y值（处理iPhone X底部多出来的34不能用于响应事件的情况，需注意）
 * 【说明】：例如，UI图的VC底部是一个height = 50的自定义view，在没有iPhone X时，
 *  frame = CGRectMake(0,kScreenH-kHeight(50),kScreenW,kHeight(50));
 * 可是自从有了iPhone X，苹果固定底部有34不能用来响应事件，而是用来处理"Home键"的事件(当然了tableView列表型的可以除外)，so,现在需要这样用：
 *  CGFloat bottomY = [UIDevice ppmake_bottomViewRealYWithUIH:kHeight(50)];
 *  CGFloat bottomH = [UIDevice ppmake_bottomViewRealHWithUIH:kHeight(50)];
 *  frame = CGRectMake(0,bottomY,kScreenW,bottomH);
 */
+(CGFloat)ppmake_bottomViewRealYWithUIH:(CGFloat)UIH
{
    if (kIsiPhoneX) {
        UIH += kiPhoneXBottomExtraH;
    }
    return kScreenH-UIH;
}
/**
 * 计算VC底部view的高度（处理iPhone X底部多出来的34不能用于响应事件的情况，需注意）
 * more see `ppmake_bottomViewRealYWithUIH:`
 */
+(CGFloat)ppmake_bottomViewRealHWithUIH:(CGFloat)UIH
{
    if (kIsiPhoneX) {
        UIH += kiPhoneXBottomExtraH;
    }
    return UIH;
}
@end


#pragma mark --- 设备判断
@implementation UIDevice (PPMakeJudge)
/** 判断设备是否是手机 */
+(BOOL)ppmake_isiPhone
{
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
}
/** 是否是6_6s_7_8等手机 */
+(BOOL)ppmake_isiphone6
{
    return [UIDevice ppmake_isiPhone] && (kScreenH == 667 ? YES:NO);
}
/** 是否是6p_6sp_7p_8p等手机 */
+(BOOL)ppmake_isiphone6p
{
    return [UIDevice ppmake_isiPhone] && (kScreenH == 736 ? YES:NO);
}
/** 设备是否是iPhoneX手机*/
+(BOOL)ppmake_isiPhoneX
{
    return [UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO;
}
/** 判断iOS版本 */
+(BOOL)ppmake_isiOS:(CGFloat)iOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= iOSVersion ? YES : NO;
}
@end

#pragma mark --- 获取设备信息
@implementation UIDevice (PPMakeGetDeviceInfo)
/** 状态栏高度 */
+(CGFloat)ppmake_statusBarHeight
{
    return kIsiPhoneX?44:20;
}
/** 导航栏高度 */
+(CGFloat)ppmake_navBarHeight
{
    return kIsiPhoneX?88:64;
}
@end
