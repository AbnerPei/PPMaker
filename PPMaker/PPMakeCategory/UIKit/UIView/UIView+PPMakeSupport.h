//
//  UIView+PPMakeSupport.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/23.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PPMakeSupport)

//说明：因为下面这些属性已经用的多，并且相对简单些，所有不再加ppmake_前缀，望注意。
@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.

@end

typedef void(^makeViewGestureBlock)(void);

@interface UIView (PPMakeSupportGestureRecognizer)
/** 添加tap手势 */
-(void)ppmake_tapBlock:(makeViewGestureBlock)gestureBlock;
/** 添加长按手势 */
-(void)ppmake_longPressBlock:(makeViewGestureBlock)gestureBlock;
@end
