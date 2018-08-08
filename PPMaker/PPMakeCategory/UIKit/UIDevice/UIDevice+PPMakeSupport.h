//
//  UIDevice+PPMakeSupport.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/14.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

/*
 截止2018-04-09，苹果手机📱尺寸与大小
 -------------------------------------------
 iPhone3G/3GS     320*480     @1X     3.5
 -------------------------------------------
 iPhone4/4S       320*480     @2x     3.5
 -------------------------------------------
 iPhone5/5S/5C    320*568     @2x     4
 -------------------------------------------
 iPhone6/6s/7/8   375*667     @2x     4.7
 -------------------------------------------
 iPhone6p/7p/8p   414*736     @3x     5.5
 -------------------------------------------
 iPhoneX          375*812     @3x     5.8
 -------------------------------------------
 */

#import <UIKit/UIKit.h>


#define kScreenW          [UIScreen mainScreen].bounds.size.width
#define kScreenH          [UIScreen mainScreen].bounds.size.height
#define kRatioW           kScreenW/375
#define kRatioH           kScreenH/667
//适配 start
#define kWidth(w)         [UIDevice ppmake_width:w]
#define kHeight(h)        [UIDevice ppmake_height:h]
//处理iPhone X的适配
#define kReallBottomY(h)  [UIDevice ppmake_bottomViewRealYWithUIH:h]
#define kReallBottomH(h)  [UIDevice ppmake_bottomViewRealHWithUIH:h]
#define kStatusBarH       [UIDevice ppmake_statusBarHeight]
#define kNavBarH          [UIDevice ppmake_navBarHeight]
//适配 end
#define kIsiPhone         [UIDevice ppmake_isiPhone]
#define kIsiPhone6        [UIDevice ppmake_isiPhone6]
#define kIsiPhone6p       [UIDevice ppmake_isiPhone6p]
#define kIsiPhoneX        [UIDevice ppmake_isiPhoneX]
#define kiOS(version)     [UIDevice ppmake_isiOS:version]


//iPhone X底部多出来的高 34
UIKIT_EXTERN const CGFloat kiPhoneXBottomExtraH;


@interface UIDevice (PPMakeSupport)

@end


#pragma mark --- 屏幕等比例缩放适配
@interface UIDevice (PPMakeAdapter)
/**
 * 【以iPhone6为准做的UI图】宽适配
 */
+(CGFloat)ppmake_width:(CGFloat)width;
/**
 * 【以iPhone6为准做的UI图】高适配
 * 【注意】iPhone X 实际上是高度增加了的iPhone 6/6s/7/8
 */
+(CGFloat)ppmake_height:(CGFloat)height;
@end



#pragma mark --- iPhoneX适配
@interface UIDevice (PPMakeAdapteriPhoneX)
/**
 * 计算VC底部view的Y值（处理iPhone X底部多出来的34不能用于响应事件的情况，需注意）
 * 【说明】：例如，UI图的VC底部是一个height = 50的自定义view，在没有iPhone X时，
 *  frame = CGRectMake(0,kScreenH-kHeight(50),kScreenW,kHeight(50));
 * 可是自从有了iPhone X，苹果固定底部有34不能用来响应事件，而是用来处理"Home键"的事件(当然了tableView列表型的可以除外)，so,现在需要这样用：
 *  CGFloat bottomY = [UIDevice ppmake_bottomViewRealYWithUIH:kHeight(50)];
 *  CGFloat bottomH = [UIDevice ppmake_bottomViewRealHWithUIH:kHeight(50)];
 *  frame = CGRectMake(0,bottomY,kScreenW,bottomH);
 */
+(CGFloat)ppmake_bottomViewRealYWithUIH:(CGFloat)UIH;
/**
 * 计算VC底部view的高度（处理iPhone X底部多出来的34不能用于响应事件的情况，需注意）
 * more see `ppmake_bottomViewRealYWithUIH:`
 */
+(CGFloat)ppmake_bottomViewRealHWithUIH:(CGFloat)UIH;
@end



#pragma mark --- 设备判断
@interface UIDevice (PPMakeJudge)
/** 判断设备是否是手机 */
+(BOOL)ppmake_isiPhone;
/** 是否是6_6s_7_8等手机 */
+(BOOL)ppmake_isiphone6;
/** 是否是6p_6sp_7p_8p等手机 */
+(BOOL)ppmake_isiphone6p;
/** 设备是否是iPhoneX手机*/
+(BOOL)ppmake_isiPhoneX;
/** 判断iOS版本 */
+(BOOL)ppmake_isiOS:(CGFloat)iOSVersion;
@end



#pragma mark --- 获取设备信息
@interface UIDevice (PPMakeGetDeviceInfo)
/** 状态栏高度 */
+(CGFloat)ppmake_statusBarHeight;
/** 导航栏高度 */
+(CGFloat)ppmake_navBarHeight;
@end
