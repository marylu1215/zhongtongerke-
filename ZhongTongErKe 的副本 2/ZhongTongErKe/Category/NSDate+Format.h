//
//  NSDate+Format.h
//
//  Created by khj on 16/8/16.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Format)
/**
 将日期格式化成字符串
 @param format 格式，例如 @"yyyy-MM-dd HH:mm:ss"
 */
- (NSString *)kj_stringWithFormat:(NSString *)format;
/**
 将日期格式化成字符串
 @param format 格式，例如 @"yyyy-MM-dd HH:mm:ss"
 */
- (NSString *)kj_stringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;

/**
 以 ISO8601 格式化日期。例如： "2016-08-16T16:13:30+12:00"
 */
- (NSString *)kj_stringWithISOFormat;

/**
 从字符串解析出日期 (解析失败则返回nil)
 @param dateString 日期字符串，例如 "2016-08-16 16:13:30"
 @param format     日期格式，例如 "yyyy-MM-dd HH:mm:ss"
 */
+ (NSDate *)kj_dateWithString:(NSString *)dateString format:(NSString *)format;

/**
 从字符串解析出日期 (解析失败则返回nil)
 @param dateString 日期字符串，例如 "2016-08-16 16:13:30"
 @param format     日期格式，例如 "yyyy-MM-dd HH:mm:ss"
 */
+ (NSDate *)kj_dateWithString:(NSString *)dateString format:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;

/**
 将 ISO8601 格式的字符串解析成日期。
 @param dateString 时间字符串，例如 "2016-08-16T16:13:30+12:00"
 */
+ (NSDate *)kj_dateWithISOFormatString:(NSString *)dateString;
@end
