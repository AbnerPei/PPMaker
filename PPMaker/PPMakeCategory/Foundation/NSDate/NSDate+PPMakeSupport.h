//
//  NSDate+PPMakeSupport.h
//  PPMakerExample
//
//  Created by PPAbner on 2019/10/11.
//  Copyright © 2019 PPAbner. All rights reserved.
//

/*
 ✎ 声明：✎
 日期处理是所有项目多少都会用到的，尤其项目中用到日历。如果每一次都写一大堆，不仅项目代码不优雅，而且在这个处理上会耗费很多时间，还容易出错，尽管GitHub或者其它地方，有各种处理时间的Category，但是，很多好用是好用，不容易调用，API不清晰，so，本质“傻瓜”的原则，整理该Category,方便你我。
 ------2017-12-05------
 ✎ 使用说明：✎
 ⓵ 所有方法or属性，都是以ppmake_date_开头
 ⓶
 
 */
//  声明：能用实例方法的，尽量不写类方法了。
//       如果是str转date(or str)，请尽量调用str.ppmake_XX
//       如果是date转str(or date)，请尽量调用date.ppmake_XX

//利用正则去验证，处理

#import <Foundation/Foundation.h>
#import "NSDateFormatterStyleConst.h"

typedef NS_ENUM(NSInteger,PPDateUnit) {
    PPDateUnitYear = 0,
    PPDateUnitMonth,
    PPDateUnitDay,
    PPDateUnitHour,
    PPDateUnitMinute,
    PPDateUnitSecond
};

typedef NS_ENUM(NSInteger,PPDateSpecialStyle) {
    PPDateSpecialStyleLine_MMdd_Zhou = 0,      //01-18 周四
    PPDateSpecialStyleCN_MMdd_Zhou,            //01月18日 周四
};

typedef NS_ENUM(NSInteger,PPDateTimeIntervalStyle) {
    PPDateTimeIntervalStyleCN_HHmm = 0,        ///2时30分
    PPDateTimeIntervalStyleEN_HHmm,            ///2h30m
    PPDateTimeIntervalStyleColonHHmmss,        ///08:32:12
    PPDateTimeIntervalStyleColonddHHmmss,      ///05:08:32:12
    PPDateTimeIntervalStyleCN_day_ColonHHmmss, ///2天08:32:12，如果天数小于等于0不展示
};

@interface NSDate (PPMakeSupport)

@property(assign,readonly) NSInteger ppmake_year;       //年
@property(assign,readonly) NSInteger ppmake_month;      //月
@property(assign,readonly) NSInteger ppmake_day;        //日
@property(assign,readonly) NSInteger ppmake_hour;       //时
@property(assign,readonly) NSInteger ppmake_minute;     //分
@property(assign,readonly) NSInteger ppmake_second;     //秒

///【单例】初始化一个Calendar
+ (NSCalendar *)ppmake_sharedCalendar;

///【单例】初始化一个DateFormatter
+ (NSDateFormatter *)ppmake_sharedDateFormatter;

/// 根据指定的相同时间格式，计算两个时间字符串间的时间差{绝对值}（单位是秒）
+ (NSInteger)ppmake_timeIntervalWithCommonDateStyle:(NSDateFormatterStyleKey)commonDateStyle aDateStr:(NSString *)aDateStr bDateStr:(NSString *)bDateStr;

/// 0-1 获取timeInterval后的date日期
/// @param unitFlags 年/月/日/时/分/秒
/// @param timeInterval 时间间隔，正--向后，负--向前
- (NSDate *)ppmake_dateAfter:(NSCalendarUnit)unitFlags timeInterval:(NSInteger)timeInterval;

/// 0-2 获取timeInterval后的指定日期格式的date日期
/// @param unitFlags 年/月/日/时/分/秒
/// @param timeInterval 时间间隔，正--向后，负--向前
/// @param wantedDateStyle 想要的日期格式
- (NSDate *)ppmake_dateAfter:(NSCalendarUnit)unitFlags timeInterval:(NSInteger)timeInterval wantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle;

/// 0-3 获取timeInterval后的str日期
/// @param unitFlags 年/月/日/时/分/秒
/// @param timeInterval 时间间隔，正--向后，负--向前
/// @param wantedDateStyle 想要的日期格式
- (NSString *)ppmake_strAfter:(NSCalendarUnit)unitFlags timeInterval:(NSInteger)timeInterval wantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle;

/// 1-1 获取明天的date日期
+ (NSDate *)ppmake_dateTomorrow;

/// 1-2 获取明天的date日期
/// @param wantedDateStyle 想要的日期格式
+ (NSDate *)ppmake_dateTomorrowWithWantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle;

/// 1-3 获取明天的str日期
/// @param wantedDateStyle 想要的日期格式
+ (NSString *)ppmake_strTomorrowWithWantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle;


/// 2-1 date转str
/// @param wantedDateStyle 想要的日期格式
- (NSString *)ppmake_strWithWantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle;

/// 3-1 date转date
/// @param wantedDateStyle 想要的日期格式
- (NSDate *)ppmake_dateWithWantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle;

///// 4-0 根据获取unitFlags类型两个时间对应的差值
///// @param unitFlags 年/月/日/时/分/秒
///// @param date 另一个date日期
//- (NSInteger)ppmake_timeInterval:(NSCalendarUnit)unitFlags date:(NSDate *)date;

/// 根据获取unit类型两个时间对应的差值 (默认day)
/// @param unit 年/月/日/时/分/秒
/// @param comparedDate 另一个date
- (NSUInteger)ppmake_timeInterValByUnit:(PPDateUnit)unit
                           comparedDate:(NSDate *)comparedDate;

/// 【通用】获取unitCount后的日期【from self】
/// @param unit 年/月/日/时/分/秒
/// @param unitCount 间隔
- (NSDate *)ppmake_dateAfterWithUnit:(PPDateUnit)unit
                           unitCount:(NSInteger)unitCount;
- (NSString *)ppmake_strAfterWithUnit:(PPDateUnit)unit
                            unitCount:(NSInteger)unitCount
                      wantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle;

/**
 获取给定日期是星期X/周X

 @param isZhou YES：返回如@"周三"，NO:返回如@"星期三"
 */
- (NSString *)ppmake_strForWeekIsZhou:(BOOL)isZhou;


/// 是否是闰年
- (BOOL)ppmake_isLeapYear;
+ (BOOL)ppmake_isLeapYearWithYear:(NSUInteger)year;

/// 是否是同年
- (BOOL)ppmake_isSameYearWithADate:(NSDate *)aDate;

/// 是否是月末
- (BOOL)ppmake_isMonthEnd;

/// 当前给定日期的月份总共有XX天
- (NSInteger)ppmake_daysInMonth;

/**
 根据specialStyle类型返回想要的时间字符串 如@"2018-01-18 09:34" =====> @"01-18 周四"

 @param specialStyle 参考PPDateSpecialStyle。
 */
- (NSString *)ppmake_strWithSpecialStyle:(PPDateSpecialStyle)specialStyle;

@end

@interface NSString (DateSupport)


/**
 根据已知时间格式的时间字符串，返回一个NSDate对象。
 比如：@"2017/08/21 14:24"，则后面的originalDateStyle必选传PPNSDateStyleSlash_yyyyMMdd_HHmm；
 - * 后期可能会优化让其自动对应。
 */
- (NSDate *)ppmake_dateWithOriginalDateStyle:(NSDateFormatterStyleKey)originalDateStyle;
- (NSDate *)ppmake_dateWithOriginalDateStyle:(NSDateFormatterStyleKey)originalDateStyle
                             wantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle;

/**
 根据已知时间格式的时间字符串，返回另一种时间格式的时间字符串
 结果如：@"2017/08/21 14:24" ==> @"2017-08-21 14:24"
 @param originalDateStyle 如：PPNSDateStyleSlash_yyyyMMdd_HHmm
 @param wantedDateStyle 如：PPNSDateStyleLine_yyyyMMdd_HHmm,
 */
- (NSString *)ppmake_strWithOriginalDateStyle:(NSDateFormatterStyleKey)originalDateStyle
                              wantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle;

/**
 【通用】获取unitCount后的日期
 
 @param unit 年/月/日/时/分/秒
 @param unitCount 间隔
 */
- (NSDate *)ppmake_dateAfterWithUnit:(PPDateUnit)unit
                           unitCount:(NSInteger)unitCount
                   originalDateStyle:(NSDateFormatterStyleKey)originalDateStyle;

- (NSString *)ppmake_strAfterWithUnit:(PPDateUnit)unit
                            unitCount:(NSInteger)unitCount
                    originalDateStyle:(NSDateFormatterStyleKey)originalDateStyle
                      wantedDateStyle:(NSDateFormatterStyleKey)wantedDateStyle;

/**
 根据获取unit类型两个时间对应的差值 (默认day)
 
 @param unit 年/月/日/时/分/秒
 @param comparedDateStr 另一个时间字符串
 */
- (NSUInteger)ppmake_timeInterValByUnit:(PPDateUnit)unit
                        comparedDateStr:(NSString *)comparedDateStr
                      originalDateStyle:(NSDateFormatterStyleKey)originalDateStyle
                      comparedDateStyle:(NSDateFormatterStyleKey)comparedDateStyle;

/**
 x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)ppmake_strAgoWithOriginalDateStyle:(NSDateFormatterStyleKey)originalDateStyle;

/**
 获取给定日期是星期X/周X
 
 @param isZhou YES：返回如@"周三"，NO:返回如@"星期三"
 */
- (NSString *)ppmake_strForWeekIsZhou:(BOOL)isZhou
                    originalDateStyle:(NSDateFormatterStyleKey)originalDateStyle;

/**
 根据specialStyle类型返回想要的时间字符串 如@"2018-01-18 09:34" =====> @"01-18 周四"
 
 @param specialStyle 参考PPDateSpecialStyle。
 */
- (NSString *)ppmake_strWithSpecialStyle:(PPDateSpecialStyle)specialStyle
                       originalDateStyle:(NSDateFormatterStyleKey)originalDateStyle;


/**
 获取时间差
【 just for 】2018-06-06T07:00:00 &&  2018-06-06T09:20:00  =>  2时20分
 @param style <#style description#>
 @param comparedDateStr <#comparedDateStr description#>
 */
- (NSString *)ppmake_strTimeIntervalWithStyle:(PPDateTimeIntervalStyle)style
                              comparedDateStr:(NSString *)comparedDateStr;
@end


/**
 匹配DateFormatter的样式
 比如：2018-01-09T16:40:00 -----> 2018-01-09 16:40:00 【@"T"替换为@" "】
 */
@interface NSString (MatchDateFormatterStyle)
- (NSString *)ppmake_replaceT;
@end
