//
//  PPMakeBannerView.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/10.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPMakeBannerView : UIView

@property (nonatomic, assign) NSTimeInterval rollTimeInterval;

/**
 返回 WTCycleRollView 对象
 @param frame 位置尺寸
 @return WTCycleRollView 对象
 */
+ (instancetype)cycleRollViewWithFrame:(CGRect)frame;

/**
 设置图片源、是否自动滚动、点击图片的回调
 @param imgUrls 图片源
 @param autoCycleRoll 是否自动滚动
 @param clickImgBlock 点击图片的回调
 */
- (void)setImgUrls:(NSArray *)imgUrls autoCycleRoll:(BOOL)autoCycleRoll clickImgBlock:(void(^)(NSInteger selectedIndex))clickImgBlock;

/** 暂停自动滚动 */
- (void)pauseCycleRoll;
/** 开始自动滚动【在暂停的状态下】 */
- (void)startCycleRoll;

@end
