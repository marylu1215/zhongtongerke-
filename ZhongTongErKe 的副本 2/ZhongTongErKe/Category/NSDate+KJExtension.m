//
//  NSDate+KJExtension.m
//
//  Created by kouhanjin on 16/8/16.
//  Copyright © 2016年 khj. All rights reserved.
//

#import "NSDate+KJExtension.h"
#import "LMDateFormatter.h"
#import "LMCalendar.h"

@implementation NSDate (KJExtension)

+ (NSDate *)timeStringToDate: (NSString *)timeString {

//    yyyy--MM--dd
    

    
    
    NSString * formatterString = @"yyyy-MM-dd";
    [LMDateFormatter sharedFormatter].dateFormat = formatterString;
    /** 指定区域，真机一定要指定 */
    [LMDateFormatter sharedFormatter].locale = [NSLocale localeWithLocaleIdentifier: @"en"];
    
    return [[LMDateFormatter sharedFormatter] dateFromString: timeString];
}

-(NSString *)dateToRequiredString {
    
    [[LMCalendar sharedCalender] isDateInToday:self];
    
    if ([[LMCalendar sharedCalender] isDateInToday:self]) {
        //如果是今天
        int seconds = [[NSDate date] timeIntervalSinceDate:self];
        if (seconds < 60) {
            return @"刚刚";
        } else if (seconds < 60 * 60) {
            return [NSString stringWithFormat:@"%d分钟前", seconds / 60];
        } else {
            return [NSString stringWithFormat:@"%d小时前", seconds / 3600];
        }
    } else if ([[LMCalendar sharedCalender] isDateInYesterday:self]) {
        //如果是昨天 10: 10
        [LMDateFormatter sharedFormatter].dateFormat = @"昨天 HH:mm";
        [LMDateFormatter sharedFormatter].locale =  [NSLocale localeWithLocaleIdentifier: @"en"];
        return [[LMDateFormatter sharedFormatter] stringFromDate:self];
    }
    else {
        //首先要取到今年是哪一年 2016
        //再取到当前的date是哪一年, 再做比较
        NSInteger thisYear = [[LMCalendar sharedCalender] component:NSCalendarUnitYear fromDate: [NSDate date]];
        
        NSInteger dateYear = [[LMCalendar sharedCalender] component:NSCalendarUnitYear fromDate: self];
        //是今年
        if (thisYear == dateYear) {
            [LMDateFormatter sharedFormatter].dateFormat = @"MM月dd日";
            [LMDateFormatter sharedFormatter].locale =  [NSLocale localeWithLocaleIdentifier: @"en"];
            return [[LMDateFormatter sharedFormatter] stringFromDate:self];
        }
        //往年
        else {
            [LMDateFormatter sharedFormatter].dateFormat = @"yyyy-MM-dd ";
            [LMDateFormatter sharedFormatter].locale =  [NSLocale localeWithLocaleIdentifier: @"en"];
            return [[LMDateFormatter sharedFormatter] stringFromDate:self];
        }
    }
}

- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    return nowYear == selfYear;
}
- (BOOL)isToday
{
    NSDateComponents *cmps = [self cmpsCompare];
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 0;
}

- (BOOL)isYesterday
{
    NSDateComponents *cmps = [self cmpsCompare];
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

- (NSDateComponents *)cmpsCompare
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    NSDate *selfDate = [fmt dateFromString:[fmt stringFromDate:self]];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *cmps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    
    return cmps;
}

@end
