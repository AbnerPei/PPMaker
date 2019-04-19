//
//  PPMakerUIDeviceDefine.h
//  PPMakerExample
//
//  Created by PPAbner on 2019/4/17.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#ifndef PPMakerUIDeviceDefine_h
#define PPMakerUIDeviceDefine_h

/*
 截止2019-04-18，苹果手机📱尺寸与大小
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
 iPhoneX/Xs       375*812     @3x     5.8
 -------------------------------------------
 iPhoneXR         414*896     @2x     6.1
 -------------------------------------------
 iPhoneXs Max     414*896     @3x     6.5
 -------------------------------------------
 
 *> 更详细的可以参考：[iPhone XR/XS/XS Max 适配，最全iPhone尺寸](https://blog.csdn.net/sinat_15735647/article/details/82762238)
 */

NS_ASSUME_NONNULL_BEGIN

CG_INLINE CGFloat UIScreenWidth(){
    return [UIScreen mainScreen].bounds.size.width;
}

CG_INLINE CGFloat UIScreenHeight(){
    return [UIScreen mainScreen].bounds.size.height;
}

CG_INLINE BOOL isiPhone(){
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
}

CG_INLINE BOOL isiPhoneXSeries(){
    return (UIScreenHeight() == 812) || (UIScreenHeight() == 896);
}

CG_INLINE CGFloat statusBarHeight(){
    return isiPhoneXSeries() ? 44 : 20;
}

CG_INLINE CGFloat navgationBarHeight(){
    return isiPhoneXSeries() ? 88 : 64;
}

CG_INLINE CGFloat safeBottomHeight(){
    return isiPhoneXSeries() ? 34 : 0.0;
}

CG_INLINE BOOL iosVersion(CGFloat version){
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= version ? YES : NO;
}

/** 屏宽比（【以iPhone6为准做的UI图】）*/
CG_INLINE CGFloat UIRatio(){
    return UIScreenWidth() / 375.0;
}

/** 宽等比例缩放 （【以iPhone6为准做的UI图】）*/
CG_INLINE CGFloat UIWidth(CGFloat width){
    return width * UIRatio();
}

/**
 * 计算VC底部view的Y值（处理iPhone X底部多出来的34不能用于响应事件的情况，需注意）
 * 【说明】：例如，UI图的VC底部是一个height = 50的自定义view，在没有iPhone X时，
 *  frame = CGRectMake(0,kScreenH - 50,kScreenW,50);
 * 可是自从有了iPhone X，苹果固定底部有34不能用来响应事件，而是用来处理"Home键"的事件(当然了tableView列表型的可以除外)，so,现在需要这样用：
 *  CGFloat bottomY = UIBottomY(50);
 *  CGFloat bottomH = UIBottomH(50);
 *  frame = CGRectMake(0,bottomY,UIScreenWidth,bottomH);
 *
 * @param bottomViewHeight UI图给的高度，如示例中的50
 */
CG_INLINE CGFloat UIBottomY(CGFloat bottomViewHeight){
    return UIScreenHeight() - bottomViewHeight - safeBottomHeight();
}

CG_INLINE CGFloat UIBottomH(CGFloat bottomViewHeight){
    return bottomViewHeight + safeBottomHeight();
}

NS_ASSUME_NONNULL_END

#endif /* PPMakerUIDeviceDefine_h */
