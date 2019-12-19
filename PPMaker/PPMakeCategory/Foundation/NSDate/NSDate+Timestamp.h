//
//  NSDate+Timestamp.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/10/19.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Timestamp)

/**
 *【001 类方法】：获取当前时间的时间戳字符串
 */
+ (NSString *)ppmake_timestampStr;


/**
 * 【002 实例方法】：获取当前NSDate对象对应的时间戳字符串
 */
- (NSString *)ppmake_timestampStr;

@end
