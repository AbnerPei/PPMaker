//
//  NSDate+PPMakeSupport.m
//  PPMakerExample
//
//  Created by PPAbner on 2019/10/11.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#import "NSDate+PPMakeSupport.h"

@implementation NSDate (PPMakeSupport)

static NSCalendar *_ppCalendar = nil;
static NSDateFormatter *_ppDateFormatter = nil;

- (NSInteger)pp_year
{
    return splitDate(NSCalendarUnitYear,self);
}

- (NSInteger)pp_month
{
    return splitDate(NSCalendarUnitMonth, self);
}

- (NSInteger)pp_day
{
    return splitDate(NSCalendarUnitDay, self);
}

- (NSInteger)pp_hour
{
    return splitDate(NSCalendarUnitHour, self);
}

- (NSInteger)pp_minute
{
    return splitDate(NSCalendarUnitMinute, self);
}

- (NSInteger)pp_second
{
    return splitDate(NSCalendarUnitSecond, self);
}

#pragma mark --- 单例初始化（内部用）
+(void)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_ppCalendar) {
            //iOS8.0推荐这种
            _ppCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        }
        if (!_ppDateFormatter) {
            _ppDateFormatter = [[NSDateFormatter alloc]init];
        }
    });
    
}
#pragma mark --- 初始化一个Calendar【单例】
+(NSCalendar *)pp_sharedCalendar
{
    PPNSDateInitialize();
    return _ppCalendar;
}

#pragma mark --- 初始化一个DateFormatter【单例】
+(NSDateFormatter *)pp_sharedDateFormatter
{
    PPNSDateInitialize();
    return _ppDateFormatter;
}
#pragma mark --- 0、获取xx后（前）的日期
/// 0-1 获取timeInterval后的date日期
/// @param unitFlags 年/月/日/时/分/秒
/// @param timeInterval 时间间隔，正--向后，负--向前
- (NSDate *)pp_dateAfter:(NSCalendarUnit)unitFlags timeInterval:(NSInteger)timeInterval
{
    PPNSDateInitialize();
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    configureUnit(dateComponents, unitFlags, timeInterval);
    NSDate *date = [_ppCalendar dateByAddingComponents:dateComponents
                                                toDate:self
                                               options:0];
    return date;
}

/// 0-2 获取timeInterval后的指定日期格式的date日期
/// @param unitFlags 年/月/日/时/分/秒
/// @param timeInterval 时间间隔，正--向后，负--向前
/// @param wantedDateStyle 想要的日期格式
- (NSDate *)pp_dateAfter:(NSCalendarUnit)unitFlags timeInterval:(NSInteger)timeInterval wantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    NSString *dateStr = [self pp_strAfter:unitFlags timeInterval:timeInterval wantedDateStyle:wantedDateStyle];
    return [_ppDateFormatter dateFromString:dateStr];
}

/// 0-3 获取timeInterval后的str日期
/// @param unitFlags 年/月/日/时/分/秒
/// @param timeInterval 时间间隔，正--向后，负--向前
/// @param wantedDateStyle 日期格式
- (NSString *)pp_strAfter:(NSCalendarUnit)unitFlags timeInterval:(NSInteger)timeInterval wantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    NSDate *date = [self pp_dateAfter:unitFlags timeInterval:timeInterval];
    return [date pp_strWithWantedDateStyle:wantedDateStyle];
}

#pragma mark --- 1、获取明天的日期
/// 1-1 获取明天的date日期
+ (NSDate *)pp_dateTomorrow
{
    return [[NSDate date] pp_dateAfter:(NSCalendarUnitDay) timeInterval:1];
}

/// 1-2 获取明天的date日期
/// @param wantedDateStyle 想要的日期格式
+ (NSDate *)pp_dateTomorrowWithWantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    NSDate *date = [NSDate pp_dateTomorrow];
    return [date pp_dateWithWantedDateStyle:wantedDateStyle];
}

/// 1-3 获取明天的str日期
/// @param wantedDateStyle 日期格式
+ (NSString *)pp_strTomorrowWithWantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    NSDate *date = [NSDate pp_dateTomorrow];
    return [date pp_strWithWantedDateStyle:wantedDateStyle];
}

#pragma mark --- 2、NSDate转NSString
/// 2-1 date转str
/// @param wantedDateStyle 日期格式
- (NSString *)pp_strWithWantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    PPNSDateInitialize();
    _ppDateFormatter.dateFormat = wantedDateStyle;
    return [_ppDateFormatter stringFromDate:self];
}

#pragma mark --- 3、NSDate转NSDate
/// 3-1 date转date
/// @param wantedDateStyle 想要的日期格式
- (NSDate *)pp_dateWithWantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    //先把date转成对应时间格式的string类型日期，再把string类型日期转为date类型的日期
    NSString *dateStr = [self pp_strWithWantedDateStyle:wantedDateStyle];
    return [_ppDateFormatter dateFromString:dateStr];
}

#pragma mark --- 4、计算两个date间的差值
/// 4-0 根据获取unitFlags类型两个时间对应的差值
/// @param unitFlags 年/月/日/时/分/秒
/// @param date 另一个date日期
- (NSInteger)pp_timeInterval:(NSCalendarUnit)unitFlags date:(NSDate *)date
{
//    PPNSDateInitialize();
//    NSDateComponents *components = [_ppCalendar components:unitFlags fromDate:self toDate:date options:0];
//    switch (<#expression#>) {
//        case <#constant#>:
//            <#statements#>
//            break;
//
//        default:
//            break;
//    }
#warning todo
    return 0;
}

#pragma mark --- private method
static inline void PPNSDateInitialize(){
    [NSDate sharedInstance];
}

static inline void configureUnit(NSDateComponents *dateComponents,NSCalendarUnit unitFlags,NSInteger timeInterval){
    switch (unitFlags) {
        case NSCalendarUnitYear:
            [dateComponents setYear:timeInterval];
            break;
            
        case NSCalendarUnitMonth:
            [dateComponents setMonth:timeInterval];
            break;
            
        case NSCalendarUnitDay:
            [dateComponents setDay:timeInterval];
            break;
            
        case NSCalendarUnitHour:
            [dateComponents setHour:timeInterval];
            break;
            
        case NSCalendarUnitMinute:
            [dateComponents setMinute:timeInterval];
            break;
            
        case NSCalendarUnitSecond:
            [dateComponents setSecond:timeInterval];
            break;
            
        default:
            break;
    }
}

/** 拆分(split)某个日期 年/月/日/时/分/秒 */
static NSInteger splitDate(NSCalendarUnit calendarUnit,NSDate *date){
    PPNSDateInitialize();
    NSDateComponents *dateComponents = [_ppCalendar components:calendarUnit fromDate:date];
    switch (calendarUnit) {
        case NSCalendarUnitYear:
            return dateComponents.year;
            break;
        case NSCalendarUnitMonth:
            return dateComponents.month;
            break;
        case NSCalendarUnitDay:
            return dateComponents.day;
            break;
        case NSCalendarUnitHour:
            return dateComponents.hour;
            break;
        case NSCalendarUnitMinute:
            return dateComponents.minute;
            break;
        case NSCalendarUnitSecond:
            return dateComponents.second;
            break;
            
        default:
            return 0;
            break;
    }
}

@end
