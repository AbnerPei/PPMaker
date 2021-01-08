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

- (NSInteger)ppmake_year
{
    return splitDate(NSCalendarUnitYear,self);
}

- (NSInteger)ppmake_month
{
    return splitDate(NSCalendarUnitMonth, self);
}

- (NSInteger)ppmake_day
{
    return splitDate(NSCalendarUnitDay, self);
}

- (NSInteger)ppmake_hour
{
    return splitDate(NSCalendarUnitHour, self);
}

- (NSInteger)ppmake_minute
{
    return splitDate(NSCalendarUnitMinute, self);
}

- (NSInteger)ppmake_second
{
    return splitDate(NSCalendarUnitSecond, self);
}

#pragma mark --- 单例初始化（内部用）
+ (void)sharedInstance
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
+ (NSCalendar *)ppmake_sharedCalendar
{
    PPNSDateInitialize();
    return _ppCalendar;
}

#pragma mark --- 初始化一个DateFormatter【单例】
+ (NSDateFormatter *)ppmake_sharedDateFormatter
{
    PPNSDateInitialize();
    return _ppDateFormatter;
}

/// 根据指定的相同时间格式，计算两个时间字符串间的时间差（单位是秒）
+ (NSInteger)ppmake_timeIntervalWithCommonDateStyle:(NSDateFormatterStyleKey)commonDateStyle
                                      aDateStr:(NSString *)aDateStr
                                      bDateStr:(NSString *)bDateStr
{
    PPNSDateInitialize();
    
    _ppDateFormatter.dateFormat = commonDateStyle;
    NSDate *aDate = [_ppDateFormatter dateFromString:aDateStr];
    NSDate *bDate = [_ppDateFormatter dateFromString:bDateStr];
    
    NSInteger timeInterval = (NSInteger)[aDate timeIntervalSinceDate:bDate];
    
    return ABS(timeInterval);
}

#pragma mark --- 0、获取xx后（前）的日期
/// 0-1 获取timeInterval后的date日期
/// @param unitFlags 年/月/日/时/分/秒
/// @param timeInterval 时间间隔，正--向后，负--向前
- (NSDate *)ppmake_dateAfter:(NSCalendarUnit)unitFlags timeInterval:(NSInteger)timeInterval
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
- (NSDate *)ppmake_dateAfter:(NSCalendarUnit)unitFlags timeInterval:(NSInteger)timeInterval wantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    NSString *dateStr = [self ppmake_strAfter:unitFlags timeInterval:timeInterval wantedDateStyle:wantedDateStyle];
    return [_ppDateFormatter dateFromString:dateStr];
}

/// 0-3 获取timeInterval后的str日期
/// @param unitFlags 年/月/日/时/分/秒
/// @param timeInterval 时间间隔，正--向后，负--向前
/// @param wantedDateStyle 日期格式
- (NSString *)ppmake_strAfter:(NSCalendarUnit)unitFlags timeInterval:(NSInteger)timeInterval wantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    NSDate *date = [self ppmake_dateAfter:unitFlags timeInterval:timeInterval];
    return [date ppmake_strWithWantedDateStyle:wantedDateStyle];
}

#pragma mark --- 1、获取明天的日期
/// 1-1 获取明天的date日期
+ (NSDate *)ppmake_dateTomorrow
{
    return [[NSDate date] ppmake_dateAfter:(NSCalendarUnitDay) timeInterval:1];
}

/// 1-2 获取明天的date日期
/// @param wantedDateStyle 想要的日期格式
+ (NSDate *)ppmake_dateTomorrowWithWantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    NSDate *date = [NSDate ppmake_dateTomorrow];
    return [date ppmake_dateWithWantedDateStyle:wantedDateStyle];
}

/// 1-3 获取明天的str日期
/// @param wantedDateStyle 日期格式
+ (NSString *)ppmake_strTomorrowWithWantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    NSDate *date = [NSDate ppmake_dateTomorrow];
    return [date ppmake_strWithWantedDateStyle:wantedDateStyle];
}

#pragma mark --- 2、NSDate转NSString
/// 2-1 date转str
/// @param wantedDateStyle 日期格式
- (NSString *)ppmake_strWithWantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    PPNSDateInitialize();
    _ppDateFormatter.dateFormat = wantedDateStyle;
    return [_ppDateFormatter stringFromDate:self];
}

#pragma mark --- 3、NSDate转NSDate
/// 3-1 date转date
/// @param wantedDateStyle 想要的日期格式
- (NSDate *)ppmake_dateWithWantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    //先把date转成对应时间格式的string类型日期，再把string类型日期转为date类型的日期
    NSString *dateStr = [self ppmake_strWithWantedDateStyle:wantedDateStyle];
    return [_ppDateFormatter dateFromString:dateStr];
}

#pragma mark --- 4、计算两个date间的差值
///// 4-0 根据获取unitFlags类型两个时间对应的差值
///// @param unitFlags 年/月/日/时/分/秒
///// @param date 另一个date日期
//- (NSInteger)ppmake_timeInterval:(NSCalendarUnit)unitFlags date:(NSDate *)date
//{
////    PPNSDateInitialize();
////    NSDateComponents *components = [_ppCalendar components:unitFlags fromDate:self toDate:date options:0];
////    switch (<#expression#>) {
////        case <#constant#>:
////            <#statements#>
////            break;
////
////        default:
////            break;
////    }
//#warning todo
//    return 0;
//}

#pragma mark --- 根据获取unit类型两个时间对应的差值
- (NSUInteger)ppmake_timeInterValByUnit:(PPDateUnit)unit
                           comparedDate:(NSDate *)comparedDate
{
    
    NSDate *fromDate = self;
    NSDate *toDate = comparedDate;
    PPNSDateInitialize();
    
    BOOL isAscend = NO;
    if ([fromDate earlierDate:toDate] == fromDate) {
        isAscend = YES;
    }
    NSDate *startDate = isAscend?fromDate:toDate;
    NSDate *endDate = isAscend?toDate:fromDate;
    
    NSCalendarUnit calendarUnit;
    switch (unit) {
        case PPDateUnitYear:
            calendarUnit = NSCalendarUnitYear;
            break;
        case PPDateUnitMonth:
            calendarUnit = NSCalendarUnitMonth;
            break;
        case PPDateUnitDay:
            calendarUnit = NSCalendarUnitDay;
            break;
        case PPDateUnitHour:
            calendarUnit = NSCalendarUnitHour;
            break;
        case PPDateUnitMinute:
            calendarUnit = NSCalendarUnitMinute;
            break;
        case PPDateUnitSecond:
            calendarUnit = NSCalendarUnitSecond;
            break;
            
        default:
            calendarUnit = NSCalendarUnitDay;
            break;
    }
    NSDateComponents *comps = [_ppCalendar components:calendarUnit
                                             fromDate:startDate
                                               toDate:endDate
                                              options:0];
    
    switch (unit) {
        case PPDateUnitYear:
            return (NSUInteger)comps.year;
            break;
        case PPDateUnitMonth:
            return (NSUInteger)comps.month;
            break;
        case PPDateUnitDay:
            return (NSUInteger)comps.day;
            break;
        case PPDateUnitHour:
            return (NSUInteger)comps.hour;
            break;
        case PPDateUnitMinute:
            return (NSUInteger)comps.minute;
            break;
        case PPDateUnitSecond:
            return (NSUInteger)comps.second;
            break;
            
        default:
            return (NSUInteger)comps.day;
            break;
    }
}

- (NSDate *)ppmake_dateAfterWithUnit:(PPDateUnit)unit
                      unitCount:(NSInteger)unitCount
{
    PPNSDateInitialize();
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    configureUnit(dateComponents, unit, unitCount);
    NSDate *date = [_ppCalendar dateByAddingComponents:dateComponents
                                                toDate:self
                                               options:0];
    return date;
}

- (NSString *)ppmake_strAfterWithUnit:(PPDateUnit)unit
                            unitCount:(NSInteger)unitCount
                      wantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    NSDate *wantedDate = [self ppmake_dateAfterWithUnit:unit
                                          unitCount:unitCount];
    return [wantedDate ppmake_strWithWantedDateStyle:wantedDateStyle];
}

#pragma mark --- 获取给定日期是星期X/周X
- (NSString *)ppmake_strForWeekIsZhou:(BOOL)isZhou
{
    NSArray *weekStrs;
    if (isZhou) {
        weekStrs = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    }else{
        weekStrs  = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    }
    
    PPNSDateInitialize();
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [_ppCalendar setTimeZone: timeZone];
    NSDateComponents *theComponents = [_ppCalendar components:NSCalendarUnitWeekday fromDate:self];
    return [weekStrs objectAtIndex:theComponents.weekday];
}

#pragma mark --- 是否是闰年
- (BOOL)ppmake_isLeapYear
{
    return [NSDate ppmake_isLeapYearWithYear:self.ppmake_year];
}

+ (BOOL)ppmake_isLeapYearWithYear:(NSUInteger)year{
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

#pragma mark --- 是否同一年
- (BOOL)ppmake_isSameYearWithADate:(NSDate *)aDate
{
    PPNSDateInitialize();
    NSDateComponents *components1 = [_ppCalendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [_ppCalendar components:NSCalendarUnitYear fromDate:aDate];
    return (components1.year == components2.year);
}

#pragma mark --- 是否是月末
- (BOOL)ppmake_isMonthEnd
{
    NSInteger daysInMonth = [self ppmake_daysInMonth];;
    NSDateComponents *components = [_ppCalendar components:NSCalendarUnitDay fromDate:self];
    return components.day >= daysInMonth ? YES:NO;
}

#pragma mark --- 当前给定日期的月份总共有XX天
- (NSInteger)ppmake_daysInMonth
{
    return [_ppCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
}

#pragma mark --- 根据specialStyle类型返回想要的时间字符串 如@"2018-01-18 09:34" =====> @"01-18 周四"
- (NSString *)ppmake_strWithSpecialStyle:(PPDateSpecialStyle)specialStyle
{
    NSString *mmddStr = [self ppmake_strWithWantedDateStyle:dateStyleExchange(specialStyle)];
    NSString *weekStr = [self ppmake_strForWeekIsZhou:YES];
    NSString *str = [NSString stringWithFormat:@"%@ %@",mmddStr,weekStr];
    return str;
}

static inline NSDateFormatterStyleKey dateStyleExchange(PPDateSpecialStyle specialStyle){
    NSDateFormatterStyleKey dateStyle ;
    switch (specialStyle) {
        case PPDateSpecialStyleLine_MMdd_Zhou:
            dateStyle = NSDateFormatterStyleKeyLine_MMdd;
            break;
            
        case PPDateSpecialStyleCN_MMdd_Zhou:
            dateStyle = NSDateFormatterStyleKeyCN_MMdd;
            break;
            
        default:
            dateStyle = NSDateFormatterStyleKeyLine_yyyyMMdd;
            break;
    }
    return dateStyle;
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


//================NSString (DateSupport)==================start
@implementation NSString (DateSupport)
#pragma mark --- 根据已知时间格式的时间字符串，返回一个NSDate对象。
- (NSDate *)ppmake_dateWithOriginalDateStyle:(NSDateFormatterStyleKey)originalDateStyle
{
    NSDateFormatter *format = [NSDate ppmake_sharedDateFormatter];
    format.dateFormat = originalDateStyle;
    NSDate *date = [format dateFromString:self];
    return date;
}

- (NSDate *)ppmake_dateWithOriginalDateStyle:(NSDateFormatterStyleKey)originalDateStyle wantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    NSDate *originalDate = [self ppmake_dateWithOriginalDateStyle:originalDateStyle];
    return [originalDate ppmake_dateWithWantedDateStyle:wantedDateStyle];
}

#pragma mark --- 根据已知时间格式的时间字符串，返回另一种时间格式的时间字符串
- (NSString *)ppmake_strWithOriginalDateStyle:(NSDateFormatterStyleKey)originalDateStyle wantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    NSDate *originalDate = [self ppmake_dateWithOriginalDateStyle:originalDateStyle];
    NSString *newDateStr = [originalDate ppmake_strWithWantedDateStyle:wantedDateStyle];
    return newDateStr;
}

#pragma mark --- 通用的处理xx天/月/时...后的日期
- (NSDate *)ppmake_dateAfterWithUnit:(PPDateUnit)unit
                      unitCount:(NSInteger)unitCount
              originalDateStyle:(NSDateFormatterStyleKey)originalDateStyle
{
    NSDate *originalDate = [self ppmake_dateWithOriginalDateStyle:originalDateStyle];
    return [originalDate ppmake_dateAfterWithUnit:unit
                                    unitCount:unitCount];
}

- (NSString *)ppmake_strAfterWithUnit:(PPDateUnit)unit
                       unitCount:(NSInteger)unitCount
               originalDateStyle:(NSDateFormatterStyleKey)originalDateStyle
                 wantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle
{
    NSDate *wantedDate = [self ppmake_dateAfterWithUnit:unit unitCount:unitCount originalDateStyle:originalDateStyle];
    return [wantedDate ppmake_strWithWantedDateStyle:wantedDateStyle];
}

#pragma mark --- 根据获取unit类型两个时间对应的差值 (默认day)
-(NSUInteger)ppmake_timeInterValByUnit:(PPDateUnit)unit
                   comparedDateStr:(NSString *)comparedDateStr
                 originalDateStyle:(NSDateFormatterStyleKey)originalDateStyle
                 comparedDateStyle:(NSDateFormatterStyleKey)comparedDateStyle
{
    NSDate *fromDate = [self ppmake_dateWithOriginalDateStyle:originalDateStyle];
    NSDate *toDate = [comparedDateStr ppmake_dateWithOriginalDateStyle:comparedDateStyle];
    return [fromDate ppmake_timeInterValByUnit:unit
                              comparedDate:toDate];
}

#pragma mark --- x分钟前/x小时前/昨天/x天前/x个月前/x年前
- (NSString *)ppmake_strAgoWithOriginalDateStyle:(NSDateFormatterStyleKey)originalDateStyle
{
    NSDate *date = [self ppmake_dateWithOriginalDateStyle:originalDateStyle];
    NSDate *nowDate = [NSDate date];
    NSTimeInterval time = [nowDate timeIntervalSinceDate:date];
    
    int year = (int)(nowDate.ppmake_year - date.ppmake_year);
    int month = (int)(nowDate.ppmake_month - date.ppmake_month);
    int day = (int)(nowDate.ppmake_day - date.ppmake_day);
    
    NSTimeInterval retTime = 1.0;
    if (time < 3600) { // 小于一小时
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return retTime < 1.0 ? @"刚刚" : [NSString stringWithFormat:@"%.0f分钟前", retTime];
        
    } else if (time < 3600 * 24) { // 小于一天，也就是今天
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    } else if (time < 3600 * 24 * 2) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(year) == 0 && abs(month) <= 1)
             || (abs(year) == 1 && nowDate.ppmake_month == 1 && date.ppmake_month == 12)) {
        int retDay = 0;
        if (year == 0) { // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }
        
        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[date ppmake_daysInMonth];
            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[nowDate ppmake_day] + (totalDays - (int)[date ppmake_day]);
        }
        
        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else  {
        if (abs(year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(month)];
            }
            
            // 隔年
            int month = (int)[nowDate ppmake_month];
            int preMonth = (int)[date ppmake_month];
            if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }
        
        return [NSString stringWithFormat:@"%d年前", abs(year)];
    }
    
    return @"1小时前";
}

#pragma mark --- 获取给定日期是星期X/周X
- (NSString *)ppmake_strForWeekIsZhou:(BOOL)isZhou originalDateStyle:(NSDateFormatterStyleKey)originalDateStyle
{
    NSDate *date = [self ppmake_dateWithOriginalDateStyle:originalDateStyle];
    return [date ppmake_strForWeekIsZhou:isZhou];
}

#pragma mark --- 根据specialStyle类型返回想要的时间字符串 如@"2018-01-18 09:34" =====> @"01-18 周四"
- (NSString *)ppmake_strWithSpecialStyle:(PPDateSpecialStyle)specialStyle originalDateStyle:(NSDateFormatterStyleKey)originalDateStyle
{
    NSDate *date = [self ppmake_dateWithOriginalDateStyle:originalDateStyle];
    return [date ppmake_strWithSpecialStyle:specialStyle];
}

- (NSString *)ppmake_strTimeIntervalWithStyle:(PPDateTimeIntervalStyle)style comparedDateStr:(NSString *)comparedDateStr
{
    NSString *oneStr = [self ppmake_replaceT];
    if (oneStr.length >= 19) {
        oneStr = [oneStr substringToIndex:19];
    }
    NSString *twoStr = [comparedDateStr ppmake_replaceT];
    if (twoStr.length >= 19) {
        twoStr = [twoStr substringToIndex:19];
    }

    NSUInteger timeInterval = [oneStr ppmake_timeInterValByUnit:PPDateUnitSecond comparedDateStr:twoStr originalDateStyle:NSDateFormatterStyleKeyLine_yyyyMMdd_HHmmss comparedDateStyle:NSDateFormatterStyleKeyLine_yyyyMMdd_HHmmss];
    
    int days = (int)(timeInterval/(3600*24));
    int hours = (int)((timeInterval-days*24*3600)/3600);
    int minutes = (int)(timeInterval-days*24*3600-hours*3600)/60;
    int seconds = (int)(timeInterval-days*24*3600-hours*3600-minutes*60);
    
    switch (style) {
        case PPDateTimeIntervalStyleCN_HHmm:
            if (hours == 0 && minutes == 0) {
                   return @"";
               }
            return [NSString stringWithFormat:@"%d时%d分",hours,minutes];
            break;
            
        case PPDateTimeIntervalStyleEN_HHmm:
            if (hours == 0 && minutes == 0) {
                   return @"";
               }
            return [NSString stringWithFormat:@"%dh%dm",hours,minutes];
            break;
            
            case PPDateTimeIntervalStyleColonHHmmss:
            return [NSString stringWithFormat:@"%02d:%02d:%02d",hours,minutes,seconds];
            break;
            
        case PPDateTimeIntervalStyleColonddHHmmss:
        {
            if (days > 0) {
                if (days > 10) {
                    return [NSString stringWithFormat:@"%d:%02d:%02d:%02d",days,hours,minutes,seconds];
                }else{
                    return [NSString stringWithFormat:@"%02d:%02d:%02d:%02d",days,hours,minutes,seconds];
                }
            }else{
                return [NSString stringWithFormat:@"%02d:%02d:%02d",hours,minutes,seconds];
            }
        }
            break;
            
        case PPDateTimeIntervalStyleCN_day_ColonHHmmss:
        {
            if (days > 0) {
                return [NSString stringWithFormat:@"%d天%02d:%02d:%02d",days,hours,minutes,seconds];
            }else{
                return [NSString stringWithFormat:@"%02d:%02d:%02d",hours,minutes,seconds];
            }
        }
            break;
        default:
            return @"";
            break;
    }
}

@end
//================NSString (DateSupport)==================end


//================NSString (MatchDateFormatterStyle)==================start
@implementation NSString (MatchDateFormatterStyle)
- (NSString *)ppmake_replaceT
{
    return replaceOneStrWithOtherStr(@"T", @" ",self);
}

//替换totalStr中所有的oneStr为otherStr
static inline NSString * replaceOneStrWithOtherStr(NSString *oneStr,NSString *otherStr,NSString *totalStr){
    NSString *str = totalStr;
    if ([str containsString:oneStr]) {
        str = [str stringByReplacingOccurrencesOfString:oneStr withString:otherStr];
    }
    return str;
}
@end
//================NSString (MatchDateFormatterStyle)==================end
