//
//  KGHandler.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/27.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * 酷狗音乐---处理类（助手）
 */
@interface KGHandler : NSObject

/**
 * 处理播放次数，如1288060处理成128.9万
 */
+(NSString *)kg_playCount:(NSInteger)playCount;

@end

NS_ASSUME_NONNULL_END
