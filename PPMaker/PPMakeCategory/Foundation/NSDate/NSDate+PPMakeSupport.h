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
    PPDateTimeIntervalStyleCN_HHmm = 0,      //2时30分
    PPDateTimeIntervalStyleEN_HHmm           //2h30m
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
@end
