//
//  ZMMatch.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/29.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "ZMMatch.h"
#import "MJExtension.h"

@implementation ZMMatchRequestResult

@end

@implementation ZMMatchData
+(NSDictionary *)mj_objectClassInArray
{
    return @{
             @"matches":@"ZMMatch"
             };
}
@end

@implementation ZMMatch
+(NSDictionary *)mj_objectClassInArray
{
    return @{
             @"schedule_list":@"ZMSchedule"
             };
}
@end

@implementation ZMSchedule

@end

@implementation ZMScheduleDetail

@end

@implementation ZMScheduleDetailStatus

@end


@implementation ZMTeam

@end
