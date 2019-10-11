//
//  NSDate+Timestamp.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/10/19.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "NSDate+Timestamp.h"

@implementation NSDate (Timestamp)
/**
 *【001 类方法】：获取当前时间的时间戳字符串
 */
+ (NSString *)ppmake_timestampStr
{
    NSDate *date = [NSDate date];
    return [date ppmake_timestampStr];
}

/**
 * 【002 实例方法】：获取当前NSDate对象对应的时间戳字符串
 */
- (NSString *)ppmake_timestampStr
{
    if (!self) {
        return @"";
    }
    //13位是毫秒，10位是秒，ios生成的是10位的。
    NSTimeInterval timeSp = [self timeIntervalSince1970] * 1000;
    return [NSString stringWithFormat:@"%ld",(long)timeSp];
}
@end
