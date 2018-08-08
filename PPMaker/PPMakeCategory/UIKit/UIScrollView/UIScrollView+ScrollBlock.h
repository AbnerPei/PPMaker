//
//  UIScrollView+ScrollBlock.h
//  PPTransitions
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/3/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 监听UIScrollView滚动（竖直方向）

 @param contentOffsetY  滚动时的ContentOffsetY
 @param isScrollToUp    是否上滑
 @param isInOneScreen   scrollView的内容是否没有超过一个屏幕
 */
typedef void(^PPUIScrollViewScrollBlock) (CGFloat contentOffsetY,BOOL isScrollToUp,BOOL isInOneScreen);

@interface UIScrollView (ScrollBlock)
/** 监听UIScrollView滚动回调block */
@property(nonatomic,copy) PPUIScrollViewScrollBlock pp_scrollBlock;
@end




